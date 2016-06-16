<?php
include_once('../../config/config.inc.php');
require_once _PS_MODULE_DIR_.'matisses/matisses.php';

$email = Tools::getValue('email');

if (Validate::isEmail($email)) {  
    $mat = new matisses();
    $response = $mat->wsmatissess_getCustomerbyEmail($email);
    echo json_encode($response);    
} 
else {
    echo "email incorrecto";
}
 
?>