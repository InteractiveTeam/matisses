<?php
if(!defined('_PS_VERSION_'))
	exit;

class DBStruct extends Module
{
	public function CreateListConfigurationTable(){
		$sql= "CREATE TABLE IF NOT EXISTS `"._DB_PREFIX_."list_configuration`(
	    `min_amount` INT(11) NOT NULL )";

		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function DeleteListConfigurationTable(){
		$sql = "DROP TABLE IF EXISTS `"._DB_PREFIX_."list_configuration`";
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function CreateEventTypeTable(){
		$sql= "CREATE TABLE IF NOT EXISTS `"._DB_PREFIX_."event_type`(
	    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	    `name` VARCHAR(100) NOT NULL )";

		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql)){
			return false;
		}
		$this->addEventTypes();
		return true;
	}

	public function DeleteEventTypeTable(){
		$sql = "DROP TABLE IF EXISTS `"._DB_PREFIX_."event_type`";
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function CreateGiftListTable(){
		$sql= "CREATE TABLE IF NOT EXISTS `"._DB_PREFIX_."gift_list`(
   		`id` INT(11) NOT NULL AUTO_INCREMENT,
	    `id_creator` INT UNSIGNED NOT NULL,
			`id_cocreator` INT UNSIGNED NULL,
			`code` VARCHAR(11) NOT NULL,
			`name` VARCHAR(100) NOT NULL,
			`public` TINYINT(1) NOT NULL,
			`event_type` INT NOT NULL,
			`event_date` DATETIME NOT NULL,
			`guest_number` INT(11) NOT NULL,
			`url` VARCHAR(100) NOT NULL,
			`message` TEXT NULL,
			`image` VARCHAR(255) NULL,
			`recieve_bond` TINYINT(1) NOT NULL,
			`max_amount` INT(11) NOT NULL,
			`info_creator` TEXT NOT NULL,
			`info_cocreator` TEXT NULL,
			`edit` TINYINT(1) NOT NULL,
			`address_before` VARCHAR(100) NOT NULL,
			`address_after` VARCHAR(100) NOT NULL,
            `validated` TINYINT(1),
			`created_at` DATETIME NOT NULL,
			`updated_at` DATETIME NOT NULL,
	  	PRIMARY KEY (`id`, `event_type`,`id_creator`),
			UNIQUE (code),

		 	INDEX `fk_"._DB_PREFIX_."gift_list_"._DB_PREFIX_."event_type_idx` (`event_type` ASC),
	 		INDEX `fk_"._DB_PREFIX_."customer_"._DB_PREFIX_."gift_list_idx` (`id_creator` ASC),

  		CONSTRAINT `fk_"._DB_PREFIX_."gift_list_"._DB_PREFIX_."event_type`
    	FOREIGN KEY (`event_type`)
    	REFERENCES `"._DB_PREFIX_."event_type` (`id`)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION,

    	CONSTRAINT `fk_"._DB_PREFIX_."customer_"._DB_PREFIX_."gift_list`
    	FOREIGN KEY (`id_creator`)
    	REFERENCES `"._DB_PREFIX_."customer` (`id_customer`)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION);";

		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function DeleteGiftListTable(){
		$sql = "DROP TABLE IF EXISTS `"._DB_PREFIX_."gift_list`";
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function CreateEmailCocreatorTable(){
		$sql= "CREATE TABLE IF NOT EXISTS `"._DB_PREFIX_."email_cocreator`(
    `id` INT(11) NOT NULL AUTO_INCREMENT,
		`id_list` INT NOT NULL,
    `email` VARCHAR(100) NOT NULL,
		PRIMARY KEY (`id`, `id_list`),
		INDEX `fk_"._DB_PREFIX_."gift_list_"._DB_PREFIX_."email_cocreator_idx` (`id_list` ASC),
		CONSTRAINT `fk_"._DB_PREFIX_."gift_list_"._DB_PREFIX_."email_cocreator`
  	FOREIGN KEY (`id_list`)
  	REFERENCES `"._DB_PREFIX_."gift_list` (`id`)
  	ON DELETE NO ACTION
  	ON UPDATE NO ACTION)";

		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function DeleteEmailCocreatorTable(){
		$sql = "DROP TABLE IF EXISTS `"._DB_PREFIX_."email_cocreator`";
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function CreateBondTable(){
		$sql= "CREATE TABLE IF NOT EXISTS `"._DB_PREFIX_."bond`(
	    `id` INT(11) NOT NULL AUTO_INCREMENT,
			`id_list` INT(11) NOT NULL,
			`value` INT(11) NOT NULL,
			`luxury_bond` TINYINT(1) NOT NULL,
			`message` TEXT NULL,
			`bought` TINYINT(1) DEFAULT 0,
			`created_at` DATETIME NOT NULL,
			`updated_at` DATETIME NOT NULL,
			PRIMARY KEY (`id`))";

		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function DeleteBondTable(){
		$sql = "DROP TABLE IF EXISTS `"._DB_PREFIX_."bond`";
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function CreateListProductBondTable(){
		$sql= "CREATE TABLE IF NOT EXISTS `"._DB_PREFIX_."list_product_bond`(
	    `id` INT(11) NOT NULL AUTO_INCREMENT,
		`id_list` INT NULL,
		`id_product` INT UNSIGNED NULL,
		`id_bond` INT NULL,
		`group` VARCHAR(70) NULL,
		`option` TEXT NULL,
		`favorite` TINYINT(1) NOT NULL,
		`message` TEXT NULL,
		`bought` TINYINT(1) DEFAULT 0,
		`created_at` DATETIME NOT NULL,
		`updated_at` DATETIME NOT NULL,
		PRIMARY KEY (`id`,`id_list`,`id_product`,`id_bond`),
		INDEX `fk_"._DB_PREFIX_."gift_list_"._DB_PREFIX_."list_product_bond_idx` (`id_list` ASC),
		INDEX `fk_"._DB_PREFIX_."product_"._DB_PREFIX_."list_product_bond_idx` (`id_product` ASC),
		INDEX `fk_"._DB_PREFIX_."bond_"._DB_PREFIX_."list_product_bond_idx` (`id_bond` ASC),

		CONSTRAINT `fk_"._DB_PREFIX_."gift_list_"._DB_PREFIX_."list_product_bond`
    	FOREIGN KEY (`id_list`)
    	REFERENCES `"._DB_PREFIX_."gift_list` (`id`)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION)";

		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function DeleteListProductBondTable(){
		$sql = "DROP TABLE IF EXISTS `"._DB_PREFIX_."list_product_bond`";
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function addEventTypes(){
		$sql = 'INSERT INTO '._DB_PREFIX_.'event_type(name) VAlUES("Matrimonio"),
				("Cermonia de compromiso"),("Renovación de votos"),("Cumpleaños"),
				("Aniversario"),("Home Shower"),("Baby Shower"),("Ocasión Especial");';
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	/*
	 * The following code is to edit the shopping cart to be able to reference a product
	 * in a gift list*/

	public function alterTableCartProductAddIdGiftList(){
		$sql = 'ALTER TABLE `'._DB_PREFIX_.'cart_product`
		ADD COLUMN `id_giftlist` INT(10) NOT NULL AFTER `id_shop`';
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function alterTableCartProductAddIdBond(){
		$sql = 'ALTER TABLE `'._DB_PREFIX_.'cart_product`
		ADD COLUMN `id_bond` INT(10) NOT NULL DEFAULT 0 AFTER `id_shop`';
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function alterTableCartProductAddQtyGroup(){
		$sql = 'ALTER TABLE `'._DB_PREFIX_.'cart_product`
		ADD COLUMN `qty_group` INT(11) NULL AFTER `date_add`';
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function alterTableCartProductDeleteIdGiftList(){
		$sql = 'ALTER TABLE `'._DB_PREFIX_.'cart_product`
			DROP COLUMN `id_giftlist`;';
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function alterTableCartProductDeleteIdBond(){
		$sql = 'ALTER TABLE `'._DB_PREFIX_.'cart_product`
			DROP COLUMN `id_bond`;';
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function alterTableCartProductDeleteQtyGroup(){
		$sql = 'ALTER TABLE `'._DB_PREFIX_.'cart_product`
			DROP COLUMN `qty_group`;';
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function addBondInProduct(){
		Db::getInstance()->insert('product',array(
			'id_supplier' => 0,
			'id_manufacturer' => 0,
			'id_category_default' => 0,
			'id_shop_default' => $this->context->shop->id,
			'id_tax_rules_group' => 1,
			'minimal_quantity' => 1,
			'price' => 0,
			'active' => 1,
			'redirect_type' => 404,
			'reference' => "BOND-LIST",
			'is_virtual' => 1,
			'visibility' => 'none',
			'indexed' => 0,
			'show_price' => 0,
			'date_add' => date ( "Y-m-d H:i:s" )
		));
		$idProd = Db::getInstance()->Insert_ID();
		Db::getInstance()->insert('product_shop',array(
			'id_product' => $idProd,
			'id_category_default' => 2,
			'id_shop' => $this->context->shop->id,
			'id_tax_rules_group' => 1,
			'minimal_quantity' => 1,
			'price' => 0,
			'wholesale_price' => 0,
			'active' => 1,
			'visibility' => 'none',
			'redirect_type' => 404,
			'indexed' => 0,
			'available_for_order' => 1
		));
		Db::getInstance()->insert('product_lang',array(
			'id_product' => $idProd,
			'id_shop' => $this->context->shop->id,
			'id_lang' => 1,
			'description' => "<p> Bono de lista de regalos</p>",
			'description_short' => "<p>Regala un bono</p>",
			'link_rewrite' => 'bono',
			'name' => "Bono",
			'available_now' => "En stock"
		));
	}

	public function deleteBondInProduct(){
		$sql = "SELECT id_product FROM "._DB_PREFIX_."product WHERE reference = 'BOND-LIST'";
		$id_product = Db::getInstance()->getValue($sql);
		Db::getInstance()->delete('cart_product', 'id_product <> 0');
		Db::getInstance()->delete('product_lang', 'id_product = '.$id_product);
		Db::getInstance()->delete('product_shop', 'id_product = '.$id_product);
		Db::getInstance()->delete('product', 'id_product = '.$id_product);
	}
}
