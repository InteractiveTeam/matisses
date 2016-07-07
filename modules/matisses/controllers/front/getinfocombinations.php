<?php 
class matissesgetinfocombinationsModuleFrontController extends ModuleFrontController{
    
    public function displayAjax() {        
        $data = $_POST['data'];
        
        if(strlen(trim($data[0])) == 7 && is_numeric(trim($data[0]))){
            $reference = substr_replace($data[0], '0000000000000', 3, 0);

            $data = Product::searchByName(1, $reference);

            $sql = 'SELECT * FROM '._DB_PREFIX_.'product_attribute WHERE id_product = '.$data[0]['id_product'];
            $results = Db::getInstance()->ExecuteS($sql);
        }

        for($i = 0;$i < count($results);$i++){
            $dataProduct[$results[$i]['id_product_attribute']]['idProduct'] = $results[$i]['id_product'];
            $dataProduct[$results[$i]['id_product_attribute']]['garantias'] = $results[$i]['garantias'];
            $dataProduct[$results[$i]['id_product_attribute']]['short_description'] = $results[$i]['short_description'];
            $dataProduct[$results[$i]['id_product_attribute']]['itemname'] = $results[$i]['itemname'];
        }
        
        //print_r($dataProduct);
        print_r(Tools::jsonEncode($dataProduct));
    }
}


?>