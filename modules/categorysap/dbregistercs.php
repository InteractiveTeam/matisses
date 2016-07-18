<?php
if(!defined('_PS_VERSION_'))
	exit;

class DBRegisterCS extends Module
{
	public function CreateTable(){
		$sql= "CREATE TABLE IF NOT EXISTS `"._DB_PREFIX_."category_sap`(
   		`id_category` INT NOT NULL,
        `sap_code` VARCHAR(50) NOT NULL);";

		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function DeleteTable(){
		$sql = "DROP TABLE IF EXISTS `"._DB_PREFIX_."category_sap`";
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}
}
