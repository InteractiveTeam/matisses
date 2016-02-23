<?php
require_once _PS_ROOT_DIR_.'config/config.inc.php';
require_once 'classes/GiftList.php';
$data = array();
$paidOrders = $l->getPaidStatusOrder();
foreach($paidOrders as $order){
    $paidOrder = $l->getPaidsOrders($order['id_order_state']);
    foreach($paidOrder as $row){
        $ids = $l->getProductsInCartByOrder($row['id_order']);
        foreach($ids as $id_array){
            $l = new GiftListModel($prod['id_giftlist']);
            $customer = new CustomerCore($l->id_customer);
            $product = new ProductCore($id_array['id_product']);
            $data[] = [
                'username' => }$customer->fisrtname . " " . $customer->lastname,
                ''
            ];
        }
    }
}
