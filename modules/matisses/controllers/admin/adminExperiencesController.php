<?php
include_once(dirname(__FILE__).'/../../classes/Experiences.php');

class AdminExperiencesController extends ModuleAdminController
{
	
	public function __construct()
	{
		$this->bootstrap 	= true;
		$this->table 		= 'experiences';
		$this->identifier	= 'id_experience';
		$this->className 	= 'Experiences';
		$this->lang 		= false;
		$this->deleted 		= false;
		$this->explicitSelect 	= true;
		$this->_defaultOrderBy 	= 'id_experience';
		$this->allow_export 	= false;
		$this->token 			= Tools::getAdminTokenLite(Tools::getValue('controller'));
		$this->imageType 		= 'jpg';
		$this->upload			= _PS_IMG_DIR_.'experiences/';
		

		$this->context = Context::getContext();

 		$this->fieldImageSettings = array(
 			'name' => 'image',
 			'dir' => 'highlights'
 		);

		$this->fields_list = array( 
			'id_experience' => array(
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
	
	public function setMedia()
    {
        parent::setMedia();
        $this->addJS(array(
            _MODULE_DIR_.'/matisses/js/experiences/experiences.js',
        ));
       // $this->addCSS(__PS_BASE_URI__.$this->admin_webpath.'/themes/'.$this->bo_theme.'/css/vendor/nv.d3.css');
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
			'desc' => $this->l('Nueva experiencia', null, null, false),
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
		parent::renderForm();
		switch($this->display)
		{
			case 'add': $this->__renderAddForm(); break;
		}
	}
	
	public function __renderAddForm()
	{
		$this->setTemplate('../addexperience.tpl');
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
