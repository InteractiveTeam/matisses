<?php

class giftlistadministrarModuleFrontController extends ModuleFrontController {
    public $uploadDir =_PS_UPLOAD_DIR_."giftlist/" ;
    
    public function initContent() {
		if(!$this->context->customer->isLogged()){
			Tools::redirect('my-account');
		}
		parent::initContent ();
        $this->display_column_left = false;
        $this->display_column_right = false;
		$list = new GiftListModel();
		$months = Tools::dateMonths();
		$days = Tools::dateDays();
		$this->context->smarty->assign (array(
            'event_type' => Db::getInstance ()->executeS ( "SELECT * FROM `" . _DB_PREFIX_ . "event_type`" ),
            'list_link' => $this->context->link->getmoduleLink("giftlist","empezar"),
            'months' => $months,
            'days' => $days,
            'countries' => CountryCore::getCountries($this->context->language->id),
            'year' => date('Y'),
            'limit' => date('Y') + 20,
		));
		$this->setTemplate ( 'crear.tpl' );
	}
    
    public function init(){
		parent::init();
		if($this->ajax){
			if(!empty(Tools::getValue("method"))){
				switch(Tools::getValue("method")){
					case "saveList":
						$this->_saveList(Tools::getValue("form"),Tools::getValue("img"));
						break;
				}
			}
		}
	}
    public function setMedia() {
		parent::setMedia ();
		$this->addJS ( array (
            _MODULE_DIR_ . '/giftlist/views/js/vendor/datetimepicker/jquery.datetimepicker.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/validation/jquery.validate.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/validation/messages_es.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/mask/jquery.mask.min.js',
            _MODULE_DIR_ . '/giftlist/views/js/ax-crear.js',
            'https://www.google.com/recaptcha/api.js'
		) );
		$this->addCSS ( array (
            _MODULE_DIR_ . '/giftlist/views/css/vendor/datetimepicker/jquery.datetimepicker.css',
            _MODULE_DIR_ . '/giftlist/views/css/ax-lista-de-regalos.css'
		) );
	}
    
    public function __construct() {
		parent::__construct ();
	}
    
    	/**
	 * upload image from list
	 * @return boolean|string|NULL
	 */
	private function _uploadImage($id = 0){
		if ($_FILES['image']['name'] != '') {
			$file = Tools::fileAttachment('image');
			$sqlExtension = pathinfo($file['name'], PATHINFO_EXTENSION);
			$mimeType = array('image/png', 'image/x-png','image/jpeg','image/gif');
			if(!$file || empty($file) || !in_array($file['mime'], $mimeType))
				return false;
			else {
				move_uploaded_file($file['tmp_name'], $this->uploadDir . $id. ".". $sqlExtension);
				$image_name = $id. ".". $sqlExtension;
			}
			return isset($image_name) ?_PS_UPLOAD_DIR_."giftlist/" . $image_name : false;
		}
		return false;
	}
    private function _uploadProfileImage($id = 0){
		if ($_FILES['profile_img']['name'] != '') {
			$file = Tools::fileAttachment('profile_img');
			$sqlExtension = pathinfo($file['name'], PATHINFO_EXTENSION);
			$mimeType = array('image/png', 'image/x-png','image/jpeg','image/gif');
			if(!$file || empty($file) || !in_array($file['mime'], $mimeType))
				return false;
			else {
				move_uploaded_file($file['tmp_name'], $this->uploadDir ."prof_".$id. ".". $sqlExtension);
				$image_name = "prof_".$id. ".". $sqlExtension;
			}
			@unlink($file);
			return isset($image_name) ?_PS_UPLOAD_DIR_."giftlist/" . $image_name : false;
		}
		return false;
	}
    
    private function _saveList($form,$img){
        //Tools::redirect($this->context->link->getModuleLink('giftlist', 'descripcion',array("url" => $list->url)));
	}
}