<?php 
mb_internal_encoding("UTF-8");
set_time_limit(0);
ini_set('memory_limit','1024M');
include_once '../../config/config.inc.php';

class CargaProductos{
    private $totalProducts;
    public $fiveMin;
    private $pStatus;
    private $data;
    private $sinSaldo;
    
    public function __construct($five,$reg = false){
        $this->totalProducts = 'http://hercules.matisses.co:8280/WebIntegrator/webresources/iteminventario/consulta';
        $this->fiveMin = 'http://hercules.matisses.co:8280/WebIntegrator/webresources/iteminventario/consultaRecientes5M';
        $this->pStatus = 'http://hercules.matisses.co:8280/WebIntegrator/webresources/iteminventario/estado';
        $this->sinSaldo = 'http://hercules.matisses.co:8280/WebIntegrator/webresources/iteminventario/consultaSinSaldo';
        $this->data = array();
        if(!$five){
            $this->loadProcess($this->totalProducts);
        }
    }

    public function loadProcess($url){
        if($_GET['five']){
            $this->printLog('Proceso 5 minutos');
        }
        try{
            $this->callService($url);
            $auxData = array();
            //asociamos todas la ref a un modelo
            foreach ($this->data as $key => $value) {
                $auxData[$value->model][$value->itemCode] = $this->parseData($this->data[$key]);
            }
            $this->printLog('Termino de consultar los productos ('.count((array)$this->data).')');
            $p = $this->uploadProduct($auxData);
            //echo "<pre>";print_r($p); echo "</pre>"; exit();
            $this->printLog("Cambiando estados");
            $this->productStatus();
            //if($_GET['five']){
            $this->printLog("Indexando");
                foreach($p as $k){
                    Search::indexation(true,$k);
                }
            /*}else{
            }*/
                //Search::indexation(true);
            $this->printLog("Fin proceso");
        }catch(Exception $e){
             $this->printLog("Error: ". $e->getMessage());
        }
    }

    //Cargar la informacion de los prod de SAP
    public function uploadProduct($_References) {
        $product_ids = array();
        if(sizeof($_References)>0) {
            foreach($_References as $_Model => $_Combinations) {
                
                unset($_Product);
                if(count($_Combinations[key($_Combinations)]->subgroupCode) > 0){
                    $_IdProduct = Db::getInstance()->getValue('SELECT id_product FROM '._DB_PREFIX_.'product WHERE model = "'.$_Model.'"');
                    if(!empty($_IdProduct))
                        array_push($product_ids, $_IdProduct);
                    
                    $_Product   = $this->__setProduct($_Combinations,$_IdProduct);
                    /*if($banderaPost){
                        Search::indexation(true,$_IdProduct);
                    }*/
                    $this->setCombinations($_Combinations,$_Product);
                }else{
                    $this->printLog('-- Actualizando producto ('.$_Combinations[key($_Combinations)]->itemCode.'): '." -> No se cargó, no existe la categoria."."\n");
                }
                unset($_References[$_Model]);
            }
            return $product_ids;
        }else{
            //$this->printLog('SERVICIO SAP INACTIVO ---------------------------------------'."\n");
            $this->printLog('No se caragon productos. El servicio retorno 0 resultados');
        }
    }

    function __setProduct($_Combinations,$_IdProduct){
        try{
            unset($_Product);
            unset($_ProductData);
            $_Quantity      = 0;
            $_Available_now = array();
            $_DateNew       = array();
            $_Categories    = array();
            $_processImages = false;
            
            //extraigo referencia del producto para los datos principales
            $_Product = new Product($_IdProduct,false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT'));
            /*echo "<pre>";print_r($_Product->model); echo "</pre>";
            echo "<pre>";print_r($_Combinations); echo "</pre>";
            exit();*/
            //$_ProductData = is_array($_Combinations[$_Product->model]) ? $_Combinations[$_Product->model] : current($_Combinations);
            $_ProductData = current($_Combinations);

            // extraigo la informacion necesaria de todas las combinaciones
            unset($featuresmaterials);
            $featuresmaterials = array();
            foreach($_Combinations as $k => $_Combination) {
                $_Quantity          += $_Combination->stock->quantity;
                
                $_Available_now[]   =  $_Combination->stock->warehouseCode;
                
                if($_Combination->newFrom)
                    $_DateNew[]         = $_Combination->newFrom;
                
                if($_Combination->subgroupCode) {
                    foreach($_Combination->subgroupCode as $d => $_Category)
                        array_push($_Categories, $_Category);
                }
                
                if(is_array($_Combination->processImages))
                    $_processImages = true;
                
                
                foreach($_Combination->arraymaterials as $km => $material)
                    $featuresmaterials[$km] =   $material;

            }
            // cargo las caracteristicas            
            $_Product->name                 = $_ProductData->itemName;
            $_Product->reference            = $_ProductData->itemCode;
            $_Product->itemname             = $_ProductData->itemName;
            $_Product->price                = $_ProductData->price;
            $_Product->description          = $_ProductData->description;
            $_Product->meta_keywords        = $_ProductData->keyWords;
            $_Product->link_rewrite         = $_ProductData->link_rewrite;
            $_Product->model                = $_ProductData->model;
            $_Product->id_category_default  = $_ProductData->id_category_default;
            $_Product->description_short    = $_ProductData->shortDescription;
            $_Product->meta_description     = $_ProductData->meta_description;
            $_Product->meta_title           = $_ProductData->meta_title;
            $_Product->cuidados             = $_ProductData->materials;
    
            $_Product->video                = $_ProductData->video;
            $_Product->sketch               = $_ProductData->sketch;
            $_Product->three_sixty          = $_ProductData->three_sixty;
            $_Product->date_new             = sizeof($_DateNew)>0 ? max($_DateNew) : NULL;
            $_Product->quantity             = $_Quantity;
            $_Product->stores               = implode(',',array_unique(array_filter($_Available_now)));
            $_Product->available_now        = '';
            $_Product->active               = ($_ProductData->status)?true:false;
            $_Product->redirect_type        = '404';
            $_Product->ean13                = '0';
            
            $_Product->id_manufacturer = $_ProductData->manufacture['id_manufacturer'];
            
            if(!$_Product->link_rewrite)
                $_Product->link_rewrite = Tools::link_rewrite(trim($_Product->name));
            
            if(sizeof($_Categories)>0)
                $_Product->id_category_default = end($_Categories);
    
            if($_Product->id) {
                $_Product->update();
                //$this->printLog('Referencia: '.$_Product->reference." Id ".$_Product->id." - ACTUALIZADO");
            }else{
                $_Product->add();
                //$this->printLog('Referencia: '.$_Product->reference." Id ".$_Product->id." - CREADO");
            }
             
            if($_processImages)
                $_Product->deleteImages();            
                         
            if($_Product->id) {
                if(sizeof($_Categories)>0) {
                    $_Product->deleteCategories(true);
                    $_Product->addToCategories(array_unique(array_filter($_Categories)));
                }
                // proceso las featurematerial
                if(sizeof($featuresmaterials)>0) {
                    foreach($featuresmaterials as $fk => $material) {
                        unset($featurename);
                        $featurename = 'material_'.$fk;
                        $id_feature = Db::getInstance()->getValue('SELECT id_feature FROM '._DB_PREFIX_.'feature_lang WHERE name ="'.$featurename.'"');
                        $Feature = new Feature(($id_feature ? $id_feature : 1));
                        if($id_feature) {
                            $Feature->name[(int)Configuration::get('PS_LANG_DEFAULT')] =  $featurename;
                            $Feature->update();
                        }else{
                                $Feature->name[(int)Configuration::get('PS_LANG_DEFAULT')] =  $featurename;
                                $Feature->add();
                             }
                        $id_feature = Db::getInstance()->getValue('SELECT id_feature FROM '._DB_PREFIX_.'feature_lang WHERE name ="'.$featurename.'"');
                        $FeatureValues = FeatureValue::getFeatureValues($id_feature);
                        if(sizeof($FeatureValues)==0) {
                            $FeatureVal = new FeatureValue(1);
                            $FeatureVal->id_feature = $id_feature;
                            $FeatureVal->value[(int)Configuration::get('PS_LANG_DEFAULT')] = mb_strtoupper(substr($material,0,1)).mb_strtolower(substr($material,1,strlen($material))); 
                            $FeatureVal->add();
                        }else{
                            $FeatureVal = new FeatureValue(1);
                            $FeatureVal->id_feature = $id_feature;
                            $FeatureVal->value[(int)Configuration::get('PS_LANG_DEFAULT')] = mb_strtoupper(substr($material,0,1)).mb_strtolower(substr($material,1,strlen($material))); ; 
                            $FeatureVal->update();
                        }
                        Db::getInstance()->Execute('DELETE FROM '._DB_PREFIX_.'feature_value_lang WHERE id_feature_value = 0');
                        $id_feature = Db::getInstance()->getValue('SELECT id_feature FROM '._DB_PREFIX_.'feature_lang WHERE name ="'.$featurename.'"');
                        $FeatureValues = FeatureValue::getFeatureValues($id_feature);
                        $_Product->addFeatureProductImport($_Product->id,$FeatureValues[0]['id_feature'],$FeatureValues[0]['id_feature_value']);                             
                    }
                }
            }
        }catch (Exception $e) {
            $this->printLog('---- Product error: itemCode: '.$_Product->reference.' id_product: '.$_Product->id.' '.$e->getMessage()." \n");
        }   
        return $_Product;
    }

    public function setCombinations($_Combinations,$_Product) {
        $_currentCombinations = array();
        foreach($_Combinations as $d => $_Combination) {
            try{
                /*if(!$_Combination->processImages && $_Product->getCombinationImages(1))
                     continue;*/
                // verifico si la combinacion esta para cambio de modelo
                $_currentCombinations[] = $_Combination->itemCode;
                $id_product_attribute = Db::getInstance()->getValue('SELECT id_product_attribute FROM '._DB_PREFIX_.'product_attribute WHERE reference = "'.$_Combination->itemCode.'" and id_product = 0');
                if($id_product_attribute)
                {
                    Db::getInstance()->execute('UPDATE '._DB_PREFIX_.'product_attribute SET id_product = '.$_Product->id.' 
                                                WHERE id_product_attribute = '.$id_product_attribute.' 
                                                    and id_product = 0');   
                }
                
                unset($id_product_attribute);
                $id_product_attribute   = Db::getInstance()->getValue('SELECT id_product_attribute FROM '._DB_PREFIX_.'product_attribute WHERE reference = "'. $_Combination->itemCode.'" and id_product = '.$_Product->id);
                $default                = $_Combination->mainCombination;
                $images                 = ($_Combination->processImages ? $this->setImages($_Combination->processImages,$_Product) : array());
                
                if($id_product_attribute)
                {
                    $_Product->updateAttribute($id_product_attribute,
                                                0,
                                                0,
                                                NULL,
                                                NULL,
                                                NULL,
                                                $images,
                                                $_Combination->itemCode,
                                                '0',//ean13
                                                $default,
                                                NULL,
                                                NULL,
                                                NULL,
                                                '0000-00-00',
                                                true,
                                                array(),
                                                $_Combination->itemName,
                                                utf8_decode($_Combination->shortDescription));
                    
                    Db::getInstance()->update(
                                        'product_attribute_combination', 
                                        array('id_attribute' => (int) $_Combination->color['id_attribute']), 
                                        'id_product_attribute = '.(int)$id_product_attribute
                                    );
                    
                                    
                    // teindas disponibles por combinacion
                    Db::getInstance()->update('product_attribute', 
                                        array('available' => $_Combination->stock->warehouseCode,
                                             'garantias'=> addslashes($_Combination->materials),
                                              'itemname'=> addslashes($_Combination->itemName),
                                              'short_description'=> addslashes($_Combination->shortDescription),
                                              'description'=> addslashes($_Combination->description) 
                                        ), 
                                        'id_product_attribute = '.(int)$id_product_attribute
                                    );
                    
                }else{
                        $id_product_attribute = $_Product->addAttribute(0,
                                                                        NULL,
                                                                        NULL,
                                                                        NULL,
                                                                        $images,
                                                                        $_Combination->itemCode,
                                                                        NULL,
                                                                        $default,
                                                                        NULL,
                                                                        NULL,
                                                                        1,
                                                                        array(),
                                                                        '0000-00-00',
                                                                        $_Combination->itemName,
                                                                        utf8_decode($_Combination->shortDescription)
                                                                        );
                        
                        $attributes_list = array(
                                        'id_product_attribute'  => (int)$id_product_attribute,
                                        'id_attribute'          => (int)$_Combination->color['id_attribute'],
                                    );
    
                        Db::getInstance()->insert('product_attribute_combination', $attributes_list);
                        // teindas disponibles por combinacion
                        Db::getInstance()->update('product_attribute', 
                                        array('available' => $_Combination->stock->warehouseCode,
                                              'garantias'=> $_Combination->materials,
                                              'itemname'=> $_Combination->itemName,
                                              'short_description'=> $_Combination->shortDescription,
                                              'description'=> $_Combination->description
                                             ), 
                                        'id_product_attribute = '.(int)$id_product_attribute
                                    );
                     }
     
                StockAvailable::setQuantity($_Product->id,$id_product_attribute,(int)$_Combination->stock->quantity);
                
                //precios especificos
                
                $spid=SpecificPrice::getIdsByProductId($_Product->id,$id_product_attribute);
                $spid=$spid[0]['id_specific_price'];
                
                if($spid)
                {
                    $SpecificPrice = new SpecificPrice($spid);
                    $SpecificPrice->price       = $_Combination->price;   
                    $SpecificPrice->reduction   = 0;
                    $SpecificPrice->update();
                }else{
                    $SpecificPrice = new SpecificPrice();
                    $SpecificPrice->id_product              = $_Product->id;
                    $SpecificPrice->id_specific_price_rule  = 0;
                    $SpecificPrice->id_cart                = 0;
                    $SpecificPrice->id_product_attribute    = $id_product_attribute;
                    $SpecificPrice->id_shop                 = (int)Context::getContext()->shop->id;
                    $SpecificPrice->id_shop_group           = Context::getContext()->shop->id_shop_group;
                    $SpecificPrice->id_currency             = 0;
                    $SpecificPrice->id_country              = 0;
                    $SpecificPrice->id_group                = 0;
                    $SpecificPrice->id_customer             = 0;
                    $SpecificPrice->price                   = $_Combination->price;                   
                    $SpecificPrice->from_quantity           = 1;
                    $SpecificPrice->reduction               = 0;
                    $SpecificPrice->reduction_type          = 'percentage';
                    $SpecificPrice->from                    = date('Y-m-d H:i:s',time());
                    $SpecificPrice->to                      = date('Y-m-d H:i:s',strtotime('+1 year'));
                    $SpecificPrice->add();
                 }  
                //$this->printLog('---- Combinacion : '.$_Combination->itemCode." \n");   
            }catch (Exception $e) {
                $this->printLog('---- Combinacion error: itemCode: '.$_Combination->itemCode.' id_product: '.$_Product->id.' id_product_attribute: '.$id_product_attribute.' '.$e->getMessage()." \n"); 
            }
        }
        
        /*if(!empty($_GET['five']) && !$_GET['five']){
            if(sizeof($_currentCombinations)>0)
                Db::getInstance()->execute('UPDATE '._DB_PREFIX_.'product_attribute SET id_product = 0 WHERE id_product = '.$_Product->id.' AND reference not in ("'.implode('","',$_currentCombinations).'")');
        }*/
        
        return true;
    }
    
    
    public function setImages($_Images,$_Product){
        if(sizeof($_Images)>0)
        {
            foreach($_Images as $d => $v)
            {   
                try{
                        $image = new Image();
                        $image->id_product  = (int)($_Product->id);
                        $image->position    = Image::getHighestPosition((int)($_Product->id)) + 1;
                        $image->cover       = !Image::getCover($image->id_product) ? 1 : 0;
                        if($image->add())
                        {
                            $image          = new Image($image->id);
                            $new_path       = $image->getPathForCreation();
                            ImageManager::resize($v, $new_path.'.'.$image->image_format);
                            $imagesTypes    = ImageType::getImagesTypes('products');
                            foreach ($imagesTypes as $imageType)
                            {
                                ImageManager::resize($v, $new_path.'-'.stripslashes($imageType['name']).'.'.$image->image_format, $imageType['width'], $imageType['height'], $image->image_format);
                            }
                            $_IdImages[$d] = $image->id;
                            //verifico que todas las imagenes se hallan cargado
                            foreach($imagesTypes as $dd => $vv)
                            {
                                if(!file_exists(_PS_ROOT_DIR_._THEME_PROD_DIR_.$image->getImgFolderStatic($image->id).$image->id.'-'.$imagesTypes[$dd]['name'].'.jpg'))
                                    $image->delete();   
                            }
                        }
                }catch (Exception $e) {
                    __MessaggeLog('---- Images error: itemCode: '.$_Product->reference.' id_product: '.$_Product->id.' id_product_attribute: '.$e->getMessage()." \n"); 
                }       
            }
            return $_IdImages;
        }
    }

    //consultar imagenes,categorias,colores y asociarlos a los prod de SAP
    private function parseData($_data){
        try{
            if($_data->description && $_data->shortDescription && $_data->price && $_data->itemName && $_data->model && $_data->subgroupCode && count((array)$_data->color)==3) {

                $path = dirname(__FILE__).'/files/'.$_data->itemCode;

                $_data->webName = str_replace(' ','-',strtolower($_data->itemName));
                $materials  = $_data->materials;
                if(!$this->countIsArrayObj($_data->materials)){
                    unset($_data->materials);
                    $_data->materials[] = $materials; 
                }

                $stock = $_data->stock;
                if(!$this->countIsArrayObj($_data->stock)){
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

                $_data->manufacture = $this->saveManufacture($_data->brand->code,$_data->brand->name);

                if($_data->newFrom) {
                    $date = explode('-',date('Y-m-d',$_data->newFrom/1000));
                    if(checkdate ( $date[1] , $date[2] , $date[0] ))
                        $_data->newFrom   = date('Y-m-d',$_data->newFrom/1000);
                }

                if(sizeof($_data->materials)>0) {
                    $cares = "";
                    $arraymaterials = array();
                    foreach($_data->materials as $d => $v) {
                        $arraymaterials[$v->code] =  $v->name;
                        if($_data->materials[$d]->name)
                            $cares.= '<h3>'.$_data->materials[$d]->name.'</h3>';

                        $cares.= '<p>'.$_data->materials[$d]->cares.'</p><br>';
                    }
                    $_data->materials = $cares;
                    $_data->arraymaterials = $arraymaterials;
                }

                if(sizeof($stock)>0) {
                    $quantity = 0;
                    $WarehouseCode = array();
                    foreach($stock as $d => $v) {
                        $quantity+= (int)$stock[$d]->quantity;
                        array_push($WarehouseCode,$stock[$d]->warehouseCode);
                    }
                    unset($_data->stock);
                    $_data->stock = (object)array(
                        'quantity'=>$quantity,
                        'warehouseCode'=>implode(',',array_unique(array_filter($WarehouseCode)))
                    );
                }
                $_data->status = ((int)$_data->stock->quantity)?true:false;//validamos la cantidad para validar el status

                if(!empty($_data->subgroupCode)) {
                    $CategoriesProduct = array();
                    $sql = 'SELECT id_category 
                        FROM ' . _DB_PREFIX_ . 'category
                        WHERE LENGTH( subgrupo ) =11 and (subgrupo like "%'.$_data->subgroupCode.'" )
                        GROUP BY id_category'; 

                    $Categories = Db::getInstance()->ExecuteS($sql);

                    foreach($Categories as $d => $v){
                        $c = new Category((int)$Categories[$d]['id_category']);          
                        $pCategories = $c->getParentsCategories(1);
                        $i = 0;
                        while($pCategories[$i]['level_depth'] > 2){
                            array_push($CategoriesProduct,$pCategories[$i]['id_category']);
                            $i++;
                        }
                    }  
                    unset($_data->subgroupCode);  
                    $_data->subgroupCode = $CategoriesProduct;        
                }
                if((int)$_data->processImages){
                    unset($images);
                    if(sizeof($images = glob($path.'/images/*.jpg'))>0) {
                        foreach($images as $dd => $image) {
                            if(filesize($image)>Configuration::get("PS_PRODUCT_PICTURE_MAX_SIZE") || (substr($image, -27,20) != $_data->itemCode)){
                                unset($images[$dd]);
                            }elseif((substr($image, -27,20) != $_data->itemCode)){
                                $this->printLog('La ref => '.$_data->itemCode.' NO coincide con las imagenes.');
                            }
                        }
                        $_data->processImages = $images;
                    }else{
                        $this->printLog('La ref => '.$_data->itemCode.' NO tiene imagenes en el directorio');
                    }
                }

                if($_data->color->code) {
                    unset($color);
                    $color =  Db::getInstance()->getRow("SELECT * FROM "._DB_PREFIX_."attribute WHERE id_sap='".$_data->color->code."'");
                    if(sizeof($color)>1) {
                        $Attribute  = new Attribute($color['id_attribute'],(int)Configuration::get('PS_LANG_DEFAULT'), (int)Configuration::get('PS_SHOP_DEFAULT'));
                        $name = $_data->color->name ? $_data->color->name : $Attribute->name;
                        $name = mb_strtoupper(substr($name,0,1)).mb_strtolower(substr($name,1));
                        $Attribute->id_attribute_group = 3;
                        $Attribute->color   =  ($_data->color->hexa && strlen($_data->color->hexa)==6) ? '#'.strtoupper($_data->color->hexa) : $color['color'];
                        $Attribute->name    = $name;
                        $Attribute->id_sap  = $color['id_sap'];
                        $Attribute->update();
                        $_data->color  = $color;
                    }else{
                        $time = time();
                        $Attribute  = new Attribute($color->id_attribute,(int)Configuration::get('PS_LANG_DEFAULT'), (int)Configuration::get('PS_SHOP_DEFAULT'));
                        $name = $_data->color->name ? $_data->color->name : 'Color temporal';
                        $name = mb_strtoupper(substr($name,0,1)).mb_strtolower(substr($name,1));
                        $Attribute->id_attribute_group = 3;
                        $Attribute->name    = pSQL($name);
                        $Attribute->color   = ($_data->color->hexa && strlen($_data->color->hexa)==6) ? '#'.strtoupper($_data->color->hexa) : '#FFFFFF';
                        $Attribute->id_sap  = $_data->color->code ? $_data->color->code : time();
                        $Attribute->add();
                        $_data->color  = Db::getInstance()->getRow("SELECT * FROM "._DB_PREFIX_."attribute WHERE id_sap='".$Attribute->id_sap."'");;
                    }
                }
            }else{
                $this->printLog("El producto con REF => ".$_data->itemCode.' No se pudo cargar. Posiblemente no tiene precio,descripción, color etc...');
                $_data = NULL;
            }
            return $_data;
        }catch(Exception $e){
             $this->printLog("Error : ".$e->getMessage());
        }
    }

    /*Creación de la marca en casi no existir
    * $brandcode => brand code of matisses
    * $nameBrand => brand name
    */
    public function saveManufacture($brandcode,$brandName){
        try{
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
        }catch(Exception $e){
            $this->printLog("Error : ".$e->getMessage());
        }
    }

    public function countIsArrayObj($value){
        return (int)count(array_filter($value,'is_object'));
    }
    
    public function loadProductByReference($ref){
        $this->callService($this->totalProducts,array($ref));
        $auxData = array();
        //asociamos todas la ref a un modelo
        foreach ($this->data as $key => $value) {
            $auxData[$value->model][$value->itemCode] = $this->parseData($this->data[$key]);
        }
        $this->printLog('Termino de consultar los productos ('.count((array)$this->data).')');
        $p = $this->uploadProduct($auxData);
        if(count($p) > 0)
            return true;
        else 
            return false;
    }
    
    public function loadProductByReferenceWithoutStock($ref){
        $this->callService($this->sinSaldo,$ref);
        $auxData = array();
        //asociamos todas la ref a un modelo
        foreach ($this->data as $key => $value) {
            $auxData[$value->model][$value->itemCode] = $this->parseData($this->data[$key]);
        }
        $this->printLog('Termino de consultar los productos ('.count((array)$this->data).')');
        $p = $this->uploadProduct($auxData);
        if(count($p) > 0)
            return true;
        else 
            return false;
    }

    public function callService($url,$params = array()){
        try{
            $ch = curl_init();

            curl_setopt($ch, CURLOPT_URL,$url);
            curl_setopt($ch, CURLOPT_POST, true);
            if(count($params) > 0)
                curl_setopt($ch,CURLOPT_POSTFIELDS,json_encode($params));
            //curl_setopt($ch, CURLOPT_ENCODING, '');

            // receive server response ...
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
                "Content-Type: application/json",
            )                                                                  
            );    
            

            $server_output = curl_exec($ch);
            //echo $server_output;
            //$error    = curl_error($ch);
            //$errno    = curl_errno($ch);
            curl_close ($ch);
            $this->data = json_decode($server_output);
        }catch(Exception $e){
            $this->printLog($e->getMessage());
            exit();
        }
    }
    
    public function productStatus(){
        try{
            $this->callService($this->pStatus);
            $active = "";
            $inactive = "";
            $stockid = "";
            foreach($this->data as $product){
                $sql = "SELECT a.id_product,a.id_product_attribute,COUNT(d.id_image) as images,c.reference as product,a.reference as attribute  
                FROM "._DB_PREFIX_."product_attribute a 
                LEFT JOIN "._DB_PREFIX_."product_attribute_image d on a.id_product_attribute = d.id_product_attribute
                INNER JOIN "._DB_PREFIX_."product c ON a.id_product = c.id_product
                WHERE a.reference ='".$product->referencia."'";
                $id_prod = Db::getInstance()->getRow($sql);
                if($id_prod){
                    if((int)$product->activo){
                        if($id_prod['images'] > 0)
                            $active .= !empty($id_prod['id_product']) ? $id_prod['id_product']."," : "";
                        else{
                            if($id_prod['product'] != $id_prod["attribute"]){
                                $stockid .= StockAvailable::getStockAvailableIdByProductId((int)$id_prod['id_product'], (int)$id_prod['id_product_attribute'], 1).",";
                            }
                            else
                                $inactive .= !empty($id_prod['id_product']) ? $id_prod['id_product']."," : "";
                        }
                    }else{
                        if($id_prod['product'] != $id_prod["attribute"])
                            $stockid .= StockAvailable::getStockAvailableIdByProductId((int)$id_prod['id_product'], (int)$id_prod['id_product_attribute'], 1).",";
                        else
                            $inactive .= !empty($id_prod['id_product']) ? $id_prod['id_product']."," : "";
                    }
                }
            }
            
            $query = "UPDATE "._DB_PREFIX_."stock_available  SET quantity = 0 WHERE id_stock_available IN (".rtrim($stockid,",").")";
            Db::getInstance()->execute($query);
            $query = "UPDATE "._DB_PREFIX_."product SET active = 0 WHERE id_product IN (".rtrim($inactive,",").")";
            $query2 = str_replace(_DB_PREFIX_."product",_DB_PREFIX_."product_shop",$query);
            Db::getInstance()->execute($query);
            Db::getInstance()->execute($query2);
            $query = "UPDATE "._DB_PREFIX_."product SET active = 1 WHERE id_product IN (".rtrim($active,",").")";
            $query2 = str_replace(_DB_PREFIX_."product",_DB_PREFIX_."product_shop",$query);
            Db::getInstance()->execute($query);
            Db::getInstance()->execute($query2);
        }catch(Exception $e){
            $this->printLog("Error: ". $e->getMessage());
        }
    }
    
    public function printLog($message,$show = false){
        try{
            @unlink("log".date("y_m_d").strtotime('-1 day'));
            $log = fopen("log".date("y_m_d"), "a+");
            fwrite($log, "------- " . strtoupper($message) . " ------> ". date("H:i:s") . PHP_EOL);
            fclose($log);
        }
        catch(Exception $e){
            echo $e->getMessage();
        }
        if($show)
            echo "------- " . strtoupper($message) . " ------> ". date("H:i:s") . "<br>";
    }
}
?>