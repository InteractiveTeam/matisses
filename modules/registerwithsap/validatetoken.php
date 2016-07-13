<?php
include_once('../../config/config.inc.php');
require_once _PS_MODULE_DIR_.'registerwithsap/registerwithsap.php';
require_once _PS_MODULE_DIR_.'matisses/matisses.php';

$token = Tools::getValue('token');
$jsonData = array('token' => array(
                                'exits' => false,
                                'used' => false,
                                'user' => array()
                                 )
                 );

if (isset($token) && !empty($token)) { 
    $regsap = new registerWithSap();
    $mat = new matisses();
    $checkToken = $regsap->checkToken($token);
    
    if (!empty($checkToken)) {
        $jsonData['token']['exits'] = true;
        $response = $mat->wsmatissess_getCustomerbyEmail($checkToken[0]['email']);
        $jsonData['token']['user'] = $response['customerDTO'];
    } 
}
 echo json_encode($jsonData);
?>