<?php
include_once('../../config/config.inc.php');
include_once('../../init.php');
include_once('matisses.php');

if (isset($_POST['skus'])) {
    $skus = $_POST['skus'];
    $matisses = new matisses();
    $idproducts = $matisses->searchByReference($skus);
    echo json_encode($idproducts);
} else {
    echo "null";
}

?>