<?php

class giftlistadministrarModuleFrontController extends ModuleFrontController {
    public $uploadDir =_PS_UPLOAD_DIR_."giftlist/" ;
    
    public function initContent() {
		if(!$this->context->customer->isLogged()){
			Tools::redirect('my-account');
		}
		parent::initContent ();
		$list = new GiftListModel();
        $edit = 0;
        $res = null;
        if(Tools::getValue("url") != "nuevo"){
            $edit = 1;
            if(!$res = $list->getListBySlug(Tools::getValue('url')))
            {
                Tools::redirect($this->context->link->getModuleLink('giftlist', 'listas'));
            }
        }
		$this->context->smarty->assign (array(
            'event_type' => Db::getInstance ()->executeS ( "SELECT * FROM `" . _DB_PREFIX_ . "event_type`" ),
            'list_link' => $this->context->link->getmoduleLink("giftlist","listas"),
            'edit' => $edit,
            'data' => $res
		));
		$this->setTemplate ( 'administrar.tpl' );
	}
    
    public function init(){
		parent::init();
    }
    
    public function setMedia() {
		parent::setMedia ();
		$this->addJS ( array (
            _MODULE_DIR_ . '/giftlist/views/js/vendor/datetimepicker/jquery.datetimepicker.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/validation/jquery.validate.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/validation/messages_es.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/mask/jquery.mask.min.js',
            _MODULE_DIR_ . '/giftlist/views/js/ax-administrar.js',
            'https://www.google.com/recaptcha/api.js'
		) );
		$this->addCSS ( array (
            _MODULE_DIR_ . '/giftlist/views/css/vendor/datetimepicker/jquery.datetimepicker.css',
            _MODULE_DIR_ . '/giftlist/views/css/ax-administrar.css'
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
				move_uploaded_file($file['tmp_name'], $this->uploadDir . Db::getInstance()->Insert_ID(). ".". $sqlExtension);
				$image_name = Db::getInstance()->Insert_ID(). ".". $sqlExtension;
			}
			@unlink($file);
			return isset($image_name) ?_PS_UPLOAD_DIR_."giftlist/" . $image_name : false;
		}
		return false;
	}
    
    public function postProcess() {
        $id = Tools::getValue("id_list");
		if (Tools::isSubmit ('saveList')) {
			$this->_saveList($id);
		}
	}
    
    private function _saveList($id = 0){
        //echo "<pre>";echo print_r($_POST);die("</pre>");
		if($id != 0){
			$list = new GiftListModel ($id);
		}else{
			$list = new GiftListModel ();
		}
        if (!($gcaptcha = (int)(Tools::getValue('g-recaptcha-response')))){
	       $this->context->smarty->assign ( array (
						'response' => "CAPTCHA no verificado",
						'error' => true
				));
            return true;
        }
		$list->id_creator = $this->context->customer->id;
		$list->name = Tools::getValue ( 'name' );
		$list->event_type = Tools::getValue ( 'event_type' );
        $date = str_replace("/","-",Tools::getValue ( 'event_date' ));
		$list->event_date = date("Y-m-d H:i:s", strtotime($date));
		$list->public = Tools::getValue( 'public' ) == "on" ? 1 : 0;
		$list->guest_number = Tools::getValue ( 'guest_number' );
		$list->recieve_bond = Tools::getValue ( 'recieve_bond' ) == "on" ? 1 : 0;
		$list->edit = Tools::getValue ( 'can_edit' ) == "on" ? 1 : 0;
		$list->min_amount = Tools::getValue ( "min_amount" );
		$list->address_after = Tools::getValue ( "date_after" );
		$list->address_before = Tools::getValue ( "date_before" );
		$list->code = $list->returnCode();
		$list->url = $list->slugify($list->name);
		$list->message = Tools::getValue('message');
		$dirC = array(
				'country' => "Colombia",
				'city'    => Tools::getValue('city'),
				'town'    => Tools::getValue('town'),
				'address' => Tools::getValue('address'),
                'address_2' => Tools::getValue('address_2'),
				'tel'     => Tools::getValue('tel'),
				'cel'     => Tools::getValue('cel')
		);        
        
		$list->info_creator = Tools::jsonEncode($dirC);
		$id == 0 ? $list->created_at = date ( "Y-m-d H:i:s" ) : $list->updated_at = date ( "Y-m-d H:i:s" );
		try {
			if ($list->save()){
				$list->image = !$this->_uploadImage($id) ? $list->image : $this->_uploadImage($id);
                $list->id_cocreator = $list->setCocreator($list-id,Tools::getValue ( 'email_cocreator' ));
                $dirCC =  array(
                    'country' => "Colombia",
                    'city_co'    => Tools::getValue('city_co'),
                    'town_co'    => Tools::getValue('town_co'),
                    'address_co' => Tools::getValue('address_co'),
                    'address_co_2' => Tools::getValue('address_co_2'),
                    'tel_co'     => Tools::getValue('tel_co'),
                    'cel_co'     => Tools::getValue('cel_co')
                );
                $list->info_cocreator = Tools::jsonEncode($dirCC);
				$list->update();
				$this->context->smarty->assign ( array (
						'response' => "Se ha creado la lista",
						'error' => false
				));
			}
			else
				$this->context->smarty->assign ( array (
						'response' => _ERROR_,
						'error' => true
				));
		} catch ( Exception $e ) {
			$this->context->smarty->assign ( array (
					'response' => $e->getMessage(),
					'error' => true
			));
		}
        Tools::redirect($this->context->link->getModuleLink('giftlist', 'descripcion',array("url" => $list->url)));
	}
}