<?php
	class Danos extends ObjectModel
	{ 
		public $id;
		public $id_feature;
		public $mcodigo;
		public $acodigo;
		public $aname;
	
		protected static $_links = array();
	
		
		public static $definition = array(
			'table' => 'tipo_danos',
			'primary' => 'id_tipo',
			'multilang' => false,
			'multilang_shop' => false,
			'fields' => array(
				'id_feature' => 	   array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
				'mcodigo' 	 => 	   array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
				'acodigo' 	 => 	   array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
				'aname' => 		array('type' => self::TYPE_STRING,'validate' => 'isGenericName', 'size' => 128),
			),
		);		
		
		
		
		public function __construct($id_tipo = null)
		{
			parent::__construct($id_tipo);
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
			if ((int)$this->id_tipo === 0)
				return false;

			return parent::delete();
		}
		
	}
?>