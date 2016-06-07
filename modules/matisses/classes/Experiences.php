<?php
	class Experiences extends ObjectModel
	{
		public $id;
		public $id_experience;
		public $parent = 0;
		public $name;
		public $active = 1;
		public $position;
		public $description;
		public $products;
		public $link_rewrite;
		public $meta_title;
		public $meta_keywords;
		public $meta_description;
		public $id_shop_default;
	
		protected static $_links = array();
	
		
		public static $definition = array(
			'table' => 'experiences',
			'primary' => 'id_experience',
			'multilang' => true,
			'multilang_shop' => true,
			'fields' => array(
				'active' => 			array('type' => self::TYPE_BOOL, 'validate' => 'isBool', 'required' => true),
				'id_shop_default' => 	array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
				'parent' => 			array('type' => self::TYPE_INT),
				'position' => 			array('type' => self::TYPE_INT),
				'products' => 			array('type' => self::TYPE_HTML),
				// Lang fields
				'name' => 				array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isCatalogName', 'required' => true, 'size' => 128),
				'link_rewrite' => 		array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isLinkRewrite', 'required' => true, 'size' => 128),
				'description' => 		array('type' => self::TYPE_HTML, 'lang' => true, 'validate' => 'isCleanHtml', 'required' => true),
				'meta_title' => 		array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isGenericName', 'size' => 128),
				'meta_description' => 	array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isGenericName', 'size' => 255),
				'meta_keywords' => 		array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isGenericName', 'size' => 255),
			),
		);		
		
		
		
		public function __construct($id_experience = null, $id_lang = null, $id_shop = null)
		{
			parent::__construct($id_experience, $id_lang, $id_shop);
			$this->id_image = ($this->id && file_exists(_PS_IMG_DIR_.'experiences/'.(int)$this->id.'.jpg')) ? (int)$this->id : false;
			$this->image_dir = _PS_IMG_DIR_.'experiences/';
		}
		
		public function getPointers($id_experience)
		{
			return Db::getInstance()->getValue('SELECT products FROM '._DB_PREFIX_.'experiences WHERE id_experience = "'.$id_experience.'" ');
		}
		
		public function add($autodate = true, $null_values = false){
			$ret = parent::add($autodate, $null_values);
			return $ret;
		}
		
		public function update($null_values = false){                        
            $data = json_decode($_POST['products']);

            foreach($data as $key => $value){
                if(strlen($value->id_product) == 20){
                    $dataProduct = $this->consultIdproduct(trim($value->id_product),$data->$key);
                    $value->id_product = trim($dataProduct['id_product']);
                    $value->id_product_attribute = $dataProduct['id_product_attribute'];                    
                }
            }
            
            $result = json_encode($data);
                        
            //Actualizamos el producto con el ID y no la referencia
            $sql = "UPDATE "._DB_PREFIX_."experiences SET products = '".$result."' WHERE id_experience = ".$_POST['id_experience'];            
            $result = Db::getInstance()->execute($sql);
            
            //$ret = parent::update($null_values);            
			return parent::update();
		}
        
        //Consultamos el ID del producto según la referrencia larga que no llega
        private function consultIdproduct($id_prod,$marker){
            $sql = "SELECT * FROM "._DB_PREFIX_."product as a 
                    INNER JOIN "._DB_PREFIX_."product_attribute as b
                on a.id_product = b.id_product
                WHERE a.reference = '".$id_prod."'
                    or b.reference = '".$id_prod."'
                    or a.id_product = '".$id_prod."'";
			
            $product = Db::getInstance()->getRow($sql);
                        
            return $product;
        }
		
		public function GetFirstExperience()
		{
			return Db::getInstance()->getValue('SELECT id_experience FROM '._DB_PREFIX_.'experiences');
		}
		
		public function getExperiences($only_active = true)
		{
			$sql = '
					SELECT * 
					FROM  '._DB_PREFIX_.'experiences AS a
						INNER JOIN  '._DB_PREFIX_.'experiences_lang AS b
							on a.id_experience = b.id_experience
					WHERE 1 = 1 '.($only_active ? ' and a.active = 1' : NULL).'	
				   ';
			return Db::getInstance()->ExecuteS($sql);
		}
		
		public function delete()
		{
			if ((int)$this->id_experience === 0)
				return false;
			
			$this->deleteImage();
			return parent::delete();
		}
		
	}
?>