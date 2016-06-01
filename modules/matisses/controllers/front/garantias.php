<?php

require_once _PS_MODULE_DIR_ . "matisses/classes/Danos.php";

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
		
		foreach($garantias as $k => $garantia)
		{
			$garantias[$k]['imgs'] = array_filter(explode(',',$garantias[$k]['imgs']));
			$garantias[$k]['status'] = 'Pendiente';
			$garantias[$k]['fecha']	= date('Y/m/d - H:i:s',$garantia['fecha']);
			$garantias[$k]['history'][0]['fecha'] = date('Y/m/d',$garantia['fecha']);
			$garantias[$k]['history'][0]['description'] = 'Solicitud recibida';
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
	
	public function nueva()
	{
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
		$garantia = $this->getGarantia();
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
								'fecha'	=> time(),
								
							));


							$id_insert = Db::getInstance()->Insert_ID();
							//echo "<br><br><br><br><br><br><br><br><br>id_insert:  ".$id_insert."<br>";
							foreach($imagenes as $k => $imagen)
							{
								move_uploaded_file($imagen['tmp_name'],_PS_IMG_DIR_.'garantias/'.$id_insert.'_'.$k.'.jpg');
								$imagesuploaded[] = $id_insert.'_'.$k;
								$realimages[] = _PS_BASE_URL_.__PS_BASE_URI__.'img/garantias/'.$id_insert.'_'.$k.'.jpg';
							}

//							echo "<pre>";
//							print_r($realimages);
//							echo "</pre>";
//                            die();
							
							
							$itemCode = Db::getInstance()->getValue('SELECT reference 
																	 FROM '._DB_PREFIX_.'product_attribute 
																	 WHERE id_product_attribute = "'.$orderdetail[1].'" 
																	  ');
							
							$invoiceNumber = Db::getInstance()->getValue('SELECT a.id_factura 
																	 FROM '._DB_PREFIX_.'cart as a
																	 	INNER JOIN '._DB_PREFIX_.'orders as b
																	 		ON a.id_cart = b.id_cart
																	  WHERE b.id_order = "'.$orderdetail[0].'"');										  
																	  
																	  
								 
							$customer = new Customer($this->context->customer->id);
							$params['customerId'] 		= $customer->charter.'CL';
							$params['description'] 		= Tools::getValue('resumen') ;
							$params['invoiceNumber'] 	= $invoiceNumber;
							$params['itemCode'] 		= $itemCode;
							$params['subject'] 			= Tools::getValue('asunto');	
							$params['problems']			= explode(',',Tools::getValue('tipo'));
							$params['images']			= $realimages;
							$params['images_64']         = $uploadedImg;
							
							
							$response = Hook::exec('actionAddGarantia', $params );
							//echo "response <pre>"; print_r($response); echo "</pre>";
							Db::getInstance()->execute('UPDATE '._DB_PREFIX_.'garantias SET imgs = "'.str_replace(_PS_IMG_DIR_,'',implode(',',$imagesuploaded)).'" WHERE id = '.$id_insert );
							$link = new link;
							
							
							
							
							Tools::redirect($link->getModuleLink('matisses','garantias').'/step3/producto/'.$_POST['data']); 
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
