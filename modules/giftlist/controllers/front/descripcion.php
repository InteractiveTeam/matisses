<?php

include_once __DIR__ . '/../../classes/GiftList.php';
include_once __DIR__ . '/../../classes/ListProductBond.php';
include_once __DIR__ . '/../../classes/Bond.php';
include_once _PS_OVERRIDE_DIR_ ."controllers/front/CartController.php";

class giftlistdescripcionModuleFrontController extends ModuleFrontController {
	public $uploadDir = __DIR__. "../../../uploads/";
	public $module;

	/**
	* Select all event types
	* Select firstname and lastnamen from creator and cocreator
	* Set template by condicion
	*/
	public function initContent() {
		parent::initContent ();
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
			'address' => Tools::jsonDecode($res['info_creator']),
			'address_cocreator' => $res['info_cocreator'] == "" ? "''" :  $res['info_cocreator'],
			'form' => _MODULE_DIR_ ."giftlist/views/templates/front/partials/form_save_list.php",
			'form_edit' => _MODULE_DIR_ ."giftlist/views/templates/front/partials/form_edit_list.php",
			'form_cocreator' => _MODULE_DIR_ ."giftlist/views/templates/front/partials/cocreator_info.php",
			'bond_form' => _MODULE_DIR_ ."giftlist/views/templates/front/partials/bond_form.php",
			'creator' => $creator,
			'cocreator' => $cocreator,
			'products' => $lpd->getProductsByList($res['id']),
			'event_type' => Db::getInstance()->getRow($ev),
            'bond' => $lpd->getBondsByList($res['id'])
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
				}
			}
		}
	}

	public function setMedia() {
		parent::setMedia ();
		$this->addJS ( array (
			_MODULE_DIR_ . '/giftlist/views/js/vendor/datetimepicker/jquery.datetimepicker.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/validation/jquery.validate.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/mask/jquery.mask.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/serializeObject/jquery.serializeObject.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/descripcion.js'
		) );
		$this->addCSS ( array (
			_MODULE_DIR_ . '/giftlist/views/css/vendor/datetimepicker/jquery.datetimepicker.css',
			_MODULE_DIR_ . '/giftlist/views/css/descripcion.css'
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
			die("Ha ocurrido un error");
		}else{
			die("Elmininado Correctamente");
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
		$bond = new BondModel();
		$list = new GiftListModel($id_list);
		$bond->id_list = $id_list;
		$bond->value = $data['mount'];
		$bond->message = $data['message'];
		$bond->luxury_bond = isset($data['luxury_bond']) ? 1 : 0;
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
		* @param int $id
		*/
	private function _saveInfoCocreator($id){
		$list = new GiftListModel ($id);
		$dirC = array(
			'country' => "Colombia",
			'city'    => Tools::getValue('city_co'),
			'town'    => Tools::getValue('town_co'),
			'address' => Tools::getValue('address_co'),
			'tel'     => Tools::getValue('tel_co'),
			'cel'     => Tools::getValue('cel_co')
		);
		$list->info_cocreator = Tools::jsonEncode($dirC);
		try {
			if ($list->updateInfo()){
				$this->context->smarty->assign (array (
					'response' => "Se ha Editado la información",
					'error' => false
				));
			}
			else
				$this->context->smarty->assign (array (
					'response' => "Ha ocurrido un error",
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
	* @param int $id
	*/
	private function _saveList($id){
		$list = new GiftListModel ($id);
		$list->name = Tools::getValue('name');
		$list->event_type = Tools::getValue('event_type');
		$list->event_date = date("Y-m-d H:i:s", strtotime(Tools::getValue('event_date')));
		$list->public = Tools::getValue('public') == "on" ? 1 : 0;
		$list->guest_number = Tools::getValue('guest_number');
		$list->recieve_bond =Tools::getValue('recieve_bond') == "on" ? 1 : 0;
		$list->max_amount = Tools::getValue("max_amount");
		$list->address_after = NULL;
		$list->code = $list->returnCode($id, true);
		$list->url = $list->slugify($list->name);
		$list->message = Tools::getValue('message');
		$dirC = array(
			'country' => "Colombia",
			'city'    => Tools::getValue('city'),
			'town'    => Tools::getValue('town'),
			'address' => Tools::getValue('address'),
			'tel'     => Tools::getValue('tel'),
			'cel'     => Tools::getValue('cel')
		);
		$list->info_creator = Tools::jsonEncode($dirC);
		$list->updated_at = date ( "Y-m-d H:i:s" );
		try {
			if ($list->save()){
				$list->image = !$this->_uploadImage() ? $list->image : $this->_uploadImage();
				$list->update();
				$this->context->smarty->assign (array (
					'response' => "Se ha Editado la lista",
					'error' => false
				));
			}
			else
			$this->context->smarty->assign (array (
				'response' => "Ha ocurrido un error",
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
	private function _uploadImage(){
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
			return isset($image_name) ?_MODULE_DIR_."giftlist/uploads/" . $image_name : false;
		}
		return false;
	}
}