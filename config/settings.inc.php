<?php
//echo "<pre>"; print_r($_SERVER); echo "</pre>";

if($_SERVER['SERVER_NAME']=='localhost')
{
	define('_DB_SERVER_', 'localhost');
	define('_DB_NAME_', 'matisses');
	define('_DB_USER_', 'root');
	define('_DB_PASSWD_', '');
	define('_DB_PREFIX_', 'ps_');
	define('_MYSQL_ENGINE_', 'InnoDB');
	define('_PS_CACHING_SYSTEM_', 'CacheMemcache');
	define('_PS_CACHE_ENABLED_', '0');
	define('_COOKIE_KEY_', 'Ci0fu32BOM5iT0Vdts0T87Jd9bGE79pOKhIg451XN53ZO7gsEkSQAV1r');
	define('_COOKIE_IV_', 'f1xaKqeO');
	define('_PS_CREATION_DATE_', '2015-06-22');
	if (!defined('_PS_VERSION_'))
		define('_PS_VERSION_', '1.6.0.14');
	define('_RIJNDAEL_KEY_', 'nM6wqH5QdaBtqTzBg5xzLNdvndd3XYRf');
	define('_RIJNDAEL_IV_', 'LcmHtgdbjnG1lLWhiyVsWQ==');
}else{
			define('_DB_SERVER_', 'localhost');
			define('_DB_NAME_', 'prestashop_matisses16014');
			define('_DB_USER_', 'prestauser16014');
			define('_DB_PASSWD_', 'M4T2015&&!10');
			define('_DB_PREFIX_', 'ps_');
			define('_MYSQL_ENGINE_', 'InnoDB');
			define('_PS_CACHING_SYSTEM_', 'CacheMemcache');
			define('_PS_CACHE_ENABLED_', '0');
			define('_COOKIE_KEY_', 'Ci0fu32BOM5iT0Vdts0T87Jd9bGE79pOKhIg451XN53ZO7gsEkSQAV1r');
			define('_COOKIE_IV_', 'f1xaKqeO');
			define('_PS_CREATION_DATE_', '2015-06-22');
			if (!defined('_PS_VERSION_'))
				define('_PS_VERSION_', '1.6.0.14');
			define('_RIJNDAEL_KEY_', 'nM6wqH5QdaBtqTzBg5xzLNdvndd3XYRf');
			define('_RIJNDAEL_IV_', 'LcmHtgdbjnG1lLWhiyVsWQ==');
	 }
>>>>>>> 2b60f1d4fd294d8c0ebbbb11120c364ffb534ea9
