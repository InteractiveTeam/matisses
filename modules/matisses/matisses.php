<?php
class matisses extends Module
{
	
	private $_uploadfile = 'matisses';
	
	public function __construct()
	{
		$this->name 			= basename(__FILE__,'.php');
		$this->tab 				= 'administration';
		$this->version 			= '1.0'; 
		$this->author 			= 'Arkix';
		$this->token 			= Tools::getAdminTokenLite('AdminModules');
		parent::__construct();
		$this->displayName 		= $this->l('Matisses');
		$this->description 		= $this->l('Instalador componentes matisses');
		$this->_module 			= $this->name;
		$this->confirmUninstall = $this->l('Si desinstala este modulo el sitio puede no funcionar correctamente, ¿Esta seguro de continuar?');

		//Db::getInstance()->execute("UPDATE ps_category_lang SET name = 'Menu' where id_category = 2");

	}
	/***********************************************
	*	INSTALACIÓN
	***********************************************/
	public function install()
	{
		
		// install controllers
		$install[] = $this->__installTabs('adminMatisses','Matisses',0);
		$parent = (int)Tab::getIdFromClassName('adminMatisses');
		//$install[] = $this->__installTabs('adminWebservices','Webservices',$parent);
		//$install[] = $this->__installTabs('adminHighlights','Destacados',$parent);
		$install[] = $this->__installTabs('adminExperiences','Experiencias',$parent);
		
		//images types
		$install[] = $this->__installImageTypes('experiences-home',570,145);
		
		$sql = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'highlights` (
				  `id_highlight` int(11) NOT NULL AUTO_INCREMENT,
				  `active` int(1) NOT NULL,
				  PRIMARY KEY (`id_highlight`),
				  KEY `active` (`active`)
				) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
				
				CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'experiences` (
				  `id_experience` int(11) NOT NULL AUTO_INCREMENT,
				  `id_shop_default` int(2) NOT NULL,
				  `position` int(3) NOT NULL,
				  `active` int(1) NOT NULL,
				  PRIMARY KEY (`id_experience`),
				  KEY `active` (`active`),
				  KEY `position` (`position`)
				) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
				
				CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'experiences_lang` (
				  `id_experience` int(11) NOT NULL AUTO_INCREMENT,
				  `id_shop` int(2) NOT NULL,
				  `id_lang` int(3) NOT NULL,
				  `name` varchar(200) NOT NULL,
				  `description` text,
				  `link_rewrite` varchar(200),
				  `meta_title` varchar(200),
				  `meta_keywords` text,
				  `meta_description` text,
				  PRIMARY KEY (`id_experience`,`id_shop`,`id_lang`)
				) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
				
				CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'experiences_product` (
				  `id_experience` int(11) NOT NULL AUTO_INCREMENT,
				  `id_product` int(11) NOT NULL,
				  `top` int(4) NOT NULL,
				  `left` int(4) NOT NULL,
				  PRIMARY KEY (`id_experience`,`id_product`)
				) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
									
		';
		
		if(!file_exists(_PS_IMG_DIR_.'highlights'))
			mkdir(_PS_IMG_DIR_.'highlights',755);
			
		if(!file_exists(_PS_IMG_DIR_.'experiences'))
			mkdir(_PS_IMG_DIR_.'experiences',755);	
		

		
		
		if (!parent::install() 
			|| in_array(0,$install) 
			|| !Db::getInstance()->Execute($sql)
			|| !$this->registerHook('displayFacebookLogin')
			|| !$this->registerHook('header')
			|| !$this->registerHook('displayFooterProduct')
			)
			return false;
		return true;
	}
	
	private function __installTabs($class_name,$name,$parent=0,$page=NULL,$title=NULL,$description=NULL, $url_rewrite=NULL)
	{
		try{
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
				$tab->module 	= $this->name;
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
		}
		
	}
	/***********************************************
	*	INSTALACIÓN
	***********************************************/	
	public function uninstall()
	{
		
		$uninstall[] = $this->__uninstallTabs('adminExperiences');
		$uninstall[] = $this->__uninstallTabs('adminDestacados');
		$uninstall[] = $this->__uninstallTabs('adminWebservices');
		$uninstall[] = $this->__uninstallTabs('adminMatisses');
		$uninstall[] = $this->__uninstallImageTypes('experiences-home');
		
		$sql = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'highlights`;
				DROP TABLE IF EXISTS `'._DB_PREFIX_.'experiences`;
				DROP TABLE IF EXISTS `'._DB_PREFIX_.'experiences_lang`;
				DROP TABLE IF EXISTS `'._DB_PREFIX_.'experiences_product`;
		';
		
		if(file_exists(_PS_IMG_DIR_.'highlights'))
			Tools::deleteDirectory(_PS_IMG_DIR_.'highlights');
			
		if(file_exists(_PS_IMG_DIR_.'experiences'))
			Tools::deleteDirectory(_PS_IMG_DIR_.'experiences');	

		
		if (!parent::uninstall() 
			|| in_array(0,$uninstall) 
			|| !Db::getInstance()->Execute($sql)
			)
			return false;
		return true;
	}
	
	private function __installImageTypes($name,$width,$height,$p=false,$c=false,$m=false,$su=false,$sc=false,$st=false)
	{
		try{
			$ImageType = new ImageType();
			$ImageType->name 	= $name;
			$ImageType->width 	= $width;
			$ImageType->height 	= $height;
			$ImageType->products 		= $p;
			$ImageType->categories 		= $c;
			$ImageType->manufacturers 	= $m;
			$ImageType->suppliers 		= $su;
			$ImageType->scenes 			= $sc;
			$ImageType->stores 			= $st;
			$ImageType->add();
			return true;
		}catch (Exception $e) {
			return false;
		}
	}
	
	
	private function __uninstallImageTypes($name)
	{
		try{
			Db::getInstance()->Execute('DELETE FROM '._DB_PREFIX_.'image_type WHERE name="'.$name.'" ');
			return true;
		}catch (Exception $e) {
			return false;
		}
	}
	
	private function __uninstallTabs($class_name)
	{
		try{
			$id_tab = (int)Tab::getIdFromClassName($class_name);
			if ($id_tab)
			{
				$tab = new Tab($id_tab);
				$tab->delete();
			}
			return true;
		}catch (Exception $e) {
			return false;
		}
	}
	
	
	/*********************************************
	* HOOKS
	*********************************************/
	
	public function hookHeader($params)
	{
		$this->context->controller->addJS($this->_path.'js/fblogin.js');
		//echo "<pre>"; print_r($params); echo "</pre>";
	}
	
	public function hookdisplayFooterProduct($params)
	{
		
		$this->context->controller->addJqueryUI('ui.tabs');
		$this->context->controller->addJS($this->_path.'js/producttabs.js');
				$this->context->smarty->assign(array(
											'product' => $params['product'],
											));
		return $this->display(__FILE__, 'views/templates/hook/product_tabs.tpl');
	}
	
	
	public function hookdisplayFacebookLogin($params)
	{
		$this->context->controller->addJS($this->_path.'js/fblogin.js');
		/*
		$this->context->smarty->assign(array(
											'ajaxurl' => Link::getModuleLink('matisses'),
											));
											*/
		return $this->display(__FILE__, 'views/templates/hook/facebook_login.tpl');
	}
	
	/*********************************************
	* AJAX 
	*********************************************/
	
	public function processAjaxCallback()
	{
		$option 	= $_REQUEST['option'];
		$request 	= $_REQUEST['request'];
		switch($option)
		{
			case 'fblogin': 
				
				$Customer = Customer::getCustomersByEmail($_REQUEST['request']['email']);
				if(sizeof($Customer)>0)
				{
					
					$response['haserror'] 	= false;
					$response['action']		= 'reload';
					$response['url']		= $this->createFacebookLogin($Customer);
					
				}else{
						$response['haserror'] 	= false;
						$response['action']		= 'create';
						$response['data']		= $request;
					 }
				
			
			break;
			default:
				$response['haserror'] 	= true;
				$response['message']	= $this->l('No data sending');
		}
		
		return json_encode($response);
	}
	
	private function createFacebookLogin($CurrentCustomer)
	{
		$customer = new Customer($CurrentCustomer[0]['id_customer']);
		$this->context->cookie->id_compare = isset($this->context->cookie->id_compare) ? $this->context->cookie->id_compare: CompareProduct::getIdCompareByIdCustomer($customer->id);
		$this->context->cookie->id_customer = (int)($customer->id);
		$this->context->cookie->customer_lastname = $customer->lastname;
		$this->context->cookie->customer_firstname = $customer->firstname;
		
		$this->context->cookie->customer_secondname = $customer->secondname;
		$this->context->cookie->customer_surname = $customer->surname;
		$this->context->cookie->customer_charter = $customer->charter;
		
		
		$this->context->cookie->logged = 1;
		$customer->logged = 1;
		$this->context->cookie->is_guest = $customer->isGuest();
		$this->context->cookie->passwd = $customer->passwd;
		$this->context->cookie->email = $customer->email;

		// Add customer to the context
		$this->context->customer = $customer;
		
		if(empty($this->context->cart))
		{
			$this->context->cart = new Cart($id_cart);
			$this->context->cart->id_currency = 1;
		}

		$id_carrier = (int)$this->context->cart->id_carrier;
		$this->context->cart->id_carrier = 0;
		$this->context->cart->setDeliveryOption(null);
		$this->context->cart->id_address_delivery = (int)Address::getFirstCustomerAddressId((int)($customer->id));
		$this->context->cart->id_address_invoice = (int)Address::getFirstCustomerAddressId((int)($customer->id));

		$this->context->cart->id_customer = (int)$customer->id;
		$this->context->cart->secure_key = $customer->secure_key;

		if ($this->ajax && isset($id_carrier) && $id_carrier && Configuration::get('PS_ORDER_PROCESS_TYPE'))
		{
			$delivery_option = array($this->context->cart->id_address_delivery => $id_carrier.',');
			$this->context->cart->setDeliveryOption($delivery_option);
		}

		$this->context->cart->save();
		$this->context->cookie->id_cart = (int)$this->context->cart->id;
		$this->context->cookie->write();
		$this->context->cart->autosetProductAddress();

		// Login information have changed, so we check if the cart rules still apply
		CartRule::autoRemoveFromCart($this->context);
		CartRule::autoAddToCart($this->context);

		return 'index.php?controller='.(($this->authRedirection !== false) ? urlencode($this->authRedirection) : $back);
	}
	
}	
?>