<?php
class GiftListModel extends ObjectModel
{
	public $id_creator;
	public $id_cocreator;
	public $code;
	public $name;
	public $public;
	public $event_type;
	public $event_date;
	public $guest_number;
	public $url;
	public $message;
	public $image;
	public $max_amount;
	public $info_creator;
	public $info_cocreator;
	public $recieve_bond;
	public $edit;
	public $address_before;
	public $address_after;
	public $created_at;
	public $updated_at;

	public static $definition = array(
		'table' => 'gift_list',
		'primary' => 'id',
		'fields' => array(
			'id_creator' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
			'id_cocreator' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
			'code' => array('type' => self::TYPE_STRING, 'required' => true, 'size' => 11),
			'name' => array('type' => self::TYPE_STRING, 'required' => true, 'size' => 100),
			'public' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
			'event_type' => array('type' => self::TYPE_INT),
			'event_date' => array('type' => self::TYPE_DATE),
			'guest_number' => array('type' => self::TYPE_INT),
			'url' => array('type' => self::TYPE_STRING, 'size' => 100),
			'message' => array('type' => self::TYPE_STRING),
			'image' => array('type' => self::TYPE_STRING, 'size' => 255),
			'recieve_bond' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
			'max_amount' => array('type' => self::TYPE_INT),
			'info_creator' => array('type' => self::TYPE_STRING),
			'info_cocreator' => array('type' => self::TYPE_STRING),
			'edit' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
			'address_before' => array('type' => self::TYPE_STRING, 'size' => 100),
			'address_after' => array('type' => self::TYPE_STRING, 'size' => 100),
			'created_at' => array('type' => self::TYPE_DATE),
			'updated_at' => array('type' => self::TYPE_DATE)
		)
	);

	public function __construct($id = null) {
		parent::__construct($id);
		$this->id_image = ($this->id && file_exists(_PS_IMG_DIR_.'giftlists/'.(int)$this->id.'.jpg')) ? (int)$this->id : false;
		$this->image_dir = _PS_IMG_DIR_.'giftlists/';
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

	/**
	 * update cocreator info
	 * @return boolean
	 */
	public function updateInfo(){
		$sql = "UPDATE `"._DB_PREFIX_."gift_list` SET `info_cocreator` = '".$this->info_cocreator."' WHERE `id` = ".$this->id.";";
		//die($sql);
		if(!Db::getInstance()->execute($sql))
			return false;
		return true;
	}

	public function delete()
	{
		if ((int)$this->id === 0)
			return false;

		Db::getInstance()->delete('list_product_bond',"id_list = ".$this->id);
		$this->deleteImage();
		return parent::delete();
	}


	/**
	 * @param number $id
	 * @param string $edit
	 * @return string|Code
	 */
	public function returnCode($id = 0, $edit = false){
		if(!$edit){
			do {
				$code = $this->_generateCode();
				$sql = "SELECT count(code) AS cant FROM "._DB_PREFIX_."gift_list WHERE `code` = '". $code."';'";
				$cant = Db::getInstance()->executeS($sql);
			} while (!$cant && $cant[0]['cant'] > 0);
			return $code;
		}
		$sql = "SELECT code FROM "._DB_PREFIX_."gift_list WHERE `id` = ". $id;
		$res = Db::getInstance()->executeS($sql);
		return $res[0]['code'];
	}

	public function getListByCreatorId($id){
		return Db::getInstance ()->executeS ( "SELECT * FROM `" . _DB_PREFIX_ . "gift_list` WHERE `id_creator` =". $id );
	}

	public function getSharedListByCoCreatorId($id){
		return Db::getInstance ()->executeS ( "SELECT * FROM `" . _DB_PREFIX_ . "gift_list` WHERE `id_cocreator` =". $id );
	}

	public function getListById($id){
		return Db::getInstance()->getRow('SELECT * FROM '._DB_PREFIX_.'gift_list WHERE id = ' . $id);
	}

	/**
	 * @param number $length
	 * @param string $uc | UPPERCASE
	 * @param string $n | num
	 * @param string $sc | special chars
	 * generate random list code
	 * @return string|Code
	 */
	private function _generateCode($length=11,$uc=TRUE,$n=TRUE,$sc=FALSE){
		$source = 'abcdefghijklmnopqrstuvwxyz';
		if($uc==1) $source .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		if($n==1) $source .= '1234567890';
		if($sc==1) $source .= '|@#~$%()=^*+[]{}-_';
		$su = strlen($source) - 1;
		if($length>0){
			$rstr = "";
			for($i=0; $i<$length; $i++){
				$rstr .=  substr($source, rand(0, $su), 1);
			}
		}
		return $rstr;
	}

	/**
	 * @param string $text
	 * generate friendly url parameter getting the name
	 * @return string|string
	 */
	public function slugify($text){
		// replace non letter or digits by -
		$text = preg_replace('~[^\\pL\d]+~u', '-', $text);
		// trim
		$text = trim($text, '-');
		// transliterate
		$text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);
		// lowercase
		$text = strtolower($text);
		// remove unwanted characters
		$text = preg_replace('~[^-\w]+~', '', $text);
		if (empty($text))
		{
			return 'n-a';
		}
		return $text;
	}

	public function getListBySlug($url){
		$sql = "SELECT * FROM `" . _DB_PREFIX_ . "gift_list` WHERE `url` = '". $url."';";
		return Db::getInstance()->getRow($sql);
	}

	/**
	 * @param stirng $email
	 * search ig $email exist in database, if exist save id, else save 0
	 * @return number
	 */
	public function setCoCreator($email){
		$sql = "SELECT id_customer FROM `" . _DB_PREFIX_ . "customer` WHERE `email` = '". $email."';";
		$row = Db::getInstance()->getRow($sql);
		if(Db::getInstance()->numRows() > 0)
			return $row['id_customer'];
		else
			return 0;
	}

	public function searchByCode($code){
		$sql = 'SELECT url FROM '._DB_PREFIX_.'gift_list WHERE code = "'.$code.'";';
		return Db::getInstance()->getRow($sql);
	}

	public function searchByCustomerNames($firstname,$lastname){
		$return = false;
		$sql = "SELECT id_customer FROM "._DB_PREFIX_.'customer WHERE
				firstname LIKE "%'.$firstname.'%" and lastname LIKE "%'.$lastname.'%";';
		$res = Db::getInstance()->getRow($sql);
		if(count($res) > 0){
			$sql = "SELECT * FROM "._DB_PREFIX_.'gift_list WHERE id_creator = '. $res['id_customer']
			.' or id_cocreator = '. $res['id_customer'];
			$return =  Db::getInstance()->executeS($sql);
		}
		return $return;
	}
    
    public function getCreator(){
        return new CustomerCore($this->id_creator);
    }
    
    public function getCartProductsByList($id){
        $sql = "SELECT * FROM "._DB_PREFIX."cart_product WHERE id_giftlist = ".$id;
        return Db::getInstance()-executeS($sql);
    }
    
    public function getPaidsOrders($order_state){
        $sql = 'SELECT id_order FROM '._DB_PREFIX_.'order_history WHERE date_add LIKE "%'.date("Y-m-d").'%" and id_order_state = '.$order_state;
        return Db::getInstance()-executeS($sql);
    }
    public function getPaidStatusOrder(){
        $sql = 'SELECT id_order_state FROM  '._DB_PREFIX_.'order_state WHERE paid = 1';
        return Db::getInstance()-executeS($sql);
    }
    public function getProductsInCartByOrder($id_order){
        $sql = 'SELECT id_product, id_giftlist,id_bond FROM '._DB_PREFIX_.'cart_product a INNER JOIN '._DB_PREFIX_.'orders b ON a.id_cart = b.id_cart WHERE b.id_order = '.$id_order.'and a.id_giftlist <> 0';
        return Db::getInstance()-executeS($sql);
    }
    
    public function seendMessage($data){
        $id_shop = (int)Context::getContext()->shop->id;
		$id_lang = $this->context->language->id;
		$params = array(
			'{lastname}'
		);
        MailCore::Send($id_lang, 'cron-mail', sprintf(
        MailCore::l('resumen de lista'), 1),
        $params, Tools::getValue('email'), $customer->firstname.' '.$customer->lastname,
        null, null, null,null, _MODULE_DIR_."giftlist/mails/", true, $id_shop);
        die("Se ha compartido la lista");
    }
}
