<?php



class newsnewModuleFrontController extends ModuleFrontController
{

	
	public function __construct()
	{
		parent::__construct();
		$this->context = Context::getContext();
	}

	public function initContent()
	{
		parent::initContent();
		
		$this->context->smarty->assign('HOOK_HOME', Hook::exec('news'));
		
		$this->setTemplate('index.tpl');


	}
}
