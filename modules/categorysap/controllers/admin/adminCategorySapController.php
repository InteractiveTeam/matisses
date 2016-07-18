<?php

class AdminCategorySapController extends ModuleAdminController
{
	public function __construct()
	{
		$this->bootstrap 	= true;
		$this->table 		= 'category_sap';
		$this->identifier	= 'id_category';
		$this->className 	= 'CategorySapModel';
		$this->lang 		= false;
		$this->deleted 		= false;
		$this->explicitSelect 	= true;
		$this->_defaultOrderBy 	= 'id_category';
		$this->token 			= Tools::getAdminTokenLite(Tools::getValue('controller'));
		$this->allow_export 	= false;
		
		$this->context = Context::getContext();
		
		$this->fields_list = array(
			'id_category' => array(
				'title' => $this->l('ID'),
				'align' => 'center'
			),
			'category_name' => array(
				'title' => $this->l('Nombre')
			),
			'sapcode' => array(
				'title' => $this->l('Código SAP'),
			)
		);
		
		parent::__construct();
	}
	
	public function initProcess()
	{
		parent::initProcess();
	}
	
	public function postProcess()
	{
		return parent::postProcess();
	}
	
	public function init()
	{
		parent::init();
	}
	
	public function renderList()
	{
		//$this->addRowAction('delete');
		return parent::renderList();
	}
	
	public function renderForm()
	{
		$obj = $this->loadObject(true);
		return parent::renderForm();
	}
}
