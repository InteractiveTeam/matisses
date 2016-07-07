<?php
	/*
		@Author: 		Sebas Castano
		@date: 			mar-2015
		@description:	Sonda para la carga de productos sap - prestashop
			
	*/

	session_start();
	mb_internal_encoding("UTF-8");
	set_time_limit(0);
	ini_set('memory_limit','1024M');
	$print 			= true;
	
	include_once dirname(__FILE__).'/../../config/config.inc.php';
	require_once dirname(__FILE__)."/classes/nusoap/nusoap.php";
	require_once dirname(__FILE__)."/matisses.php";
	
	//if(Configuration::get('ax_simpleproduct_data')!='')
	//	$_Modelos		= Tools::jsonDecode(Configuration::get('ax_simpleproduct_data'),true);
	
	//define('_PS_MODE_DEV_', false);
	$_wsmatisses 	= new matisses;
	$_Modelos = null;
	__MessaggeLog('---------------------------------------------------------------------------------------------------------------'."\n");
	__MessaggeLog("INICIA PROCESO ".date('H:i:s')." - ".$time."\n");
	__MessaggeLog('---------------------------------------------------------------------------------------------------------------'."\n");
    
	// Consulto las referencias
	unset($_SESSION['REFERENCES']);
	unset($_References);
	__MessaggeLog('---- Consultando Referencias Inicio: '.date('H:i:s')."\n");
    

    $banderaPost = false;
    $searchExist = false;
    if(isset($_POST['modelo']) && $_POST['modelo'] != ""){
        
        $_Modelos = getProductsByModel($_POST['modelo']);
        $banderaPost = true;
        if(sizeof($_Modelos)<1){
            echo 'NO MODELS';
            exit();
        }
        print_r($_POST);
        print_r($_Modelos);
    } 
    
    if (isset($modeloSAP) && !empty($modeloSAP)) {
        $searchExist = true;
        $_Modelos = getProductsByModel($modeloSAP, $searchExist);
        $banderaPost = true;
        
        if(sizeof($_Modelos)<1){
            echo 'NO MODELS';
            exit();
        }
    }
    
	$_References    = __getReferences($_Modelos,$banderaPost,$searchExist);
	/*if(Configuration::get('ax_simpleproduct_data')=='')	{
		$ModelsExists = implode('","',array_keys($_References));
		Db::getInstance()->Execute('UPDATE  '._DB_PREFIX_.'product SET active = 0 WHERE id_product NOT IN ("'.$ModelsExists.'")');
		Db::getInstance()->Execute('UPDATE  '._DB_PREFIX_.'product_shop SET active = 0 WHERE id_product NOT IN ("'.$ModelsExists.'")');
	}*/
	
	
	
	Configuration::updateValue('ax_simpleproduct_data','');
	__MessaggeLog('---- Referencias Consultadas Fin: '.date('H:i:s')."\n");
	
	__MessaggeLog('---------------------------------------------------------------------------------------------------------------'."\n");
	__MessaggeLog('PRODUCTOS A CARGAR = '.count($_References)."\n");
	__MessaggeLog('---------------------------------------------------------------------------------------------------------------'."\n");
	// cargo los productos
	
	if(sizeof($_References)>0)
	{
        echo "<pre>";print_r($_References); echo "</pre>";
		foreach($_References as $_Model => $_Combinations)
		{
			unset($_Product);
			$_IdProduct = Db::getInstance()->getValue('SELECT id_product FROM '._DB_PREFIX_.'product WHERE model = "'.$_Model.'"');
			__MessaggeLog('---------------------------------------------------------------'.date('H:i:s')."\n");
			__MessaggeLog('-- Actualizando producto ('.$_Model.'): '.date('H:i:s')." ");
			$_Product 	= __setProduct($_Combinations,$_IdProduct);
			
			__setCombinations($_Combinations,$_Product);
			unset($_References[$_Model]);
		}
	}else{
        __MessaggeLog('SERVICIO SAP INACTIVO ---------------------------------------'."\n");
     }

	Configuration::updateValue('ax_simpleproduct_data','');
	__MessaggeLog('---------------------------------------------------------------------------------------------------------------'."\n");
	__MessaggeLog("TERMINA PROCESO ".date('H:i:s')." - ".$time."\n");
	__MessaggeLog('---------------------------------------------------------------------------------------------------------------'."\n");
	
	
	Db::getInstance()->Execute('UPDATE  '._DB_PREFIX_.'product SET active = 0 WHERE id_product NOT IN (select id_product from  '._DB_PREFIX_.'image group by id_product)');
	Db::getInstance()->Execute('UPDATE  '._DB_PREFIX_.'product_shop SET active = 0 WHERE id_product NOT IN (select id_product from  '._DB_PREFIX_.'image group by id_product)');

	Db::getInstance()->Execute('
		update '._DB_PREFIX_.'product_attribute set default_on = 1 where reference in (
			select x.reference from (
			SELECT id_product, SUM( default_on ) as defaults 
			FROM  `'._DB_PREFIX_.'product_attribute` 
			WHERE 1 
			GROUP BY id_product) as a
			INNER JOIN '._DB_PREFIX_.'product as x
				on a.id_product = x.id_product
			where a.defaults = 0 
			);
	');
	
	Search::indexation(true);
    
    /*if($banderaPost){
        return 'ok';
        exit();
    }*/

	$_success = Module::displayConfirmation('Carga completa!!');
    
	if(sizeof($_Modelos)==0)
		exit;
		
	function __setCombinations($_Combinations,$_Product)
	{
        
		$_currentCombinations = array();
		foreach($_Combinations as $d => $_Combination)
		{
			try{
                    if(!$_Combination['processImages'] && $_Product->getCombinationImages(1))
                         //continue;
					// verifico si la combinacion esta para cambio de modelo
					$_currentCombinations[] = $_Combination['itemCode'];
					$id_product_attribute = Db::getInstance()->getValue('SELECT id_product_attribute FROM '._DB_PREFIX_.'product_attribute WHERE reference = "'.$_Combination['itemCode'].'" and id_product = 0');
					if($id_product_attribute)
					{
						Db::getInstance()->execute('UPDATE '._DB_PREFIX_.'product_attribute SET id_product = '.$_Product->id.' 
													WHERE id_product_attribute = '.$id_product_attribute.' 
														and id_product = 0');	
					}
					
					unset($id_product_attribute);
					$id_product_attribute 	= Db::getInstance()->getValue('SELECT id_product_attribute FROM '._DB_PREFIX_.'product_attribute WHERE reference = "'.$_Combination['itemCode'].'" and id_product = '.$_Product->id);
					$default				= $_Combination['mainCombination'];
					$images 			  	= ($_Combination['processImages'] ? __setImages($_Combination['processImages'],$_Product) : array());
					
					if($id_product_attribute)
					{
									
						$_Product->updateAttribute($id_product_attribute,
													0,
													0,
													NULL,
													NULL,
													NULL,
													$images,
													$_Combination['itemCode'],
													$ean13,
													$default,
													NULL,
													NULL,
													NULL,
													'0000-00-00',
													true,
													array(),
													$_Combination['itemName'],
													utf8_decode($_Combination['shortDescription']));
						
						Db::getInstance()->update(
											'product_attribute_combination', 
											array('id_attribute' => (int) $_Combination['color']['id_attribute']), 
											'id_product_attribute = '.(int)$id_product_attribute
										);
										
						// teindas disponibles por combinacion				
						Db::getInstance()->update('product_attribute', 
											array('available' => $_Combination['stock']['WarehouseCode'],
                                                 'garantias'=> $_Combination['materials'],
                                                  'itemname'=> $_Combination['itemName'],
                                                  'short_description'=> $_Combination['shortDescription'] 
                                            ), 
											'id_product_attribute = '.(int)$id_product_attribute
										);
						
					}else{
							$id_product_attribute = $_Product->addAttribute(0,
																			NULL,
																			NULL,
																			NULL,
																			$images,
																			$_Combination['itemCode'],
																			NULL,
																			$default,
																			NULL,
																			NULL,
																			1,
																			array(),
																			'0000-00-00',
																			$_Combination['itemName'],
																			utf8_decode($_Combination['shortDescription'])
																			);
							
							$attributes_list = array(
											'id_product_attribute' 	=> (int)$id_product_attribute,
											'id_attribute' 			=> (int)$_Combination['color']['id_attribute'],
										);
		
							Db::getInstance()->insert('product_attribute_combination', $attributes_list);
							// teindas disponibles por combinacion
							Db::getInstance()->update('product_attribute', 
											array('available' => $_Combination['stock']['WarehouseCode'],
                                                  'garantias'=> $_Combination['materials'],
                                                  'itemname'=> $_Combination['itemName'],
                                                  'short_description'=> $_Combination['shortDescription']
                                                 ), 
											'id_product_attribute = '.(int)$id_product_attribute
										);
						 }
		 
					StockAvailable::setQuantity($_Product->id,$id_product_attribute,(int)$_Combination['stock']['quantity']);
					
					//precios especificos
					
					$spid=SpecificPrice::getIdsByProductId($_Product->id,$id_product_attribute);
					$spid=$spid[0]['id_specific_price'];
					
					if($spid)
					{
						$SpecificPrice = new SpecificPrice($spid);
						$SpecificPrice->price		= $_Combination['price'];	
						$SpecificPrice->reduction	= 0;
						$SpecificPrice->update();
		
					}else{
		
							$SpecificPrice = new SpecificPrice();
							$SpecificPrice->id_product				= $_Product->id;
							$SpecificPrice->id_specific_price_rule 	= 0;
							 $SpecificPrice->id_cart 				= 0;
							$SpecificPrice->id_product_attribute	= $id_product_attribute;
							$SpecificPrice->id_shop					= (int)Context::getContext()->shop->id;
							$SpecificPrice->id_shop_group			= Context::getContext()->shop->id_shop_group;
							$SpecificPrice->id_currency				= 0;
							$SpecificPrice->id_country				= 0;
							$SpecificPrice->id_group				= 0;
							$SpecificPrice->id_customer				= 0;
							$SpecificPrice->price					= $_Combination['price'];					
							$SpecificPrice->from_quantity			= 1;
							$SpecificPrice->reduction				= 0;
							$SpecificPrice->reduction_type			= 'percentage';
							$SpecificPrice->from					= date('Y-m-d H:i:s',time());
							$SpecificPrice->to						= date('Y-m-d H:i:s',strtotime('+1 year'));
							$SpecificPrice->add();
						 }	
					__MessaggeLog('---- Combinacion : '.$_Combination['itemCode']." \n");	
			}catch (Exception $e) {
				__MessaggeLog('---- Combinacion error: itemCode: '.$_Combination['itemCode'].' id_product: '.$_Product->id.' id_product_attribute: '.$id_product_attribute.' '.$e->getMessage()." \n");	
			}		
		}
		
		if(sizeof($_currentCombinations)>0)
			Db::getInstance()->execute('UPDATE '._DB_PREFIX_.'product_attribute SET id_product = 0 WHERE id_product = '.$_Product->id.' AND reference not in ("'.implode('","',$_currentCombinations).'")');
		
		
		return true;
	}
	
	
	function __setImages($_Images,$_Product)
	{
		//echo "<pre>"; print_r($_Images); echo "</pre>";
		if(sizeof($_Images)>0)
		{
			foreach($_Images as $d => $v)
			{	
				try{
						$image = new Image();
						$image->id_product 	= (int)($_Product->id);
						$image->position 	= Image::getHighestPosition((int)($_Product->id)) + 1;
						$image->cover		= !Image::getCover($image->id_product) ? 1 : 0;
						if($image->add())
						{
							$image 			= new Image($image->id);
							$new_path 		= $image->getPathForCreation();
							ImageManager::resize($v, $new_path.'.'.$image->image_format);
							$imagesTypes 	= ImageType::getImagesTypes('products');
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
	
	function __setProduct($_Combinations,$_IdProduct)
	{
		try{
			unset($_Product);
			unset($_ProductData);
			$_Quantity 		= 0;
			$_Available_now = array();
			$_DateNew		= array();
			$_Categories	= array();
			$_processImages	= false;
			
	
			//extraigo referencia del producto para los datos principales
			$_Product 		= new Product($_IdProduct,false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT'));
			$_ProductData 	= is_array($_Combinations[$_Product->model]) ? $_Combinations[$_Product->model] : current($_Combinations); 
			
			
			// extraigo la informacion necesaria de todas las combinaciones
	
			unset($featuresmaterials);
			$featuresmaterials = array();
			foreach($_Combinations as $k => $_Combination)
			{
				$_Quantity 			+= $_Combination['stock']['quantity'];
                
				$_Available_now[]	=  $_Combination['stock']['WarehouseCode'];
				
				if($_Combination['newFrom'])
					$_DateNew[]			= $_Combination['newFrom'];
				
				if($_Combination['subgroupCode'])
				{
					foreach($_Combination['subgroupCode'] as $d => $_Category)
						array_push($_Categories, $_Category);
				}
				
				if($_Combination['processImages']==1)
					$_processImages = true;
				
				
				foreach($_Combination['arraymaterials'] as $km => $material)
					$featuresmaterials[$km] = 	$material;

			}
			// cargo las caracteristicas
			
			
			//$_Product->name 				= $_ProductData['webName'];
			$_Product->name 				= $_ProductData['itemName'];
			$_Product->reference 			= $_ProductData['itemCode'];
			$_Product->itemname				= $_ProductData['itemName'];
			$_Product->price				= $_ProductData['price'];
			$_Product->description			= $_ProductData['description'];
			$_Product->meta_keywords		= $_ProductData['keyWords'];
			$_Product->link_rewrite 		= $_ProductData['link_rewrite'];
			$_Product->model				= $_ProductData['model'];
			$_Product->id_category_default	= $_ProductData['id_category_default'];
			$_Product->description_short	= $_ProductData['shortDescription'];
			$_Product->meta_description		= $_ProductData['meta_description'];
			$_Product->meta_title			= $_ProductData['meta_title'];
			$_Product->cuidados				= $_ProductData['materials'];
	
			$_Product->video				= $_ProductData['video'];
			$_Product->sketch				= $_ProductData['sketch'];
			$_Product->three_sixty			= $_ProductData['three_sixty'];
			$_Product->date_new				= sizeof($_DateNew)>0 ? max($_DateNew) : NULL;
			$_Product->quantity				= $_Quantity;
			$_Product->stores				= implode(',',array_unique(array_filter($_Available_now)));
			$_Product->available_now		= '';
            $_Product->active			    = ($_data['status'])?true:false;
			$_Product->redirect_type		= '404';
			$_Product->ean13				= '0';
            
            $_Product->id_manufacturer = $_ProductData['manufacture']['id_manufacturer'];
			
			if(!$_Product->link_rewrite)
				$_Product->link_rewrite = Tools::link_rewrite(trim($_Product->name));
			
			if(sizeof($_Categories)>0)
				$_Product->id_category_default = end($_Categories);
	
			if($_Product->id)
			{

				$_Product->update();
				__MessaggeLog('Referencia: '.$_Product->reference." Id ".$_Product->id." - ACTUALIZADO");
			}else{
					$_Product->add();
					__MessaggeLog('Referencia: '.$_Product->reference." Id ".$_Product->id." - CREADO");
				 }
			  
			 
			if($_Product->id)
			{
				if(sizeof($_Categories)>0)
				{
					$_Product->deleteCategories(true);
					$_Product->addToCategories(array_unique(array_filter($_Categories)));
				}
				// proceso las featurematerial
				if(sizeof($featuresmaterials)>0)
				{
					foreach($featuresmaterials as $fk => $material)
					{
						unset($featurename);
						$featurename = 'material_'.$fk;
						$id_feature = Db::getInstance()->getValue('SELECT id_feature FROM '._DB_PREFIX_.'feature_lang WHERE name ="'.$featurename.'"');
						$Feature = new Feature(($id_feature ? $id_feature : 1));
						if($id_feature)
						{
							$Feature->name[(int)Configuration::get('PS_LANG_DEFAULT')] =  $featurename;
							$Feature->update();
						}else{
								$Feature->name[(int)Configuration::get('PS_LANG_DEFAULT')] =  $featurename;
								$Feature->add();
							 }
						$id_feature = Db::getInstance()->getValue('SELECT id_feature FROM '._DB_PREFIX_.'feature_lang WHERE name ="'.$featurename.'"');
						$FeatureValues = FeatureValue::getFeatureValues($id_feature);
						if(sizeof($FeatureValues)==0)
						{

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

				if($_processImages==true)
					$_Product->deleteImages();
			}
			__MessaggeLog("\n");
		}catch (Exception $e) {
					__MessaggeLog('---- Product error: itemCode: '.$_Product->reference.' id_product: '.$_Product->id.' '.$e->getMessage()." \n");
		}	
		return $_Product;
	}
	
	function __MessaggeLog($msm=null)
	{
		global $print,$_Consultar;
		if($msm)
		{
			if($print)
				echo str_replace("\n","<br>",$msm);flush();
				
			 $ddf = fopen(dirname(__FILE__).'/log/'.date("Y-m-d").'.log','a'); 
			 fwrite($ddf,$msm); 
			 fclose($ddf);  
		}
	}
	
	function __getReferences($_Modelos,$bandera, $includeall = false)	{ 
		global $_wsmatisses;
		if(!$_wsmatisses)
			$_wsmatisses 	= new matisses;
		
		__MessaggeLog(' -------- Consultando modelos Inicio: '.date('H:i:s'));
		

		if(sizeof($_Modelos)>0)
		{
			$_Data = $_Modelos;
		}else{
            $_Data = $_wsmatisses->wsmatisses_getModelInfo();
        }
        $_Data = validProductExist($_Data,$bandera);
        
	  	if($_Data['error_string'])
		{
			__MessaggeLog("\n".$_Data['error_string']."\n");
			die("<br>".$_Data['error_string']."<br>");
			exit;
		}
		__MessaggeLog(' Modelos consultados Fin: '.date('H:i:s')." TOTAL: ".count($_Data)."\n");
		$_Models 	= array();
		//$_Data = array_slice($_Data, 0 , 10); 
                
		$_Data2 = $_Data;        
        
		foreach($_Data2 as $key => $_Model) {
			if(is_array($_Model['references'])) {                
				foreach($_Model['references'] as $k => $_Reference) {					
					 __MessaggeLog(' ------------ Consultando ('.$_Model['code'].') '.date('H:i:s').' '.$_Reference."\n");
					$_data =  __parseData($_wsmatisses->wsmatisses_getInfoProduct($_Reference,$includeall),$_Model['status']);
					if($_data)
						$_Models[$_Model['code']][$_Reference] =$_data;			
				}
			}else{     
                __MessaggeLog(' ------------ Consultando ('.$_Model['code'].') '.date('H:i:s').' '.$_Model['references']."\n");
                $_data =  __parseData($_wsmatisses->wsmatisses_getInfoProduct($_Model['references'],$includeall),$_Model['status']);
                //$_data2 =  $_wsmatisses->wsmatisses_getInfoProduct($_Model['references'],$includeall);
                if($_data)
                    $_Models[$_Model['code']][$_Model['references']] = $_data;
                
             }
		}
        
		// desactivo los productos que no existen
		foreach($_Data2 as $d => $v) {
			$code = $v['code'];
			if(!array_key_exists($code,$_Models)) {
				$_IdProduct = Db::getInstance()->getValue('SELECT id_product FROM '._DB_PREFIX_.'product WHERE model = "'.$code.'"');
				if($_IdProduct) {
					$_Product 		= new Product($_IdProduct,false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT'));
					$_Product_attributes = $_Product->getProductAttributesIds($_IdProduct);
					foreach($_Product_attributes as $key => $product_attribute)
					{
						StockAvailable::setQuantity($_Product->id,$product_attribute['id_product_attribute'],0);
					}
					StockAvailable::setQuantity($_Product->id,0,0);
					$_Product->active = 0;
					$_Product->update();
					
				}
			}	
		}		
		__MessaggeLog('---------------------------------------------------------------------------------------------------------------'."\n");
		return $_Models;
	}
	
	function __parseData($_data,$status = null){        
		if($_data['description'] && $_data['shortDescription'] && $_data['price'] && $_data['itemName'] && $_data['model'] && $_data['subgroupCode'] && sizeof($_data['color'])==3)
		{
            if(empty($_data['webName'])) {
               $_data['webName'] = ""; 
            }
				
			$path		= dirname(__FILE__).'/files/'.$_data['itemCode'];
			$materials 	= $_data['materials'];
			//echo "Materiales  ".count(array_filter($materials,'is_array'));
			if(count(array_filter($_data['materials'],'is_array'))==0)
			{
				unset($_data['materials']);
				$_data['materials'][] = $materials;	
			}
			
			$stock 		= $_data['stock'];
			//echo "Materiales  ".count(array_filter($materials,'is_array'));
			if(count(array_filter($_data['stock'],'is_array'))==0)
			{
				unset($_data['stock']);
				$_data['stock'][] = $stock;	 
			}
			             
            //$_data['processImages'] = 1;
            
			$_data['itemName'] 				= pSQL(mb_strtoupper(substr($_data['itemName'],0,1)).mb_strtolower(substr($_data['itemName'],1)));
			$_data['color']['name'] 		= mb_strtolower($_data['color']['name']);
			$_data['sketch']				= basename(current(glob($path.'/plantilla/*.jpg')));
			$_data['three_sixty']			= strstr($_data['itemCode'].'/360/'.basename(current(glob($path.'/360/*.html'))),'.html') ? $_data['itemCode'].'/360/'.basename(current(glob($path.'/360/*.html'))) : NULL;
			$_data['keyWords'] 				= strtolower(pSQL(implode(',',array_unique(array_filter(explode(' ',$_data['keyWords']))))));
			$_data['link_rewrite'] 			= Tools::link_rewrite($_data['webName']);
			$_data['id_category_default']	= (int) Configuration::get('PS_HOME_CATEGORY');
			$_data['shortDescription']		= Tools::truncate(($_data['shortDescription']),190,'...');
			$_data['meta_description']		= Tools::truncate(($_data['shortDescription']),130,'...');
			$_data['meta_title']			= $_data['itemName'];
			$_data['video']					=  strstr($_data['itemCode'].'/animacion/'.basename(current(glob($path.'/animacion/*.html'))),'.html') ? $_data['itemCode'].'/animacion/'.basename(current(glob($path.'/animacion/*.html'))) : NULL;
            
            $_data['manufacture'] = saveManufacture($_data['brand']['code'],$_data['brand']['name']);
			$_data['status'] = ($status && $_data['processImages']==1)?true:false;
                        
			if($_data['newFrom']) {
				unset($date);
				$date = explode('-',date('Y-m-d',$_data['newFrom']/1000));
				if(checkdate ( $date[1] , $date[2] , $date[0] ))
					$_data['newFrom']	= date('Y-m-d',$_data['newFrom']/1000);
			}
				
			if(sizeof($_data['materials'])>0) {
				$cares = "";
				unset($arraymaterials);
				$arraymaterials = array();
				foreach($_data['materials'] as $d => $v)
				{
					$arraymaterials[$v['code']] =  $v['name'];
					if($_data['materials'][$d]['name'])
						$cares.= '<h3>'.$_data['materials'][$d]['name'].'</h3>';
						
					$cares.= '<p>'.$_data['materials'][$d]['cares'].'</p><br>';
				}
				$_data['materials'] = $cares;
				$_data['arraymaterials'] = $arraymaterials;
			}
			
			$stock = $_data['stock'];
			if(sizeof($stock)>0) {
				$quantity = 0;
				$WarehouseCode = array();
				foreach($stock as $d => $v) { 
					$quantity+= (int)$stock[$d]['quantity'];
					array_push($WarehouseCode,$stock[$d]['warehouseCode']);
				}
				unset($_data['stock']);
				$_data['stock']['quantity'] 		= $quantity;
				$_data['stock']['WarehouseCode'] 	= implode(',',array_unique(array_filter($WarehouseCode)));
			}
			
			if(!empty($_data['subgroupCode'])) {
				$CategoriesProduct = array();
				$sql = 'SELECT id_category 
					FROM ' . _DB_PREFIX_ . 'category
					WHERE LENGTH( subgrupo ) =11 and (subgrupo like "%'.$_data['subgroupCode'].'" )
					GROUP BY id_category'; 
				
				$Categories = Db::getInstance()->ExecuteS($sql);
				
				foreach($Categories as $d => $v)
					array_push($CategoriesProduct,$Categories[$d]['id_category']);
				
				unset($_data['subgroupCode']);	
				$_data['subgroupCode'] = $CategoriesProduct;	
			}
			            
			if($_data['processImages']==1) {
				unset($images);
				if(sizeof($images = glob($path.'/images/*.jpg'))>0) {
					foreach($images as $dd => $image) {
						if(filesize($image)>Configuration::get("PS_PRODUCT_PICTURE_MAX_SIZE"))
							unset($images[$dd]);
					}
					$_data['processImages']	= $images;
				}
			}
			
			if($_data['color']['code']) {
				unset($color);
				$color =  Db::getInstance()->getRow("SELECT * FROM "._DB_PREFIX_."attribute WHERE id_sap='".$_data['color']['code']."'");
				if(sizeof($color)>1)
				{
					//echo "ACTUALIZO<BR>";
					$Attribute 	= new Attribute($color['id_attribute'],(int)Configuration::get('PS_LANG_DEFAULT'), (int)Configuration::get('PS_SHOP_DEFAULT'));
					$name = $_data['color']['name'] ? $_data['color']['name'] : $Attribute->name;
					$name = mb_strtoupper(substr($name,0,1)).mb_strtolower(substr($name,1));
					$Attribute->id_attribute_group = 3;
					$Attribute->color	=  ($_data['color']['hexa'] && strlen($_data['color']['hexa'])==6) ? '#'.strtoupper($_data['color']['hexa']) : $color['color'];
					$Attribute->name	= $name;
					$Attribute->id_sap	= $color['id_sap'];
					$Attribute->update();
					$_data['color']  = $color;
				}else{
						$time = time();
						$Attribute 	= new Attribute($color['id_attribute'],(int)Configuration::get('PS_LANG_DEFAULT'), (int)Configuration::get('PS_SHOP_DEFAULT'));
						$name = $_data['color']['name'] ? $_data['color']['name'] : 'Color temporal';
						$name = mb_strtoupper(substr($name,0,1)).mb_strtolower(substr($name,1));
						$Attribute->id_attribute_group = 3;
						$Attribute->name 	= pSQL($name);
						$Attribute->color	= ($_data['color']['hexa'] && strlen($_data['color']['hexa'])==6) ? '#'.strtoupper($_data['color']['hexa']) : '#FFFFFF';
						$Attribute->id_sap	= $_data['color']['code'] ? $_data['color']['code'] : time();
						$Attribute->add();
						$_data['color']  = Db::getInstance()->getRow("SELECT * FROM "._DB_PREFIX_."attribute WHERE id_sap='".$Attribute->id_sap."'");;
					 }
			}
			return $_data;
		}else{
            return NULL;
         }
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
	/* Obetenes las referencias por el modelo
    * $models => todos los modelos delimitados por ","
    */
    function getProductsByModel($models, $all = false){
        $_wsmatisses = new matisses;
        
        $models = explode(',',$models);
        $auxModels = array();
        for($i = 0; $i < count($models);$i++){
            $dataModel = $_wsmatisses->wsmatissess_getReferencesByModel($models[$i], $all);
            if(!isset($dataModel['itemCode'])){
                $auxRef = array();
                for($j = 0; $j < count($dataModel);$j++){
                    $auxRef[] = $dataModel[$j]['itemCode'];
                }            
                $auxModels[] = array('code'=>$models[$i],'references'=>$auxRef);
            }else{
                $auxModels[] = array('code'=>$models[$i],'references'=>$dataModel['itemCode']);
            }            
        }
        return $auxModels;        
    }
    
    /*
    * $productMat => obtiene todos los productos del servicio de matisess
    */
    function validProductExist($productMat,$bandera){
        $productObj = new Product();
        
        if(!$bandera){
            $productsPS = $productObj->getProducts((int)Configuration::get('PS_LANG_DEFAULT'), 0, 0, 'id_product', 'DESC',false,true);
            
            $query = 'UPDATE '._DB_PREFIX_.'product SET active = CASE id_product ';
            $queryCondition = '';
            $str_ids = '';

            foreach ($productsPS as $key => $value){
                $bandera = false;
                foreach($productMat as $key2 => $value2){

                    $references = (is_array($value2['references']))?$value2['references'][0]:trim($value2['references']);

                    if($references == trim($value['reference'])){
                        $bandera = true;
                        $productMat[$key2]['status'] = 'Existe';
                        break;
                    }
                }
                if(!$bandera){
                    $queryCondition .= ' WHEN '.$value['id_product'].' THEN 0';
                    $str_ids .= $value['id_product'].',';
                    //echo ' product => '.$value['reference'];
                }
            }
            $query = $query .' '.$queryCondition.'  END WHERE id_product IN ('.substr($str_ids,0,-1).')';        
            $query2 = str_replace(_DB_PREFIX_.'product',_DB_PREFIX_.'product_shop',$query);

            /*echo '<pre>';
            print_r($productMat);
            echo '</pre>';*/
            if($queryCondition != ''){
                echo $query;
                Db::getInstance()->Execute($query);
                $result = Db::getInstance()->Execute($query2);
            }
        }else{
            foreach($productMat as $key => $value){
                $references = (is_array($value['references']))?$value['references'][0]:trim($value['references']);
                if($productObj->existsRefInDatabase($references))
                    $productMat[$key]['status'] = 'Existe';
            }
        }
        return $productMat;
    }
?>
