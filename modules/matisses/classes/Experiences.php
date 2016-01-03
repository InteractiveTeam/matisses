<?php
	class Experiences extends ObjectModel
	{
		public $id;
		public $id_experience;
		public $name;
		public $active = 1;
		public $position;
		public $description;
		public $products;
		public $link_rewrite;
		public $meta_title;
		public $meta_keywords;
		public $meta_description;
		public $id_shop_default;
	
		protected static $_links = array();
	
		
		public static $definition = array(
			'table' => 'experiences',
			'primary' => 'id_experience',
			'multilang' => true,
			'multilang_shop' => true,
			'fields' => array(
				'active' => 			array('type' => self::TYPE_BOOL, 'validate' => 'isBool', 'required' => true),
				'id_shop_default' => 	array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
				'position' => 			array('type' => self::TYPE_INT),
				'products' => 			array('type' => self::TYPE_HTML),
				// Lang fields
				'name' => 				array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isCatalogName', 'required' => true, 'size' => 128),
				'link_rewrite' => 		array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isLinkRewrite', 'required' => true, 'size' => 128),
				'description' => 		array('type' => self::TYPE_HTML, 'lang' => true, 'validate' => 'isCleanHtml', 'required' => true),
				'meta_title' => 		array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isGenericName', 'size' => 128),
				'meta_description' => 	array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isGenericName', 'size' => 255),
				'meta_keywords' => 		array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isGenericName', 'size' => 255),
			),
		);		
		
		
		
		public function __construct($id_experience = null, $id_lang = null, $id_shop = null)
		{
			parent::__construct($id_experience, $id_lang, $id_shop);
			$this->id_image = ($this->id && file_exists(_PS_IMG_DIR_.'experiences/'.(int)$this->id.'.jpg')) ? (int)$this->id : false;
			$this->image_dir = _PS_IMG_DIR_.'experiences/';
		}
		
		public function getPointers($id_experience)
		{
			return Db::getInstance()->getValue('SELECT products FROM '._DB_PREFIX_.'experiences WHERE id_experience = "'.$id_experience.'" ');
		}
		
		public function add($autodate = true, $null_values = false)
		{
			$ret = parent::add($autodate, $null_values);
			return $ret;
		}
		
		public function update($null_values = false)
		{
			$ret = parent::update($null_values);
			return $ret;
		}
		
		public function delete()
		{
			if ((int)$this->id_experience === 0)
				return false;
			
			$this->deleteImage();
			return parent::delete();
		}
		
	}
?>