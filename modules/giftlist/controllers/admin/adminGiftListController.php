<?php

include_once __DIR__ . '/../../classes/GiftList.php';
class AdminGiftListController extends ModuleAdminController
{
	public function __construct()
	{
		$this->bootstrap 	= true;
		$this->table 		= 'gift_list';
		$this->identifier	= 'id';
		$this->className 	= 'GiftListModel';
		$this->lang 		= false;
		$this->deleted 		= false;
		$this->explicitSelect 	= true;
		$this->_defaultOrderBy 	= 'id';
		$this->token 			= Tools::getAdminTokenLite(Tools::getValue('controller'));
		$this->allow_export 	= false;
		$this->imageType 		= 'jpg';
		$this->upload			= _PS_IMG_DIR_.'giftlist/';
		
		$this->context = Context::getContext();
		
		$this->fields_list = array(
			'id' => array(
				'title' => $this->l('ID'),
				'align' => 'center',
				'class' => 'fixed-width-xs'
			),
			'code' => array(
				'title' => $this->l('code')
			),
			'name' => array(
				'title' => $this->l('name'),
			)
		);
		
		$this->bulk_actions = array('delete' => array('text' => $this->l('Delete selected')));
		//$this->specificConfirmDelete = false;
		
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
		$this->fields_form = array(
			'legend' => array(
				'title' => $this->l('Only customers can create!'),
				'icon' => 'icon-asterisk'
			)
		);
		return parent::renderForm();
	}
}
