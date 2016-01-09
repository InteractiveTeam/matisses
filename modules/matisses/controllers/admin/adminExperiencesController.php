<?php
include_once(dirname(__FILE__).'/../../classes/Experiences.php');

class AdminExperiencesController extends ModuleAdminController
{
	public $_html = NULL;
	
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
		$this->token 			= Tools::getAdminTokenLite('adminExperiences');
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
	   $this->addCSS(_MODULE_DIR_.'/matisses/css/experiences/experiences.css');
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
			if($this->display=='add')
			{
				if(!$_FILES['image']['name'] || mb_strtolower(pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION)) != 'jpg' )
					$this->errors[] = Tools::displayError('Seleccione una imagen interactiva formato jpg');
					
				if(!$_FILES['image2']['name'] || mb_strtolower(pathinfo($_FILES['image2']['name'], PATHINFO_EXTENSION)) != 'jpg' )
					$this->errors[] = Tools::displayError('Seleccione una imagen home formato jpg');	
			}
			
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
			'desc' => $this->l('Crear experiencia', null, null, false),
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
		$this->addRowAction('edit');
		$this->addRowAction('delete');
		
		return parent::renderList();
	}
	
	protected function postImage($id)
	{
		if(!file_exists($this->upload))
			mkdir($this->upload,0755);

		$ret = parent::postImage($id);
		if (($id_experiencia = (int)Tools::getValue('id_experience')) &&
			isset($_FILES) && count($_FILES) && $_FILES['image']['name'] != null &&
		file_exists($this->upload.$id_experiencia.'.jpg'))
		{
			$images_types = ImageType::getImagesTypes('categories');
			foreach ($images_types as $k => $image_type)
			{
				ImageManager::resize(
					$this->upload.$id_experiencia.'.jpg',
					$this->upload.$id_experiencia.'-'.stripslashes($image_type['name']).'.jpg',
					(int)$image_type['width'], (int)$image_type['height']
				);
			}
		}
		
		
		if($_FILES['image2']['tmp_name'])
		{
			if(file_exists($this->upload.$id_experiencia.'-home.jpg'))
				unlink($this->upload.$id_experiencia.'-home.jpg');
				
			move_uploaded_file($_FILES['image2']['tmp_name'],$this->upload.$id_experiencia.'-home.jpg');	
			
			if(file_exists($this->upload.$id_experiencia.'-home.jpg'))
			{
				$images_types = ImageType::getImagesTypes('experiences-home');
				foreach ($images_types as $k => $image_type)
				{
					ImageManager::resize(
						$this->upload.$id_experiencia.'-home.jpg',
						$this->upload.$id_experiencia.'-home.jpg',
						(int)$image_type['width'], (int)$image_type['height']
					);
				}
			}		
		}
		
		
		if($_FILES['image3']['tmp_name'])
		{
			if(file_exists($this->upload.$id_experiencia.'-slider.jpg'))
				unlink($this->upload.$id_experiencia.'-slider.jpg');
				
			move_uploaded_file($_FILES['image3']['tmp_name'],$this->upload.$id_experiencia.'-slider.jpg');	
			
			if(file_exists($this->upload.$id_experiencia.'-slider.jpg'))
			{
				$images_types = ImageType::getImagesTypes('experiences-home');
				foreach ($images_types as $k => $image_type)
				{
					ImageManager::resize(
						$this->upload.$id_experiencia.'-slider.jpg',
						$this->upload.$id_experiencia.'-slider.jpg',
						(int)$image_type['width'], (int)$image_type['height']
					);
				}
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
		$obj = $this->loadObject(true);
		$image = $this->upload.$obj->id.'.jpg';
		$image_url = ImageManager::thumbnail($image, $this->table.'_'.(int)$obj->id.'.'.$this->imageType, 800,$this->imageType, true, true);
		$image_size = file_exists($image) ? filesize($image) / 1000 : false;
		
		
		$image2 = $this->upload.$obj->id.'-home.jpg';
		$image_url2 = ImageManager::thumbnail($image2, $this->table.'_'.(int)$obj->id.'-home.'.$this->imageType, 150,$this->imageType, true, true);
		$image_size2 = file_exists($image2) ? filesize($image2) / 1000 : false;
		
		$image3 = $this->upload.$obj->id.'-slider.jpg';
		$image_url3 = ImageManager::thumbnail($image3, $this->table.'_'.(int)$obj->id.'-slider.'.$this->imageType, 150,$this->imageType, true, true);
		$image_size3 = file_exists($image3) ? filesize($image3) / 1000 : false;
		

		$this->fields_form = array(
			'tinymce' => true,
			'legend' => array(
				'title' => $this->display=='add' ? $this->l('Nueva Experiencia') : $this->l('Editar Experiencia'),
				'icon' => 'icon-tags',
				'hint' => 'selecciona la image'
			),
			'input' => array(

				array(
					'type' => 'text',
					'label' => $this->l('Título'),
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
					'type' => 'file',
					'label' => $this->l('Imagen interactiva'),
					'name' => 'image',
					'required' => true,
					'hint' => $this->l('Selecione una imagen formato jpg:'),
					'display_image' => true,
					'class'		=> 'experiences-pointer',
					'image' => $image_url ? $image_url : false,
				),
				
				array(
					'type' => 'file',
					'label' => $this->l('Imagen home'),
					'name' => 'image2',
					'required' => true,
					'hint' => $this->l('Selecione una imagen formato jpg:'),
					'display_image' => true,
					'image' => $image_url2 ? $image_url2 : false,
				),						
				
				array(
					'type' => 'file',
					'label' => $this->l('Imagen slider'),
					'name' => 'image3',
					'required' => true,
					'hint' => $this->l('Selecione una imagen formato jpg:'),
					'display_image' => true,
					'image' => $image_url3 ? $image_url3 : false,
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
					'type' => 'hidden',
					'label' => $this->l('configuracion'),
					'name' => 'products',
					'lang' => false,
					'required' => true,
					'class'	=> 'experience_product',
					'hint' => $this->l('Only letters, numbers, underscore (_) and the minus (-) character are allowed.')
				),
								
				array(
					'type' => 'switch',
					'label' => $this->l('Estado'),
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
				
				array(
					'type' => 'select',
					'label' => $this->l('Experiencia principal'),
					'name' => 'parent',
					'lang' => false,
					'required' => false,
					'options' => array(
						'query' => Db::getInstance()->ExecuteS('select 	id_experience, name from '._DB_PREFIX_.'experiences_lang WHERE id_experience != "'.Tools::getvalue('id_experience').'" '),
						'id' => '	id_experience',
						'name' => 'name',
					),
                           
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
		//$image2 = ImageManager::thumbnail($this->upload.$obj->id.'-home.jpg', $this->table.'_'.(int)$obj->id.'-home.'.$this->imageType, 350, $this->imageType, true);
		$this->fields_value['image2'] = array(
			'image' => $this->upload.$obj->id.'-home.jpg',
			'size' => $image2 ? filesize($this->upload.$obj->id.'-home.jpg') / 1024 : false
		);	
		
		$this->fields_value['image3'] = array(
			'image' => $this->upload.$obj->id.'-slider.jpg',
			'size' => $image3 ? filesize($this->upload.$obj->id.'-slider.jpg') / 1024 : false
		);	
		
	return parent::renderForm(); 
	}
	
	
	public function ajaxProcessexperienceAssociations()
	{
		$this->context->smarty->assign(array(
											'left' => $_REQUEST['left'],
											'top' => $_REQUEST['top'],	
											'poid' => $_REQUEST['poid'],	
											 ));											 
		$this->context->smarty->display(dirname(__FILE__).'/../../views/templates/admin/experiences_products.tpl');
	}
	
	
	public function ajaxProcessexperienceAddProduct()
	{
		if(!$_REQUEST['data']['product'])
			$this->errors[] = Module::displayError('Add a valid product');
			
		if(!$_REQUEST['data']['left'])
			$this->errors[] = Module::displayError('Add a valid product');	
			
		if(!$_REQUEST['data']['top'] || $_REQUEST['data']['top']<0 || $_REQUEST['data']['top']>100)
			$this->errors[] = Module::displayError('Add a valid top coordinate');		
		
		if(!$_REQUEST['data']['left'] || $_REQUEST['data']['left']<0 || $_REQUEST['data']['left']>100)
			$this->errors[] = Module::displayError('Add a valid left coordinate');	
		
		if(!$_REQUEST['data']['market'])
			$this->errors[] = Module::displayError('Choose a market');
			
		if($_REQUEST['data']['product'])
		{
			$sql = "SELECT
						*
					FROM "._DB_PREFIX_."product as a 
						INNER JOIN "._DB_PREFIX_."product_attribute as b
					on a.id_product = b.id_product
					WHERE a.reference = '".$_REQUEST['data']['product']."'
						or b.reference = '".$_REQUEST['data']['product']."'
						or a.id_product = '".$_REQUEST['data']['product']."' 	
					";
			$product = Db::getInstance()->getRow($sql);
			//print_r($product);
			if($product)
			{
				$poid = $_REQUEST['data']['poid'];
				$response[$poid]['product'] 		= $product;
				$response[$poid]['left'] 			= $_REQUEST['data']['left'];
				$response[$poid]['top'] 			= $_REQUEST['data']['top']; 
				$response[$poid]['market'] 			= $_REQUEST['data']['market']; 	
				$response[$poid]['status'] 			= $_REQUEST['data']['status']; 	
					
				if($_REQUEST['data']['pointers'])
					$pointers = json_decode($_REQUEST['data']['pointers'],true);	
		
				$key = sizeof($pointers);

				$pointers[$key]['market'] 		= $response[$poid]['market'];
				$pointers[$key]['left'] 		= $response[$poid]['left'];
				$pointers[$key]['top'] 			= $response[$poid]['top'];
				$pointers[$key]['id_product'] 	= $product['id_product'];
				$pointers[$key]['id_product_attribute'] 	= $product['id_product_attribute'];
				$pointers[$key]['id_product_attribute'] 	= $product['id_product_attribute'];
				$pointers[$key]['status'] 		= $_REQUEST['data']['status'];

				$response['pointer'] = '<div class="experience-pointer '.$response[$poid]['market'].'" style="left:'.$response[$poid]['left'].'%; top:'.$response[$poid]['top'].'%;"></div>';	 
				$response['configurations'] = json_encode($pointers);	 
				$response['update'] = $response;
			}else{
					$this->errors[] = Module::displayError('The product does not exists');
				 }
			
		}
			
			
		if(sizeof($this->errors)==0)
		{
			$response['haserror'] = false; 

		}else{
				 $response['haserror'] 	= true;
				 $response['message']	= '<div class="error">'.implode('',$this->errors).'</div>';
			 }
		
		die(Tools::jsonEncode($response));
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
