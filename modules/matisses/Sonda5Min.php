<?php

include_once('../../config/config.inc.php');
include_once('CargarProductos.php');

$ob = new CargaProductos(true);
$ob->loadProcess($ob->fiveMin);

?>