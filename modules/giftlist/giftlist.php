<?php
if(!defined('_PS_VERSION_'))
	exit;

require_once __DIR__ . '/dbstruct.php';
include_once __DIR__ . '/classes/Bond.php';
include_once __DIR__ . '/classes/GiftList.php';
include_once __DIR__ . '/classes/ListProductBond.php';
class giftlist extends Module
{
	private $dbstruct;
    
    public static $moduleRoutes = array(
         'module-giftlist-descripcion' => array(
                'controller' => 'descripcion',
                'rule' =>  'lista-de-regalos/lista{/:url}',
              'keywords' => array(
                    'url'   => array('regexp' => '[_a-zA-Z0-9_-]+',   'param' => 'url'),
                  ),
                'params' => array(
                    'fc' => 'module',
                    'module' => 'giftlist',
                    'controller' => 'descripcion'
                )
            ),

            'module-giftlist-listas' => array(
                'controller' => 'listas',
                'rule' =>  'lista-de-regalos/listas',
                'keywords' => array(),
                'params' => array(
                    'fc' => 'module',
                    'module' => 'giftlist',
                    'controller' => 'listas'
                )
            ), 
             
            'module-giftlist-administrar' => array(
                'controller' => 'administrar',
                'rule' =>  'lista-de-regalos/crear',
                'keywords' => array(),
                'params' => array(
                    'fc' => 'module',
                    'module' => 'giftlist',
                    'controller' => 'administrar'
                )
            ),  
             
            'module-giftlist-empezar' => array(
                'controller' => 'empezar',
                'rule' =>  'lista-de-regalos',
                'keywords' => array(),
                'params' => array(
                    'fc' => 'module',
                    'module' => 'giftlist',
                    'controller' => 'empezar'
                )
            ), 
             
            'module-giftlist-buscar' => array(
                'controller' => 'buscar',
                'rule' =>  'lista-de-regalos/buscar',
                'keywords' => array(),
                'params' => array(
                    'fc' => 'module',
                    'module' => 'giftlist',
                    'controller' => 'buscar'
                )
            ), 
    );
    
    
    
	public function __construct()
	{
		$this->dbstruct = new DBStruct();
		$this->name = basename(__FILE__,'.php');
		$this->tab = "front_office_features";
		$this->version = "1.0.0";
		$this->author = "Arkix";
		$this->need_instance = 0;
		parent::__construct();

		$this->displayName = $this->l("Lista de regalos");
		$this->description = $this->l("Módulo para manejar listas de regalos");
		$this->_module = $this->name;
		$this->confirmUninstall = $this->l('Are you sure you want to uninstall?');

		if (!Configuration::get('MYMODULE_NAME'))
			$this->warning = $this->l('No name provided');
        
       // $this->registerHook("actionGiftlistProccess");
	}

	public function install(){
		if (Shop::isFeatureActive())
			Shop::setContext(Shop::CONTEXT_ALL);
		if(parent::install()){
			$this->registerHook('displayCustomerAccount');
			$this->registerHook('moduleRoutes');
			$this->registerHook('displayProductButtons');
			$this->registerHook('displayBackOfficeHeader');
			$this->registerHook("actionOrderStatusUpdate");
			$this->registerHook("actionGiftlistProccess");
            $this->registerHook("actionCustomerAccountAdd");
            $this->registerHook("actionUpdateQuantity");
            $this->registerHook("actionProductInList");
            $this->registerHook('header');
			$this->dbstruct->CreateListConfigurationTable();
			$this->dbstruct->CreateEventTypeTable();
			$this->dbstruct->CreateGiftListTable();
			$this->dbstruct->CreateEmailCocreatorTable();
			$this->dbstruct->CreateBondTable();
			$this->dbstruct->CreateListProductBondTable();
			$this->dbstruct->alterTableCartProductAddIdGiftList();
			$this->dbstruct->alterTableCartProductAddQtyGroup();
			$this->dbstruct->alterTableCartProductaddIdBond();
			$this->dbstruct->addBondInProduct();
			$this->__installTabs('giftlist', 'Lista de Regalos',0);
			$parent = (int)Tab::getIdFromClassName('giftlist');
			$this->__installTabs('AdminGiftList', "Lista de Regalos", $parent , $this->name);
			$this->__installTabs('AdminEventType', "Tipo de Evento", $parent , $this->name);
			return true;
		}
		return false;
	}

	public function uninstall(){
		if(!parent::uninstall())
			return false;
        /*unlink(_PS_ROOT_DIR_ . "override/classes/Cart.php");
        unlink(_PS_ROOT_DIR_ . "override/controllers/front/CartController.php");*/
		$this->dbstruct->DeleteListProductBondTable();
		$this->dbstruct->DeleteListConfigurationTable();
		$this->dbstruct->DeleteEmailCocreatorTable();
		$this->dbstruct->DeleteGiftListTable();
		$this->dbstruct->DeleteEventTypeTable();
		$this->dbstruct->DeleteBondTable();
		$this->dbstruct->alterTableCartProductDeleteIdGiftList();
		$this->dbstruct->alterTableCartProductDeleteQtyGroup();
		$this->dbstruct->alterTableCartProductDeleteIdBond();
		$this->dbstruct->deleteBondInProduct();
		$this->unregisterHook('displayBackOfficeHeader');
		$this->__uninstallTabs('adminEventType');
		$this->__uninstallTabs('adminGiftList');
		$this->__uninstallTabs('giftlist');
		return true;
	}
	public function hookDisplayCustomerAccount($params)
	{
	 /* $this->context->smarty->assign(
	  		array(
	  			'gift_link' =>  $this->context->link->getModuleLink('giftlist', 'listas'),
  				'search_link' => $this->context->link->getModuleLink('giftlist', 'buscar'),
  				'create_link' => $this->context->link->getModuleLink('giftlist', 'administrar'),
	  		));
	  return $this->display(__FILE__, 'giftlistbtn.tpl');*/
	}
    
    
    /*
    * Mostrar el boton de añadir a lista de regalos en el detalle del producto
    */
	public function hookDisplayProductButtons($params)
	{
		/*if($this->context->customer->isLogged()){
			$sql = "SELECT id,name FROM "._DB_PREFIX_."gift_list WHERE id_creator = ".$this->context->customer->id . ";";
			$this->context->smarty->assign(
				array(
						'desc_link' =>  $this->context->link->getModuleLink('giftlist', 'listas'),
						'list' => Db::getInstance()->executeS($sql)
				));
			return $this->display(__FILE__, 'addToListBtn.tpl');
		}*/
	}
    public function hookactionUpdateQuantity($params){
       /* if($params['quantity'] == 0){
            $lists = DB::getInstance()->executeS('SELECT id_list FROM '._DB_PREFIX_.'list_product_bond WHERE id_product = '.$params['id_product'] . " GROUP BY id_list");
            foreach($lists as $l){
                $params['id_list'] = $l['id_list'];
                $this->outOfStock($params);
            }
        }*/
    }
    
    
    /*
    * Validar si un producto perteneciente a una lista de regalos se quedo sin inventario, notificar al cliente.
    */
    public function outOfStock($params){
        /*if($params['id_product_attribute'] == 0)
            if(!empty($_REQUEST['id_product_attribute']) && $_REQUEST['id_product_attribute'] != 0)
                $params['id_product_attribute'] = $_REQUEST['id_product_attribute'];
        $l = new GiftListModel($params['id_list']);
        if(!$l->real_not)
            return true;
        $p = new ProductCore($params["id_product"]);
        $sql = "SELECT count(*) AS total FROM `"._DB_PREFIX_."list_product_bond` WHERE `id_list` = ".$params['id_list']." AND `id_product` = ". $params["id_product"];
        if(Db::getInstance()->getValue($sql) > 1)
            $lpd = ListProductBondModel::getByProductAndList($params['id_product'],$params['id_list'],$params['id_product_attribute']);
        else
            $lpd = ListProductBondModel::getByProductAndListNotAgroup($params['id_product'],$params['id_list'],$params['id_product_attribute']);
        $customer = new CustomerCore($l->id_creator);
        $attr = $p->getAttributeCombinationsById($lpd['option'][3]->value,Context::getContext()->language->id);
        $id_image = ProductCore::getCover($params['id_product']);
        
        // get Image by id
        if (sizeof($id_image) > 0) {
            $image = new Image($id_image['id_image']);
            // get image full URL
            $image_url = _PS_BASE_URL_._THEME_PROD_DIR_.$image->getExistingImgPath().".jpg";
        }
        $out = array (
            '{creator}' => $customer->firstname.' '.$customer->lastname,
            '{image}' => $image_url,
            '{name}' => $p->name[1],
            '{price}' => Tools::displayPrice($p->getPrice(),Context::getContext()->currency),
            "{colorProd}" => $attr[0]['attribute_name'],
            "{wanted}" => $lpd['total'],
            "{missing}" => $lpd['missing'],
            "{description_link}" => Context::getContext()->link->getModuleLink('giftlist', 'descripcion',array('url' => $l->url)),
            '{message}' => $l->message,
        );
        $cust = array(
            'name' => $customer->firstname.' '.$customer->lastname,
            'email' => $l->email
        );
        $this->_sendEmail("out-stock","Producto agotado",$cust,$out);*/
    }
    
    public function hookActionProductInList($params){
         //$this->outOfStock($params);
    }

    /*
    * Validar cocreador
    */
    public function hookactionCustomerAccountAdd($params){
        //get the email
        /*echo $sql = "SELECT * FROM "._DB_PREFIX_."email_cocreator WHERE email = '".$params['newCustomer']->email."'";
        $res = Db::getInstance()->executeS($sql);
        if(!empty($res)){
            foreach($res as $row){
                Db::getInstance()->update('gift_list',array(
                    'id_cocreator' => (int)$parmas['newCustomer']->id
                ),'id ='.$row['íd_list']);
            }
        }
        Db::getInstance()->delete('email_cocreator', "email = '".$params['newCustomer']->email."'");*/
        
    }
    
	public function hookactionOrderStatusUpdate($params){
        //Order status payment confirmation
        //$this->registerHook("actionGiftlistProccess");
	}
    
    /*
    * En cuanto una compra se realiza, si la orden es correcta, notifica al usuario que han comprado un producto y
    * descuenta la cantidad comprada en la lista de regalos
    */
    public function hookactionGiftlistProccess($params){
        /*$this->__verifyListInOrderBeforePayment($params['id_order']);//correo
        $this->_updateStatesinList($params['id_order']);//estados*/
    }

    private function _updateStatesinList($cart){
        /*$sql = "SELECT * FROM "._DB_PREFIX_."cart_product WHERE id_cart = " . $cart;
        $products = Db::getInstance()->executeS($sql);
        $sql = "SELECT id_customer FROM "._DB_PREFIX_."orders WHERE id_cart = ".$cart;
        $id_customer = Db::getInstance()->getValue($sql);
        $buyer = new CustomerCore($id_customer);
        $link = new LinkCore();
        foreach($products as $product){
            if($product['id_giftlist'] != 0){
                $list = new GiftListModel($product['id_giftlist']);
                if($product['id_bond'] != 0){
                    $sql="SELECT id FROM "._DB_PREFIX_."list_product_bond WHERE id_bond = ".$product['id_bond']." AND id_list = ".$product['id_giftlist'];
                    $id = Db::getInstance()->getRow($sql);
                    $lpd = new ListProductBondModel($id['id']);
                    $lpd->bought = 1;
                    $lpd->save();
                    $bond = new BondModel($product['id_bond']);
                    $creator = $list->getCreator($list->id_creator);
                    $params = array(
                        '{creator}' =>  $creator->firstname.' '.$creator->lastname,
                        '{value}' => $bond->value,
                        '{message}' => $bond->message == "" ? "Ningun Mensaje" : $bond->message,
                        '{buyer}' => $buyer->firstname . " " . $buyer->lastname,
                        '{description_link}' => $this->context->link->getModuleLink('giftlist', 'descripcion',array('url' => $list->url))
                    );

                    $cust = array(
                        'name' => $creator->firstname.' '.$creator->lastname,
                        'email' => $list->email
                    );
                    if($list->real_not)
                        $this->_sendEmail('bond-bought','¡Han comprado un bono para ti!',$cust,$params);
                }else{
                    $prod = new ProductCore($product['id_product']);
                    $creator = $list->getCreator($list->id_creator);
                    $sql = "SELECT count(*) FROM `"._DB_PREFIX_."list_product_bond` WHERE `id_list` = ".$product['id_giftlist']." AND `id_product` = ". $product['id_product'];
                    if(Db::getInstance()->getValue($sql) > 1)
                        $lpd = ListProductBondModel::getByProductAndList($product['id_product'],$product['id_giftlist'],$product['id_product_attribute']);
                    else
                        $lpd = ListProductBondModel::getByProductAndListNotAgroup($product['id_product'],$product['id_giftlist'],$product['id_product_attribute'],0);
                    $attr = $prod->getAttributeCombinationsById($lpd['option'][3]->value,Context::getContext()->language->id);
                    $id_image = ProductCore::getCover($product['id_product']);
                    // get Image by id
                    if (sizeof($id_image) > 0) {
                        $image = new Image($id_image['id_image']);
                        // get image full URL
                        $image_url = _PS_BASE_URL_._THEME_PROD_DIR_.$image->getExistingImgPath().".jpg";
                    }
                    $sPrice = Db::getInstance()->getValue("SELECT price FROM `"._DB_PREFIX_."specific_price` WHERE `id_product` = ".$product['id_product']." AND`id_product_attribute` = ".(int)$lpd['option'][3]->value);
                    $price = ($sPrice == 0 ? $prod->getPrice() : $sPrice);
                    $params = array(
                        '{creator}' => $creator->firstname.' '.$creator->lastname,
                        '{image}' => $image_url,
                        '{name}' => $prod->name[1],
                        '{product_price}' => Tools::displayPrice($price),
                        '{color_prod}' => $attr[0]['attribute_name'],
                        '{buyer}' => $buyer->firstname . " " . $buyer->lastname,
                        '{qty_buy}' => $product['quantity'],
                        '{qty_want}' => $lpd['total'],
                        '{qty_rest}' => $lpd['missing'],
                        '{message}' => $lpd['message'] == "" ? "Ningun Mensaje" : $lpd['message'],
                        '{description_link}' => $this->context->link->getModuleLink('giftlist', 'descripcion',array('url' => $list->url))
                    );
                    $cust = array(
                        'name' => $creator->firstname.' '.$creator->lastname,
                        'email' => $list->email
                    );

                    if($list->real_not)
                        $this->_sendEmail('product-bought','¡Han comprado un producto para ti!',$cust,$params);
                }
            }
        }*/
    }
    
    private function __verifyListInOrderBeforePayment($cart){
       /* $sql = "SELECT * FROM "._DB_PREFIX_."cart_product WHERE id_cart = " .$cart;
        $products = Db::getInstance()->executeS($sql);
        $buyer = Db::getInstance()->getValue("SELECT id_customer FROM "._DB_PREFIX_."cart WHERE id_cart = ".$cart);
        $sql = "SELECT id_product FROM "._DB_PREFIX_."product WHERE reference = 'BOND-LIST'";
		$id_product = Db::getInstance()->getValue($sql);
        foreach($products as $product){
            if($product['id_bond'] != 0){
                $sqlB = "SELECT count(id_bond)  as bonos FROM " . _DB_PREFIX_ . "list_product_bond WHERE id_bond = ". $product['id_bond'];
                $res = Db::getInstance()->getValue($sql);
                if($res['bonos'] <= 1 ){
                    Db::getInstance()->insert('list_product_bond',array(
                        'id_list' => $product['id_giftlist'],
                        'id_product' => 0,
                        'id_bond' => $product['id_bond'],
                        'group' => 0,
                        'option' => "[]",
                        'favorite' => 0,
                        'bought' => 0,
                        'created_at' => date( "Y-m-d H:i:s" )
                    ));
                }
            }else{
                $sqlB = "SELECT * FROM " . _DB_PREFIX_ . "list_product_bond WHERE id_list = ". $product['id_giftlist']. " AND id_product = ".$product['id_product'] . " AND id_bond = 0 AND bought = 0 ORDER BY cant DESC";
                $prod = Db::getInstance()->executeS($sqlB);
                foreach($prod as $row){
                    $op = Tools::jsonDecode($row['option']);
                    if($row['group']){
                        if($op[3]->value == $product['id_product_attribute']){
                            if($product['quantity'] > 0){
                                if($product['quantity'] == $row['cant']){
                                    Db::getInstance()->update('list_product_bond',array(
                                        'bought' => 1,
                                        'updated_at' => date( "Y-m-d H:i:s" )
                                    ),"id = ".$row['id']);
                                    $product['quantity'] -= $row['cant'];
                                }elseif($product['quantity'] == $row['cant']){
                                    Db::getInstance()->update('list_product_bond',array(
                                        'bought' => 1,
                                        'updated_at' => date( "Y-m-d H:i:s" )
                                    ),"id = ".$row['id']);
                                    $product['quantity'] -= $row['cant'];
                                }
                            }
                        }
                    }else{
                        $row['missing'] -= $product['quantity'];
                        Db::getInstance()->update('list_product_bond',array(
                            'missing' => $row['missing'],  
                            'bought' => $row['missing'] > 0 ? 0 : 1,
                            'updated_at' => date( "Y-m-d H:i:s" )
                        ),"id = ".$row['id']);
                    }
                }
            }
        }*/
    }
    
    
    
    private function _sendEmail($template,$subject,$customer,$params){
        /*$id_shop = (int)Context::getContext()->shop->id;
		$id_lang = $this->context->language->id;
        try{
            MailCore::Send($id_lang, $template, sprintf(
                MailCore::l($subject), 1),
                $params,$customer['email'], $customer['name'],
            null, null, null,null, _MODULE_DIR_."giftlist/mails/", true, $id_shop);
        }catch(Exception $ex){
            die($ex->getMessage());
        }*/
    }

	private function __uninstallTabs($class_name)
	{
		/*try{
			$id_tab = (int)Tab::getIdFromClassName($class_name);
			if ($id_tab)
			{
				$tab = new Tab($id_tab);
				$tab->delete();
			}
			return true;
		}catch (Exception $e) {
			return false;
		}*/
	}

	private function __installTabs($class_name,$name,$parent=0,$module = null,$page=NULL,$title=NULL,$description=NULL, $url_rewrite=NULL)
	{
		/*try{
			$id_tab = (int)Tab::getIdFromClassName($class_name);
			if(!$id_tab)
			{
				$tab = new Tab();
				$tab->active = 1;
				$tab->class_name = $class_name;
				$tab->name = array();
				foreach (Language::getLanguages(true) as $lang)
					$tab->name[$lang['id_lang']] = $name;

					$tab->id_parent = $parent;
					$tab->module 	= $module;
					$tab->add();
					if($page && $title)
					{
						$meta = new Meta();
						$meta->page 		= $page;
						$meta->title 		= $title;

						if($description)
							$meta->description	= $description;

						if($url_rewrite)
							$meta->url_rewrite	= Tools::link_rewrite($url_rewrite);
						$meta->add();
					}
			}else{
				$this->__uninstallTabs($class_name);
				self::__installTabs($class_name,$name,$parent,$page,$title,$description, $url_rewrite);
			}
			return true;

		}catch (Exception $e) {
			return false;
		}*/
	}
    
    public function hookModuleRoutes() {
        //return self::$moduleRoutes;
    }

	public function hookDisplayBackOfficeHeader()
	{
		//$this->context->controller->addCss(_MODULE_DIR_."giftlist/views/css/tab.css");
	}

    public function hookHeader($params)
    {
        /*if(Dispatcher::getInstance()->getController() == "myaccount")
            $this->context->controller->addJS((_MODULE_DIR_).'giftlist/views/js/ax-empezar.js');*/
    }
}