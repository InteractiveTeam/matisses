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
    
    public function renderForm() {
		// Building the Add/Edit form
        $this->fields_form = array(
            'legend' => array(
                'title' => $this->l('Test')
            ),
            'input' => array(
                array(
                    'type' => 'text',
                    'label' => $this->l('name test:'),
                    'name' => 'name',
                    'size' => 33,
                    'required' => true,
                    'desc' => $this->l('A description'),
                )
            ),
            'submit' => array(
                'title' => $this->l('    Save   '),
                'class' => 'button'
            )
        );
        $more = $this->module->display($this->path, 'views/templates/admin/PostList.tpl'); 
        return parent::renderForm().$more;
	}
}