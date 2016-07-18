<?php

class CategorySapModel extends ObjectModel
{
	/** @var integer Category id */
	public $id_category;

	/** @var integer Category name */
	public $category_name;

	/** @var string Code SAP */
	public $sapcode;
	
	/**
	 * @see ObjectModel::$definition
	 */
	public static $definition = array(
		'table' => 'category_sap',
		'primary' => 'id_category',
		'fields' => array(
			'id_category' => 	array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
			'category_name' => 		array('type' => self::TYPE_STRING, 'validate' => 'isGenericName', 'required' => true, 'size' => 128),
			'sapcode' => 		array('type' => self::TYPE_STRING, 'validate' => 'isGenericName', 'required' => true, 'size' => 128)
		),
	);

	public function __construct($id_store = null, $id_lang = null)
	{
		parent::__construct($id_category);
	}
}
