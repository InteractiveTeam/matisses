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
		$this->lang 		= true;
		$this->deleted 		= false;
		$this->explicitSelect 	= true;
		$this->_defaultOrderBy 	= 'position';
		$this->allow_export 	= false;
		$this->token 			= Tools::getAdminTokenLite(Tools::getValue('controller'));
		$this->imageType 		= 'jpg';
		$this->upload			= _PS_IMG_DIR_.'experiences/';
		
		
		$this->context = Context::getContext();

		$this->fieldImageSettings = array(
 			'name' => 'image',
 			'dir' => 'experiences'
 		);

		$this->fields_list = array(
			'id_experience' => array(
				'title' => $this->l('ID'),
				'align' => 'center',
				'filter_key' => 'a!id_experience',
				'class' => 'fixed-width-xs'
			),
			'image' => array(
				'title' => $this->l('Imagen'),
				'align' => 'center',
				'image' => 'experiences',
				'orderby' => false,
				'filter' => false,
				'search' => false
			),			
			'name' => array(
				'title' => $this->l('Experiencia')
			),
			'position' => array(
				'title' => $this->l('Posición'),
				'filter_key' => 'a!position',
				'position' => 'position',
				'align' => 'center'
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
        $this->addJqueryUI('ui.datepicker');
		$this->addJqueryPlugin('tagify');
	    $this->addJS(array(
            _MODULE_DIR_.'/matisses/js/experiences/experiences.js',
			__PS_BASE_URI__.$this->admin_webpath.'/themes/'.$this->bo_theme.'/js/vendor/nv.d3.min.js',
        ));
       $this->addCSS(__PS_BASE_URI__.$this->admin_webpath.'/themes/'.$this->bo_theme.'/css/vendor/nv.d3.css');
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
		
		if(Tools::isSubmit('submitAddexperiences'))
		{
			if(!$_FILES['image']['name'] || mb_strtolower(pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION)) != 'jpg')
				$this->errors[] = Tools::displayError('Seleccione una imagen formato jpg');
			$this->display = 'add';	
			//return $this->renderForm();
		}

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
		$this->addRowAction('edit');
		return parent::renderList();
	}
	
	protected function postImage($id)
	{
		$ret = parent::postImage($id);
		if (($id_highlights = (int)Tools::getValue('id_experience')) &&
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
	 
	public function processPosition()
	{
		if ($this->tabAccess['edit'] !== '1')
			$this->errors[] = Tools::displayError('You do not have permission to edit this.');
		elseif (!Validate::isLoadedObject($object = new Category((int)Tools::getValue($this->identifier, Tools::getValue('id_category_to_move', 1)))))
			$this->errors[] = Tools::displayError('An error occurred while updating the status for an object.').' <b>'.
				$this->table.'</b> '.Tools::displayError('(cannot load object)');
		if (!$object->updatePosition((int)Tools::getValue('way'), (int)Tools::getValue('position')))
			$this->errors[] = Tools::displayError('Failed to update the position.');
		else
		{
			$object->regenerateEntireNtree();
			Tools::redirectAdmin(self::$currentIndex.'&'.$this->table.'Orderby=position&'.$this->table.'Orderway=asc&conf=5'.(($id_category = (int)Tools::getValue($this->identifier, Tools::getValue('id_category_parent', 1))) ? ('&'.$this->identifier.'='.$id_category) : '').'&token='.Tools::getAdminTokenLite('AdminCategories'));
		}
	}	 
	
	public function renderForm()
	{
		if(Tools::isSubmit('submitAddexperiences'))
			$this->display = 'add';
		
		
		switch($this->display)
		{
			case 'add':
			// ADD FORM
			$obj = $this->loadObject(true);

			
			$this->fields_form = array(
				'tinymce' => true,
				'legend' => array(
					'title' => $this->l('Nueva Experiencia'),
					'icon' => 'icon-tags'
				),
				'input' => array(
					array(
						'type' => 'file',
						'label' => $this->l('Seleccione la imagen de la experiencia'),
						'name' => 'image',
						'required' => true,
						'hint' => $this->l('Selecione una imagen formato jpg:'),
					),
					
					array(
						'type' => 'text',
						'label' => $this->l('Nombre de la experiencia'),
						'name' => 'name',
						'lang' => true,
						'required' => true,
						'class' => 'copy2friendlyUrl',
						'hint' => $this->l('Invalid characters:').' <>;=#{}',
					),
					
					array(
						'type' => 'textarea',
						'label' => $this->l('Descripción'),
						'name' => 'description',
						'autoload_rte' => true,
						'lang' => true,
						'hint' => $this->l('Invalid characters:').' <>;=#{}'
					),
					
					array(
						'type' => 'textarea',
						'label' => $this->l('Meta titulo'),
						'name' => 'meta_title',
						'lang' => true,
						'rows' => 5,
						'cols' => 100,
						'hint' => $this->l('Forbidden characters:').' <>;=#{}'
					),
					
					array(
						'type' => 'tags',
						'label' => $this->l('Meta keywords'),
						'name' => 'meta_keywords',
						'lang' => true,
						'hint' => $this->l('To add "tags," click in the field, write something, and then press "Enter."').'&nbsp;'.$this->l('Forbidden characters:').' <>;=#{}'
					),								
					
					array(
						'type' => 'text',
						'label' => $this->l('Url Amigable'),
						'name' => 'link_rewrite',
						'lang' => true,
						'required' => true,
						'hint' => $this->l('Only letters, numbers, underscore (_) and the minus (-) character are allowed.')
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
			
			$this->tpl_form_vars['token'] = $this->token;
			$this->tpl_form_vars['PS_ALLOW_ACCENTED_CHARS_URL'] = (int)Configuration::get('PS_ALLOW_ACCENTED_CHARS_URL');
			$this->tpl_form_vars['ps_force_friendly_product'] = Configuration::get('PS_FORCE_FRIENDLY_PRODUCT');
			$this->redirect_after = self::$currentIndex.'&addexperiences&token='.Tools::getAdminTokenLite('AdminProducts');
			//$image = ImageManager::thumbnail(_PS_IMG_DIR_.'lookbook/'.$obj->id.'.jpg', $this->table.'_'.(int)$obj->id.'.'.$this->imageType, 350, $this->imageType, true);
			$image = ImageManager::thumbnail($this->upload.$obj->id.'.jpg', $this->table.'_'.(int)$obj->id.'.'.$this->imageType, 350, $this->imageType, true);
			$this->fields_value['image'] = array(
				'image' => $image ? $image : false,
				'size' => $image ? filesize($this->upload.$obj->id.'.jpg') / 1024 : false
			);	

			
	
			
			
			
			// END ADD FORM
			break;
		}
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
