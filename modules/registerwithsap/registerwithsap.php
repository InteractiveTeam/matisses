<?php
/*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_'))
	exit;

require_once __DIR__ . '/dbregister.php';
require_once _PS_MODULE_DIR_.'matisses/matisses.php';
require_once _PS_MODULE_DIR_.'matisses/CargarProductos.php';

class registerWithSap extends Module
{
	private $_html = '';
	private $_postErrors = array();
	public $context;
    private $sonda;

	function __construct($dontTranslate = false)
 	{
        $this->db = new DBRegister();
 	 	$this->name = 'registerwithsap';
		$this->version = '1.0.0';
		$this->author = 'Arkix';
 	 	$this->tab = 'front_office_features';
		$this->need_instance = 0;
		$this->secure_key = Tools::encrypt($this->name);

		parent::__construct();

        $this->displayName = $this->l('Registro con SAP');
        $this->description = $this->l('Permite el registro de usuario en el sitio si es cliente en la tienda fisica.');
		$this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
	}

	public function install()
	{
	 	return (parent::install() && $this->registerHook('header') && $this->registerHook('createOrders') && $this->db->CreateTokenTable());
	}

	public function uninstall()
	{
		return (parent::uninstall() && $this->unregisterHook('header') && $this->unregisterHook('createOrders') && $this->db->DeleteTokenTable());
	}

	public function hookHeader($params)
	{
	}
    
    public function hookcreateOrders($params){
        if (isset($params) && !empty($params)) {
            $validate = $this->checkByEmail($params['email']);
            
            if (isset($validate) && !empty($validate)) {
                $update = $this->updateToken($params['email'], $validate[0]['token'], true);
                $mat = new matisses();
                $idcustomer = $params['idcustomer'];
                $userSap = $mat->wsmatissess_getCustomerbyEmail($params['email']);
//                $userSap = $mat->wsmatissess_getCustomerbyEmail('dlopez@matisses.co');
                $sapOrders = $mat->wsmatissess_getOrdersByCharter($params['charter']);
//                $sapOrders = $mat->wsmatissess_getOrdersByCharter('98667971');
                

                // Registering address
                $addresses = $userSap['customerDTO']['addresses'];
                
                
                if (isset($addresses) && !empty($addresses)) {
                    $addressObj = new Address();
                    
                    foreach ($addresses as $addr) {
                        if ($addr['addressType'] == 'E') {
                            $id = Db::getInstance()->getValue("SELECT id_address FROM "._DB_PREFIX_."address WHERE address1 = '".$params['address'] . "' AND lastname = '" .$params['lastname']. "' AND firstname = '" .$params['firstname'] . "'");
                            if(!empty($id) || $id == 0){
                                $addressObj->id_customer = $params['idcustomer'];
                                $addressObj->firstname = $params['firstname'];
                                $addressObj->secondname = $params['secondname'];
                                $addressObj->lastname = $params['lastname'];
                                $addressObj->surname = $params['surname'];
                                $addressObj->phone = $addr['phone'];
                                $addressObj->phone_mobile = $addr['mobile'];
                                $addressObj->address1 = $addr['address'];
                                $addressObj->postcode = $addr['cityCode'];
                                $addressObj->city = $addr['cityName'];
                                $addressObj->id_country = Db::getInstance()->getValue("SELECT id_country FROM "._DB_PREFIX_."country WHERE iso_code = ".$addr['stateCode']);
                                $addressObj->id_state = Db::getInstance()->getValue("SELECT id_state FROM "._DB_PREFIX_."state WHERE iso_code = ".$addr['cityCode']);
                                $addressObj->alias = $addr['addressName'];
                                $addressObj->add();
                            }else{
                                $addressObj = new Address($id);
                            }
                        }
                    }
                    
                    // Registering orders                
                    if ($this->isNumericArray($sapOrders['customerOrdersDTO']['orders'])) {
                        foreach ($sapOrders['customerOrdersDTO']['orders'] as $ordersap) {
                            // create new cart if needed
                            $ordersap['total'] = 0;
                            $cart = new Cart();
                            $cart->id_customer = $idcustomer;
                            $cart->id_address_delivery = $addressObj->id;
                            $cart->id_address_invoice = $cart->id_address_delivery;
                            $cart->id_lang = (int)($this->context->cookie->id_lang);
                            $cart->id_currency = (int)($this->context->cookie->id_currency);
                            $cart->id_carrier = 0;
                            $cart->recyclable = 0;
                            $cart->gift = 0;
                            $cart->add();                        
                            $this->context->cookie->id_cart = (int)($cart->id); 
                            $cart->update();
                            Db::getInstance()->update('cart',array('id_factura' => $ordersap['invoiceNumber']),'id_cart = '.$cart->id);

                            $sonda = new CargaProductos(true);
                            $ref = array();
                            foreach($ordersap['items'] as $item){
                                array_push($ref,$item['itemCode']);
                            }
                            $sonda->loadProductByReferenceWithoutStock($ref);
                            foreach ($ordersap['items'] as $item) {
                            try{
                                if ($item['quantity'] != 0) {
                                    $prod = Db::getInstance()->getRow("SELECT * FROM " . _DB_PREFIX_ . "product_attribute WHERE reference = '".$item['itemCode']."'");
                                    //$product = new Product($prod['id_product']);
                                    if(!empty($prod)){
                                        /*$product->quantity = $product->quantity+$item['quantity'];
                                        $product->active = true;
                                        $product->update();*/
                                        Db::getInstance()->insert("cart_product",array(
                                            'id_cart' => $cart->id,
                                            'id_product' => $prod['id_product'],
                                            'id_address_delivery' => $add,
                                            'id_shop' => 1,
                                            'id_bond' => 0,
                                            'id_giftlist' => 0,
                                            'id_product_attribute' => $prod['id_product_attribute'],
                                            'quantity' => $item['quantity'],
                                            'date_add' => date("Y-m-d H:i:s")
                                        ));
                                        //$cart->updateQty($item['quantity'], $prod['id_product'],$prod['id_product_attribute']);   
                                        $ordersap['total'] += $item['price'];
                                    }
                                } else {
                                    unset($cart);
                                }
                            }catch(Exception $e){
                                return;
                            }
                        }

                            // Create Orders
                            if (isset($cart)) {
                                $order = new Order();
                                $order->current_state = 5;
                                $prodlist = array();
                                foreach ($cart->getProducts() as $prodcart) {
                                    array_push($prodlist, $prodcart);
                                } 
                                $order->product_list = $prodlist;
                                $carrier = null;
                                if (!$cart->isVirtualCart() && isset($package['id_carrier'])) {
                                    $carrier = new Carrier((int)$package['id_carrier'], (int)$cart->id_lang);
                                    $order->id_carrier = (int)$carrier->id;
                                    $id_carrier = (int)$carrier->id;
                                } else {
                                    $order->id_carrier = 0;
                                    $id_carrier = 0;
                                }
                                $order->id_customer = $cart->id_customer;
                                $order->id_address_invoice = $cart->id_address_invoice;
                                $order->id_address_delivery = $cart->id_address_delivery;
                                $order->id_currency = $this->context->currency->id;
                                $order->id_lang = $cart->id_lang;
                                $order->id_cart = $cart->id;
                                $order->reference = $order->generateReference();
                                $order->id_shop = (int)$this->context->shop->id;
                                $order->id_shop_group = (int)$this->context->shop->id_shop_group;
                                $order->secure_key = $params['securekey'];
                                $order->payment = 'Pago en Tienda Física';
                                if (isset($this->name)) {
                                    $order->module = $this->name;
                                }
                                $order->recyclable = $cart->recyclable;
                                $order->gift = (int)$cart->gift;
                                $order->gift_message = $cart->gift_message;
                                $order->mobile_theme = $cart->mobile_theme;
                                $order->conversion_rate = $this->context->currency->conversion_rate;
                                $order->total_paid_real = $ordersap['total'];
                                $order->total_products = (float)$cart->getOrderTotal(false);
                                $order->total_products_wt = (float)$cart->getOrderTotal(true);
                                $order->total_discounts_tax_excl = 0;
                                $order->total_discounts_tax_incl = 0;
                                $order->total_discounts = 0;
                                $order->total_shipping = 0;
                                $order->carrier_tax_rate = 0;
                                $order->total_paid = $ordersap['total'];
                                $order->total_paid_tax_incl = $ordersap['total'];
                                $order->total_paid_tax_excl = $ordersap['total'];
                                $order->round_mode = 0;
                                $order->round_type = Configuration::get('PS_ROUND_TYPE');
                                $order->invoice_date = $ordersap['documentDate'];
                                $order->delivery_date = '0000-00-00 00:00:00';                            
                                $order->valid = 1;
                                
                                // Creating order
                                $result = $order->add();
                                if (!$result) {
                                    echo "<pre><h1>Error creating Order</h1>"; print_r($result); echo "</pre>";
                                }
                                
                                $order->date_add = $ordersap['documentDate'];
                                $order->date_up = $ordersap['documentDate'];

                                $order->update();

                                $id_order_state = $order->current_state;
                                $order_list[] = $order;
                                
                                Db::getInstance()->insert('order_history', array(
                                    'id_employee' => 1,
                                    'id_order' => $order->id,
                                    'id_order_state' => $id_order_state,
                                    'date_add' => date('Y-m-d H:i:s')
                                ));
                                // Insert new Order detail list using cart for the current order
                                $order_detail = new OrderDetail(null, null, $this->context);
                                $order_detail->createList($order, $cart, $id_order_state, $order->product_list, 0, true);
                                $order_detail_list[] = $order_detail;

                                unset($order);
                                unset($order_detail);
                            }
                        }
                    } else {
                        $ordersWithSap = $sapOrders['customerOrdersDTO']['orders'];
                        // create new cart if needed    
                        $cart = new Cart();
                        $cart->id_customer = $idcustomer;
                        $cart->id_address_delivery = $addressObj->id;
                        $cart->id_address_invoice = $cart->id_address_delivery;
                        $cart->id_lang = (int)($this->context->cookie->id_lang);
                        $cart->id_currency = (int)($this->context->cookie->id_currency);
                        $cart->id_carrier = 0;
                        $cart->recyclable = 0;
                        $cart->gift = 0;
                        $cart->add();                        
                        $this->context->cookie->id_cart = (int)($cart->id); 
                        $cart->update();
                        Db::getInstance()->update('cart',array('id_factura' => $ordersWithSap['invoiceNumber']),'id_cart = '.$cart->id);
                        $ordersWithSap['total'] = 0;

                        $sonda = new CargaProductos(true);
                        foreach($sapOrders['items'] as $item){
                            array_push($ref,$item['itemCode']);
                        }
                        $sonda->loadProductByReferenceWithoutStock($ref);
                        foreach ($sapOrders['items'] as $item) {
                            try{
                                if ($item['quantity'] != 0) {
                                    $prod = Db::getInstance()->getRow("SELECT * FROM " . _DB_PREFIX_ . "product_attribute WHERE reference = '".$item['itemCode']."'");
                                    //$product = new Product($prod['id_product']);
                                    if(!empty($prod)){
                                        /*$product->quantity = $product->quantity+$item['quantity'];
                                        $product->active = true;
                                        $product->update();*/
                                        Db::getInstance()->insert("cart_product",array(
                                            'id_cart' => $cart->id,
                                            'id_product' => $prod['id_product'],
                                            'id_address_delivery' => $add,
                                            'id_shop' => 1,
                                            'id_bond' => 0,
                                            'id_giftlist' => 0,
                                            'id_product_attribute' => $prod['id_product_attribute'],
                                            'quantity' => $item['quantity'],
                                            'date_add' => date("Y-m-d H:i:s")
                                        ));
                                        //$cart->updateQty($item['quantity'], $prod['id_product'],$prod['id_product_attribute']);   
                                        $ordersap['total'] += $item['price'];
                                    }
                                } else {
                                    unset($cart);
                                }
                            }catch(Exception $e){
                                return;
                            }
                        }
                        // Create Orders
                        if (isset($cart)) {
                            $order = new Order();
                            $order->current_state = 5;
                            $prodlist = array();
                            foreach ($cart->getProducts() as $prodcart) {
                                array_push($prodlist, $prodcart);
                            } 
                            $order->product_list = $prodlist;
                            $carrier = null;
                            if (!$cart->isVirtualCart() && isset($package['id_carrier'])) {
                                $carrier = new Carrier((int)$package['id_carrier'], (int)$cart->id_lang);
                                $order->id_carrier = (int)$carrier->id;
                                $id_carrier = (int)$carrier->id;
                            } else {
                                $order->id_carrier = 0;
                                $id_carrier = 0;
                            }
                            $order->id_customer = $cart->id_customer;
                            $order->id_address_invoice = $cart->id_address_invoice;
                            $order->id_address_delivery = $cart->id_address_delivery;
                            $order->id_currency = $this->context->currency->id;
                            $order->id_lang = $cart->id_lang;
                            $order->id_cart = $cart->id;
                            $order->reference = $order->generateReference();
                            $order->id_shop = (int)$this->context->shop->id;
                            $order->id_shop_group = (int)$this->context->shop->id_shop_group;
                            $order->secure_key = $params['securekey'];
                            $order->payment = 'Pago en Tienda Física';
                            if (isset($this->name)) {
                                $order->module = $this->name;
                            }
                            $order->recyclable = $cart->recyclable;
                            $order->gift = (int)$cart->gift;
                            $order->gift_message = $cart->gift_message;
                            $order->mobile_theme = $cart->mobile_theme;
                            $order->conversion_rate = $this->context->currency->conversion_rate;
                            $order->total_paid_real = $ordersWithSap['total'];
                            $order->total_products = (float)$cart->getOrderTotal(false);
                            $order->total_products_wt = (float)$cart->getOrderTotal(true);
                            $order->total_discounts_tax_excl = 0;
                            $order->total_discounts_tax_incl = 0;
                            $order->total_discounts = 0;
                            $order->total_shipping = 0;
                            $order->carrier_tax_rate = 0;
                            $order->total_paid = $ordersWithSap['total'];
                            $order->total_paid_tax_incl = $ordersWithSap['total'];
                            $order->total_paid_tax_excl = $ordersWithSap['total'];
                            $order->round_mode = 0;
                            $order->round_type = Configuration::get('PS_ROUND_TYPE');
                            $order->invoice_date = $ordersWithSap['documentDate'];
                            $order->delivery_date = '0000-00-00 00:00:00';
                            $order->valid = 1;

                            // Creating order
                            $result = $order->add();

                            if (!$result) {
                                echo "<pre><h1>Error creating Order</h1>"; print_r($result); echo "</pre>";
                            }
                            
                            $order->date_add = $ordersWithSap['documentDate'];
                            $order->date_up = $ordersWithSap['documentDate'];
                            
                            $order->update();

                            $id_order_state = $order->current_state;
                            $order_list[] = $order;
                            
                            Db::getInstance()->insert('order_history', array(
                                'id_employee' => 1,
                                'id_order' => $order->id,
                                'id_order_state' => $id_order_state,
                                'date_add' => date('Y-m-d H:i:s')
                            ));
                            
                            // Insert new Order detail list using cart for the current order
                            $order_detail = new OrderDetail(null, null, $this->context);
                            $order_detail->createList($order, $cart, $id_order_state, $order->product_list, 0, true);
                            $order_detail_list[] = $order_detail;
                            unset($order);
                            unset($order_detail);
                        }
                    }
                }     
            }   
        }
    }
    
    protected function isNumericArray($array) {
        foreach ($array as $a => $b) {
            if (!is_int($a)) {
                return false;
            }
        }
        return true;
    }
    
    protected function getOrdersSAP($charter) {
        
    }
    
    public function checkByEmail($email) {
        $result = Db::getInstance()->ExecuteS('SELECT * FROM '._DB_PREFIX_.'token_email WHERE email = "'.$email.'"');
        return $result;
    }
    
    public function createToken($email, $token) {
        $result = Db::getInstance()->insert('token_email',array(
                        'email' => $email,
                        'token' => $token,
                        'token_used' => 'false')
                    );
        return $result;
    }
    
    public function updateToken($email, $token, $tokenused) {
        $result = Db::getInstance()->update('token_email',array(
                    'token' => $token,
                    'token_used' => $tokenused
                ),"email = '".$email."'");
        return $result;
    }
    
    public function checkToken($token) {
        $result = Db::getInstance()->ExecuteS('SELECT * FROM '._DB_PREFIX_.'token_email WHERE token = "'.$token.'"');
        return $result;
    }
}