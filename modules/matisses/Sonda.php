<?php

include_once('../../config/config.inc.php');
include_once('CargarProductos.php');

//c29uZGFNYXRpc3Nlcw==

if (base64_decode($_GET['token']) == "sondaMatisses"){
    if($_GET['five']){
        $ob = new CargaProductos(true);
        $ob->loadProcess($ob->fiveMin);
    }else{
       $ob = new CargaProductos(false); 
    }
}
else{
    Tools::redirect('404');
}

?>