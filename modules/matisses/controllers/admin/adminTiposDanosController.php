<?php
include_once(dirname(__FILE__).'/../../classes/Danos.php');

class AdminTiposDanosController extends ModuleAdminController
{
	public $_html = NULL;
	public $cmaterial = NULL;
	
	public function __construct()
	{
		$this->bootstrap 	= true;
		$this->table 		= 'feature';
		$this->className 	= 'Danos';
		$this->lang 		= true;
		$this->deleted 		= false;
		$this->explicitSelect 	= true;
		$this->_defaultOrderBy 	= 'id_feature';
		$this->allow_export 	= false;
		$this->cmaterial		= Db::getInstance()->GetValue('
						SELECT mcodigo
						FROM '._DB_PREFIX_.'tipo_danos 
						WHERE id_feature = "'.$value['id_feature'].'"	
					');
		$this->token 			= Tools::getAdminTokenLite(Tools::getValue('controller')).(Tools::getValue('id_feature') ? '&id_feature='.Tools::getValue('id_feature') : NULL);
		$this->context = Context::getContext();


		if(array_key_exists('viewfeature',$_GET))	
		{
			$this->display = 'view';
			$this->table   = 'tipo_danos';
            $this->identifier	= 'id_tipo';
			$this->lang    = false;
			$this->_defaultOrderBy 	= 'id_tipo';
		}

		if(array_key_exists('addtipo_danos',$_GET))
		{
			$this->display = 'add';
			$this->table   = 'tipo_danos';
            $this->identifier	= 'id_tipo';
			$this->lang    = false;
			$this->_defaultOrderBy 	= 'id_tipo';
		}
		
		if(array_key_exists('addtipo_danosroot',$_GET))
		{
			$this->display = 'add';
			$this->table   = 'tipo_danos';
            $this->identifier	= 'id_tipo';
			$this->lang    = false;
			$this->_defaultOrderBy 	= 'id_tipo';
		}
		
		if(array_key_exists('updatetipo_danos',$_GET))
		{
			$this->display = 'edit';
			$this->table   = 'tipo_danos';
            $this->identifier	= 'id_tipo';
			$this->lang    = false;
			$this->_defaultOrderBy 	= 'id_tipo';
		}
		
		
		
		//$RESULT = Db::getInstance()->executeS('SELECT * FROM '._DB_PREFIX_.'tipo_danos');
		//echo "<br><br><br><br><br><br><br><br><br><pre>"; print_r($RESULT); echo "</pre>";
		
		Db::getInstance()->execute('
		
			CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'tipo_danos` (
			  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
			  `id_feature` int(11) NOT NULL,
			  `mcodigo` int(5) NOT NULL,
			  `acodigo` int(5) NOT NULL,
			  `aname` varchar(100) NOT NULL,
			  PRIMARY KEY (`id_tipo`),
			  KEY `id_feature` (`id_feature`,`mcodigo`,`acodigo`)
			) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
		');
        
		$this->_select = '
            (SELECT REPLACE(name, "material_", "") FROM '._DB_PREFIX_.'feature_lang where a.id_feature = id_feature) as codigo_name            
        ';

		$this->fields_list = array(
			'id_feature' => array(
				'title' => $this->l('ID'),
				'align' => 'center',
				'class' => 'fixed-width-xs'
			),
			'codigo_name' => array(
				'title' => $this->l('Código material'),
				'lang' => true,
				'filter_key' => 'b!name',
				'filter' => false,
                'class' => 'fixed-width-xs',
				'align' => 'center',
			),
			'name' => array(
				'title' => $this->l('Material'),
				'lang' => true,
				'filter' => false,
			),
		);
		
		
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
	
	public function renderView()
	{
		$this->initToolbar();
		return $this->renderList();
	}	
	
	
	
	
	public function initToolbar()
	{
		if($this->display == 'view' && Tools::getValue('id_feature'))
		{
			$this->table 		= 'tipo_danos';
			$this->lang 		= false;		
			$this->toolbar_btn['new'] = array(
					'href' => self::$currentIndex.'&add'.$this->table.'&token='.$this->token.'&id_feature='.Tools::getValue('id_feature'),
					'desc' => $this->l('Nueva averia')
			);
			$back = self::$currentIndex.'&token='.$this->token;
			$this->toolbar_btn['back'] = array(
					'href' => $back,
					'desc' => $this->l('Back to list')
			);
		}
		parent::initToolbar();
	}
	
	

	
	public function initProcess()
	{
		if(in_array('addtipo_danos',$_GET))
			$this->display = 'add';
			
		parent::initProcess();
	}
	
	public function postProcess()
	{
		
		if(Tools::isSubmit('submitAddAveria'))
		{
			if(!Tools::getValue('id_feature') || !Validate::isInt(Tools::getValue('id_feature')))
				$this->errors[] = Tools::displayError('Se presento un error inesperado');
				
			if(!Tools::getValue('mcodigo') || !Validate::isInt(Tools::getValue('mcodigo')))
				$this->errors[] = Tools::displayError('Debe asignar un código de material válido');	
				
			if(!Tools::getValue('acodigo') || !Validate::isInt(Tools::getValue('acodigo')))
				$this->errors[] = Tools::displayError('Debe asignar un código de averia válido');	
				
			if(!Tools::getValue('acodigo') || !Validate::isGenericName(Tools::getValue('acodigo')))
				$this->errors[] = Tools::displayError('Debe asignar una averia válida');
				
			if(Db::getInstance()->getValue('SELECT count(*) FROM '._DB_PREFIX_.'tipo_danos WHERE mcodigo="'.Tools::getValue('mcodigo').'"'))
				$this->errors[] = sprintf(Tools::displayError('El Codigo de daño %s ya se encuentra registrado'), '<b>'.Tools::getValue('mcodigo').'</b>');	
							
			
			if(sizeof($this->errors)==0)
			{
				$Danos = new Danos;			
				$Danos->id_feature = Tools::getValue('id_feature');
				$Danos->mcodigo = Tools::getValue('mcodigo');
				$Danos->acodigo = Tools::getValue('acodigo');
				$Danos->aname = Tools::getValue('aname');
				$Danos->add();
			}
		}
		//die('entre');
		return parent::postProcess();
	}
	
	public function init()
	{
		parent::init();
	}
	
	public function initPageHeaderToolbar()
	{
		if($this->display=='view')
		{
			
			$this->page_header_toolbar_title = Db::getInstance()->GetValue('
				SELECT b.value
				FROM '._DB_PREFIX_.'feature_value as a
					INNER JOIN 	'._DB_PREFIX_.'feature_value_lang as b
				ON a.id_feature_value = b.id_feature_value
				WHERE a.id_feature = "'.Tools::getValue('id_feature').'"	
			');
		}else{
				$this->page_header_toolbar_title = $this->l('Tipos de daños');
			 }
		parent::initPageHeaderToolbar();
		
		if($this->display=='view')
		{
		$this->page_header_toolbar_btn['new'] = array(
			'href' => self::$currentIndex.'&add'.$this->table.'root&token='.$this->token.'&id_feature='.Tools::getValue('id_feature'),
			'desc' => $this->l('Nueva averia', null, null, false)
		);
		}
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

	
	protected function postImage($id)
	{
		$ret = parent::postImage($id);
		return $ret;
	} 
	
	public function renderList()
	{

		if($this->display == 'view' && Tools::getValue('id_feature'))
		{
			unset($this->fields_list);
			$this->table 		= 'tipo_danos';
			$this->lang 		= false;
			$this->_defaultOrderBy 	= 'id_tipo';
			
			$this->fields_list = array(
				'id_tipo' => array(
					'title' => $this->l('ID'),
					'align' => 'center',
					'class' => 'fixed-width-xs'
				),
				'acodigo' => array(
					'title' => $this->l('Código Averia'),
					'filter' => false,
					'class' => 'fixed-width-xs'
				),
				
				'aname' => array(
					'title' => $this->l('Averia'),
					'lang' => true,
					'filter' => false,
				),
			);			
			
			$this->addRowAction('edit');
			$this->addRowAction('delete');
		}else{
				$this->addRowAction('view');
			 }
		
		
		return parent::renderList();
	}
	
	public function getList($id_lang, $order_by = null, $order_way = null, $start = 0, $limit = null, $id_lang_shop = false)
	{
		if($this->display=='view' && Tools::getValue('id_feature'))
		{
			
			$this->_list = Db::getInstance()->executeS('SELECT * 
														FROM '._DB_PREFIX_.'tipo_danos 
														WHERE id_feature = "'.Tools::getValue('id_feature').'"');
		}else{
				parent::getList($id_lang, $order_by, $order_way, $start, $limit);
				// Check each row to see if there are combinations and get the correct action in consequence
				foreach($this->_list as $k => $value)
				{
					$this->_list[$k]['name'] = Db::getInstance()->GetValue('
						SELECT b.value
						FROM '._DB_PREFIX_.'feature_value as a
							INNER JOIN 	'._DB_PREFIX_.'feature_value_lang as b
						ON a.id_feature_value = b.id_feature_value
						WHERE a.id_feature = "'.$value['id_feature'].'"	
					');
					
					$this->_list[$k]['codigo'] = $this->getMcodigo($value['id_feature']);
					$this->_list[$k]['codigo'] = $this->_list[$k]['codigo'] ? $this->_list[$k]['codigo'] : '-';
					
				}
		}
		//echo "<pre>"; print_r($this->_list); echo "</pre>";
	}
	
	private function getMcodigo($idfeature)
	{
		return Db::getInstance()->GetValue('
						SELECT mcodigo
						FROM '._DB_PREFIX_.'tipo_danos 
						WHERE id_feature = "'.pSQL($idfeature).'"	
					');
	}
	
	public function renderForm()
	{
		
		$obj = $this->loadObject(true);
		$this->cmaterial = $this->getMcodigo(Tools::getValue('id_feature'));
		
		$this->fields_form = array(
			'tinymce' => false,
			'legend' => array(
				'title' => $this->l('Configuracion Experiencias'),
				'icon' => 'icon-tags',
				'hint' => 'selecciona la image'
			),
			'input' => array(
				array(
					'type' => 'hidden',
					'label' => $this->l('id_feature'),
					'name' => 'id_feature',
					'required' => true,
				),
				
				array(
					'type' => !$this->cmaterial ? 'text' : 'hidden',
					'label' => $this->l('Código del daño'),
					'name' => 'mcodigo',
					'desc' => $this->l('Aun no se ha definido un codigo para este tipo dedaño, ingresa uno para crear la nueva averia'),
					'required' => true,
				),
				
				array(
					'type' => 'text',
					'label' => $this->l('Código averia'),
					'name' => 'acodigo',
					'required' => true,
				),
				
				array(
					'type' => 'text',
					'label' => $this->l('Averia'),
					'name' => 'aname',
					'required' => true,
				),
				
			),
			'submit' => array(
				'title' => $this->l('Save'),
				'name' => 'submitAddAveria'
			)
		);
		$this->tpl_form_vars['token'] = $this->token;
		$this->fields_value['mcodigo'] = $this->cmaterial;
		

		return parent::renderForm(); 
	}

}
