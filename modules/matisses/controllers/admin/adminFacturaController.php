<?php 

class AdminFacturaController extends ModuleAdminController  {
    public function __construct() {
        $this->bootstrap = true;
        //$this->className 	= 'Factura';
		$this->lang 		= true;
        $this->path         = _PS_MODULE_DIR_."matisses";
        $this->token 			= Tools::getAdminTokenLite(Tools::getValue('controller'));
        
        
        $this->context = Context::getContext();

        $fields_form = array(
            'InvoiceNumber' => array(
                'title' => $this->l('Número de factura'),
                'type' => 'text',
                'class' => 'fixed-width-xxl'
            ),
		);

        $this->fields_options = array(
            'general' => array(
                'title' =>	$this->l('Borrar factura'),
                'icon' =>	'icon-search',
                'fields' =>	$fields_form,
                'submit' => array('title' => $this->l('Borrar'),'name' => 'deleteInvoice'),
            ),
        );
        parent::__construct();
    }
    
    public function initContent() {        
        parent::initContent();
    }
            
    public function init() {
		parent::init();
	}
    
    public function initProcess() {
		parent::initProcess();
	}
    public function PostProcess(){
        if(Tools::isSubmit("deleteInvoice")){
            if(Tools::getValue('InvoiceNumber') != ""){
                $info = Db::getInstance()->getRow(
                    'SELECT id_cart,id_customer FROM '._DB_PREFIX_.'cart WHERE id_factura = "'.Tools::getValue('InvoiceNumber').'"'
                );
                if(!empty($info)){
                    $id_order = Db::getInstance()->getValue(
                        'SELECT id_order FROM '._DB_PREFIX_.'orders WHERE id_cart = '.$info['id_cart'] . ' AND id_customer = '. $info['id_customer'] 
                    );
                    if(!empty($id_order) && $id_order != 0){
                        Db::getInstance()->delete('cart_product', 'id_cart = '.$info['id_cart']);
                        Db::getInstance()->delete('order_detail', 'id_order = '.$id_order);
                        Db::getInstance()->delete('cart', 'id_cart = '.$info['id_cart']);
                        Db::getInstance()->delete('orders', 'id_order = '.$id_order);
                        $this->confirmations[] = 'Se ha borrrado la factura ' . Tools::getValue('InvoiceNumber');
                    }else{
                        $this->displayWarning($this->l('No existe la orden'));
                    }
                }
            }else{
                $this->displayWarning($this->l('Debes ingresar un número de factura'));
            }
        }
    }
}