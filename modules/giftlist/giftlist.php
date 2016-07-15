<?php
if(!defined('_PS_VERSION_'))
	exit;

require_once __DIR__ . '/dbstruct.php';
include_once __DIR__ . '/classes/Bond.php';
include_once __DIR__ . '/classes/GiftList.php';
include_once __DIR__ . '/classes/ListProductBond.php';
class giftlist extends Module
{
	private $dbstruct;
    
    public static $moduleRoutes = array(
         'module-giftlist-descripcion' => array(
                'controller' => 'descripcion',
                'rule' =>  'lista-de-regalos/lista{/:url}',
              'keywords' => array(
                    'url'   => array('regexp' => '[_a-zA-Z0-9_-]+',   'param' => 'url'),
                  ),
                'params' => array(
                    'fc' => 'module',
                    'module' => 'giftlist',
                    'controller' => 'descripcion'
                )
            ),

            'module-giftlist-listas' => array(
                'controller' => 'listas',
                'rule' =>  'lista-de-regalos/listas',
                'keywords' => array(),
                'params' => array(
                    'fc' => 'module',
                    'module' => 'giftlist',
                    'controller' => 'listas'
                )
            ), 
             
            'module-giftlist-administrar' => array(
                'controller' => 'administrar',
                'rule' =>  'lista-de-regalos/crear',
                'keywords' => array(),
                'params' => array(
                    'fc' => 'module',
                    'module' => 'giftlist',
                    'controller' => 'administrar'
                )
            ),  
             
            'module-giftlist-empezar' => array(
                'controller' => 'empezar',
                'rule' =>  'lista-de-regalos',
                'keywords' => array(),
                'params' => array(
                    'fc' => 'module',
                    'module' => 'giftlist',
                    'controller' => 'empezar'
                )
            ), 
             
            'module-giftlist-buscar' => array(
                'controller' => 'buscar',
                'rule' =>  'lista-de-regalos/buscar',
                'keywords' => array(),
                'params' => array(
                    'fc' => 'module',
                    'module' => 'giftlist',
                    'controller' => 'buscar'
                )
            ), 
    );
    
    
    
	public function __construct()
	{
		$this->dbstruct = new DBStruct();
		$this->name = basename(__FILE__,'.php');
		$this->tab = "front_office_features";
		$this->version = "1.0.0";
		$this->author = "Arkix";
		$this->need_instance = 0;
		parent::__construct();

		$this->displayName = $this->l("Lista de regalos");
		$this->description = $this->l("Módulo para manejar listas de regalos");
		$this->_module = $this->name;
		$this->confirmUninstall = $this->l('Are you sure you want to uninstall?');

		if (!Configuration::get('MYMODULE_NAME'))
			$this->warning = $this->l('No name provided');
	}

	public function install(){
		if (Shop::isFeatureActive())
			Shop::setContext(Shop::CONTEXT_ALL);
		if(parent::install()){
			$this->registerHook('displayCustomerAccount');
			$this->registerHook('moduleRoutes');
			$this->registerHook('displayProductButtons');
			$this->registerHook('displayBackOfficeHeader');
			$this->registerHook("actionOrderStatusUpdate");
            $this->registerHook("actionCustomerAccountAdd");
            $this->registerHook("actionProductInList");
            $this->registerHook('header');
			$this->dbstruct->CreateListConfigurationTable();
			$this->dbstruct->CreateEventTypeTable();
			$this->dbstruct->CreateGiftListTable();
			$this->dbstruct->CreateEmailCocreatorTable();
			$this->dbstruct->CreateBondTable();
			$this->dbstruct->CreateListProductBondTable();
			$this->dbstruct->alterTableCartProductAddIdGiftList();
			$this->dbstruct->alterTableCartProductAddQtyGroup();
			$this->dbstruct->alterTableCartProductaddIdBond();
			$this->dbstruct->addBondInProduct();
			$this->__installTabs('giftlist', 'Lista de Regalos',0);
			$parent = (int)Tab::getIdFromClassName('giftlist');
			$this->__installTabs('AdminGiftList', "Lista de Regalos", $parent , $this->name);
			$this->__installTabs('AdminEventType', "Tipo de Evento", $parent , $this->name);
			return true;
		}
		return false;
	}

	public function uninstall(){
		if(!parent::uninstall())
			return false;
        unlink(_PS_ROOT_DIR_ . "override/classes/Cart.php");
        unlink(_PS_ROOT_DIR_ . "override/controllers/front/CartController.php");
		$this->dbstruct->DeleteListProductBondTable();
		$this->dbstruct->DeleteListConfigurationTable();
		$this->dbstruct->DeleteEmailCocreatorTable();
		$this->dbstruct->DeleteGiftListTable();
		$this->dbstruct->DeleteEventTypeTable();
		$this->dbstruct->DeleteBondTable();
		$this->dbstruct->alterTableCartProductDeleteIdGiftList();
		$this->dbstruct->alterTableCartProductDeleteQtyGroup();
		$this->dbstruct->alterTableCartProductDeleteIdBond();
		$this->dbstruct->deleteBondInProduct();
		$this->unregisterHook('displayBackOfficeHeader');
		$this->__uninstallTabs('adminEventType');
		$this->__uninstallTabs('adminGiftList');
		$this->__uninstallTabs('giftlist');
		return true;
	}

	public function hookDisplayCustomerAccount($params)
	{
	  $this->context->smarty->assign(
	  		array(
	  			'gift_link' =>  $this->context->link->getModuleLink('giftlist', 'listas'),
  				'search_link' => $this->context->link->getModuleLink('giftlist', 'buscar'),
  				'create_link' => $this->context->link->getModuleLink('giftlist', 'administrar'),
	  		));
	  return $this->display(__FILE__, 'giftlistbtn.tpl');
	}

	public function hookDisplayProductButtons($params)
	{
		if($this->context->customer->isLogged()){
			$sql = "SELECT id,name FROM "._DB_PREFIX_."gift_list WHERE id_creator = ".$this->context->customer->id . ";";
			$this->context->smarty->assign(
				array(
						'desc_link' =>  $this->context->link->getModuleLink('giftlist', 'listas'),
						'list' => Db::getInstance()->executeS($sql)
				));
			return $this->display(__FILE__, 'addToListBtn.tpl');
		}
	}
    
    public function hookActionProductInList($params){
        $l = new GiftListModel($params['id_list']);
        $p = new ProductCore($params["id_product"]);
        $lpd = ListProductBondModel::getByProductAndList($params['id_list'],$params['id_product']);
        $customer = new CustomerCore($l->id_creator);
        $attr = $p->getAttributeCombinationsById($params['id_product_attribute'],$this->context->language->id);
        $id_image = ProductCore::getCover($params['id_product']);
        // get Image by id
        if (sizeof($id_image) > 0) {
            $image = new Image($id_image['id_image']);
            // get image full URL
            $image_url = _PS_BASE_URL_._THEME_PROD_DIR_.$image->getExistingImgPath().".jpg";
        }
        $out = array (
            '{creator}' => $customer->firstname.' '.$customer->lastname,
            '{image}' => $image_url,
            '{name}' => $p->name[1],
            '{price}' => $p->price,
            '{color}' => $attr['attribute_name'],
            "{wanted}" => $lpd['total'],
            "{missing}" => $lpd['missing'],
            '{description_link}' =>$context->link->getModuleLink('giftlist', 'descripcion',array('url' => $l->url))
        );
        $this->_sendEmail("out-stock","Producto agotado",$customer,$params);
    }

    public function hookactionCustomerAccountAdd($params){
        //get the email
        $sql = "SELECT * FROM "._DB_PREFIX_."email_cocreator WHERE email = '".$params['customer']->email."'";
        $res = Db::getInstance()->executeS($sql);
        if(!empty($res)){
            foreach($res as $row){
                Db::getInstace()->update('gift_list',array(
                    'id_cocreator' => $parmas['customer']->id
                ),'id ='.$row['íd_list']);
            }
        }
        Db::getInstance()->delete('email_cocreator', "email = '".$params['customer']->email."'");
        
    }
    
	public function hookActionOrderStatusUpdate($params){

        //Order status payment confirmation
        if (!($params['newOrderStatus']->id == ConfigurationCore::get('PS_OS_WS_PAYMENT'))
         && !($params['newOrderStatus']->id == ConfigurationCore::get('PS_OS_PAYMENT'))){
            $this->_updateStatesinList($params['cart']);
            $this->__verifyListInOrderBeforePayment($params['cart']);
        }

        
	}
    
    private function _updateStatesinList($cart){
        $sql = "SELECT * FROM "._DB_PREFIX_."cart_product WHERE id_cart = " . $cart->id;
        $products = Db::getInstance()->executeS($sql);
        $sql = "SELECT id_customer FROM "._DB_PREFIX_."orders WHERE id_cart = ".$cart->id;
        $id_customer = Db::getInstance()->getValue($sql);
        $buyer = new CustomerCore($id_customer);
        $link = new LinkCore();
        foreach($products as $product){
            if($product['id_giftlist'] != 0){
                $sql="SELECT id FROM "._DB_PREFIX_."list_product_bond WHERE id_bond = ".$product['id_bond']." AND id_list = ".$product['id_giftlist'];
                $id = Db::getInstance()->getRow($sql);
                $lpd = new ListProductBondModel($id['id']);
                if($product['id_bond'] != 0){
                    $lpd->bought = 1;
                    $lpd->save();
                    $bond = new BondModel($product['id_bond']);
                    $list = new GiftListModel($product['id_giftlist']);
                    $creator = $list->getCreator($list->id_creator);
                    $params = array(
                        '{creator}' =>  $creator->firstname,
                        '{value}' => $bond->value,
                        '{message}' => $bond->message == "" ? "Ningun Mensaje" : $bond->message,
                        '{buyer}' => $buyer->firstname . " " . $buyer->lastname,
                        '{description_link}' => $this->context->link->getModuleLink('giftlist', 'descripcion',array('url' => $list->url))
                    );
                    $this->_sendEmail('bond-bought','¡Han comprado un bono para ti!',$creator,$params);
                }
                elseif($product['id_product'] != 0){
                    $lpd->bought = 1;
                    $lpd->save();
                    $prod = new ProductCore($product['id_product']);
                    $list = new GiftListModel($product['id_giftlist']);
                    $creator = $list->getCreator($list->getCreator($list->id_creator));
                    $params = array(
                        '{creator}' =>  $creator->firstname,
                        '{image}' => $link->getImageLink($prod->link_rewrite, $prod->id_image, 'home_default'),
                        '{name}' => $prod->name,
                        '{color}' => "Validate",
                        '{product_price}' => $prod->price,
                        '{buyer}' => $buyer->firstname . " " . $buyer->lastname,
                        '{qty_buy}' => $product['quantity'],
                        '{qty_want}' => $lpd->cant,
                        '{qty_rest}' => $lpd->missing,
                        '{message}' => $lpd->message == "" ? "Ningun Mensaje" : $lpd->message,
                        '{description_link}' => $this->context->link->getModuleLink('giftlist', 'descripcion',array('url' => $list->url))
                    );
                    $this->_sendEmail('product-bought','¡Han comprado un producto para ti!',$creator,$params);
                }
            }
        }
    }
    
    private function __verifyListInOrderBeforePayment($cart){
        $sql = "SELECT * FROM "._DB_PREFIX_."cart_product WHERE id_cart = " .$cart->id;
        $products = Db::getInstance()->executeS($sql);
        $buyer = new Customer($cart->id_customer);
        $sql = "SELECT id_product FROM "._DB_PREFIX_."product WHERE reference = 'BOND-LIST'";
		$id_product = Db::getInstance()->getValue($sql);
        foreach($products as $product){
            if($product['id_bond'] != 0){
                $sqlB = "SELECT count(id_bond)  as bonos FROM " . _DB_PREFIX_ . "list_product_bond WHERE id_bond = ". $product['id_bond'];
                $res = Db::getInstance()->getValue($sql);
                if($res['bonos'] <= 1 ){
                    Db::getInstance()->insert('list_product_bond',array(
                        'id_list' => $product['id_giftlist'],
                        'id_product' => 0,
                        'id_bond' => $product['id_bond'],
                        'group' => "[]",
                        'option' => "[]",
                        'favorite' => 0,
                        'bought' => 0,
                        'created_at' => date( "Y-m-d H:i:s" )
                    ));
                }
            }else{
                $sqlB = "SELECT * FROM " . _DB_PREFIX_ . "list_product_bond WHERE id_list = ". $product['id_giftlist']. " AND id_product = ".$product['id_product'] . " AND id_bond = 0";
                $prod = Db::getInstance()->getRow($sqlB);
                $prod['missing'] -= $product['quantity'];
                Db::getInstance()->update('list_product_bond',array(
                    'group' => Tools::jsonEncode($cant),
                    'bought' => $cant->missing > 0 ? 1 : 0,
                    'updated_at' => date( "Y-m-d H:i:s" )
                ),"id_product = ".$product['id_product']);
            }
        }
    }
    
    
    
    private function _sendEmail($template,$subject,$customer,$params){
        $id_shop = (int)Context::getContext()->shop->id;
		$id_lang = $this->context->language->id;
        MailCore::Send($id_lang, $template, sprintf(
            MailCore::l($subject), 1),
            $params,$customer->email, $customer->firstname.' '.$customer->lastname,
        null, null, null,null, _MODULE_DIR_."giftlist/mails/", true, $id_shop);
    }

	private function __uninstallTabs($class_name)
	{
		try{
			$id_tab = (int)Tab::getIdFromClassName($class_name);
			if ($id_tab)
			{
				$tab = new Tab($id_tab);
				$tab->delete();
			}
			return true;
		}catch (Exception $e) {
			return false;
		}
	}

	private function __installTabs($class_name,$name,$parent=0,$module = null,$page=NULL,$title=NULL,$description=NULL, $url_rewrite=NULL)
	{
		try{
			$id_tab = (int)Tab::getIdFromClassName($class_name);
			if(!$id_tab)
			{
				$tab = new Tab();
				$tab->active = 1;
				$tab->class_name = $class_name;
				$tab->name = array();
				foreach (Language::getLanguages(true) as $lang)
					$tab->name[$lang['id_lang']] = $name;

					$tab->id_parent = $parent;
					$tab->module 	= $module;
					$tab->add();
					if($page && $title)
					{
						$meta = new Meta();
						$meta->page 		= $page;
						$meta->title 		= $title;

						if($description)
							$meta->description	= $description;

						if($url_rewrite)
							$meta->url_rewrite	= Tools::link_rewrite($url_rewrite);
						$meta->add();
					}
			}else{
				$this->__uninstallTabs($class_name);
				self::__installTabs($class_name,$name,$parent,$page,$title,$description, $url_rewrite);
			}
			return true;

		}catch (Exception $e) {
			return false;
		}
	}
    
    public function hookModuleRoutes() {
        return self::$moduleRoutes;
    }

	public function hookDisplayBackOfficeHeader()
	{
		$this->context->controller->addCss(_MODULE_DIR_."giftlist/views/css/tab.css");
	}

    public function hookHeader($params)
    {
        if(Dispatcher::getInstance()->getController() == "myaccount")
            $this->context->controller->addJS((_MODULE_DIR_).'giftlist/views/js/ax-empezar.js');
    }
}