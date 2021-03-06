<?php

class ListProductBondModel extends ObjectModel
{
	public $id_list;
	public $id_product;
	public $id_bond;
	public $option;
	public $cant;
	public $missing;
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
			'cant' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
			'missing' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
			'option' => array('type' => self::TYPE_STRING, 'required' => true),
			'group' => array('type' => self::TYPE_STRING,'size' => 70),
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

	public function deleteProduct($id_list,$id_product,$id_att){
		$sql = "SELECT * FROM `"._DB_PREFIX_."list_product_bond` WHERE id_list = ".$id_list." AND id_product = ".$id_product;
		$prod = Db::getInstance()->executeS($sql);
        $deleted = false;
        foreach($prod as $row){
            $op = Tools::jsonDecode($row['option']);
            if($op[3]->value == $id_att){
                Db::getInstance()->delete('list_product_bond','id = '. $row['id'],1);
                $deleted = true;
                break;
            }
        }
        return $deleted;
	}

	/**
	 * @param int $id
	 * @return array of products associated in a list
	 */
	public function getProductsByList($id){
         $context = Context::getContext();
		 $sql = "SELECT * FROM "._DB_PREFIX_."list_product_bond a INNER JOIN "._DB_PREFIX_."product b ON a.id_product = b.id_product INNER JOIN "._DB_PREFIX_."product_shop c ON a.id_product = c.id_product INNER JOIN "._DB_PREFIX_."stock_available d ON a.id_product = d.id_product WHERE id_list = ".$id." AND a.id_product <> 0 AND bought = 0 AND b.active = 1 AND c.active = 1  AND d.quantity > 0 GROUP BY a.id ORDER BY favorite";
         $res  = Db::getInstance()->executeS($sql);
		 $prod = array();
		 $link = new LinkCore();
		 foreach ($res as $row){
            $option = Tools::jsonDecode($row['option']);
            $image = ProductCore::getCombinationImageById( (int)$option[3]->value, $context->language->id);
            $my_prod = new ProductCore($row['id_product']);
            $images = Image::getImages(1, $row['id_product']);
            $sPrice = Db::getInstance()->getValue("SELECT price FROM `"._DB_PREFIX_."specific_price` WHERE `id_product` = ".$row['id_product']." AND`id_product_attribute` = ".(int)$option[3]->value);
            $price = ($sPrice == 0 ? $my_prod->getPrice() : $sPrice);
            if($row['group']){
                $price = $price * $row['cant'];
            }
            $prod[] = [
                'id_lpd' => $row['id'],
                'id' => $row['id_product'],
                'id_att' => $option[3]->value,
                'name' => $my_prod->getProductName($my_prod->id),
                'image' =>  (Configuration::get('PS_SSL_ENABLED') ? 'https://' : 'http://').$link->getImageLink($my_prod->link_rewrite[1], (isset($image[0]['id_image']) ? $image[0]['id_image'] : $image['id_image']), 'home_default'),
                'price' => $price,
                'cant' => $row['cant'],
                'missing' => $row['missing'],
                'options' => $my_prod->getAttributeCombinationsById($option[3]->value,1),//[3] = id_attribute,
                'favorite' => $row['favorite'],
                'group' => ($row['group'] ? true : false)
            ];
		 }
		 //echo "<pre>"; print_r($my_prod);echo "</pre>";die();
		 return $prod;
	}
    
    public function getProductsForMail($listId){
        $link = new LinkCore();
        $groupP = "SELECT * FROM `"._DB_PREFIX_."list_product_bond` WHERE id_list = ".$listId." AND `group` = 1";
        $res = Db::getInstance()->executeS($groupP);
        $prod = array();
        foreach($res as $row){
            $option = Tools::jsonDecode($row['option']);
            $image = ProductCore::getCombinationImageById( (int)$option[3]->value, Context::getContext()->language->id);
            $my_prod = new ProductCore($row['id_product']);
            $images = Image::getImages(1, $row['id_product']);
            $prod[$row['id_product']] = array(
                'id' => $row['id_product'],
                'id_att' => $option[3]->value,
                'name' => $my_prod->getProductName($my_prod->id),
                'options' => $my_prod->getAttributeCombinationsById($option[3]->value,1),//[3] = id_attribute,
                'image' =>  (Configuration::get('PS_SSL_ENABLED') ? 'https://' : 'http://').$link->getImageLink($my_prod->link_rewrite[1], (isset($image[0]['id_image']) ? $image[0]['id_image'] : $image['id_image']), 'home_default'),
                'price' => Tools::displayPrice(Db::getInstance()->getValue('SELECT price FROM '._DB_PREFIX_.'specific_price WHERE id_product = '.$row['id_product'] . ' AND id_product_attribute = '.$option[3]->value),1),
                'cant' => $prod[$row['id_product']]['cant'] + $row['cant'],
                'missing' => (!$row['bought'] ? $prod[$row['id_product']]['missing'] + $row['cant'] :$prod[$row['id_product']]['missing']),
            );
        }
        unset($res);
        $groupP = "SELECT * FROM `"._DB_PREFIX_."list_product_bond` WHERE id_list = ".$listId." AND `group` = 0 AND bought = 0";
        $res = Db::getInstance()->executeS($groupP);
        foreach($res as $row){
            $option = Tools::jsonDecode($row['option']);
            $image = ProductCore::getCombinationImageById( (int)$option[3]->value, Context::getContext()->language->id);
            $my_prod = new ProductCore($row['id_product']);
            $images = Image::getImages(1, $row['id_product']);
            $prod[$row['id_product']] = array(
                'id' => $row['id_product'],
                'id_att' => $option[3]->value,
                'name' => $my_prod->getProductName($my_prod->id),
                'options' => $my_prod->getAttributeCombinationsById($option[3]->value,1),//[3] = id_attribute,
                'image' =>  (Configuration::get('PS_SSL_ENABLED') ? 'https://' : 'http://').$link->getImageLink($my_prod->link_rewrite[1], (isset($image[0]['id_image']) ? $image[0]['id_image'] : $image['id_image']), 'home_default'),
                'price' =>Tools::displayPrice(Db::getInstance()->getValue('SELECT price FROM '._DB_PREFIX_.'specific_price WHERE id_product = '.$row['id_product'] . ' AND id_product_attribute = '.$option[3]->value),1),
                'cant' => $row['cant'],
                'missing' => $row['missing'],
            );
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
    
    public static function getByProductAndList($id_product,$id_list,$id_att,$id_lpd){
        $sql = "SELECT * FROM ". _DB_PREFIX_ ."list_product_bond WHERE id_list = ".$id_list." AND id_product = ".$id_product;
        $prod = [];
        $products = Db::getInstance()->executeS($sql);
        $sqlCant = "SELECT cant FROM ". _DB_PREFIX_ ."list_product_bond WHERE id = ".$id_lpd;
        $cantP = Db::getInstance()->getValue($sqlCant);
        foreach($products as $row){
            $op = Tools::jsonDecode($row['option']);
            if($op[3]->value == $id_att){
                $prod['total'] += $row['cant'];
                $prod['bought'] += $row['bought'] ? $row['cant'] : 0;
                $prod['missing'] +=$row['bought'] ? 0 : $row['cant'];
                $prod['option'] = $op;
                $prod['cant'] = $cantP;
                $prod['group'] = true;
                $prod['message'] = $row['message'];
            }
        }
        return $prod;
    }
    
    public static function getByProductAndListNotAgroup($id_prod,$id_list,$id_att = 0){
        $totalCant = "SELECT `cant`,`missing`,`option`,`message` FROM `"._DB_PREFIX_."list_product_bond` WHERE `id_list`= ".$id_list." AND `id_product` = ".$id_prod." AND `group` = 0";
        $totalCant = Db::getInstance()->executeS($totalCant);
        foreach($totalCant as $row)
        {
            $prod['option'] = Tools::jsonDecode($row['option']);
            if($prod['option'][3]->value == $id_att){
                $prod['total'] = $row['cant'];
                $prod['bought'] = $row['cant'] - $row['missing'];
                $prod['missing'] = $row['missing'];
                $prod['message'] = $row['message'];
                return $prod;
            }
        }
    }
}
