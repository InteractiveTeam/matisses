<?php
include_once('../../config/config.inc.php');
require_once(dirname(__FILE__).'/matisses.php');
error_reporting(E_ALL);
ini_set("display_errors", 1);
$matisses = new matisses();
echo $matisses->hookactionValidateProductsAvailableCart();
exit;
?>