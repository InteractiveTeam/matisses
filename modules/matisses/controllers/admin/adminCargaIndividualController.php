<?php 

class AdminCargaIndividualController extends ModuleAdminController  {
    public function __construct() {
        $this->bootstrap = true;
        $this->className 	= 'CargaIndividual';
		$this->lang 		= true;
        $this->token        = Tools::getAdminTokenLite('adminCargaIndividual');
        $this->path         = _PS_MODULE_DIR_."matisses";
        
        
        $this->context = Context::getContext();
        parent::__construct();
    }
    
    public function initContent() {        
        parent::initContent();
        $this->setTemplate('carga_individual.tpl');        
    }
            
    public function init() {
		parent::init();
	}
    
    public function initProcess() {
		parent::initProcess();
	}
}