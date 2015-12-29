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

		//Db::getInstance()->execute("UPDATE ps_category_lang SET name = 'Menu' where id_category = 2");

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
		//$install[] = $this->__installTabs('adminHighlights','Destacados',$parent);
		$install[] = $this->__installTabs('adminExperiences','Experiencias',$parent);
		
		//images types
		$install[] = $this->__installImageTypes('experiences-home',570,145);
		
		$sql = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'highlights` (
				  `id_highlight` int(11) NOT NULL AUTO_INCREMENT,
				  `active` int(1) NOT NULL,
				  PRIMARY KEY (`id_highlight`),
				  KEY `active` (`active`)
				) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
				
				CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'experiences` (
				  `id_experience` int(11) NOT NULL AUTO_INCREMENT,
				  `id_shop_default` int(2) NOT NULL,
				  `position` int(3) NOT NULL,
				  `active` int(1) NOT NULL,
				  PRIMARY KEY (`id_experience`),
				  KEY `active` (`active`),
				  KEY `position` (`position`)
				) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
				
				CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'experiences_lang` (
				  `id_experience` int(11) NOT NULL AUTO_INCREMENT,
				  `id_shop` int(2) NOT NULL,
				  `id_lang` int(3) NOT NULL,
				  `name` varchar(200) NOT NULL,
				  `description` text,
				  `link_rewrite` varchar(200),
				  `meta_title` varchar(200),
				  `meta_keywords` text,
				  `meta_description` text,
				  PRIMARY KEY (`id_experience`,`id_shop`,`id_lang`)
				) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
				
				CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'experiences_product` (
				  `id_experience` int(11) NOT NULL AUTO_INCREMENT,
				  `id_product` int(11) NOT NULL,
				  `top` int(4) NOT NULL,
				  `left` int(4) NOT NULL,
				  PRIMARY KEY (`id_experience`,`id_product`)
				) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
									
		';
		
		if(!file_exists(_PS_IMG_DIR_.'highlights'))
			mkdir(_PS_IMG_DIR_.'highlights',755);
			
		if(!file_exists(_PS_IMG_DIR_.'experiences'))
			mkdir(_PS_IMG_DIR_.'experiences',755);	
		

		
		
		if (!parent::install() || in_array(0,$install) || !Db::getInstance()->Execute($sql))
			return false;
		return true;
	}
	
	private function __installTabs($class_name,$name,$parent=0,$page=NULL,$title=NULL,$description=NULL, $url_rewrite=NULL)
	{
		try{
			$id_tab = (int)Tab::getIdFromClassName($class_name);
			if(!$id_tab)
			{
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
			}else{
					$this->__uninstallTabs($class_name);
					self::__installTabs($class_name,$name,$parent,$page,$title,$description, $url_rewrite);
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
		
		$uninstall[] = $this->__uninstallTabs('adminExperiences');
		$uninstall[] = $this->__uninstallTabs('adminDestacados');
		$uninstall[] = $this->__uninstallTabs('adminWebservices');
		$uninstall[] = $this->__uninstallTabs('adminMatisses');
		$uninstall[] = $this->__uninstallImageTypes('experiences-home');
		
		$sql = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'highlights`;
				DROP TABLE IF EXISTS `'._DB_PREFIX_.'experiences`;
				DROP TABLE IF EXISTS `'._DB_PREFIX_.'experiences_lang`;
				DROP TABLE IF EXISTS `'._DB_PREFIX_.'experiences_product`;
		';
		
		if(file_exists(_PS_IMG_DIR_.'highlights'))
			Tools::deleteDirectory(_PS_IMG_DIR_.'highlights');
			
		if(file_exists(_PS_IMG_DIR_.'experiences'))
			Tools::deleteDirectory(_PS_IMG_DIR_.'experiences');	

		
		if (!parent::uninstall() || in_array(0,$uninstall) || !Db::getInstance()->Execute($sql))
			return false;
		return true;
	}
	
	private function __installImageTypes($name,$width,$height,$p=false,$c=false,$m=false,$su=false,$sc=false,$st=false)
	{
		try{
			$ImageType = new ImageType();
			$ImageType->name 	= $name;
			$ImageType->width 	= $width;
			$ImageType->height 	= $height;
			$ImageType->products 		= $p;
			$ImageType->categories 		= $c;
			$ImageType->manufacturers 	= $m;
			$ImageType->suppliers 		= $su;
			$ImageType->scenes 			= $sc;
			$ImageType->stores 			= $st;
			$ImageType->add();
			return true;
		}catch (Exception $e) {
			return false;
		}
	}
	
	
	private function __uninstallImageTypes($name)
	{
		try{
			Db::getInstance()->Execute('DELETE FROM '._DB_PREFIX_.'image_type WHERE name="'.$name.'" ');
			return true;
		}catch (Exception $e) {
			return false;
		}
	}
	
	private function __uninstallTabs($class_name)
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