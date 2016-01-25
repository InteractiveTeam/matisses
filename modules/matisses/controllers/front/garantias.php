<?php

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
			$this->addJqueryPlugin(array('scrollTo', 'footable','footable-sort'));
		}
		/*
		
		$this->addJqueryPlugin('bxslider');
		$this->addCss(array(
			_MODULE_DIR_.'matisses/css/experiences/front-experiences.css'
		));
		
		$this->addJS(array(
			_MODULE_DIR_.'socialsharing/js/socialsharing.js',
			_MODULE_DIR_.'matisses/js/experiences/front-experiences.js'
		));
		*/

		
	}
	
	public function initContent()
	{
		parent::initContent();
		$this->info['confgaran_danos'] = Configuration::get('confgaran_nrdanos');
		$this->info['confgaran_nimages'] = Configuration::get('confgaran_nimages');
		$this->info['confgaran_nrdanos'] = Configuration::get('confgaran_danos');
		$this->info['confgaran_terminos'] = Configuration::get('confgaran_terminos');
		$this->info['confgaran_imagen'] = Tools::getShopDomain(true).'/img/'.Configuration::get('confgaran_imagen'); 
		$this->context->smarty->assign('config',$this->info);
		$step = Tools::getValue('step');
		switch($step)
		{
			case 'nueva':
				$this->nueva();
			break;
			
			case 'step2':
				$this->step2();
			break;
			
			case 'step1':
			default:
				$this->step1();
		}
	}
	
	public function nueva()
	{
		if ($orders = Order::getCustomerOrders($this->context->customer->id))
		foreach ($orders as &$order)
		{
			$myOrder = new Order((int)$order['id_order']);
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
												'nrodanos' => $nrodanos
											 ));
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
				Tools::redirect($link->getModuleLink('matisses','garantias').'/step2/order='.Tools::getValue('order'));
						
		}
		$this->setTemplate('garantias_step1.tpl');
	}
}

?>
