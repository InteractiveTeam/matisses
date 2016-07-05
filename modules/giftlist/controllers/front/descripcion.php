<?php

include_once __DIR__ . '/../../classes/GiftList.php';
include_once __DIR__ . '/../../classes/ListProductBond.php';
include_once __DIR__ . '/../../classes/Bond.php';
include_once _PS_MODULE_DIR_ . "matisses/matisses.php";
include_once _PS_OVERRIDE_DIR_ ."controllers/front/CartController.php";
define("_ERROR_","Ha ocurrido un error, vuelva a intentarlo mas tarde");
define("_DELETED_","Elmininado Correctamente");
define("_EDITED_","Se ha editado la informacion");

class giftlistdescripcionModuleFrontController extends ModuleFrontController {
	public $uploadDir = _PS_UPLOAD_DIR_."giftlist/";
	public $module;
	/**
	* Select all event types
	* Select firstname and lastnamen from creator and cocreator
	* Set template by condicion
	*/
	public function initContent() {
        global $cookie;
		parent::initContent ();
        $this->display_column_left = false;
        $this->display_column_right = false;
		$list = new GiftListModel();
		$lpd = new ListProductBondModel();
		if(!$res = $list->getListBySlug(Tools::getValue('url')))
		{
			Tools::redirect($this->context->link->getModuleLink('giftlist', 'listas'));
		}
		$ev = "SELECT name FROM "._DB_PREFIX_."event_type WHERE id =".$res['event_type'];
		$sql = "SELECT id_customer,firstname,lastname FROM "._DB_PREFIX_.
		"customer WHERE id_customer = ". $res['id_creator'];
		$sql2 = "SELECT id_customer,firstname,lastname FROM "._DB_PREFIX_.
		"customer WHERE id_customer = ". $res['id_cocreator'];
		$creator = Db::getInstance()->getRow($sql);
		$cocreator = Db::getInstance()->getRow($sql2);
		$this->context->smarty->assign ( array (
			'list_desc' => $res,
			'all_link' => $this->context->link->getModuleLink('giftlist', 'listas'),
			'admin_link' => $this->context->link->getModuleLink('giftlist', 'administrar',array("url" => Tools::getValue('url'))),
			'address' => Tools::jsonDecode($res['info_creator']),
			'form' => _MODULE_DIR_ ."giftlist/views/templates/front/partials/form_save_list.php",
			'form_edit' => _MODULE_DIR_ ."giftlist/views/templates/front/partials/form_edit_list.php",
			'form_cocreator' => _MODULE_DIR_ ."giftlist/views/templates/front/partials/cocreator_info.php",
			'bond_form' => _MODULE_DIR_ ."giftlist/views/templates/front/partials/bond_form.php",
			'creator' => $creator['firstname'] . " " . $creator['lastname'],
			'cocreator' => ($cocreator ? $cocreator['firstname'] . " " . $cocreator['lastname'] : "-"),
			'products' => $lpd->getProductsByList($res['id']),
			'event_type' => Db::getInstance()->getValue($ev),
            'bond' => $lpd->getBondsByList($res['id']),
            'days' => $list->getMissingDays($res['event_date']),
            'numberProducts' => $list->getNumberProductsByList($res['id']),
			'share_list' => _MODULE_DIR_ ."giftlist/views/templates/front/partials/share_email.php",
            'cats' => Category::getCategories( (int)($cookie->id_lang), true, false  )
		) );

		if($this->context->customer->isLogged()){
			if($res['id_creator'] == $this->context->customer->id)
				$this->setTemplate ( 'listOwnerDesc.tpl' );
			elseif($res['id_cocreator'] == $this->context->customer->id)
				$this->setTemplate ( 'listSharedDesc.tpl' );
			else
				$this->setTemplate ( 'listDesc.tpl' );
		}
		else{
			$this->setTemplate ( 'listDesc.tpl' );
		}
	}

	public function init(){
		parent::init();
		if($this->ajax){
			if(!empty(Tools::getValue("method"))){
				switch(Tools::getValue("method")){
					case "delete-product":
						$this->_deteleProductFromList(Tools::getValue("id_list"),Tools::getValue('id_product'));
						break;
					case "addBond":
						$this->_addBond(Tools::getValue('id_list'), Tools::getValue('data'));
						break;
                    case "saveMessage":
                        $this->_saveMessaage(Tools::getValue('id_list'), Tools::getValue('message'));
                    case "uploadImage":
                        $this->_uploadImage(Tools::getValue('id_list'), Tools::getValue('prof'));
                    case "share":
						$this->_shareList();
				}
			}
		}
	}
    
    private function _saveMessaage($id, $message){
        if(Db::getInstance()->update('gift_list', array('message' => $message),"id = ".$id))
            die(Tools::jsonEncode("Se ha actalizado el mensaje"));
        else
            die(Tools::jsonEncode("Ha ocurrido un error"));
    }

	public function setMedia() {
		parent::setMedia ();
		$this->addJS ( array (
			_MODULE_DIR_ . '/giftlist/views/js/vendor/datetimepicker/jquery.datetimepicker.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/validation/jquery.validate.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/owl/owl.carousel.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/serializeObject/jquery.serializeObject.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/descripcion.js'
		) );
		$this->addCSS ( array (
			_MODULE_DIR_ . '/giftlist/views/css/vendor/datetimepicker/jquery.datetimepicker.css',
            _MODULE_DIR_ . '/giftlist/views/css/vendor/owl/owl.carousel.css',
			_MODULE_DIR_ . '/giftlist/views/css/ax-lista-de-regalos.css'
		) );
	}

	public function __construct() {
		$this->module = Module::getInstanceByName ( Tools::getValue ( 'module' ) );
		if (! $this->module->active)
			Tools::redirect ( 'index' );

		$this->page_name = 'module-' . $this->module->name . '-' . Dispatcher::getInstance ()->getController ();
		parent::__construct ();
	}

	public function postProcess(){
        //echo "<pre>";echo print_r($_POST);die("</pre>");
		if(Tools::isSubmit ('saveList'))
		$this->_saveList(Tools::getValue("id_list"));
		else if(Tools::isSubmit('saveInfo'))
		$this->_saveInfoCocreator(Tools::getValue("id_list"));
	}

	/**
	* @param int $id_list
	* @param int $id_product
	*/
	private function _deteleProductFromList($id_list,$id_product){
		$lpd = new ListProductBondModel();
		if(!$lpd->deleteProduct($id_list, $id_product)){
			die(_ERROR_);
		}else{
			die(_DELETED_);
		}
	}

	private function _addBond($id_list, $data){
		if ($this->context->cart->id)
		{
			$cart = new Cart($this->context->cookie->id_cart);
		}
		else
		{
			$cart = new Cart();
			$cart->id_lang = $this->context->language->id;
			$cart->id_currency = $this->context->currency->id;
			$cart->save();
		}
        $mat = new Matisses();
        $res = $mat->wsmatissess_getVIPGift($data['mount']);
        $FreeVipBond = $res["return"]['detail'];
		$bond = new BondModel();
		$list = new GiftListModel($id_list);
		$bond->id_list = $id_list;
		$bond->value = $data['mount'];
		$bond->message = $data['message'];
		$bond->luxury_bond = ($FreeVipBond ? 1 : (isset($data['luxury_bond']) ? 1 : 0));
		$bond->created_at = date( "Y-m-d H:i:s" );
		$sql = "SELECT id_product FROM "._DB_PREFIX_."product WHERE reference = 'BOND-LIST'";
		$id_product = Db::getInstance()->getValue($sql);
		if(!$bond->save())
			die("error");
		else{
			Db::getInstance()->insert('cart_product', array(
				'id_cart' => $cart->id,
				'id_product' => $id_product,
				'id_address_delivery' => 0,
				'id_shop' => $this->context->shop->id,
				'id_bond' => $bond->id,
				'id_giftlist' => $id_list,
				'id_product_attribute' => 0,
				'quantity' => 1,
				'date_add' => date( "Y-m-d H:i:s" )
			));
			$this->context->cookie->id_cart = ( int )$cart->id;
			$this->ajax_refresh = true;
			CartRule::autoAddToCart($this->context);
			die(Tools::jsonEncode(array(
				'msg' =>  'Se ha agregado un bono de $'.$bond->value. ' a la lista "'. $list->name.'"'
				)));
            $cartController = new CartController();
            $_GET['summary'] = true;
            $this->context->cookie->ajax_blockcart_display = 1;
            $cartController->displayAjax();
		}
    }

		/**
        *only for cocreator who cannot edit the list
		* @param int $id
		*/
	private function _saveInfoCocreator($id){
		$list = new GiftListModel ($id);
		$dirC = array(
			'country' => "Colombia",
			'city'    => Tools::getValue('city_co'),
			'town'    => Tools::getValue('town_co'),
			'address' => Tools::getValue('address_co'),
			'address_2' => Tools::getValue('address_co_2'),
			'tel'     => Tools::getValue('tel_co'),
			'cel'     => Tools::getValue('cel_co')
		);
		$list->info_cocreator = Tools::jsonEncode($dirC);
		try {
			if ($list->updateInfo()){
				$this->context->smarty->assign (array (
					'response' => _EDITED_,
					'error' => false
				));
			}
			else
				$this->context->smarty->assign (array (
					'response' => _ERROR_,
					'error' => true
				));
		} catch ( Exception $e ) {
			$this->context->smarty->assign (array (
				'response' => $e->getMessage(),
				'error' => true
			));
		}
	}

	/**
	* upload image from list
	* @return boolean|string|NULL
	*/
	private function _uploadImage($id, $prof){
        if (!is_dir($this->uploadDir)) {
            mkdir($this->uploadDir);         
        }
        $prof = ($prof == "true" ? true : false);
		if ($_FILES['file-0']['name'] != '') {
			$file = Tools::fileAttachment('file-0');
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
			die(isset($image_name) ? "/upload/giftlist/" . $image_name : false);
		}
		return false;
	}
    
    private function _shareList(){
		$id_shop = (int)Context::getContext()->shop->id;
		$id_lang = $this->context->language->id;
		$list = new GiftListModel (Tools::getValue('id_list'));
		$currency = $this->context->currency;
		$customer = new CustomerCore($list->id_creator);
		$params = array(
			'{lastname}' => $customer->lastname,
			'{firstname}' => $customer->firstname,
			'{code}' => $list->code,
			'{description_link}' => $this->context->link->getModuleLink('giftlist', 'descripcion',array('url' => $list->url))
		);

		if(!empty($list->id_cocreator)){
			$customer = new CustomerCore($list->id_cocreator);
			$params['firstname_co'] = $customer->firstname;
			$params['lastname_co'] = $customer->lastname;

			MailCore::Send($id_lang, 'share-list', sprintf(
			MailCore::l('Te han compartido una lista'), 1),
			$params, Tools::getValue('email'), $customer->firstname.' '.$customer->lastname,
			null, null, null,null, _MODULE_DIR_."giftlist/mails/", true, $id_shop);
			die("Se ha compartido la lista");
		}
		MailCore::Send($id_lang, 'share-list-no-cocreator', sprintf(
		MailCore::l('Te han compartido una lista'), 1),
		$params, Tools::getValue('email'), $customer->firstname.' '.$customer->lastname,
		null, null, null,null, _MODULE_DIR_."giftlist/mails/", true, $id_shop);
		die("Se ha compartido la lista");
	}
}