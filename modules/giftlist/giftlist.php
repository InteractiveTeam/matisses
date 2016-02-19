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
	public function __construct()
	{
		$this->dbstruct = new DBStruct();
		$this->name = basename(__FILE__,'.php');
		$this->tab = "administration";
		$this->version = "1.0.0";
		$this->author = "Arkix";
        $this->token = Tools::getAdminTokenLite('AdminModules');
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
			$this->__installTabs('adminGiftList', "Lista de Regalos", $parent , $this->name);
			$this->__installTabs('adminEventType', "Tipo de Evento", $parent , $this->name);
			return true;
		}
		return false;
	}

	public function uninstall(){
		if(!parent::uninstall())
			return false;

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
  				'search_link' => $this->context->link->getModuleLink('giftlist', 'buscar')
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

	public function hookActionOrderStatusUpdate($params){
		//Order status awaiting payment confirmation
        if($params['newOrderStatus']->id == ConfigurationCore::get("PS_OS_COD_VALIDATION")
        || $params['newOrderStatus']->id == ConfigurationCore::get("PS_OS_CHEQUE")
        || $params['newOrderStatus']->id == ConfigurationCore::get("PS_OS_PAYPAL")
        || $params['newOrderStatus']->id == ConfigurationCore::get("PS_OS_BANKWIRE")){
            $this->__verifyListInOrderAfertPayment($params['cart']);
        }

        //Order status payment confirmation
        if (!($params['newOrderStatus']->id == ConfigurationCore::get('PS_OS_WS_PAYMENT'))
         && !($params['newOrderStatus']->id == ConfigurationCore::get('PS_OS_PAYMENT')))
            $this->_updateStatesinList($params['cart']);

        
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
                    $creator = $list->getCreator();
                    $params = array(
                        '{creator}' =>  $creator->firstname,
                        '{value}' => $bond->value,
                        '{message}' => $bond->message == "" ? "Ningun Mensaje" : $bond->message,
                        '{buyer}' => $buyer->firstname . " " . $buyer->lastname,
                        '{description_link}' => $this->context->link->getModuleLink('giftlist', 'descripcion',array('url' => $list->url))
                    );
                    $this->_sendEmail('bond-bought','¡Han comprado un bono para ti!',$creator,$params);
                }
                elseif(['id_product'] != 0){
                    $lpd->bought = 1;
                    $lpd->save();
                    $prod = new ProductCore($product['id_product']);
                    $list = new GiftListModel($product['id_giftlist']);
                    $creator = $list->getCreator();
                    $qty = Tools::jsonDecode($lpd->group);
                    $params = array(
                        '{creator}' =>  $creator->firstname,
                        '{image}' => $link->getImageLink($prod->link_rewrite, $prod->id_image, 'home_default'),
                        '{name}' => $prod->name,
                        '{color}' => "Validate",
                        '{product_price}' => $prod->price,
                        '{buyer}' => $buyer->firstname . " " . $buyer->lastname,
                        '{qty_buy}' => $product['quantity'],
                        '{qty_want}' => $qty->wanted,
                        '{qty_rest}' => $qty->missing,
                        '{message}' => $lpd->message == "" ? "Ningun Mensaje" : $lpd->message,
                        '{description_link}' => $this->context->link->getModuleLink('giftlist', 'descripcion',array('url' => $list->url))
                    );
                    $this->_sendEmail('product-bought','¡Han comprado un producto para ti!',$creator,$params);
                }
            }
        }
    }
    
    private function __verifyListInOrderAfertPayment($cart){
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

	public function hookModuleRoutes($params)
	{
		return [
			'module-giftlist-descripcion' => [
				'controller' => 'descripcion',
				'rule' => 'giftlist/descripcion{/:url}',
				'keywords' => [
					'url' => ['regexp' => '[_a-zA-Z0-9_-]+', 'param' => 'url']
				],
				'params' => [
					'fc' => 'module',
					'module' => 'giftlist'
				]
			],
			'module-giftlist-listas' => [
				'controller' => 'listas',
				'rule' => 'giftlist/listas',
				'params' => [
						'fc' => 'module',
						'module' => 'giftlist'
				]
			],
		];
	}

	public function hookDisplayBackOfficeHeader()
	{
		$this->context->controller->addCss(_MODULE_DIR_."giftlist/views/css/tab.css");
	}

}
