<?php
include_once('../../config/config.inc.php');
require_once(dirname(__FILE__).'/matisses.php');
$matisses = new matisses();
echo $matisses->hookactionValidateProductsAvailableCart();
exit;
?>