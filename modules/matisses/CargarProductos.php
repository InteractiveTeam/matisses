<?php 
mb_internal_encoding("UTF-8");
set_time_limit(0);
ini_set('memory_limit','1024M');
include_once('../../config/config.inc.php');

$ob = new CargaProductos();
$ob->productStatus();


class CargaProductos{
    private $totalProducts;
    private $fiveMin;
    private $pStatus;
    private $data;
    
    public function __construct(){
        $this->totalProducts = 'http://hercules.matisses.co:8280/WebIntegrator/webresources/iteminventario/consulta';
        $this->fiveMin = 'http://hercules.matisses.co:8280/WebIntegrator/webresources/iteminventario/consultaRecientes5M';
        $this->pStatus = 'http://hercules.matisses.co:8280/WebIntegrator/webresources/iteminventario/estado';
        $this->data = array();
    }
    
    public function callService($url){
        try{
            $ch = curl_init();

            curl_setopt($ch, CURLOPT_URL,$url);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch,CURLOPT_POSTFIELDS,json_encode(array()));
            //curl_setopt($ch, CURLOPT_ENCODING, '');

            // receive server response ...
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
                "Content-Type: application/json",
                'Content-Length: 0' )                                                                  
            );    
            

            $server_output = curl_exec($ch);
            //$error    = curl_error($ch);
            //$errno    = curl_errno($ch);
            curl_close ($ch);
            $this->data = json_decode($server_output);
        }catch(Exception $e){
            die($e->getMessage());
        }
    }
    
    public function productStatus(){
        $this->callService($this->pStatus);
        foreach($this->data as $product){
            echo "<pre>";print_r($product);echo "</pre>";
            //$id_prod = Db::getInstance()->getValue("SELECT id_product FROM "._DB_PREFIX_."product WHERE reference = '".$product->referencia."'");
            /*if(!empty($id_prod)){
                
            }
            $combinations = Db::getInstance()->executeS("SELECT id_product,id_product_attribute,default_on FROM "._DB_PREFIX_."product_attribute WHERE reference = '".$product->referencia."'");
            if(!empty($combinations)){
                echo "<pre>";print_r($product);echo "</pre>";
                die(print_r($combinations));
            }*/
        }
    }
}
?>