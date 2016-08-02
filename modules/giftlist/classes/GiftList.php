<?php

include_once __DIR__ . '/EventType.php';
class GiftListModel extends ObjectModel
{
	public $id_creator;
	public $id_cocreator;
	public $code;
	public $name;
    public $firstname;
    public $lastname;
	public $public;
	public $event_type;
	public $event_date;
	public $guest_number;
	public $url;
	public $message;
	public $image;
	public $profile_img;
	public $min_amount;
	public $info_creator;
	public $info_cocreator;
	public $info_creator_2;
	public $info_cocreator_2;
	public $recieve_bond;
	public $edit;
	public $address_before;
	public $address_after;
	public $created_at;
	public $updated_at;
    public $context;
    public $validated;
    public $real_not;
    public $cons_not;

	public static $definition = array(
		'table' => 'gift_list',
		'primary' => 'id',
		'fields' => array(
			'id_creator' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),
			'id_cocreator' => array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
			'code' => array('type' => self::TYPE_STRING, 'required' => true, 'size' => 11),
			'name' => array('type' => self::TYPE_STRING, 'required' => true, 'size' => 100),
			'firstname' => array('type' => self::TYPE_STRING, 'required' => true, 'size' => 100),
			'lastname' => array('type' => self::TYPE_STRING, 'required' => true, 'size' => 100),
			'public' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
			'event_type' => array('type' => self::TYPE_INT),
			'event_date' => array('type' => self::TYPE_DATE),
			'guest_number' => array('type' => self::TYPE_INT),
			'url' => array('type' => self::TYPE_STRING, 'size' => 100),
			'message' => array('type' => self::TYPE_STRING),
			'image' => array('type' => self::TYPE_STRING, 'size' => 255),
			'profile_img' => array('type' => self::TYPE_STRING, 'size' => 255),
			'recieve_bond' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
			'min_amount' => array('type' => self::TYPE_INT),
			'info_creator' => array('type' => self::TYPE_STRING),
			'info_cocreator' => array('type' => self::TYPE_STRING),
			'edit' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
			'address_before' => array('type' => self::TYPE_STRING, 'size' => 100),
			'address_after' => array('type' => self::TYPE_STRING, 'size' => 100),
            'validated' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'real_not' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'cons_not' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
			'created_at' => array('type' => self::TYPE_DATE),
			'updated_at' => array('type' => self::TYPE_DATE)
		)
	);

	public function __construct($id = null) {
        $this->context = Context::getContext();
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
		$sql = "UPDATE `"._DB_PREFIX_."gift_list` SET `firstname` = '".$this->firstname."', `lastname` = '".$this->lastname."', `info_creator` = '".$this->info_creator."',`address_before` = '".$this->address_before."',`address_after` = '".$this->address_after."' WHERE `id` = ".$this->id.";";
		if(!Db::getInstance()->execute($sql))
			return false;
		return true;
	}

	public function delete()
	{
		if ((int)$this->id === 0)
			return false;

		Db::getInstance()->delete('list_product_bond',"id_list = ".$this->id);
		Db::getInstance()->delete('email_cocreator',"id_list = ".$this->id);

		//$this->deleteImage();
		return parent::delete();
	}
    
    public function setValidated(){
        $sql = "UPDATE "._DB_PREFIX_."gift_list SET validated = 1 WHERE id = ". $this->id;
        if(!Db::getInstance()->execute($sql))
			return false;
		return true;      
    }


	/**
	 * @param number $id
	 * @param string $edit
	 * @return string|Code
	 */
	public function returnCode($id = 0, $edit = false){
		if(!$edit){
			do {
				$code = $this->_generateCode(8,true,true,false,false);
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
		$lists = Db::getInstance ()->executeS ( "SELECT * FROM `" . _DB_PREFIX_ . "gift_list` WHERE `id_creator` = ". $id . " OR `id_cocreator` = ". $id);
        
        foreach($lists as $key => $l){
            $c = new CustomerCore($l['id_creator']);
            $lists[$key]['creator_name'] = $l['firstname'] . " " . $l['lastname'];
            if($l['id_cocreator'] != 0){
                $cc = new CustomerCore($l['id_cocreator']);
                $lists[$key]['cocreator_name'] = $cc->firstname . " " . $cc->lastname;
            }else{
                $lists[$key]['cocreator_name'] = "-";
            }
            $ev = new EventTypeModel($l['event_type']);
            $lists[$key]['event'] = $ev->name;
            $prod = $this->getNumberProductsByList($l['id']);
            $lists[$key]['days'] = $this->getMissingDays($l['event_date']);
            $lists[$key]['products'] = $prod['products'];
            $lists[$key]['products_bought'] = $prod['products_bought'];
        }
        return $lists;
	}
    
    public function getNumberProductsByList($id){
        $res['products'] = Db::getInstance()->getValue("SELECT COUNT( id ) FROM `ps_list_product_bond`  WHERE  `id_list` =" . $id);
        $res['products_bought'] = Db::getInstance()->getValue("SELECT COUNT( id ) FROM `ps_list_product_bond`  WHERE  `id_list` = " . $id . " AND  `bought` =1");
        return $res;
    }
    
    public function getMissingDays($d1){
        $d1 = new DateTime($d1);
        $d2 = new DateTime(date('Y-m-d'));
        $interval = $d2->diff($d1);
        return $interval->format("%R%a");
    }

	public function getSharedListByCoCreatorId($id){
		return Db::getInstance ()->executeS ( "SELECT * FROM `" . _DB_PREFIX_ . "gift_list` WHERE `id_cocreator` =". $id );
	}

	/**
	 * @param number $length
	 * @param string $uc | UPPERCASE
	 * @param string $n | num
	 * @param string $sc | special chars
	 * generate random list code
	 * @return string|Code
	 */
	private function _generateCode($length=11,$uc=TRUE,$n=TRUE,$sc=FALSE,$letters = false){
        $source = '';
		if($letters == 1) $source .= 'abcdefghijklmnopqrstuvwxyz';
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
	 * search ig $email exist in database, if exist save id, else save in ps_email_cocreator
	 * @return number
	 */
	public function setCoCreator($id,$email,$creator,$url){
        $context = Context::getContext();
        $id_shop = (int)Context::getContext()->shop->id;
		$id_lang = $context->language->id;
		$sql = "SELECT id_customer FROM `" . _DB_PREFIX_ . "customer` WHERE `email` = '". $email."';";
		$row = Db::getInstance()->getRow($sql);
		if(!empty($row) && count($row) > 0)
			return $row['id_customer'];
		else{
            Db::getInstance()->insert('email_cocreator',array(
                'id_list' => $id,
                'email' => $email
            ));
            $params = array(
                '{creator}' => $creator,
                '{url}' => $context->link->getModuleLink('giftlist', 'descripcion',array("url" => $url)),
            );
            MailCore::Send($id_lang, 'cocreator-list', sprintf(
            MailCore::l('Eres cocreador de una lista'), 1),
            $params, $email, $creator,
            null, null, null,null, _MODULE_DIR_."giftlist/mails/", true, $id_shop);
            return 0;
        }
	}

	public function searchByCode($code){
		$sql = 'SELECT url FROM '._DB_PREFIX_.'gift_list WHERE code = "'.$code.'";';
		return Db::getInstance()->getRow($sql);
	}

	public function searchByCustomerNames($firstname,$lastname){
		$return = false;
        $sql = "SELECT * FROM "._DB_PREFIX_.'gift_list WHERE firstname = "'. $firstname.'" AND lastname = "'.$lastname.'" AND public = 1;';
		 $return = Db::getInstance()->executeS($sql);
                
        $sql = "SELECT id_customer FROM "._DB_PREFIX_.'customer WHERE
				firstname = "'.$firstname.'" AND lastname = "'.$lastname.'";';
        $res = Db::getInstance()->executeS($sql);
		if(count($res) > 0){
            foreach($res as $row){
                $sql = "SELECT * FROM "._DB_PREFIX_.'gift_list WHERE id_cocreator = '. $row['id_customer']. " AND public = 1";
                $ret = Db::getInstance()->executeS($sql);
                for($i = 0; $i < count($ret);$i++){
                    array_push($return,$ret[$i]);
                }
            }
		}
        
        foreach($return as $key => $row){
            $cocreator = ($row['id_cocreator'] ? $this->getCoCreator($row['id_cocreator']) : false);
            $return[$key]['creator'] = $row['firstname'] . " " . $row['lastname'];
            $return[$key]['cocreator'] = ($cocreator ? $cocreator->firstname . " " . $cocreator->lastname : " - ");
            $return[$key]['event_type'] = Db::getInstance()->getValue("SELECT name FROM "._DB_PREFIX_."event_type WHERE id =".$row['event_type']);
            $return[$key]['link'] = $this->context->link->getModuleLink('giftlist', 'descripcion', ['url' => $row['url']]);
        }
		return $return;
	}
    
    public function getCreator($id){
        return new CustomerCore($id);
    }
    
    public function getCoCreator($id){
        return new CustomerCore($id);
    }
    
    public function getCartProductsByList($id){
        $sql = "SELECT * FROM "._DB_PREFIX."cart_product WHERE id_giftlist = ".$id;
        return Db::getInstance()->executeS($sql);
    }
    
    public static function getPaidsOrders($order_state){
        $sql = 'SELECT id_order FROM '._DB_PREFIX_.'order_history WHERE date_add LIKE "%'.date("Y-m-d").'%" and id_order_state = '.$order_state;
        return Db::getInstance()->executeS($sql);
    }
    public static function getPaidStatusOrder(){
        $sql = 'SELECT id_order_state FROM  '._DB_PREFIX_.'order_state WHERE paid = 1';
        return Db::getInstance()->executeS($sql);
    }
    public static function getProductsInCartByOrder($id_order){
        $sql = 'SELECT id_product,id_giftlist,id_bond,b.id_customer,a.quantity FROM '._DB_PREFIX_.'cart_product a INNER JOIN '._DB_PREFIX_.'orders b ON a.id_cart = b.id_cart WHERE b.id_order = '.$id_order.' and a.id_giftlist <> 0';
        return Db::getInstance()->executeS($sql);
    }
    
    public function sendMessage($out){
        $context = Context::getContext();
        $id_shop = (int)Context::getContext()->shop->id;
		$id_lang = $context->language->id;
        $product_list_txt = $this->getEmailTemplateContent('cron-mail-products.txt', Mail::TYPE_TEXT,$out);
        $product_list_html = $this->getEmailTemplateContent('cron-mail-products.txt', Mail::TYPE_HTML,$out);
		$params = array(
            '{creator}' => $out[0]['creator'],
            '{description_link}' => $out[0]['description_link'],
			'{products_html}' => $product_list_html,
            '{products_txt}' => $product_list_txt,
            '{message}' => "HOLI"
		);
        MailCore::Send($id_lang, 'cron-mail', sprintf(
        MailCore::l('resumen de lista'), 1),
        $params, $data[0]['email'], $out[0]['creator'],
        null, null, null,null, _MODULE_DIR_."giftlist/mails/", true, $id_shop);
    }
    
    protected function getEmailTemplateContent($template_name, $mail_type,$out)
    {
		$email_configuration = Configuration::get('PS_MAIL_TYPE');
		if ($email_configuration != $mail_type && $email_configuration != Mail::TYPE_BOTH)
			return '';

		$theme_template_path = _PS_THEME_DIR_.'modules/giftlist/mails'.DIRECTORY_SEPARATOR.$this->context->language->iso_code.DIRECTORY_SEPARATOR.$template_name;
		$default_mail_template_path = _PS_MODULE_DIR_."mails/".$this->context->language->iso_code.DIRECTORY_SEPARATOR.$template_name;
		if (Tools::file_exists_cache($theme_template_path))
			$default_mail_template_path = $theme_template_path;

		if (Tools::file_exists_cache($default_mail_template_path))
		{
			$this->context->smarty->assign(array(
                'out' => $out
            ));
			return $this->context->smarty->fetch($default_mail_template_path);
		}
		return '';
	}
    
    public static function getAllList(){
        $sql = 'SELECT * FROM  '._DB_PREFIX_.'gift_list WHERE validated = 0';
        return Db::getInstance()->executeS($sql);
    }
    
    public static function setValidatedFalse(){
        $sql = "UPDATE "._DB_PREFIX_."gift_list SET validated = 0 ";
        if(!Db::getInstance()->execute($sql))
			return false;
		return true;  
    }
    
    public function validateProductinList($id_prod,$id_list){
        $sql = "SELECT count(*) FROM ". _DB_PREFIX_ ."list_product_bond WHERE id_list = ".$id_list." AND id_product = ".$id_prod;
        $value = Db::getInstance()->getValue($sql);
        return ($value > 0 ? true : false);
    }
}
