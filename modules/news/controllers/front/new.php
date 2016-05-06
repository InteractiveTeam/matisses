<?php



class newsnewModuleFrontController extends ModuleFrontController
{

	
	public function __construct()
	{
		parent::__construct();
		$this->context = Context::getContext();
	}

	public function initContent() {
		parent::initContent();        
		
        $new = str_replace('-',' ',Tools::getValue('rewrite'));
        /*$dataCategory = Db::getInstance()->ExecuteS('SELECT * FROM  `ps_news_langs` 
            WHERE  `title` LIKE  "%'.$new.'%"');
        
        $_GET['id_news'] = trim($dataCategory[0]['id_news']);
        
        echo Tools::getValue('id_news');*/
        
		$cat 	 = (Tools::getValue('cat_news') ? intval(Tools::getValue('cat_news')) : 0);
		$id_news = (Tools::getValue('id_news') ? intval(Tools::getValue('id_news')) : 0);
		
		
		Db::getInstance()->execute('UPDATE '._DB_PREFIX_.'news SET viewed = (viewed + 1) WHERE id_news = "'.$id_news.'"');
        
		$breadcrum[] = '<a href="/blog">Blog</a>';
		$breadcrum[] = '<i class="fa fa-angle-right"></i>';
		$breadcrum[] = $new;
		
		$breadcrum = implode('',$breadcrum);
		
		
		$this->context->smarty->assign('HOOK_HOME', Hook::exec('news'));
		
		$this->context->smarty->assign(array('meta_title' => 'Blog'));
		$this->context->smarty->assign('path',$breadcrum);
		$this->context->smarty->assign('id_new',Tools::getValue('id_news'));
        //$this->context->smarty->assign('id_new',8);
		$this->setTemplate('index.tpl');


	}
}
