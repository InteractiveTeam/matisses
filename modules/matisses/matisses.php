<?php
class matisses extends Module
{
	
	private $_uploadfile = 'matisses';
	
	public function __construct()
	{
		$this->name 			= basename(__FILE__,'.php');
		$this->tab 				= 'administration';
		$this->version 			= '1.0'; 
		$this->author 			= 'Arkix';
		$this->token 			= Tools::getAdminTokenLite('AdminModules');
		parent::__construct();
		$this->displayName 		= $this->l('Matisses');
		$this->description 		= $this->l('Instalador componentes matisses');
		$this->_module 			= $this->name;
		$this->confirmUninstall = $this->l('Si desinstala este modulo el sitio puede no funcionar correctamente, ¿Esta seguro de continuar?');
	}
	/***********************************************
	*	INSTALACIÓN
	***********************************************/
	public function install()
	{
		// install controllers
		$install[] = $this->__installTabs('adminMatisses','Matisses',0);
		$parent = (int)Tab::getIdFromClassName('adminMatisses');
		//$install[] = $this->__installTabs('adminWebservices','Webservices',$parent);
		$install[] = $this->__installTabs('adminHighlights','Destacados',$parent);
		//$install[] = $this->__installTabs('adminExperiencias','Experiencias',$parent);
		
		$sql = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'highlights` (
				  `id_highlight` int(11) NOT NULL AUTO_INCREMENT,
				  `active` int(1) NOT NULL,
				  PRIMARY KEY (`id_highlight`),
				  KEY `active` (`active`)
				) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;';
		
		if(!file_exists(_PS_IMG_DIR_.'highlights'))
			mkdir(_PS_IMG_DIR_.'highlights',755);
		

		
		if (!parent::install() || in_array(0,$install) || !Db::getInstance()->Execute($sql))
			return false;
		return true;
	}
	
	private function __installTabs($class_name,$name,$parent=0,$page=NULL,$title=NULL,$description=NULL, $url_rewrite=NULL)
	{
		try{
			$tab = new Tab();
			$tab->active = 1;
			$tab->class_name = $class_name;
			$tab->name = array();
			foreach (Language::getLanguages(true) as $lang)
				$tab->name[$lang['id_lang']] = $name;
				
			$tab->id_parent = $parent;
			$tab->module 	= $this->name;
			$tab->add(); 
			if($page && $title)
			{
				$meta = new Meta();
				$meta->page 		= $page;
				$meta->title 		= $title;
				
				if($description)
					$meta->description	= $description;
					
				if($url_rewrite)
				$meta->url_rewrite	= Tools::link_rewrite($url_rewrite);
				$meta->add(); 
				
			}
			return true;
			
		}catch (Exception $e) {
			return false;
		}
		
	}
	/***********************************************
	*	INSTALACIÓN
	***********************************************/	
	public function uninstall()
	{
		
		$uninstall[] = $this->__uninstallTabs('adminExperiencias');
		$uninstall[] = $this->__uninstallTabs('adminDestacados');
		$uninstall[] = $this->__uninstallTabs('adminWebservices');
		$uninstall[] = $this->__uninstallTabs('adminMatisses');
		
		
		$sql = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'highlights`;';
		
		if(file_exists(_PS_IMG_DIR_.'highlights'))
			Tools::deleteDirectory(_PS_IMG_DIR_.'highlights');

		
		if (!parent::uninstall() || in_array(0,$uninstall) || !Db::getInstance()->Execute($sql))
			return false;
		return true;
	}
	
	public function __uninstallTabs($class_name)
	{
		try{
			$id_tab = (int)Tab::getIdFromClassName($class_name);
			if ($id_tab)
			{
				$tab = new Tab($id_tab);
				$tab->delete();
			}
			return true;
		}catch (Exception $e) {
			return false;
		}
	}
	
}	
?>