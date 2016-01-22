<?php



class newscatgModuleFrontController extends ModuleFrontController
{

	
	public function __construct()
	{
		parent::__construct();
		$this->context = Context::getContext();
	}


	public function initContent()
	{
		parent::initContent();
				
		$cat 	 = (Tools::getValue('cat_news') ? intval(Tools::getValue('cat_news')) : 0);
		$id_news = (Tools::getValue('id_news') ? intval(Tools::getValue('id_news')) : 0);
		$new	 = str_replace('-',' ',Tools::getValue('rewrite'));
		
		$breadcrum[] = '<span class="navigation-pipe"><a href="/blog">Blog</a></span>';
		$breadcrum[] = '<span class="navigation-pipe">'.Configuration::get('PS_NAVIGATION_PIPE').'</span>';
		$breadcrum[] = '<span>'.$new.'</span>'; 
		
		$breadcrum = implode('',$breadcrum);
		
		$this->context->smarty->assign('HOOK_HOME', Hook::exec('newscategory'));
		$this->context->smarty->assign(array('meta_title' => 'Blog'));
		$this->context->smarty->assign('path',$breadcrum);
		$this->setTemplate('index.tpl');


	}
}
