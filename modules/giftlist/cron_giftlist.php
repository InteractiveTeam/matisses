<?php
require_once _PS_ROOT_DIR_.'config/config.inc.php';
require_once 'classes/GiftList.php';

$l = new GiftListModel();
$lists = $l->getAllLists();

$paidOrders = $l->getPaidStatusOrder();
foreach($paidOrders as $order){
    $paidOrder = $l->getPaidsOrders($order['id_order_state']);
    foreach($paidOrder as $row){
        $prod = $l->getProductsInCartByOrder($row['id_order']);
        
    }
}

foreach($lists as $list){
    $products = $l->getCartProductsByList($list['id']);
    
}