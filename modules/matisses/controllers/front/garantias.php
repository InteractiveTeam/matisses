<?php

require_once _PS_MODULE_DIR_ . "matisses/classes/Danos.php";
require_once _PS_MODULE_DIR_.'matisses/CargarProductos.php';

class matissesgarantiasModuleFrontController extends ModuleFrontController
{
	//public $php_self = "experiences";
	public $auth = true; 
	public $info; 
	protected $garantia;
	
	
	public function init()
	{
		parent::init();
		include_once(dirname(__FILE__).'/../../classes/Experiences.php');
		if($this->ajax){
			if(Tools::getValue("method") == "addComment"){
				$params['id_garantia'] = Tools::getValue("id_request");
				$params['comment'] = Tools::getValue("comment");
				$res = json_decode(hook::exec("actionAddCommetsGarantia",$params));
				$ret = array();
				if((int)substr($res->return->code, 4 , 1)  === 9){
					$ret = array(
						'message' => $res->return->detail,
						'error' => true
					);
				}else{
					$ret = array(
						'message' => $res->return->detail,
						'error' => false
					);
				}
				die(json_encode($ret));
			}
		}
	}
	
	public function setMedia()
	{
		parent::setMedia();	
		$this->addCSS(array(_PS_MODULE_DIR_.'blocklayered/css/jquery.jscrollpane.css'));
		$this->addCSS(array(_PS_MODULE_DIR_.'blocklayered/css/jquery.mCustomScrollbar.css'));
		$this->addCSS(array(_PS_MODULE_DIR_.'matisses/css/garantias/garantias.css'));
		$this->addJS(array(_PS_MODULE_DIR_.'matisses/js/garantias/garantias.js'));
		$this->addJS(array(_PS_MODULE_DIR_.'blocklayered/js/jquery.mCustomScrollbar.min.js'));
		$this->addJqueryPlugin(array('bxslider','scrollTo', 'footable','footable-sort'));
		if(Tools::getValue('step')=='nueva')
		{
			$this->addCSS(array(
				_THEME_CSS_DIR_.'history.css',
				_THEME_CSS_DIR_.'addresses.css'
			));
			$this->addJS(array(
				_THEME_JS_DIR_.'history.js',
				_THEME_JS_DIR_.'tools.js' // retro compat themes 1.5
			));
			
		}
		

	}
	
	public function initContent()
	{
		parent::initContent();
		$this->info['confgaran_danos'] = Configuration::get('confgaran_nrdanos');
		$this->info['confgaran_nimages'] = Configuration::get('confgaran_nimages');
		$this->info['confgaran_nrdanos'] = Configuration::get('confgaran_danos');
		$this->info['confgaran_terminos'] = Configuration::get('confgaran_terminos');
		
		$this->info['confgaran_terminos'] = Db::getInstance()->getValue('SELECT content 
																		 FROM '._DB_PREFIX_.'cms_lang 
																		 WHERE id_cms = "'.$this->info['confgaran_terminos'].'" 
																		 		and id_lang="'.$this->context->language->id.'" 
																				and id_shop="'.$this->context->shop->id.'"');
		
		$this->info['confgaran_imagen'] = Tools::getShopDomain(true).'/img/'.Configuration::get('confgaran_imagen'); 
		$this->context->smarty->assign('config',$this->info);
		$step = Tools::getValue('step');
		switch($step)
		{
			case 'nueva':
				$this->nueva();
			break;
			case 'estado':
				$this->estado();
			break;
			
			case 'step3':
				$this->step3();
			break;
			
			case 'modificar':
			case 'step2':
				$this->step2();
			break;
			
			case 'step1':
			default:
				$this->step1();
		}
	}
	
	private function getGarantia()
	{
		$orderdetail = explode('-',$_POST['data']);
		$garantia = Db::getInstance()->getRow('SELECT a.id as id_garantia, a.description as description_dano, a.*, b.*, c.*, d.* 
												 FROM '._DB_PREFIX_.'garantias as a
												 	INNER JOIN '._DB_PREFIX_.'product as b
													INNER JOIN '._DB_PREFIX_.'product_lang as d
													INNER JOIN '._DB_PREFIX_.'customer as c
													ON
													a.id_product = b.id_product
													and a.id_customer = c.id_customer
													and a.id_product = d.id_product
												 WHERE
												 	a.id_lang = '.$this->context->language->id.'
												  	and a.id_shop = '.$this->context->shop->id.'
													and a.id_customer = '.$this->context->customer->id.'
												 	and a.id_order = '.$orderdetail[0].'	
												 	and a.id_product = '.$orderdetail[1].'	
												 	and a.id_product_attribute = '.$orderdetail[2]);
		$garantia['imgs'] = explode(',',$garantia['imgs']);	
		return $garantia;										
	}
	
	public function step3()
	{
		
		$garantia = $this->getGarantia();
		$this->context->smarty->assign(array(
										'garantia' => $garantia,
									 ));											
		
		$this->setTemplate('garantias_result.tpl');
	}
	
	public function allCustomerGarantias()
	{
		$sql = 'SELECT a.id as id_garantia, a.description as description_dano, a.*, b.*, c.*, d.* 
												 FROM '._DB_PREFIX_.'garantias as a
												 	INNER JOIN '._DB_PREFIX_.'product as b
													INNER JOIN '._DB_PREFIX_.'product_lang as d
													INNER JOIN '._DB_PREFIX_.'customer as c
													ON
													a.id_product = b.id_product
													and a.id_customer = c.id_customer
													and a.id_product = d.id_product
												 WHERE
												 	a.id_lang = '.$this->context->language->id.'
												  	and a.id_shop = '.$this->context->shop->id.'
													and a.id_customer = '.$this->context->customer->id;
		$garantias = Db::getInstance()->executeS($sql);
		$history = "";
		foreach($garantias as $k => $garantia)
		{
			$history = (array)json_decode(hook::exec("actionListGarantia", array('id_garantia' => $garantia['id_request'])));
			$garantias[$k]['imgs'] = array_filter(explode(',',$garantias[$k]['imgs']));
			$garantias[$k]['status'] = $history['statusName'];
			$garantias[$k]['id_request'] = $garantia['id_request'];
			$garantias[$k]['code'] = $history['statusCode'];
			$garantias[$k]['fecha']	= date('Y/m/d - H:i:s',$garantia['fecha']);
			$garantias[$k]['history'][0]['fecha'] = date('Y/m/d - H:i',$garantia['fecha']);
			$garantias[$k]['history'][0]['description'] = 'Solicitud recibida';
			$i = 1;
			if(sizeof($history['history']) > 1){
				foreach($history['history'] as $log){
					$garantias[$k]['history'][$i]['fecha'] = date('Y/m/d - H:i',strtotime($log->fecha));
					$garantias[$k]['history'][$i]['description'] = $log->name;
					$i++;
				}
			}
			else{
				$garantias[$k]['history'][$i]['fecha'] = date('Y/m/d - H:i',strtotime($history['history']->fecha));
				$garantias[$k]['history'][$i]['description'] = $history['history']->name;
			}
		}
		return $garantias;
 	}
	
	public function estado()
	{
		$allCustomerGarantias = $this->allCustomerGarantias();
		$this->context->smarty->assign(array(
			'garantias' => $allCustomerGarantias,
		));
		$this->setTemplate('garantias_estado.tpl');
	}

	public function registerOrder($ordersap){
		//echo "<pre>"; print_r($ordersap); echo "</pre>";die();
		$add = $this->registerAddress($this->context->customer->email);
		if($add){
			$ordersap['total'] = 0;
			$cart = new Cart();
			$cart->id_customer = $this->context->customer->id;
			$cart->id_address_delivery = $add;
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
			foreach ($ordersap['items'] as $item) {
				try{
					if ($item['quantity'] != 0) {
						$prod = Db::getInstance()->getRow("SELECT * FROM " . _DB_PREFIX_ . "product_attribute WHERE reference = '".$item['itemCode']."'");
						if (empty($prod)) {
							$sonda->loadProductByReferenceWithoutStock($item['itemCode']);
							$prod = Db::getInstance()->getRow("SELECT * FROM " . _DB_PREFIX_ . "product_attribute WHERE reference = '".$item['itemCode']."'");
							if(is_array($prod)){
								$product = new Product($prod['id_product']);
								$product->quantity = $product->quantity+$item['quantity'];
								$product->active = true;
								$product->update();
								$cart->updateQty($item['quantity'], $prod['id_product'],$prod['id_product_attribute']);  
								$ordersap['total'] += $item['price'];
							}
						} else {
							$product = new Product($prod['id_product']);
							if(!empty($product)){
								$product->quantity = $product->quantity+$item['quantity'];
								$product->active = true;
								$product->update();
								$cart->updateQty($item['quantity'], $prod['id_product'],$prod['id_product_attribute']);   
								$ordersap['total'] += $item['price'];
							}
						}
					} else {
						unset($cart);
					}
				}catch(Exception $e){
					return;
				}
			}
			die(print_r($cart->getProducts()));
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
				$order->secure_key = md5(uniqid(rand(), true));
				$order->payment = 'Pago en Tienda Física';
				$order->module = "matisses";
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
                
                Db::getInstance()->insert('order_history', array(
                    'id_employee' => 1,
                    'id_order' => $order->id,
                    'id_order_state' => $id_order_state,
                    'date_add' => date('Y-m-d H:i:s')
                ));
                
				$order_list[] = $order;
				// Insert new Order detail list using cart for the current order
				$order_detail = new OrderDetail(null, null, $this->context);
				$order_detail->createList($order, $cart, $id_order_state, $order->product_list, 0, true);
				$order_detail_list[] = $order_detail;

				unset($order);
				unset($order_detail);
			}
		}
	}

	public function registerAddress($email){
		$mat = new matisses();
		$userSap = $mat->wsmatissess_getCustomerbyEmail($email);
		$addresses = $userSap['customerDTO']['addresses'];
		if(empty($addresses))
			return false;
        
        $params = array(
            'firstname' => $this->context->customer->firstname,
            'secondname' => $this->context->customer->secondname,
            'lastname' => $this->context->customer->lastname,
            'surname' => $this->context->customer->surname,
            'idcustomer' => $this->context->customer->id
        );

		$addressObj = new Address();
		foreach ($addresses as $addr) {
			if ($addr['addressType'] == 'E') {
                $id = Db::getInstance()->getValue("SELECT id_address FROM "._DB_PREFIX_."address WHERE address1 = '".$addr['address'] . "' AND lastname = '" .$params['lastname']. "' AND firstname = '" .$params['firstname'] . "'");
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
		return $addressObj->id;
	}

	protected function isNumericArray($array) {
        foreach ($array as $a => $b) {
            if (!is_int($a)) {
                return false;
            }
        }
        return true;
    }
	
	public function nueva()
	{
		$mat = new matisses();
		$sapOrders = $mat->wsmatissess_getOrdersByCharter($this->context->customer->charter);
		if($this->isNumericArray($sapOrders['customerOrdersDTO']['orders'])){
			foreach($sapOrders['customerOrdersDTO']['orders'] as $order){
				$psOrders = Db::getInstance()->getRow("SELECT * FROM "._DB_PREFIX_.'cart WHERE id_factura = "'. $order['invoiceNumber']. '"');;
				if(sizeof($psOrders) == 1){
					$this->registerOrder($order);
				}
			}
		}else{
			$psOrders = Db::getInstance()->getRow("SELECT * FROM "._DB_PREFIX_.'cart WHERE id_factura = "'. $sapOrders['customerOrdersDTO']['orders']['invoiceNumber']. '"');
			if(empty($psOrders)){
				$this->registerOrder($sapOrders['customerOrdersDTO']['orders']);
			}
		}
		if ($orders = Order::getCustomerOrders($this->context->customer->id))
		foreach ($orders as &$order)
		{
			$myOrder = new Order((int)$order['id_order']);
            $order['idFacture'] = $myOrder->getIdFacture();
			if (Validate::isLoadedObject($myOrder))
				$order['virtual'] = $myOrder->isVirtual(false);
		}
		$this->context->smarty->assign(array(
			'orders' => $orders,
			'invoiceAllowed' => (int)Configuration::get('PS_INVOICE'),
			'reorderingAllowed' => !(int)Configuration::get('PS_DISALLOW_HISTORY_REORDERING'),
			'slowValidation' => Tools::isSubmit('slowvalidation')
		));
		
		$this->setTemplate('garantias_pedidos.tpl');
	}
	
	public function step2()
	{
		//$garantia = $this->getGarantia();
		if(Tools::isSubmit('submitStep2'))
		{
            //echo "<pre>";print_r($_POST);echo "</pre>";die();
			$this->context->smarty->assign(array(
												'tipo' => Tools::getValue('tipo'),
												'asunto' => Tools::getValue('asunto'),
												'resumen' => Tools::getValue('resumen'),
												));
			if(!Tools::getValue('tipo'))
				$this->errors[] = Tools::displayError('Indique los tipos de daño');		
			
			if(!Tools::getValue('asunto'))
				$this->errors[] = Tools::displayError('Indique el asunto de la garantia');		
				
			if(!Tools::getValue('resumen'))
				$this->errors[] = Tools::displayError('Indique el detalle del daño de la garantia');
			
			
			if(!$garantia['id_garantia'])
			{	
				if(!$_FILES['imagen']['name'][0])
					$this->errors[] = Tools::displayError('Cargue almenos una imagen del daño');
			}
	
	
			if($_FILES['imagen']['name'][0])
			{
				$imagen = $_FILES['imagen'];
				for($i=1; $i<=sizeof($imagen['name']); $i++)
				{
					if($imagen['name'][$i])
					{
						$imagenes[$i]['name'] 		= $imagen['name'][$i];
						$imagenes[$i]['type'] 		= $imagen['type'][$i];
						$imagenes[$i]['tmp_name'] 	= $imagen['tmp_name'][$i];
						$imagenes[$i]['error']		= $imagen['error'][$i];
						$imagenes[$i]['size']		= $imagen['size'][$i];
					}
				}
				foreach($imagenes as $k => $imagen)
				{
					if(!in_array(strtolower(trim(pathinfo($imagen['name'], PATHINFO_EXTENSION))), array('jpg','png','gif','jpeg')))
					{
						$this->errors[] = Tools::displayError('Una o mas imagenes no cumplen con el formato adecuado');
						break;
					}
					
					if($imagen['error']!=0)
					{
						$this->errors[] = Tools::displayError('Una o mas imagenes presentaron error al cargar');
						break;
					}
					
					if($imagen['size']>Configuration::get("PS_PRODUCT_PICTURE_MAX_SIZE"))
					{
						$this->errors[] = Tools::displayError('Una o mas imagenes exceden el limite de carga permitido ').' '.(Configuration::get("PS_PRODUCT_PICTURE_MAX_SIZE")/(1024*1024)).'Mb';
						break;
					}
				}				
				
			}	
				
			if(sizeof($this->errors)==0)
			{
				$imagen = $_FILES['imagen'];
				if($imagen['name'][0])
				{
					for($i=0; $i<=sizeof($imagen['name']); $i++)
					{
						if($imagen['name'][$i])
						{
							$imagenes[$i]['name'] 		= $imagen['name'][$i];
							$imagenes[$i]['type'] 		= $imagen['type'][$i];
							$imagenes[$i]['tmp_name'] 	= $imagen['tmp_name'][$i];
							$imagenes[$i]['error']		= $imagen['error'][$i];
							$imagenes[$i]['size']		= $imagen['size'][$i];
						}
					}
					
					foreach($imagenes as $k => $imagen)
					{
						if(strtolower(trim(pathinfo($imagen['name'], PATHINFO_EXTENSION))) != 'jpg')
						{
							$this->errors[] = Tools::displayError('Una o mas imagenes no cumplen con el formato jpg');
							break;
						}
						
						if($imagen['error']!=0)
						{
							$this->errors[] = Tools::displayError('Una o mas imagenes presentaron error al cargar');
							break;
						}
						
						if($imagen['size']>Configuration::get("PS_PRODUCT_PICTURE_MAX_SIZE"))
						{
							$this->errors[] = Tools::displayError('Una o mas imagenes exceden el limite de carga permitodo');
							break;
						}
					}
				}

					
					if(sizeof($this->errors)==0)
					{
						if(!$garantia['id_garantia'])
						{
							//creo
							$orderdetail = explode('-',$_POST['data']);
													
							
							$itemCode = Db::getInstance()->getValue('SELECT reference 
																	 FROM '._DB_PREFIX_.'product_attribute 
																	 WHERE id_product_attribute = '.$orderdetail[2].'
																	  ');
							
							$invoiceNumber = Db::getInstance()->getValue('SELECT a.id_factura 
																	 FROM '._DB_PREFIX_.'cart as a
																	 	INNER JOIN '._DB_PREFIX_.'orders as b
																	 		ON a.id_cart = b.id_cart
																	  WHERE b.id_order = "'.$orderdetail[0].'"');	

							foreach($imagenes as $k => $imagen)
							{
								$name = hook::exec('actionMatChangeReference',array('reference'=> $itemCode)). $invoiceNumber ."_".$k;
								move_uploaded_file($imagen['tmp_name'],_PS_IMG_DIR_.'garantias/'.$name.'.jpg');
								$imagesuploaded[] = $name;
								$realimages[] = _PS_BASE_URL_.__PS_BASE_URI__.'img/garantias/'.$name.'.jpg';
							}
							
							$customer = new Customer($this->context->customer->id);
							$params['customerId'] 		= $customer->charter.'CL';
							$params['description'] 		= Tools::getValue('resumen') ;
							$params['invoiceNumber'] 	= $invoiceNumber;
							$params['itemCode'] 		= $itemCode;
							$params['subject'] 			= Tools::getValue('asunto');	
							$params['problems']			= explode(',',Tools::getValue('tipo'));
							$params['images']			= $realimages;
							$params['images_64']         = $realimages;
                            
							$response = Hook::exec('actionAddGarantia', $params );
							
                            $response = Tools::jsonDecode($response);
                            if((int)substr($response->return->code, 4 , 1)  === 9){
                                $this->errors[] = Tools::displayError($response->return->detail);
                            }
                            
                            if(sizeof($this->errors)==0)
					        {
                            
                                Db::getInstance()->insert('garantias', array(
                                    'id_lang' 		=>	$this->context->language->id,
                                    'id_shop' 		=>	$this->context->shop->id,
                                    'asunto' 		=>	Tools::getValue('asunto'),
                                    'tipo' 			=>	Tools::getValue('tipo'),
                                    'description' 	=>	Tools::getValue('resumen'),
                                    'id_customer' 	=>	$this->context->customer->id,
                                    'id_order'		=> 	$orderdetail[0],
                                    'id_product'	=>  	$orderdetail[1],
                                    'id_product_attribute'	=> $orderdetail[2],
									'id_request' => $response->return->detail,
                                    'fecha'	=> time(),

                                ));


                                $id_insert = Db::getInstance()->Insert_ID();
                                //echo "<br><br><br><br><br><br><br><br><br>id_insert:  ".$id_insert."<br>";
                                // foreach($imagenes as $k => $imagen)
                                // {
                                //     move_uploaded_file($imagen['tmp_name'],_PS_IMG_DIR_.'garantias/'.$id_insert.'_'.$k.'.jpg');
                                //     $imagesuploaded[] = $id_insert.'_'.$k;
                                //     $realimages[] = _PS_BASE_URL_.__PS_BASE_URI__.'img/garantias/'.$id_insert.'_'.$k.'.jpg';
                                // }

    //							echo "<pre>";
    //							print_r($realimages);
    //							echo "</pre>";
    //                            die();

                                Db::getInstance()->execute('UPDATE '._DB_PREFIX_.'garantias SET imgs = "'.str_replace(_PS_IMG_DIR_,'',implode(',',$imagesuploaded)).'" WHERE id = '.$id_insert );
                                $link = new link;

                                Tools::redirect($link->getModuleLink('matisses','garantias').'/step3/producto/'.$_POST['data']);
                            }
						}else{
								//actualizo
								$id_insert = $garantia['id_garantia'];
								if(sizeof($imagenes)>0)
								{
									
									foreach($imagenes as $k => $imagen)
									{
										unlink(_PS_IMG_DIR_.'garantias/'.$id_insert.'_'.$k.'.jpg');
										move_uploaded_file($imagen['tmp_name'],_PS_IMG_DIR_.'garantias/'.$id_insert.'_'.$k.'.jpg');
										$imagesuploaded[] = $id_insert.'_'.$k;
									}
									Db::getInstance()->execute('UPDATE '._DB_PREFIX_.'garantias SET imgs = "'.str_replace(_PS_IMG_DIR_,'',implode(',',$imagesuploaded)).'" WHERE id = '.$id_insert );
								}
								


								
								Db::getInstance()->execute('
									UPDATE '._DB_PREFIX_.'garantias
									SET
										asunto		=	"'.Tools::getValue('asunto').'",
										tipo 		=	"'.Tools::getValue('tipo').'",
										description =	"'.Tools::getValue('resumen').'"
									WHERE id = '.$id_insert);
								   
								   
								   $link = new link;
									Tools::redirect($link->getModuleLink('matisses','garantias').'/step3/producto/'.$_POST['data']); 	
								
							 }
						
					}
				}			
		}
        $data = explode("-",Tools::getValue("data"));
        $prod = new ProductCore($data[1]);
        $features = $prod->getFeatures();
        $damages = array();
        $i = 0;
        foreach($features as $ft){
            $m = FeatureValueCore::getFeatureValuesWithLang(1,$ft['id_feature']);
            $f = FeatureCore::getFeature(1,$ft['id_feature']);
            
            $damages[$i] = array(
                'material' => $m[0]['value'],
                'id_value' => $m[0]['id_feature_value'],
                'code' => str_replace("material_","",$f['name']),
                'damages' => Danos::getDamages($f['id_feature'])
            );
            $i++;
        }
		$realdanos = array();
		$danos = explode(',',$this->info['confgaran_nrdanos']);
		
		if(sizeof($danos))
		{
			foreach($danos as $k => $dano)
			{
				$dano = explode(':',$dano);
				$realdanos[$k]['coddano'] = $dano[0];
				$realdanos[$k]['dano'] = $dano[1];
			}
		}
		
		switch($this->info['confgaran_danos'])
		{
			case '1': $nrodanos = 'un'; break;
			case '2': $nrodanos = 'dos'; break;
			case '3': $nrodanos = 'tres'; break;
			case '4': $nrodanos = 'cuatro'; break;
			case '5': $nrodanos = 'cinco'; break;
			case '6': $nrodanos = 'seis'; break;
			case '7': $nrodanos = 'siete'; break;
			case '8': $nrodanos = 'ocho'; break;
			case '9': $nrodanos = 'nueve'; break;
			case '10': $nrodanos = 'diez'; break;
			default: $nrodanos = $this->info['confgaran_danos'];
		}

		$this->context->smarty->assign(array(
												'danos' => $realdanos,
												'nrodanos' => $nrodanos,
												'rnrodanos' => $this->info['confgaran_danos'],
												'errors' => $this->errors,
                                                'materials' => $damages
												
											 ));
		if($garantia)
		{
			//$garantia['imgs'] = explode(',',$garantia['imgs']);
			$garantia['imgs'] = array_filter(array_unique($garantia['imgs']));
			$this->context->smarty->assign(array(
												'tipo' => $garantia['tipo'],
												'asunto' => $garantia['asunto'],
												'resumen' => $garantia['description_dano'],
												'garantia' => $garantia,
												));
		}
		$this->setTemplate('garantias_step2.tpl'); 
	}
	
	public function step1()
	{
		$link = new link;
		if(Tools::isSubmit('submitStep1'))
		{
			
			if(!Tools::getValue('accept'))
				$this->errors[] = Tools::displayError('Debe aceptar los terminos de las garantias');
			
			if(sizeof($this->errors)==0)
				Tools::redirect($link->getModuleLink('matisses','garantias').'/step2/producto/'.$_POST['data']);
				
						
		}
		$this->setTemplate('garantias_step1.tpl');
	}
}

?>
