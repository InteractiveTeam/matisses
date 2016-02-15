<?php
include_once __DIR__ . '/../../classes/EventType.php';
class AdminEventTypeController extends ModuleAdminController
{
	public function __construct()
	{
		$this->bootstrap 	= true;
		$this->table 		= 'event_type';
		$this->identifier	= 'id';
		$this->className 	= 'EventTypeModel';
		$this->lang 		= false;
		$this->deleted 		= false;
		$this->token 			= Tools::getAdminTokenLite(Tools::getValue('AdminController'));
		$this->explicitSelect 	= true;
		$this->_defaultOrderBy 	= 'id';
		$this->allow_export 	= false;
		
		$this->context = Context::getContext();
		
		$this->fields_list = array(
			'id' => array(
				'title' => $this->l('ID'),
				'align' => 'center',
				'class' => 'fixed-width-xs'
			),
			'name' => array(
				'title' => $this->l('name'),
			)
		);
		
		$this->bulk_actions = array('delete' => array('text' => $this->l('Delete selected')));
		$this->specificConfirmDelete = true;
		
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
		$this->addRowAction('delete');
		return parent::renderList();
	}
	
	public function renderForm()
	{
		$obj = $this->loadObject(true);
		$this->fields_form = array(
				'legend' => array(
						'title' => $this->l('Event type'),
						'icon' => 'icon-tags'
				),
				'input' => array(
						array(
								'type' => 'text',
								'label' => $this->l('Name'),
								'name' => 'name',
								'required' => true,
								'hint' => $this->l('Name:'),
						)		
				),
				'submit' => array(
						'title' => $this->l('Save'),
						'name' => 'submitAdd'.$this->table
				)
		);
		return parent::renderForm();
	}
}
