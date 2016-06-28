<?php
include_once __DIR__ . '/../../classes/GiftList.php';

class giftlistbuscarModuleFrontController extends ModuleFrontController {
	public $uploadDir = __DIR__. "../../../uploads/";
	public $module;

	public function initContent() {
		parent::initContent ();
        $this->display_column_left = false;
        $this->display_column_right = false;
		$list = new GiftListModel();
        if(empty(Tools::getValue("name")) && empty(Tools::getValue("lastname")) && empty(Tools::getValue("code")))
           Tools::redirect($this->context->link->getModuleLink('giftlist', 'empezar'));
        if(!empty(Tools::getValue("name")) && !empty(Tools::getValue("lastname"))){
            $res = $list->searchByCustomerNames(Tools::getValue("name"),Tools::getValue("lastname"));
		}elseif(!empty(Tools::getValue("code"))){
			$res = $list->searchByCode(Tools::getValue("code"));
			if($res != ""){
				Tools::redirect($this->context->link->getModuleLink('giftlist', 'descripcion', $res));
			}
			$res = array();
		}
			
		$this->context->smarty->assign ( array (
            "lists" => $res,
            'parameter' => Tools::getValue("name") . Tools::getValue("lastname"),
			'description_link' => $this->context->link->getModuleLink('giftlist', 'descripcion',array('url' => "")),
			'items_per_page' => 5
		) );
		$this->setTemplate ( 'searchList.tpl' );
	}
	
	public function init(){
		parent::init();
		if($this->ajax){
			$list = new GiftListModel();
			if(!empty(Tools::getValue("name")) && !empty(Tools::getValue("lastname"))){
				$res = $list->searchByCustomerNames(Tools::getValue("name"),Tools::getValue("lastname"));
				die(Tools::jsonEncode($res));
			}elseif(!empty(Tools::getValue("code"))){
				$res = $list->searchByCode(Tools::getValue("code"));
				if($res != ""){
					die(Tools::jsonEncode($this->context->link->getModuleLink('giftlist', 'descripcion', $res)));
				}
			}
		}
	}
	
	public function setMedia() {
		parent::setMedia ();
		$this->addJS ( array (
			_MODULE_DIR_ . '/giftlist/views/js/vendor/jplist/jplist.core.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/jplist/jplist.pagination-bundle.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/jplist/jplist.textbox-filter.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/buscar.js'
		) );
		$this->addCSS ( array (
			_MODULE_DIR_ . '/giftlist/views/css/vendor/jplist/jplist.core.min.css',
			_MODULE_DIR_ . '/giftlist/views/css/vendor/jplist/jplist.pagination-bundle.min.css',
			_MODULE_DIR_ . '/giftlist/views/css/vendor/jplist/jplist.textbox-filter.min.css',
			_MODULE_DIR_ . '/giftlist/views/css/ax-lista-de-regalos.css'
		) );
	}
	
	public function __construct() {
		$this->module = Module::getInstanceByName ( Tools::getValue ( 'module' ) );
		if (! $this->module->active)
			Tools::redirect ( 'index' );
		
		$this->page_name = 'module-'.$this->module->name.'-'.Dispatcher::getInstance()->getController();
		parent::__construct ();
	}
}