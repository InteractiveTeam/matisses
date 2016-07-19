<?php

set_time_limit(0);
require_once dirname(__FILE__).'../../../config/config.inc.php';
require_once 'classes/GiftList.php';
require_once 'classes/ListProductBond.php';
$context = Context::getContext();
$id_lang = $context->language->id;
/*The following code is used to get all the products bought, this products are linked to a list
And return all the info of thses products*/
$context = Context::getContext();
$paidOrders = GiftListModel::getPaidStatusOrder();

foreach($paidOrders as $order){
    $paidOrder = GiftListModel::getPaidsOrders($order['id_order_state']);
    foreach($paidOrder as $row){
        $ids = GiftListModel::getProductsInCartByOrder($row['id_order']);
        foreach($ids as $id_array){
            $out = array();
            $l = new GiftListModel($id_array['id_giftlist']);
            $lpd = ListProductBondModel::getByProductAndList($id_array['id_product'],$id_array['id_giftlist']);
            $customer = new CustomerCore($l->id_creator);
            $buyer = new CustomerCore($id_array['id_customer']);
            $product = new ProductCore($id_array['id_product']);
            $id_image = ProductCore::getCover($id_array['id_product']);
            // get Image by id
            if (sizeof($id_image) > 0) {
                $image = new Image($id_image['id_image']);
                // get image full URL
                $image_url = _PS_BASE_URL_._THEME_PROD_DIR_.$image->getExistingImgPath().".jpg";
            }
            if($id_array['id_bond'] != 0){
                $bond = new BondModel($id_array['id_bond']);
                $data_b[] = array(
                    'bond' => 1,
                    'creator' => $customer->firstname . " " . $customer->lastname,
                    'image' => $image_url,
                    'name' => $product->name[1],
                    'buyer' => $buyer->firstname. " " . $buyer->lastname,
                    'price' => $bond->value,
                    'color' => 0,
                    "wanted" => 0,
                    "missing" => 0,
                    "message" => $l->message,
                    "bought" => $id_array['quantity'],
                    'description_link' => $context->link->getModuleLink('giftlist', 'descripcion',array('url' => $l->url)),
                    'email' => $customer->email
                );
            }
            else{
                $attr_op = Tools::jsonDecode($lpd['option']);
                $attr = $product->getAttributeCombinationsById($attr_op[3]->value,$id_lang);//[3] = id_attribute
                $data_b[] = array(
                    'bond' => 0,
                    'creator' => $customer->firstname . " " . $customer->lastname,
                    'image' => $image_url,
                    'name' => $product->name[1],
                    'buyer' => $buyer->firstname. " " . $buyer->lastname,
                    'price' => $product->price,
                    'color' => attr['attribute_name'],
                    "wanted" => $lpd['total'],
                    "missing" => $lpd['missing'],
                    "message" => $l->message,
                    "bought" => $id_array['quantity'],
                    'description_link' =>$context->link->getModuleLink('giftlist', 'descripcion',array('url' => $l->url)),
                    'email' => $customer->email
                );
                /*
                The following code is used to search wich products are out of stock, and wich of these
                products are linked to a list, and return the info
                */
                if(!$l->validated){
                    $p = new ListProductBondModel();
                    $prod = $p->getProductsByList($l->id);
                    foreach($prod as $p){
                        $cant = ToolsCore::jsonDecode($p['group']);
                        $attr_op = Tools::jsonDecode($p['option']);
                        $attr = $p->getAttributeCombinationsById($attr_op[3]->value,$id_lang);//[3] = id_attribute
                        $id_image = ProductCore::getCover($p['id']);
                        // get Image by id
                        if (sizeof($id_image) > 0) {
                            $image = new Image($id_image['id_image']);
                            // get image full URL
                            $image_url = _PS_BASE_URL_._THEME_PROD_DIR_.$image->getExistingImgPath().".jpg";
                        }
                        $s = StockAvailable::getQuantityAvailableByProduct($p->id,$attr_op[3]->value);
                        if(s <= 0){
                            $out[] = array (
                                'image' => $image_url,
                                'name' => $p->name[1],
                                'price' => $p->price,
                                'color' => attr['attribute_name'],
                                "wanted" => $cant->wanted,
                                "missing" => $cant->missing,
                            );
                        }  
                    }
                }
                $l->setValidated();
            }
        }
        if($l->cons_not)
            $l->sendMessage($data_b,$out);
        $data_b = array();
    }
}

//validate gift list without bought products

$list = GiftList::getAllList();
foreach($list as $l){
    $p = new ListProductBondModel();
    $prod = $p->getProductsByList($l->id);
    $customer = new CustomerCore($l->id_creator);
    foreach($prod as $p){
        $attr_op = Tools::jsonDecode($p['option']);
        $attr = $p->getAttributeCombinationsById($attr_op[3]->value,$id_lang);//[3] = id_attribute
        $id_image = ProductCore::getCover($p['id']);
        // get Image by id
        if (sizeof($id_image) > 0) {
            $image = new Image($id_image['id_image']);
            // get image full URL
            $image_url = _PS_BASE_URL_._THEME_PROD_DIR_.$image->getExistingImgPath().".jpg";
        }
        $s = StockAvailable::getQuantityAvailableByProduct($p->id,$attr_op[3]->value);
        if(s <= 0){
            $out[] = array (
                'image' => $image_url,
                'creator' => $customer->firstname . " " . $customer->lastname,
                'name' => $p->name[1],
                'price' => $p->price,
                'color' => attr['attribute_name'],
                "wanted" => $cant['cant'],
                "missing" => $cant['missing'],
                "email" => $l->email
            );
        }
    }
    if($l->cons_not)
        $l->sendMessage($out);
}

Giftlist::setValidatedFalse();