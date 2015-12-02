<?php
	class Highlights extends ObjectModel
	{
		public $id;
		public $id_highlight;
		public $active = 1; 
		
		public static $definition = array(
			'table' 	=> 'highlights',
			'primary' 	=> 'id_highlight',
			'multilang' => false, 
			'multilang_shop' => false,
			'fields' => array(
				'active' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool', 'required' => true),
			),
		);
		
		public function __construct($id_highlight = null)
		{
			parent::__construct();
			$this->id_image = ($this->id && file_exists(_PS_IMG_DIR_.'highlights/'.(int)$this->id.'.jpg')) ? (int)$this->id : false;
			$this->image_dir = _PS_IMG_DIR_.'highlights/';
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