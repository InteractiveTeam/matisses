<?php 
	include_once('../../config/config.inc.php');
	//print_r($_REQUEST);
	global $cookie;
	$link = new link();
	ini_set('display_errors',true);
	error_reporting(E_ALL);
	$Product = new Product($_REQUEST['id_product'],false,(int)Context::getContext()->shop->id,(int)Context::getContext()->language->id);
	$Attribute = $Product->getAttributeCombinationsById($_REQUEST['id_product_attribute'],$cookie->id_lang);
	$images = $Product->_getAttributeImageAssociations($_REQUEST['id_product_attribute']);

	//$precio = Product::getPriceStatic($Product->id, true, $_REQUEST['id_product_attribute'],6, null, false, false);
	if(sizeof($images) > 0)
		$Attribute[0]['image'] = Tools::getShopProtocol().$link->getImageLink($Product->link_rewrite, $images[0], 'home_default');


	echo json_encode($Attribute[0]);
?>