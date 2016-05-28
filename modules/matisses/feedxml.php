<?php
include_once('../../config/config.inc.php');
require_once _PS_MODULE_DIR_.'matisses/matisses.php';

$matisses = new matisses();
header("Content-type: text/xml");
echo $matisses->createXML();

//echo "<pre>";print_r($matisses->createXML()); echo "</pre>";

?>