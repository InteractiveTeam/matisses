<?php

class BondModel extends ObjectModel
{
	public $bought;
	public $id_list;
	public $value;
	public $luxury_bond;
	public $message;
	public $created_at;
	public $updated_at;

	public static $definition = array(
		'table' => 'bond',
		'primary' => 'id',
		'fields' => array(
			'value'       => array('type' => self::TYPE_INT),
			'id_list'     => array('type' => self::TYPE_INT),
			'luxury_bond' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
			'bought'      => array('type' => self::TYPE_BOOL),
			'message'     => array('type' => self::TYPE_STRING),
			'created_at'  => array('type' => self::TYPE_DATE),
			'updated_at'  => array('type' => self::TYPE_DATE)
		)
	);

	public function __construct($id = null) {
		parent::__construct($id);
	}

	public function add($autodate = true, $null_values = false) {
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
		if ((int)$this->id === 0)
			return false;
		return parent::delete();
	}
}
