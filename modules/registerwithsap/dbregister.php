<?php
if(!defined('_PS_VERSION_'))
	exit;

class DBRegister extends Module
{
	public function CreateTokenTable(){
		$sql= "CREATE TABLE IF NOT EXISTS `"._DB_PREFIX_."token_email`(
   		`id_token` INT PRIMARY KEY AUTO_INCREMENT,
        `email` VARCHAR(30) NOT NULL,
        `token` VARCHAR(100) NOT NULL,
        `token_used` BIT NOT NULL);";

		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}

	public function DeleteTokenTable(){
		$sql = "DROP TABLE IF EXISTS `"._DB_PREFIX_."token_email`";
		if(!$result=Db::getInstance(_PS_USE_SQL_SLAVE_)->Execute($sql))
			return false;
		return true;
	}
}
