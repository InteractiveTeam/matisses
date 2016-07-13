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
    $jsonData = array('trueProcess' => array(
                                        'response' => false,
                                        'result' => ''
                                    ),
                      'failSend' => array(
                                        'response' => false,
                                        'result' => ''
                                    ),
                      'errorToken' => array(
                                        'response' => false,
                                        'result' => ''
                                    ),
                      'notExistSap' => array(
                                        'response' => false,
                                        'result' => ''
                                    ),
                      'emailFalse' => array(
                                        'response' => false,
                                        'result' => ''
                                    ));
    
    if ($response && !Customer::customerExists($email)) {
        
        $link = new Link();
        $ctrlname = 'authentication';
        $url = $link->getPageLink($ctrlname, true);
        $token = bin2hex(openssl_random_pseudo_bytes(20));
        $send = false;
        $checktoken = $regsap->checkByEmail($email);

        if (!empty($checktoken)) {
            $update = $regsap->updateToken($email, $token, false);
            $jsonData['errorToken']['result'] = $update;
            
            if ($update) {
                $send = true;
            }
        } else {
            $create = $regsap->createToken($email, $token);
            $jsonData['errorToken']['result'] = $create;
            
            if ($create) {
                $send = true;
            }
        }

        if ($send) {
            $templateVars = array(
                '{link}' => $url.'?skey='.$token
            );
            
            $mailSend = Mail::Send((int)$context->language->id,'validate_account_sap',Mail::l('Registration account process', (int)$context->language->id),$templateVars,$email,null,null,null,null,null,_THEME_DIR_.'mails/');
             /* Email sending */
            if ($mailSend) {
                $jsonData['trueProcess']['response'] = true;
                $jsonData['trueProcess']['result'] = $mailSend;
            } 
            else {
                $jsonData['failSend']['response'] = true;
                $jsonData['failSend']['result'] = $mailSend;
            }
        } else {
            $jsonData['errorToken']['response'] = true;
        }

    } else {
        $jsonData['notExistSap']['response'] = true;
        $jsonData['notExistSap']['result'] = $response;
    }  
} 
else {
    $jsonData['emailFalse']['response'] = true;
}
 
echo json_encode($jsonData);
?>