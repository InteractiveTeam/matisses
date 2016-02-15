<?php

class EventTypeModel extends ObjectModel
{
	public $id;
	public $name;
	public static $definition = array(
		'table' => 'event_type',
		'primary' => 'id',
		'fields' => array(
			'id' => array('type' => self::TYPE_INT),
			'name' => array('type' => self::TYPE_STRING, 'required' => true)
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