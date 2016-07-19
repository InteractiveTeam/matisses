<?php

class giftlistadministrarModuleFrontController extends ModuleFrontController {
    public $uploadDir = _PS_UPLOAD_DIR_."giftlist/";
    
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
						$this->_saveList();
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
    private function _uploadImage($id, $prof, $pname){
        if (!is_dir($this->uploadDir)) {
            mkdir($this->uploadDir);         
        }
		if ($_FILES[$pname]['name'] != '') {
			$file = Tools::fileAttachment($pname);
			$sqlExtension = pathinfo($file['name'], PATHINFO_EXTENSION);
			$mimeType = array('image/png', 'image/x-png','image/jpeg','image/gif');
			if(!$file || empty($file) || !in_array($file['mime'], $mimeType))
				return false;
			else {
				move_uploaded_file($file['tmp_name'], $this->uploadDir . ($prof ? "prof_" : "") . $id. ".". $sqlExtension);
                $image_name = ($prof ? "prof_" : "") . $id. ".". $sqlExtension;
                $sql = "UPDATE "._DB_PREFIX_."gift_list SET ". ($prof ? "profile_img":"image") .' = "/upload/giftlist/'.$image_name.'" WHERE id = '.$id;
                Db::getInstance()->execute($sql);
			}
			@unlink($file);
			return isset($image_name) ? "/upload/giftlist/" . $image_name : false;
		}
		return false;
	}
    
    private function _saveList(){
        $c = CountryCore::getCountries($this->context->language->id);
        parse_str($_POST['form'],$data);
        $li = new GiftListModel();
        $r = $li->getListBySlug($data['url']);
        if(!empty($r))
            die(
                Tools::jsonEncode(array(
                    'msg' => $this->module->l('Ya existe una lista con la url ingresada'),
                    'error' => 1
                ))
            );        
        $li->id_creator = $this->context->customer->id;
        $li->id_cocreator = 0;
        $li->code = $li->returnCode();
        $li->name = $data['name'];
        $li->public = ($data['list_type'] == 1 ? true : false);
        $li->event_type = $data['event_type'];
        $li->event_date = date("Y-m-d",strtotime($data['years']."-".$data['months']."-".$data['days']));
        $li->guest_number = $data['guest_number'];
        $li->url = $li->slugify($data['url']);
        $li->message = $data['message'];
        $li->recieve_bond = isset($data['recieve_bond']) && $data['recieve_bond'] == 'on' ? true : false;
        $li->min_amount = $data['min_ammount'];
        $li->address_before = $data['dir_before'];
        $li->address_after = $data['dir_after'];
        $li->real_not = $data['real_not'] == 'on' ? true : false;
        $li->cons_not = $data['cons_not'] == 'on' ? true : false;
        $li->firstname = $data['firstname'];
        $li->lastname = $data['lastname'];
        $li->info_creator = Tools::jsonEncode(array(
            'country' => 'Colombia',
            'city' => ucfirst(strtolower($c[$data['city']]['name'])),
            'town' => ucfirst(strtolower($data['town'])),
            'address' => $data['address'],
            'address_2' => $data['address_2'],
            'tel' => $data['tel'],
        ));
        $li->created_at = date("Y-m-d");
        if($li->add()){
            $li->image = $this->_uploadImage($li->id, false, 'image-p');
            $li->profile_img = $this->_uploadImage($li->id, true, 'image-prof');
            if($data['email'] != $data['email_co'])
                $li->id_cocreator = $li->setCoCreator($li->id,$data['email_co'],$data['firstname'] . " " .$data ['lastname'],$li->url);
            $li->update();
            die(
                Tools::jsonEncode(array(
                    'url' => $this->context->link->getModuleLink('giftlist', 'descripcion',array("url" => $li->url)),
                    'error' => 0
                ))
            );
        }else{
           die(
                Tools::jsonEncode(array(
                    'msg' => "Hay un error ". Db::getInstance()->getMsgError(),
                    'error' => 1
                ))
            ); 
        }
	}
}