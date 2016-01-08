<?php

class matissesgarantiasModuleFrontController extends ModuleFrontController
{
	//public $php_self = "experiences";
	public $auth = true;  
	protected $garantia;
	
	
	public function init()
	{
		parent::init();
		include_once(dirname(__FILE__).'/../../classes/Experiences.php');
	}
	
	public function setMedia()
	{
		parent::setMedia();	
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
		$info['confgaran_danos'] = Configuration::get('confgaran_nrdanos');
		$info['confgaran_nimages'] = Configuration::get('confgaran_nimages');
		$info['confgaran_nrdanos'] = Configuration::get('confgaran_danos');
		$info['confgaran_terminos'] = Configuration::get('confgaran_terminos');
		$info['confgaran_imagen'] = Tools::getShopDomain(true).'/img/'.Configuration::get('confgaran_imagen'); 
		$this->context->smarty->assign('config',$info);
		
		switch($step)
		{
			default:
				$this->step1();
		}
	}
	
	public function step1()
	{
		if(Tools::isSubmit('submitStep1'))
		{
			if(!Tools::getValue('accept'))
				$this->errors[] = Tools::displayError('Debe aceptar los terminos de las garantias');
			
			if(sizeof($this->errors)==0)
				Tools::redirect(Link::getModuleLink('matisses','garantias',array('current' => 'step2')));
						
		}
		$this->setTemplate('garantias_step1.tpl');
	}
}

?>
