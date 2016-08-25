<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

include_once __DIR__ . '/../../classes/GiftList.php';
include_once __DIR__ . '/../../classes/ListProductBond.php';
include_once _PS_CLASS_DIR_ . "stock/StockAvailable.php";
define("_ERROR_", "Ha ocurrido un error");

class giftlistlistasModuleFrontController extends ModuleFrontController {
	public $module;

	public function initContent() {
		if(!$this->context->customer->isLogged()){
			Tools::redirect('my-account');
		}
		parent::initContent ();
        $this->display_column_left = false;
        $this->display_column_right = false;
		$list = new GiftListModel();
		$event_type = Db::getInstance ()->executeS ( "SELECT * FROM `" . _DB_PREFIX_ . "event_type`" );
		$_SESSION['event'] = $event_type;
		$this->context->smarty->assign ( array (
			'all_lists' => $list->getListByCreatorId($this->context->customer->id),
            'admin_link' => $this->context->link->getModuleLink('giftlist', 'administrar'),
			'description_link' => $this->context->link->getModuleLink('giftlist', 'descripcion',array('url' => "")),
			'form' => _MODULE_DIR_ ."giftlist/views/templates/front/partials/form_save_list.php",
            'items_per_page' => 5
		) );
		$this->setTemplate ( 'listas.tpl' );
	}

	public function init(){
		parent::init();
		if($this->ajax)
		{
			if(!empty(Tools::getValue('method'))){
				switch(Tools::getValue('method')){
					case "delete" :
						$this->_ajaxProcessDeleteList(Tools::getValue('id_list'));
						break;
					case "addProduct" :
						$this->_addProduct(Tools::getValue('id'),Tools::getValue('data'));
						break;
					default:
						die();
						break;
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
			_MODULE_DIR_ . '/giftlist/views/js/vendor/datetimepicker/jquery.datetimepicker.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/validation/jquery.validate.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/vendor/mask/jquery.mask.min.js',
			_MODULE_DIR_ . '/giftlist/views/js/listas.js'
		) );
		$this->addCSS ( array (
			_MODULE_DIR_ . '/giftlist/views/css/vendor/datetimepicker/jquery.datetimepicker.css',
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

		$this->page_name = 'module-' . $this->module->name . '-' . Dispatcher::getInstance ()->getController ();
		parent::__construct ();
	}

	/**
	 * @param int $id_product
	 * @param array $data
	 */
	private function _addProduct($id_product,$data){
		$list = new GiftListModel($data['list']);
		$prod = new ProductCore($id_product);
		$options = Tools::sjonDecode
        
        $response = StockAvailable::getQuantityAvailableByProduct((int)$id_product,(int)$data['form'][3]['value']);
        $image = ProductCore::getCombinationImageById( (int)$data['form'][3]['value'], $this->context->language->id);
        if($response == 0 || $response < $data['cant'])
            die(Tools::jsonEncode(array(
                'msg' => "No hay cantidades suficientes en el inventario",
                'error' => true))
               );
        
        if($list->validateProductinList($id_product,(int)$data['form'][3]['value'],$data['list']))
            die(Tools::jsonEncode(array(
                'msg' => "Este producto ya existe en tu lista",
                'error' => true))
               );
        if($data['cant_group'] && $data['cant_group'] > 0){
            $pcant = $data['cant'];
            while($pcant > $data['cant_group']){
                $lpd = new ListProductBondModel();
                $lpd->id_list = $data['list'];
                $lpd->id_product = $id_product;
                $lpd->group = 1;
                $lpd->cant = $data['cant_group'];
                $lpd->message = $data['message'];
                $lpd->option = Tools::jsonEncode($data['form']);
                $lpd->favorite = $data['fav'];
                $lpd->created_at = date ( "Y-m-d H:i:s" );
                $pcant -= $data['cant_group'];
                $lpd->save();
            }
            $lpd = new ListProductBondModel();
            $lpd->id_list = $data['list'];
            $lpd->id_product = $id_product;
            $lpd->cant = $pcant;
            $lpd->group = 1;
            $lpd->message = $data['message'];
            $lpd->option = Tools::jsonEncode($data['form']);
            $lpd->favorite = $data['fav'];
            $lpd->created_at = date ( "Y-m-d H:i:s" );
            $lpd->save();
        }else{
            $lpd = new ListProductBondModel();
            $lpd->id_list = $data['list'];
            $lpd->id_product = $id_product;
            $lpd->message = $data['message'];
            $lpd->group = 0;
            $lpd->cant = $data['cant'];
            $lpd->missing = $data['cant'];
            $lpd->option = Tools::jsonEncode($data['form']);
            $lpd->favorite = $data['fav'];
            $lpd->created_at = date ( "Y-m-d H:i:s" );
            $lpd->save();
        }		
        $msg = $prod->getProductName($id_product)
        ." ha sido añadido a la lista de regalos ". $list->name;
        $att = null;
        $attributes = $prod->getAttributeCombinationsById($data['form'][3]['value'], $this->context->language->id);
        foreach ($attributes as $row){
            if(isset($row['group_name']))
                $att[] = [
                    'value' => "<span class='ax-color-list'>".$row['group_name']."</span>: ". $row['attribute_name']
                ];
        }
        die(Tools::jsonEncode(array(
            'msg' => $msg,
            'prod_name' => $prod->getProductName($id_product),
            'attributes' => $att,
            'price' => Tools::displayPrice($prod->getPrice()),
            'image' => Tools::getShopProtocol().$link->getImageLink($prod->link_rewrite[1], (int)$image['id_image'], 'home_default'),
            'description_link' => $this->context->link->getModuleLink('giftlist', 'descripcion',array('url' => $list->url)),
            'error' => false
        )));
	}

	/**
	 * @param int $id
	 */
	private function _ajaxProcessDeleteList($id){
		$list = new GiftListModel($id);
		if($list->delete()){
			$response = array(
				'msg' => "Se ha eliminado correctamente",
				'id'  => $id
			);
			die(Tools::jsonEncode($response));
		}else{
			$response = array(
				'msg' => _ERROR_,
				'id'  => 0
			);
			die(Tools::jsonEncode($response));
		}

	}
}
