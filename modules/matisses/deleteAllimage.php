<?php 
	include_once dirname(__FILE__).'/../../config/config.inc.php';


	$_Product = new Product(1588,false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT'));
	//echo '<pre>';print_r($_Product);echo '</pre>';
	//echo '<pre>';print_r(Product::getallimages(1588));echo '</pre>';

	date_default_timezone_set("American/Bogota");
	
	echo "Start<br>";
	echo date('Y-m-d H:i:s');
	$_Product->deleteImages();
	echo "End<br>";
	echo date('Y-m-d H:i:s');
?>