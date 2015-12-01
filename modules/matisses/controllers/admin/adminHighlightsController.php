<?php
include_once(dirname(__FILE__).'/../../classes/Highlights.php');

class AdminHighlightsController extends ModuleAdminController
{
	
	public function __construct()
	{
		$this->bootstrap 	= true;
		$this->table 		= 'highlights';
		$this->identifier	= 'id_highlight';
		$this->className 	= 'Highlights';
		$this->lang 		= false;
		$this->deleted 		= false;
		$this->explicitSelect 	= true;
		$this->_defaultOrderBy 	= 'id_highlight';
		$this->allow_export 	= false;
		$this->token 			= Tools::getAdminTokenLite(Tools::getValue('controller'));
		$this->imageType 		= 'jpg';
		$this->upload			= _PS_IMG_DIR_.'highlights/';
		

		$this->context = Context::getContext();

 		$this->fieldImageSettings = array(
 			'name' => 'image',
 			'dir' => 'highlights'
 		);

		$this->fields_list = array( 
			'id_highlight' => array(
				'title' => $this->l('ID'),
				'align' => 'center',
				'class' => 'fixed-width-xs'
			),
			'image' => array(
				'title' => $this->l('Destacado'),
				'align' => 'center',
				'image' => 'highlights',
				'width' => 300,
				'orderby' => false,
				'filter' => false,
				'search' => false,
			),
			'active' => array(
				'title' => $this->l('Activo'),
				'active' => 'status',
				'type' => 'bool',
				'class' => 'fixed-width-xs',
				'align' => 'center',
				'ajax' => true,
				'orderby' => false
			)
		);

		$this->bulk_actions = array('delete' => array('text' => $this->l('Delete selected')));
		$this->specificConfirmDelete = false;

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
	
	public function initPageHeaderToolbar()
	{
		parent::initPageHeaderToolbar();
		
		$this->page_header_toolbar_btn['new_category'] = array(
			'href' => self::$currentIndex.'&add'.$this->table.'&token='.$this->token,
			'desc' => $this->l('Agregar nuevo destacado', null, null, false),
			'icon' => 'process-icon-new'
		);
	}
	
	public function processDelete()
	{
		$highlights = $this->loadObject();
		if ($this->tabAccess['delete'] === '1')
		{
			if (parent::processDelete())
			{
				return true;
			}
			else
				return false;
		}
		else
			$this->errors[] = Tools::displayError('You do not have permission to delete this.');
	}
	
	public function processForceDeleteImage()
	{
		$highlights = $this->loadObject(true);
		if (Validate::isLoadedObject($category))
			$highlights->deleteImage(true);
	}
	
	public function renderList()
	{
		$this->addRowAction('delete');
		return parent::renderList();
	}
	
	protected function postImage($id)
	{
		$ret = parent::postImage($id);
		if (($id_highlights = (int)Tools::getValue('id_highlights')) &&
			isset($_FILES) && count($_FILES) && $_FILES['image']['name'] != null &&
		file_exists($this->upload.$id_highlights.'.jpg'))
		{
			$images_types = ImageType::getImagesTypes('categories');
			foreach ($images_types as $k => $image_type)
			{
				ImageManager::resize(
					$this->upload.$id_highlights.'.jpg',
					$this->upload.$id_highlights.'-'.stripslashes($image_type['name']).'.jpg',
					(int)$image_type['width'], (int)$image_type['height']
				);
			}
		}

		return $ret;
	}
	 
	
	public function renderForm()
	{
		$obj = $this->loadObject(true);
		$this->fields_form = array(
			'tinymce' => false,
			'legend' => array(
				'title' => $this->l('Destacado'),
				'icon' => 'icon-tags'
			),
			'input' => array(
				array(
					'type' => 'file',
					'label' => $this->l('Seleccione la imagen'),
					'name' => 'image',
					'required' => true,
					'hint' => $this->l('Selecione una imagen formato jpg:'),
				),
				array(
					'type' => 'switch',
					'label' => $this->l('Displayed'),
					'name' => 'active',
					'required' => false,
					'is_bool' => true,
					'values' => array(
						array(
							'id' => 'active_on',
							'value' => 1,
							'label' => $this->l('Enabled')
						),
						array(
							'id' => 'active_off',
							'value' => 0,
							'label' => $this->l('Disabled')
						)
					)
				),
				
			),
			'submit' => array(
				'title' => $this->l('Save'),
				'name' => 'submitAdd'.$this->table
			)
		);
		//$image = ImageManager::thumbnail(_PS_IMG_DIR_.'lookbook/'.$obj->id.'.jpg', $this->table.'_'.(int)$obj->id.'.'.$this->imageType, 350, $this->imageType, true);
		$image = ImageManager::thumbnail($this->upload.$obj->id.'.jpg', $this->table.'_'.(int)$obj->id.'.'.$this->imageType, 350, $this->imageType, true);
		$this->fields_value['image'] = array(
			'image' => $image ? $image : false,
			'size' => $image ? filesize($this->upload.$obj->id.'.jpg') / 1024 : false
		);
		return parent::renderForm();
	}	
	
		
	public function ajaxProcessStatusHighlights()
	{
		if (!$id_highlights = (int)Tools::getValue('id_highlights'))
			die(Tools::jsonEncode(array('success' => false, 'error' => true, 'text' => $this->l('Failed to update the status'))));
		else
		{
			$Highlights = new Highlights((int)$id_highlights);
			if (Validate::isLoadedObject($Highlights))
			{
				$Highlights->active = $Highlights->active == 1 ? 0 : 1;
				$Highlights->save() ?
				die(Tools::jsonEncode(array('success' => true, 'text' => $this->l('The status has been updated successfully')))) :
				die(Tools::jsonEncode(array('success' => false, 'error' => true, 'text' => $this->l('Failed to update the status'))));
			}
		}
	}	
}
