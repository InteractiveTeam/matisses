<?php

/*

* 2007-2015 PrestaShop

*

* NOTICE OF LICENSE

*

* This source file is subject to the Open Software License (OSL 3.0)

* that is bundled with this package in the file LICENSE.txt.

* It is also available through the world-wide-web at this URL:

* http:
* If you did not receive a copy of the license and are unable to

* obtain it through the world-wide-web, please send an email

* to license@prestashop.com so we can send you a copy immediately.

*

* DISCLAIMER

*

* Do not edit or add to this file if you wish to upgrade PrestaShop to newer

* versions in the future. If you wish to customize PrestaShop for your

* needs please refer to http:
*

*  @author PrestaShop SA <contact@prestashop.com>

*  @copyright  2007-2015 PrestaShop SA

*  @license    http:
*  International Registered Trademark & Property of PrestaShop SA

*/

class CartController extends CartControllerCore

{

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	public $php_self = 'cart';



	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected $id_product;

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected $id_product_attribute;

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected $id_address_delivery;

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected $customization_id;

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected $qty;

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected $id_giftlist;

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected $qty_group;

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	public $ssl = true;



	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected $ajax_refresh = false;



	/**

	 * This is not a public page, so the canonical redirection is disabled

	 */

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	public function canonicalRedirection($canonicalURL = '')

	{

	}



	/**

	 * Initialize cart controller

	 * @see FrontController::init()

	 */

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	public function init()

	{

		parent::init();



		
		header('X-Robots-Tag: noindex, nofollow', true);



		
		$this->id_product = (int)Tools::getValue('id_product', null);

		$this->id_product_attribute = (int)Tools::getValue('id_product_attribute', Tools::getValue('ipa'));

		$this->customization_id = (int)Tools::getValue('id_customization');

		$this->qty = abs(Tools::getValue('qty', 1));

		$this->id_address_delivery = (int)Tools::getValue('id_address_delivery');

		$this->id_giftlist = ( int ) Tools::getValue ( "id_list" );

	}

	

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	public function postProcess()

	{

		
		if ($this->context->cookie->exists() && !$this->errors && !($this->context->customer->isLogged() && !$this->isTokenValid()))

		{

			if (Tools::getIsset('add') || Tools::getIsset('update'))

				$this->processChangeProductInCart();

			elseif (Tools::getIsset('delete'))

				$this->processDeleteProductInCart();

			elseif (Tools::getIsset('changeAddressDelivery'))

				$this->processChangeProductAddressDelivery();

			elseif (Tools::getIsset('allowSeperatedPackage'))

				$this->processAllowSeperatedPackage();

			elseif (Tools::getIsset('duplicate'))

				$this->processDuplicateProduct();

			elseif (Tools::getIsset ( 'addFromList' ) || Tools::getIsset ( 'updateFromList' ))

				$this->processChangeProductInCartFromList ();



			
			if (!$this->errors && !$this->ajax)

			{

				$queryString = Tools::safeOutput(Tools::getValue('query', null));

				if ($queryString && !Configuration::get('PS_CART_REDIRECT'))

					Tools::redirect('index.php?controller=search&search='.$queryString);



				
				if (isset($_SERVER['HTTP_REFERER']))

				{

					preg_match('!http(s?)://(.*)/(.*)!', $_SERVER['HTTP_REFERER'], $regs);
					if (isset($regs[3]) && !Configuration::get('PS_CART_REDIRECT'))

						Tools::redirect($_SERVER['HTTP_REFERER']);

				}



				Tools::redirect('index.php?controller=order&'.(isset($this->id_product) ? 'ipa='.$this->id_product : ''));

			}



		}

		elseif (!$this->isTokenValid())

			Tools::redirect('index.php');

	}

	

	/**

	 * This process delete a product from the cart

	 */

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected function processDeleteProductInCart()

	{

		$customization_product = Db::getInstance()->executeS('SELECT * FROM `'._DB_PREFIX_.'customization`

		WHERE `id_product` = '.(int)$this->id_product.' AND `id_customization` != '.(int)$this->customization_id);



		if (count($customization_product))

		{

			$product = new Product((int)$this->id_product);



			$total_quantity = 0;

			foreach ($customization_product as $custom)

				$total_quantity += $custom['quantity'];



			if ($total_quantity < $product->minimal_quantity)

				$this->ajaxDie(Tools::jsonEncode(array(

						'hasError' => true,

						'errors' => array(sprintf(Tools::displayError('You must add %d minimum quantity', !Tools::getValue('ajax')), $product->minimal_quantity)),

				)));

		}



		if ($this->context->cart->deleteProduct($this->id_product, $this->id_product_attribute, $this->customization_id, $this->id_address_delivery))

		{

			if (!Cart::getNbProducts((int)$this->context->cart->id))

			{

				$this->context->cart->setDeliveryOption(null);

				$this->context->cart->gift = 0;

				$this->context->cart->gift_message = '';

				$this->context->cart->update();

			}

		}

		$removed = CartRule::autoRemoveFromCart();

		CartRule::autoAddToCart();

		if (count($removed) && (int)Tools::getValue('allow_refresh'))

			$this->ajax_refresh = true;

	}



	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected function processChangeProductAddressDelivery()

	{

		if (!Configuration::get('PS_ALLOW_MULTISHIPPING'))

			return;



		$old_id_address_delivery = (int)Tools::getValue('old_id_address_delivery');

		$new_id_address_delivery = (int)Tools::getValue('new_id_address_delivery');



		if (!count(Carrier::getAvailableCarrierList(new Product($this->id_product), null, $new_id_address_delivery)))

			$this->ajaxDie(Tools::jsonEncode(array(

				'hasErrors' => true,

				'error' => Tools::displayError('It is not possible to deliver this product to the selected address.', false),

			)));



		$this->context->cart->setProductAddressDelivery(

			$this->id_product,

			$this->id_product_attribute,

			$old_id_address_delivery,

			$new_id_address_delivery);

	}



	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected function processAllowSeperatedPackage()

	{

		if (!Configuration::get('PS_SHIP_WHEN_AVAILABLE'))

			return;



		if (Tools::getValue('value') === false)

			$this->ajaxDie('{"error":true, "error_message": "No value setted"}');



		$this->context->cart->allow_seperated_package = (boolean)Tools::getValue('value');

		$this->context->cart->update();

		$this->ajaxDie('{"error":false}');

	}



	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected function processDuplicateProduct()

	{

		if (!Configuration::get('PS_ALLOW_MULTISHIPPING'))

			return;



		if (!$this->context->cart->duplicateProduct(

				$this->id_product,

				$this->id_product_attribute,

				$this->id_address_delivery,

				(int)Tools::getValue('new_id_address_delivery')

			))

		{

			
			
			$error_message = 'Error durring product duplication';

		}

	}



	/**

	 * This process add or update a product in the cart

	 */

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected function processChangeProductInCart()

	{

        $products = $this->context->cart->getProducts();

        if(count($products) > 0){

            foreach($products as $product){

                if($product['id_giftlist'] != 0){

                    $this->errors [] = Tools::displayError ( 'Recuerda que no puedes agregar productos del Ecommerce y de una Lista de regalos en un mismo carrito', ! Tools::getValue ( 'ajax' ) );

                    return;

                }

            }

        }

		$mode = (Tools::getIsset('update') && $this->id_product) ? 'update' : 'add';

		

		$params['id_product'] = $this->id_product;

		$params['id_product_attribute'] = $this->id_product_attribute;

		

		$response = Hook::exec('actionProductCartSave', $params);

		if ($this->qty == 0 || $response==0)

			$this->errors[] = Tools::displayError('Null quantity.', !Tools::getValue('ajax'));

		elseif (!$this->id_product)

			$this->errors[] = Tools::displayError('Product not found', !Tools::getValue('ajax'));



		$product = new Product($this->id_product, true, $this->context->language->id);

		if (!$product->id || !$product->active || !$product->checkAccess($this->context->cart->id_customer))

		{

			$this->errors[] = Tools::displayError('This product is no longer available.', !Tools::getValue('ajax'));

			return;

		}



		$qty_to_check = $this->qty;

		$cart_products = $this->context->cart->getProducts();



		if (is_array($cart_products))

			foreach ($cart_products as $cart_product)

			{

				if ((!isset($this->id_product_attribute) || $cart_product['id_product_attribute'] == $this->id_product_attribute) &&

					(isset($this->id_product) && $cart_product['id_product'] == $this->id_product))

				{

					$qty_to_check = $cart_product['cart_quantity'];



					if (Tools::getValue('op', 'up') == 'down')

						$qty_to_check -= $this->qty;

					else

						$qty_to_check += $this->qty;



					break;

				}

			}



		
		if ($this->id_product_attribute)

		{

			if (!Product::isAvailableWhenOutOfStock($product->out_of_stock) && !Attribute::checkAttributeQty($this->id_product_attribute, $qty_to_check))

				$this->errors[] = Tools::displayError('There isn\'t enough product in stock.', !Tools::getValue('ajax'));

		}

		elseif ($product->hasAttributes())

		{

			$minimumQuantity = ($product->out_of_stock == 2) ? !Configuration::get('PS_ORDER_OUT_OF_STOCK') : !$product->out_of_stock;

			$this->id_product_attribute = Product::getDefaultAttribute($product->id, $minimumQuantity);

			
			if (!$this->id_product_attribute)

				Tools::redirectAdmin($this->context->link->getProductLink($product));

			elseif (!Product::isAvailableWhenOutOfStock($product->out_of_stock) && !Attribute::checkAttributeQty($this->id_product_attribute, $qty_to_check))

				$this->errors[] = Tools::displayError('There isn\'t enough product in stock.', !Tools::getValue('ajax'));

		}

		elseif (!$product->checkQty($qty_to_check))

			$this->errors[] = Tools::displayError('There isn\'t enough product in stock.', !Tools::getValue('ajax'));



		
		if (!$this->errors && $mode == 'add')

		{

			
			if (!$this->context->cart->id)

			{

				if (Context::getContext()->cookie->id_guest)

				{

					$guest = new Guest(Context::getContext()->cookie->id_guest);

					$this->context->cart->mobile_theme = $guest->mobile_theme;

				}

				$this->context->cart->add();

				if ($this->context->cart->id)

					$this->context->cookie->id_cart = (int)$this->context->cart->id;

			}



			
			if (!$product->hasAllRequiredCustomizableFields() && !$this->customization_id)

				$this->errors[] = Tools::displayError('Please fill in all of the required fields, and then save your customizations.', !Tools::getValue('ajax'));



			if (!$this->errors)

			{

				$cart_rules = $this->context->cart->getCartRules();

				$update_quantity = $this->context->cart->updateQty($this->qty, $this->id_product, $this->id_product_attribute, $this->customization_id, Tools::getValue('op', 'up'), $this->id_address_delivery);

				if ($update_quantity < 0)

				{

					
					$minimal_quantity = ($this->id_product_attribute) ? Attribute::getAttributeMinimalQty($this->id_product_attribute) : $product->minimal_quantity;

					$this->errors[] = sprintf(Tools::displayError('You must add %d minimum quantity', !Tools::getValue('ajax')), $minimal_quantity);

				}

				elseif (!$update_quantity)

					$this->errors[] = Tools::displayError('You already have the maximum quantity available for this product.', !Tools::getValue('ajax'));

				elseif ((int)Tools::getValue('allow_refresh'))

				{

					
					$cart_rules2 = $this->context->cart->getCartRules();

					if (count($cart_rules2) != count($cart_rules))

						$this->ajax_refresh = true;

					else

					{

						$rule_list = array();

						foreach ($cart_rules2 as $rule)

							$rule_list[] = $rule['id_cart_rule'];

						foreach ($cart_rules as $rule)

							if (!in_array($rule['id_cart_rule'], $rule_list))

							{

								$this->ajax_refresh = true;

								break;

							}

					}

				}

			}

		}



		$removed = CartRule::autoRemoveFromCart();

		CartRule::autoAddToCart();

		if (count($removed) && (int)Tools::getValue('allow_refresh'))

			$this->ajax_refresh = true;

	}



	/**

	 * Remove discounts on cart

	 */

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected function processRemoveDiscounts()

	{

		Tools::displayAsDeprecated();

		$this->errors = array_merge($this->errors, CartRule::autoRemoveFromCart());

	}



	/**

	 * @see FrontController::initContent()

	 */

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	public function initContent()

	{

		$this->setTemplate(_PS_THEME_DIR_.'errors.tpl');

		if (!$this->ajax)

			parent::initContent();

	}

	/**

	 * Display ajax content (this function is called instead of classic display, in ajax mode)

	 */

	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	public function displayAjax()

	{

		if ($this->errors)

			$this->ajaxDie(Tools::jsonEncode(array('hasError' => true, 'errors' => $this->errors)));

		if ($this->ajax_refresh)

			$this->ajaxDie(Tools::jsonEncode(array('refresh' => true)));



		
		$this->context->cookie->write();



		if (Tools::getIsset('summary'))

		{

			$result = array();

			if (Configuration::get('PS_ORDER_PROCESS_TYPE') == 1)

			{

				$groups = (Validate::isLoadedObject($this->context->customer)) ? $this->context->customer->getGroups() : array(1);

				if ($this->context->cart->id_address_delivery)

					$deliveryAddress = new Address($this->context->cart->id_address_delivery);

				$id_country = (isset($deliveryAddress) && $deliveryAddress->id) ? (int)$deliveryAddress->id_country : (int)Tools::getCountry();



				Cart::addExtraCarriers($result);

			}

			$result['summary'] = $this->context->cart->getSummaryDetails(null, true);

			$result['customizedDatas'] = Product::getAllCustomizedDatas($this->context->cart->id, null, true);

			$result['HOOK_SHOPPING_CART'] = Hook::exec('displayShoppingCartFooter', $result['summary']);

			$result['HOOK_SHOPPING_CART_EXTRA'] = Hook::exec('displayShoppingCart', $result['summary']);



			foreach ($result['summary']['products'] as $key => &$product)

			{

				$product['quantity_without_customization'] = $product['quantity'];

				if ($result['customizedDatas'] && isset($result['customizedDatas'][(int)$product['id_product']][(int)$product['id_product_attribute']]))

				{

					foreach ($result['customizedDatas'][(int)$product['id_product']][(int)$product['id_product_attribute']] as $addresses)

						foreach ($addresses as $customization)

							$product['quantity_without_customization'] -= (int)$customization['quantity'];

				}

				$product['price_without_quantity_discount'] = Product::getPriceStatic(

					$product['id_product'],

					!Product::getTaxCalculationMethod(),

					$product['id_product_attribute'],

					6,

					null,

					false,

					false

				);



				if ($product['reduction_type'] == 'amount')

				{

					$reduction = (float)$product['price_wt'] - (float)$product['price_without_quantity_discount'];

					$product['reduction_formatted'] = Tools::displayPrice($reduction);

				}

			}

			if ($result['customizedDatas'])

				Product::addCustomizationPrice($result['summary']['products'], $result['customizedDatas']);



			Hook::exec('actionCartListOverride', array('summary' => $result, 'json' => &$json));

			$this->ajaxDie(Tools::jsonEncode(array_merge($result, (array)Tools::jsonDecode($json, true))));



		}

		
		elseif (file_exists(_PS_MODULE_DIR_.'/blockcart/blockcart-ajax.php'))

			require_once(_PS_MODULE_DIR_.'/blockcart/blockcart-ajax.php');

	}



	/*
	* module: giftlist
	* date: 2016-06-28 14:44:36
	* version: 1.0.0
	*/
	protected function processChangeProductInCartFromList() {

        $products = $this->context->cart->getProducts();

        if(count($products) > 0){

            foreach($products as $product){
                if($product['id_giftlist'] != 0 && $product['id_giftlist'] != $this->id_giftlist){

                    $this->errors [] = Tools::displayError ( 'Recuerda que solo puedes agregar productos de una misma Lista de regalos a un solo carrito de compras', ! Tools::getValue ( 'ajax' ) );

                    return;

                }elseif($product['id_giftlist'] == 0){

                    $this->errors [] = Tools::displayError ( 'Recuerda que no puedes agregar productos del Ecommerce y de una Lista de regalos en un mismo carrito', ! Tools::getValue ( 'ajax' ) );

                    return;

                }
                if($this->id_product == $product['id_product'] && $this->id_giftlist != 0 && $product['id_product_attribute'] == $this->id_product_attribute){
                    $cant = GiftlistModel::getCantByListAndProduct($this->id_giftlist,$this->id_product,$this->id_product_attribute);
                    if($cant < ($this->qty + $product['cart_quantity'])){
                        $this->errors [] = Tools::displayError ( 'La cantidad que elegiste supera la requerida por el creador de la lista.', ! Tools::getValue ( 'ajax' ) );
                        return;
                    }

                }
            }
        }
        
		$mode = (Tools::getIsset ( 'updateFromList' ) && $this->id_product) ? 'update' : 'add';

        $params['id_product'] = $this->id_product;

		$params['id_product_attribute'] = $this->id_product_attribute;

		

		$response = Hook::exec('actionProductCartSave', $params);

		if ($this->qty == 0 || $response==0){

            $param['id_product'] = $this->id_product;
            $param['id_list'] = $this->id_giftlist;
            $param['id_product_attribute'] = $this->id_product_attribute;

            Hook::exec('actionProductInList',$param);

            $this->errors [] = Tools::displayError ( 'Null quantity.', ! Tools::getValue ( 'ajax' ) );

        }

		elseif (! $this->id_product)

			$this->errors [] = Tools::displayError ( 'Product not found', ! Tools::getValue ( 'ajax' ) );

		$product = new Product ( $this->id_product, true, $this->context->language->id );

		if (! $product->id || ! $product->active || ! $product->checkAccess ( $this->context->cart->id_customer )) {

			$this->errors [] = Tools::displayError ( 'This product is no longer available.', ! Tools::getValue ( 'ajax' ) );

			return;

		}

		$qty_to_check = $this->qty * ($this->qty_group != 0 ? $this->qty_group : 1);

		$cart_products = $this->context->cart->getProducts ();

		if (is_array ( $cart_products ))

			foreach ( $cart_products as $cart_product ) {

				if ((! isset ( $this->id_product_attribute ) || $cart_product ['id_product_attribute'] == $this->id_product_attribute) && (isset ( $this->id_product ) && $cart_product ['id_product'] == $this->id_product)) {

					$qty_to_check = $cart_product ['cart_quantity'];

					if (Tools::getValue ( 'op', 'up' ) == 'down')

						$qty_to_check -= $this->qty * ($this->qty_group != 0 ? $this->qty_group : 1);

					else

						$qty_to_check += $this->qty * ($this->qty_group != 0 ? $this->qty_group : 1);

					break;

				}

			}

		if ($this->id_product_attribute) {

			if (! Product::isAvailableWhenOutOfStock ( $product->out_of_stock ) && ! Attribute::checkAttributeQty ( $this->id_product_attribute, $qty_to_check ))

				$this->errors [] = Tools::displayError ( 'There isn\'t enough product in stock.', ! Tools::getValue ( 'ajax' ) );

		} elseif ($product->hasAttributes ()) {

			$minimumQuantity = ($product->out_of_stock == 2) ? ! Configuration::get ( 'PS_ORDER_OUT_OF_STOCK' ) : ! $product->out_of_stock;

			$this->id_product_attribute = Product::getDefaultAttribute ( $product->id, $minimumQuantity );

			if (! $this->id_product_attribute)

				Tools::redirectAdmin ( $this->context->link->getProductLink ( $product ) );

			elseif (! Product::isAvailableWhenOutOfStock ( $product->out_of_stock ) && ! Attribute::checkAttributeQty ( $this->id_product_attribute, $qty_to_check ))

				$this->errors [] = Tools::displayError ( 'There isn\'t enough product in stock.', ! Tools::getValue ( 'ajax' ) );

		} elseif (! $product->checkQty ( $qty_to_check ))

			$this->errors [] = Tools::displayError ( 'There isn\'t enough product in stock.', ! Tools::getValue ( 'ajax' ) );

			if (! $this->errors && $mode == 'add') {

				if (! $this->context->cart->id) {

					if (Context::getContext ()->cookie->id_guest) {

						$guest = new Guest ( Context::getContext ()->cookie->id_guest );

						$this->context->cart->mobile_theme = $guest->mobile_theme;

				}

				$this->context->cart->add();

				if ($this->context->cart->id)

					$this->context->cookie->id_cart = ( int ) $this->context->cart->id;

			}

			if (! $product->hasAllRequiredCustomizableFields () && ! $this->customization_id)

				$this->errors [] = Tools::displayError ( 'Please fill in all of the required fields, and then save your customizations.', ! Tools::getValue ( 'ajax' ) );

			if (! $this->errors) {

				$cart_rules = $this->context->cart->getCartRules ();

				$update_quantity = $this->context->cart->updateQty ( $this->qty * ($this->qty_group != 0 ? $this->qty_group : 1), $this->id_product, $this->id_product_attribute, $this->customization_id, Tools::getValue ( 'op', 'up' ), $this->id_address_delivery ,null, null,$this->id_giftlist );

				if ($update_quantity < 0) {

					$minimal_quantity = ($this->id_product_attribute) ? Attribute::getAttributeMinimalQty ( $this->id_product_attribute ) : $product->minimal_quantity;

					$this->errors [] = sprintf ( Tools::displayError ( 'You must add %d minimum quantity', ! Tools::getValue ( 'ajax' ) ), $minimal_quantity );

				} elseif (! $update_quantity)

					$this->errors [] = Tools::displayError ( 'You already have the maximum quantity available for this product.', ! Tools::getValue ( 'ajax' ) );

				elseif (( int ) Tools::getValue ( 'allow_refresh' )) {

					$cart_rules2 = $this->context->cart->getCartRules();

					if (count ( $cart_rules2 ) != count ( $cart_rules ))

						$this->ajax_refresh = true;

					else 

					{

						$rule_list = array ();

						foreach ( $cart_rules2 as $rule )

						$rule_list [] = $rule ['id_cart_rule'];

						foreach ( $cart_rules as $rule )

							if (! in_array ( $rule ['id_cart_rule'], $rule_list )) {

								$this->ajax_refresh = true;

								break;

							}

					}

				}

			}

		}

		$removed = CartRule::autoRemoveFromCart ();

		CartRule::autoAddToCart ();

		if (count ( $removed ) && ( int ) Tools::getValue ( 'allow_refresh' ))

			$this->ajax_refresh = true;

	}

}