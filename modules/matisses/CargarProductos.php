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
        $this->loadProcess();
    }
    
    private function loadProcess(){
        $this->callService($this->totalProducts);
        $auxData = array();
        //asociamos todas la ref a un modelo
        foreach ($this->data as $key => $value) {
            $auxData[$value->model][$value->itemCode] = $this->parseData($this->data[$key]);
        }
        
        echo "<pre>";print_r($auxData); echo "</pre>";        
    }

    private function parseData($_data){
        if($_data->description && $_data->shortDescription && $_data->price && $_data->itemName && $_data->model && $_data->subgroupCode && count((array)$_data->color)==3) {

            $path = dirname(__FILE__).'/files/'.$_data->itemCode;

            $_data->webName = str_replace(' ','-',strtolower($_data->itemName));
            $materials  = $_data->materials;
            if(!$this->countIsArray($_data->materials)){
                unset($_data->materials);
                $_data->materials[] = $materials; 
            }
            //print_r($_data->stock);
            /*echo $this->countIsArray($_data->materials).'<br>';
            echo $this->countIsArray($_data->stock).'<br>';*/
            $stock = $_data->stock;
            if(!$this->countIsArray($_data->stock)){
                unset($_data->stock);
                $_data->stock[] = $stock;
            }

            $_data->itemName = ucfirst(strtolower($_data->itemName));
            $_data->color->name = strtolower($_data->color->name);
            $_data->sketch = basename(current(glob($path.'/plantilla/*.jpg')));
            $_data->three_sixty = strstr($_data->itemCode.'/360/'.basename(current(glob($path.'/360/*.html'))),'.html') ? $_data->itemCode.'/360/'.basename(current(glob($path.'/360/*.html'))) : NULL;
            $_data->keyWords = strtolower(pSQL(implode(',',array_unique(array_filter(explode(' ',$_data->keyWords))))));
            $_data->link_rewrite = Tools::link_rewrite($_data->webName);
            $_data->id_category_default = (int)Configuration::get('PS_HOME_CATEGORY');
            $_data->shortDescription = Tools::truncate(($_data->shortDescription),190,'...');
            $_data->meta_description = Tools::truncate(($_data->shortDescription),130,'...');
            $_data->meta_title = $_data->itemName;
            $_data->video =  strstr($_data->itemCode.'/animacion/'.basename(current(glob($path.'/animacion/*.html'))),'.html') ? $_data->itemCode.'/animacion/'.basename(current(glob($path.'/animacion/*.html'))) : NULL;
        
            //$_data->manufacture = saveManufacture($_data->brand->code,$_data->brand->name);
        }else{
            echo "El producto con REF => ".$_data->itemCode.' No se pudo cargar. Posiblemente no tiene precio,descripción, color etc...';
        }
        return $_data;
    }

    /*Creación de la marca en casi no existir
    * $brandcode => brand code of matisses
    * $nameBrand => brand name
    */
    function saveManufacture($brandcode,$brandName){
        $row = Db::getInstance()->getRow('SELECT * FROM '._DB_PREFIX_.'manufacturer WHERE brandcode ="'.trim($brandcode).'"');
        
        if(!$row['id_manufacturer']){
            Db::getInstance()->Execute('INSERT INTO '._DB_PREFIX_.'manufacturer VALUES (null,"'.$brandName.'",
            "'.date('Y-m-d H:i:s').'", "'.date('Y-m-d H:i:s').'",1,"'.$brandcode.'")');
 
            $row = Db::getInstance()->getRow('SELECT *,MAX(id_manufacturer) id_last FROM '._DB_PREFIX_.'manufacturer GROUP BY id_manufacturer DESC');

            $attributes_list = array(
                'id_manufacturer' => $row['id_last'],
                'id_lang' => 1
            );

            Db::getInstance()->insert('manufacturer_lang', $attributes_list);

            Db::getInstance()->insert('manufacturer_shop', array('id_manufacturer' => $row['id_last'],'id_shop'=>1));
        }
        
        return $row;        
    }

    public function countIsArray($value){
        return count(array_filter($value,'is_array'));
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