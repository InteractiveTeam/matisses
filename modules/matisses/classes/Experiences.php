<?php
	class Experiences extends ObjectModel
	{
		public $id;
		public $id_experience;
		public $active = 1; 
		
		public static $definition = array(
			'table' 	=> 'experiences',
			'primary' 	=> 'id_experience',
			'multilang' => false, 
			'multilang_shop' => false,
			'fields' => array(
				'active' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool', 'required' => true),
			),
		);
		
		public function __construct($id_experience = null)
		{
			parent::__construct();
			$this->id_image = ($this->id && file_exists(_PS_IMG_DIR_.'experiences/'.(int)$this->id.'.jpg')) ? (int)$this->id : false;
			$this->image_dir = _PS_IMG_DIR_.'experiences/';
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
			if ((int)$this->id_highlight === 0)
				return false;
			
			$this->deleteImage();
			return parent::delete();
		}
		
	}
?>