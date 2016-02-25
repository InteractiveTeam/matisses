<?php

class ListProductBondModel extends ObjectModel
{
	public $id_list;
	public $id_product;
	public $id_bond;
	public $option;
	public $group;
    public $bought;
	public $favorite;
	public $message;
	public $created_at;
	public $updated_at;

	public static $definition = array(
		'table' => 'list_product_bond',
		'primary' => 'id',
		'fields' => array(
			'id_list' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
			'id_product' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
			'id_bond' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
			'option' => array('type' => self::TYPE_STRING, 'required' => true),
			'group' => array('type' => self::TYPE_STRING, 'required' => true, 'size' => 70),
			'favorite' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'bought' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'), 
			'message' => array('type' => self::TYPE_STRING),
			'created_at' => array('type' => self::TYPE_DATE),
			'updated_at' => array('type' => self::TYPE_DATE)
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

	public function deleteProduct($id_list,$id_product){
		$sql = "DELETE FROM `"._DB_PREFIX_."list_product_bond` WHERE id_list = ".$id_list." AND id_product ="
				.$id_product;
		if(!Db::getInstance()->execute($sql))
			return false;
		return true;
	}

	/**
	 * @param int $id
	 * @return array of products associated in a list
	 */
	public function getProductsByList($id){
		 $sql = "SELECT * FROM "._DB_PREFIX_."list_product_bond WHERE id_list = ".$id." AND id_product <> 0 AND bought = 0";
		 $res  = Db::getInstance()->executeS($sql);
		 $prod = array();
		 $link = new LinkCore();
		 foreach ($res as $row){
		 		$my_prod = new ProductCore($row['id_product']);
		 		$images = Image::getImages(1, $row['id_product']);
				$prod[] = [
					'id' => $row['id_product'],
					'name' => $my_prod->getProductName($my_prod->id),
					'data' => $my_prod->getAttributeCombinations(1),
					'image' =>  $link->getImageLink($my_prod->link_rewrite[1], (int)$images[0]['id_image'], 'home_default'),
					'price' => $my_prod->getPrice(),
					'group' => $row['group'],
					'options' => Tools::jsonDecode($row['option'])
				];
		 }
		 return $prod;
	}

	public function getBondsByList($id)
	{
		$sql = "SELECT * FROM "._DB_PREFIX_."list_product_bond WHERE id_list = ".$id." AND id_bond <> 0";
		$res  = Db::getInstance()->executeS($sql);
		$bonds = array();
        $info = array(
            'total' => 0,
            'total_qty' => 0
        );
		foreach ($res as $row){
			$bond = new BondModel($row['id_bond']);
			$info['total'] += $bond->value;
            $info['total_qty']++;
		}
		return $info;
	}

	/**
	 * @param int $id
	 * @return string of product image uri|boolean
	 */
	private function _productImage($id){
		$id_image = Product::getCover($id);
		// get Image by id
		if (sizeof($id_image) > 0) {
			$image = new Image($id_image['id_image']);
			return _PS_PROD_IMG_DIR_.Image::getImgFolderStatic($image->id_image).$image->id_image.".jpg";
		}
		return false;
	}
    
    public static function getByProductAndList($id_prod,$id_list){
        $sql = "SELECT * FROM ". _DB_PREFIX_ ."list_product_bond WHERE id_list = ".$id_list." AND id_product = ".$id_prod;
        return Db::getInstance()->getRow($sql);
    }
}
