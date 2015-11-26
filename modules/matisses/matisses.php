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
		$install[] = $this->__installTabs('adminWebservices','Webservices',$parent);
		$install[] = $this->__installTabs('adminDestacados','Destacados',$parent);
		$install[] = $this->__installTabs('adminExperiencias','Experiencias',$parent);
		
		echo "<pre>"; print_r($install); echo "</pre>";
		die();
		
		if (!parent::install() || !in_array(0,$install))
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
			$tab->module = $this->name;
			
			if($page && $title)
			{
				$meta = new Meta();
				$meta->page 		= $page;
				$meta->title 		= $title;
				
				if($description)
					$meta->description	= $description;
					
				if($url_rewrite)
				$meta->url_rewrite	= Tools::link_rewrite($url_rewrite);
			}
			return true;
			
		}catch (Exception $e) {
			return false;
		}
		
	}
	
	public function uninstall()
	{
		
		$uninstall[] = $this->__uninstallTabs('adminExperiencias');
		$uninstall[] = $this->__uninstallTabs('adminDestacados');
		$uninstall[] = $this->__uninstallTabs('adminWebservices');
		$uninstall[] = $this->__uninstallTabs('adminMatisses');
		
		if (!parent::uninstall() || in_array(false,$uninstall))
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