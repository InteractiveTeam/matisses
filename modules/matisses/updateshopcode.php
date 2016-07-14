<?php
include_once('../../config/config.inc.php');
require_once _PS_MODULE_DIR_.'matisses/matisses.php';

$code = Tools::getValue('code');
$idcart = Tools::getValue('idcart');

if (!empty($code) && !empty($idcart)) {
    print_r($code);
    print_r($idcart);
    $matisses = new matisses();
    $result = $matisses->updateShopCode($code, $idcart);
    print_r($result);   
} else {
    echo "false";
}

?>