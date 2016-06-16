<?php
include_once('../../config/config.inc.php');
require_once _PS_MODULE_DIR_.'matisses/matisses.php';
require_once _PS_MODULE_DIR_.'registerwithsap/registerwithsap.php';

$email = Tools::getValue('email');

if (Validate::isEmail($email)) { 
    
    $mat = new matisses();
    $regsap = new registerWithSap();
    $response = $mat->wsmatissess_getCustomerbyEmail($email);
    $context = Context::getContext();
    $jsonData = array('trueProcess' => false,
                      'failSend' => false,
                      'errorToken' => false,
                      'notExistSap' => false,
                      'emailFalse' => false);
    
    if ($response) {
        
        $link = new Link();
        $ctrlname = 'authentication';
        $url = $link->getPageLink($ctrlname, true);
        $token = bin2hex(openssl_random_pseudo_bytes(20));
        $send = false;
        $checktoken = $regsap->checkByEmail($email);

        if (!empty($checktoken)) {
            $update = $regsap->updateToken($email, $token, false);

            if ($update) {
                $send = true;
            }
        } else {
            $create = $regsap->createToken($email, $token);

            if ($create) {
                $send = true;
            }
        }

        if ($send) {
            $templateVars = array(
                '{link}' => $url.'?skey='.$token
            );
             /* Email sending */
            if (Mail::Send((int)$context->language->id,'validate_account_sap',Mail::l('Registration account process', (int)$context->language->id),$templateVars,$email,null,null,null,null,null,_THEME_DIR_.'mails/')) {
                $jsonData['trueProcess'] = true;
            } 
            else {
                $jsonData['failSend'] = true;
            }
        } else {
            $jsonData['errorToken'] = true;
        }

    } else {
        $jsonData['notExistSap'] = true;
    }  
} 
else {
    $jsonData['emailFalse'] = true;
}
 
echo json_encode($jsonData);
?>