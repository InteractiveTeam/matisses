<?php
include_once(dirname(__FILE__).'/../../classes/Experiences.php');

class AdminGarantiasController extends ModuleAdminController
{
	public $_html = NULL;
	
	public function __construct()
	{
		$this->display = 'edit';
		$this->bootstrap 	= true;
		$this->table 		= 'garantias';
		$this->lang 		= true;
		$this->deleted 		= false;
		$this->explicitSelect 	= true;
		$this->_defaultOrderBy 	= 'position';
		$this->allow_export 	= false;
		$this->token 			= Tools::getAdminTokenLite(Tools::getValue('controller'));
		$this->context = Context::getContext();
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
	   $this->addCSS(_MODULE_DIR_.'/matisses/css/experiences/experiences.css');
    }
	

	
	public function initProcess()
	{
		//$this->display = 'edit';
		parent::initProcess();
	}
	
	public function postProcess()
	{
		//echo "<pre>"; print_r($_POST); echo "</pre>"; die();

		if(Tools::isSubmit('submitConfigGarantias'))
		{
			if($_FILES['image']['tmp_name'])
			{
				if(file_exists(_PS_IMG_DIR_.'garantias.jpg'))
					unlink(_PS_IMG_DIR_.'garantias.jpg');
					
				move_uploaded_file($_FILES['image']['tmp_name'],_PS_IMG_DIR_.'garantias.jpg');		
			}
			
			Configuration::updateValue('confgaran_danos',Tools::getValue('danos'));
			Configuration::updateValue('confgaran_nimages',Tools::getValue('nimages'));
			Configuration::updateValue('confgaran_nrdanos',Tools::getValue('nrdanos'));
			Configuration::updateValue('confgaran_terminos',Tools::getValue('terminos'));
			Configuration::updateValue('confgaran_imagen','garantias.jpg');
			$this->display = 'add';	
		}		
		
		
		return parent::postProcess();
	}
	
	public function init()
	{

		parent::init();
	}
	
	public function initPageHeaderToolbar()
	{
		parent::initPageHeaderToolbar();
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
	/*
	public function renderList()
	{
		parent::renderList();
		$this->display = 'edit';	

	}
	*/
	
	protected function postImage($id)
	{
		$ret = parent::postImage($id);
		return $ret;
	} 
	
	public function renderForm()
	{
		$obj = $this->loadObject(true);
		
		//echo "<br><br><br><br><br><pre>"; print_r($this->context->shop); echo "</pre>";
		if(file_exists(_PS_IMG_DIR_.Configuration::get('confgaran_imagen')))
			$image_url = '<img src="'.Tools::getShopDomain(true).'/img/'.Configuration::get('confgaran_imagen').'">';	

		$this->fields_form = array(
			'tinymce' => true,
			'legend' => array(
				'title' => $this->l('Configuracion Experiencias'),
				'icon' => 'icon-tags',
				'hint' => 'selecciona la image'
			),
			'input' => array(

				array(
					'type' => 'file',
					'label' => $this->l('Imagen'),
					'name' => 'image',
					'required' => false,
					'hint' => $this->l('Selecione una imagen formato jpg:'),
					'display_image' => true,
					'image' => $image_url ? $image_url : false,
				),
				
				array(
					'type' => 'textarea',
					'label' => $this->l('Terminos y condiciones'),
					'name' => 'terminos',
					'autoload_rte' => true,
					'lang' => false,
				),					
				
				array(
					'type' => 'textarea',
					'label' => $this->l('Tipos de daños'),
					'name' => 'danos',
					'lang' => false,
					'required' => false,
					'desc' => array(
										$this->l('Ingrese los cada uno de los tipos de daño separados por (,)'),
										$this->l('Asigne codigos a los tipos de daño siguiendo la estructura codigo:descripcion (1:Daño1,2:Daño numero dos)'),
									),
				),
				
				array(
					'type' => 'text',
					'label' => $this->l('Numero de imagenes'),
					'name' => 'nimages',
					'lang' => false,
					'required' => false,
					'desc' => $this->l('Numero de imagenes que puede cargar el usuario'),
				),				

				array(
					'type' => 'text',
					'label' => $this->l('Numero de daños'),
					'name' => 'nrdanos',
					'lang' => false,
					'required' => false,
					'desc' => $this->l('Numero de daños que puede seleccionar el usuario')
				),
			),
			'submit' => array(
				'title' => $this->l('Save'),
				'name' => 'submitConfigGarantias'
			)
		);
		
		$this->tpl_form_vars['token'] = $this->token;
		$this->tpl_form_vars['PS_ALLOW_ACCENTED_CHARS_URL'] = (int)Configuration::get('PS_ALLOW_ACCENTED_CHARS_URL');
		$this->tpl_form_vars['ps_force_friendly_product'] = Configuration::get('PS_FORCE_FRIENDLY_PRODUCT');
		
		$this->fields_value['nrdanos'] = Configuration::get('confgaran_nrdanos');
		$this->fields_value['nimages'] = Configuration::get('confgaran_nimages');
		$this->fields_value['danos'] = Configuration::get('confgaran_danos');
		$this->fields_value['terminos'] = Configuration::get('confgaran_terminos');
		
		/*
		//$image = ImageManager::thumbnail(_PS_IMG_DIR_.'lookbook/'.$obj->id.'.jpg', $this->table.'_'.(int)$obj->id.'.'.$this->imageType, 350, $this->imageType, true);
		$image = ImageManager::thumbnail($this->upload.$obj->id.'.jpg', $this->table.'_'.(int)$obj->id.'.'.$this->imageType, 350, $this->imageType, true);
		$this->fields_value['image'] = array(
			'image' => $image ? $image : false,
			'size' => $image ? filesize($this->upload.$obj->id.'.jpg') / 1024 : false
		);
		//$image2 = ImageManager::thumbnail($this->upload.$obj->id.'-home.jpg', $this->table.'_'.(int)$obj->id.'-home.'.$this->imageType, 350, $this->imageType, true);
		$this->fields_value['image2'] = array(
			'image' => $this->upload.$obj->id.'-home.jpg',
			'size' => $image2 ? filesize($this->upload.$obj->id.'-home.jpg') / 1024 : false
		);	
		*/
		
		return parent::renderForm(); 
	}

}
