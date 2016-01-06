<?php
class ws_loadProducts extends matisses
{
	
	public $_products; 
	public $_pibote;
	public $_product;
	public $_combination;
	public $_products_disable = array();
	public function loadProducts()
	{
		ini_set('memory_limit', '3000M');
		set_time_limit(0); 
		$ddf 	= fopen(dirname(__FILE__).'/../loadproducts.log','a');
		$time 	= time();
		fwrite($ddf,"-------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");
		fwrite($ddf,date("Y-m-d H:i:s")." INICIA PROCESO DE CARGA DE PRODUCTOS - ".sizeof(($this->_products))." REFERENCIAS \n");
		fwrite($ddf,"-------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");

		fwrite($ddf,"	-----------------------------------------------------------------------------------------------------------------\n");
		fwrite($ddf,"	".date("Y-m-d H:i:s")." CONSULTA INFORMACION DETALLADA POR REFERENCIA\n");
		fwrite($ddf,"	-----------------------------------------------------------------------------------------------------------------\n");
			
 		self::parseArray();
		
		fwrite($ddf,"	-----------------------------------------------------------------------------------------------------------------\n");
		fwrite($ddf,"	".date("Y-m-d H:i:s")." TERMINE CONSULTA INFORMACION DETALLADA POR REFERENCIA - TARDE ".(time()-$time)." seg \n");
		fwrite($ddf,"	-----------------------------------------------------------------------------------------------------------------\n");
		unset($this->_products);
		$this->_products = $this->_pibote;
		unset($this->_pibote);
		$time2 = time();
		fwrite($ddf,"	-----------------------------------------------------------------------------------------------------------------\n");
		fwrite($ddf,"	".date("Y-m-d H:i:s")." INICIA CREACION PRODUCTOS ".sizeof($this->_products)."\n");
		fwrite($ddf,"	-----------------------------------------------------------------------------------------------------------------\n");
		//echo "ORIGINAL PRODUCTOS <pre>"; print_r($this->_products); echo "</pre>-----------------";
		self::load();
		
		fwrite($ddf,"	-----------------------------------------------------------------------------------------------------------------\n");
		fwrite($ddf,"	".date("Y-m-d H:i:s")." TERMINE CREACION PRODUCTOS - TARDE ".(time()-$time2)." seg \n");
		fwrite($ddf,"	-----------------------------------------------------------------------------------------------------------------\n");
		
		
/*		self::loadImagesProducts(); */
		fwrite($ddf,"-------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");
		fwrite($ddf,date("Y-m-d H:i:s")." TERMINA PROCESO DE CARGA DE PRODUCTOS - TARDE ".(time()-$time)." seg \n");
		fwrite($ddf,"-------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");
		fclose($ddf);
		//echo "<H1>TERMINE TODO EL PROCESO</H1>";
		exit;
	}
	
	private function parseArray()
	{
		//organizo los productos por modelo
		if(sizeof($this->_products))
		{
			$model 	= $this->_products[key($this->_products)]['model'];
			$item	= $this->_products[key($this->_products)]['itemCode'];
			
			$ddf 	= fopen(dirname(__FILE__).'/../loadproducts.log','a');
			fwrite($ddf,"			-------------------------------------------------------------------------------------\n");
			fwrite($ddf,"			".date("Y-m-d H:i:s")." CONSULTANDO REFERENCIA ".$item." - ".$model."\n");
			$path 	= dirname(__FILE__)."/../files/".$item;
			fwrite($ddf,"			VERIFICANDO ESTRUCTURA:");
			if(file_exists($path))
			{	
				fwrite($ddf," OK\n");
				fwrite($ddf,"			VERIFICANDO IMAGENES:");
				if(sizeof(glob($path."/images/*.jpg"))==0)
				{
					fwrite($ddf,": FAIL\n");
					unset($products[$d]);
				}else{
						fwrite($ddf,": OK\n");
						$this->_pibote[$model][$item] = parent::wsmatisses_getInfoProduct($item);

					 }
							
				
			}else{
					fwrite($ddf,": FAIL\n");
				 } 
			unset($this->_products[key($this->_products)]);
			fclose($ddf);
			self::parseArray();
		}
	} 
	
	private function load()
	{
		if(sizeof($this->_products))
		{
			$_model		= key($this->_products);
			$_array		= $this->_products[$_model];
			$cont 		= 1;

			$ddf 	= fopen(dirname(__FILE__).'/../loadproducts.log','a');
			$time	= time();
			fwrite($ddf,"			-------------------------------------------------------------------------------------\n");

			if(sizeof($_array)==1)
			{
				
				$this->_product = current($_array);
				//print_r($this->_product);
				fwrite($ddf,"			".date("Y-m-d H:i:s")." PRODUCTO SIMPLE: ".$this->_product['itemCode']." - ".$_model."\n");
				fwrite($ddf,"			INFORMACION MATISSES\n".print_r($this->_product,true)."\n");
				self::createProduct();
			}else{
					

					$this->_combination = $_array;
					fwrite($ddf,"		".date("Y-m-d H:i:s")." PRODUCTO COMBINADO: - ".$_model."\n");
					fwrite($ddf,"			".print_r($this->_combination,true)."\n");
					self::createCombinations();
				 }
				 
			fwrite($ddf,"			-------------------------------------------------------------------------------------\n");
			fclose($ddf);
			
			unset($this->_products[$_model]);
			self::load();
		}
	}
	
	private function createProduct($return = false)
	{
	
		$ddf 	= fopen(dirname(__FILE__).'/../loadproducts.log','a');
		$time	= time();
/*
		echo "--------------------------------------------------------------------------------------------------------";
		echo "<pre>"; 
		print_r($this->_product);
		echo "</pre>";	
*/		
		$product 						= (object) $this->_product;
		$opt 							= ($id_product = Product::getIdproductByExistsRefInDatabase($product->itemCode)) ? 'update' : 'create';
		$Product 						= new Product($id_product,false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT'));
		$name 							= strtolower(str_replace(' ','-',$product->itemName));
		$keyWords						= explode(' ',$product->keyWords);
		$path							= dirname(__FILE__).'/../files/'.$product->itemCode;
		$plantilla						= basename(current(glob($path.'/plantilla/*.jpg')));
		$p360							= $product->itemCode.'/360/'.basename(current(glob($path.'/360/*.html')));
		$itemname						= pSQL(utf8_encode($product->itemName));
		$itemname						= strtoupper(substr($itemname,0,1)).strtolower(substr($itemname,1));
		$cares 							= NULL;
		
		fwrite($ddf,"\n					".date("Y-m-d H:i:s")." PROCESANDO ".$product->itemCode."\n");
		fwrite($ddf,"					".date("Y-m-d H:i:s")." LEYENDO MATERIALES:						- ");
		if(sizeof($product->materials)>0)
		{
			//echo "<pre>";print_r($product->materials); echo "</pre>";
			foreach($product->materials as $d => $v)
			{
				$cares.= '<h1>'.$product->materials[$d]['name'].'</h1>';
				$cares.= '<p>'.$product->materials[$d]['cares'].'</p>';
			}
		}
		fwrite($ddf,"OK\n");
		
		fwrite($ddf,"					".date("Y-m-d H:i:s")." LEYENDO KEYWORDS:						- ");
		foreach($keyWords as $d => $v)
		{
			if(!$v)
				unset($keyWords[$d]);
		}
		fwrite($ddf,"OK\n");
		$search  = array('á','é','í','ó','ú','ä','ë','ï','ö','ü');
		$replace = array('a','e','i','o','u','a','e','i','o','u');
		
		
		fwrite($ddf,"					".date("Y-m-d H:i:s")." LEYENDO INFORMACION:					- ");
		$Product->name					= pSQL(utf8_encode($product->webName));
		$Product->reference				= pSQL($product->itemCode);
		$Product->itemname				= $itemname;	
		$Product->price					= pSQL($product->price);
		$Product->description			= pSQL(utf8_encode($product->description));
		$Product->meta_keywords			= utf8_encode(implode(',',$keyWords));
		$Product->link_rewrite			= str_replace($search, $replace,pSQL(str_replace(array(' ','/','+',':',',',';','  '),'-',strtolower(trim($Product->name)))));
		$Product->model					= pSQL($product->model);
		$Product->id_category_default	= pSQL((int) Configuration::get('PS_HOME_CATEGORY'));
		$Product->description_short		= pSQL(Tools::truncate($Product->description,190,'...'));
		$Product->meta_description		= pSQL(Tools::truncate($Product->description,190,''));
		$Product->meta_title			= $Product->name; 
		$Product->cuidados				= utf8_encode($cares);
		$Product->video					= $product->idYoutube ? $product->idYoutube : '';
		$Product->sketch				= $plantilla;
		$Product->three_sixty			= $p360;
		fwrite($ddf,"OK\n");

		
		if($product->newFrom)
		{
			fwrite($ddf,"					".date("Y-m-d H:i:s")." LEYENDO FECHA NUEVO:					- ");
			$date = explode('-',date('Y-m-d',$product->newFrom));
			if(checkdate ( $date[1] , $date[2] , $date[0] ))
				$Product->date_new				= date('Y-m-d',$product->newFrom);
			fwrite($ddf,"OK\n");	
		}

		
		$stock = $product->stock;
		if(sizeof($stock))
		{
			fwrite($ddf,"					".date("Y-m-d H:i:s")." LEYENDO STOCK:							- ");
			$Product->quantity = 0;
			$WarehouseCode = array();
			foreach($stock as $d => $v)
			{ 
				$Product->quantity+= (int)$stock[$d]['quantity'];
				array_push($WarehouseCode,$stock[$d]['warehouseCode']);
			}
			$WarehouseCode = implode(',',$WarehouseCode);
			$Product->available_now = pSQL($WarehouseCode);
			fwrite($ddf,"OK - ".$Product->quantity." Und DISPONIBLE EN ($WarehouseCode)\n");
		}else{
			 	fwrite($ddf,"					".date("Y-m-d H:i:s")." LEYENDO STOCK:							- FAIL Sin stock\n");
			 } 
		//echo "<h2>".$Product->quantity."</h2>";
		
		fwrite($ddf,"					".date("Y-m-d H:i:s")." CREADO PRODUCTO:						- "); 
		if($Product->link_rewrite && $Product->name && $Product->reference && $Product->description && $Product->model && $Product->price)
		{
			switch($opt)
			{
				case 'create':
					
					fwrite($ddf,"						".date("H:i:s")." CREADO PRODUCTO:					- "); 
					$Product->add(); 
					//echo "cree<bre>";flush();
					fwrite($ddf," OK"); 
					
				break;
				case 'update':
					fwrite($ddf,"						".date("H:i:s")." ACTUALIZANDO PRODUCTO:			- ");  
					$images = Image::getImages((int)Configuration::get('PS_LANG_DEFAULT'),$id_product);
					$Image	= new Image();
					foreach($images as $d => $v)
					{
						$Image->id = $images[$d]['id_image'];
						$Image->delete();
					}
					$Product->update(); 
					//echo "actualice<bre>";flush();
					fwrite($ddf,"OK"); 
				break;
			}
			
				
				// agrego las tags
				fwrite($ddf,"						".date("H:i:s")." ASIGNANDO KEYWORDS:				- ");
				if(sizeof($keyWords))
				{
					Tag::deleteTagsForProduct((int) Product::getIdproductByExistsRefInDatabase($product->itemCode));
					Tag::addTags((int)Configuration::get('PS_LANG_DEFAULT'), (int) Product::getIdproductByExistsRefInDatabase($product->itemCode), implode(',',array_unique($keyWords)));
					fwrite($ddf,"OK"); 
				}else{
						fwrite($ddf,"FAIL Sin keywords"); 
					 }
				
				$id_product = (int) Product::getIdproductByExistsRefInDatabase($product->itemCode);
				$CategoriesProduct= array();
				fwrite($ddf,"						".date("H:i:s")." ASIGNANDO CATEGORIAS:				- ");
				$Product->deleteCategories(true);
				if(!empty($product->subgroupCode))
				{
					fwrite($ddf,"					".date("Y-m-d H:i:s")." PROCESANDO CATEGORIAS:						- "); 
					//$Categories = Category::getCategories((int)Configuration::get('PS_LANG_DEFAULT'),true, false, " AND c.subgrupo LIKE '%".$product->subgroupCode."'");
					$sql = 'SELECT id_category 
						FROM ' . _DB_PREFIX_ . 'category
						WHERE LENGTH( subgrupo ) =11 and (subgrupo like "%'.$product->subgroupCode.'" )
						GROUP BY id_category'; 

					$Categories = Db::getInstance()->ExecuteS($sql);
					
					foreach($Categories as $d => $v)
					{
						array_push($CategoriesProduct,$Categories[$d]['id_category']);
					}

					$Product->addToCategories($CategoriesProduct);
					$CategoriesProduct= array();
					fwrite($ddf,"OK MATISSES: subgroupCode: (".$product->subgroupCode.") PRESTASHOP (".implode(',',$CategoriesProduct).")\n"); 
				}else{
					
						$Producto = new Product($id_product,false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT'));
						$Producto->active = true;
						$Producto->update();
						fwrite($ddf,"FAIL Sin categorias Producto desactivado\n"); 
					 }
				
				
				if($Product->quantity && !$return)
				{
					fwrite($ddf,"					".date("Y-m-d H:i:s")." PROCESANDO STOCK:						- "); 
					StockAvailable::setQuantity($id_product,0,(int)$Product->quantity);
					fwrite($ddf,"OK ".$Product->quantity." Und\n"); 
				}
				// Proceso imagenes
				//echo "<h1>termine de cargar ".$product->itemCode." - $id_product </h1><hr>";
				
				$path = dirname(__FILE__).'/../files/'.$Product->reference;
				$images = glob($path."/images/*.jpg");
				
				if(sizeof($images>0) && !$return)
				{
					fwrite($ddf,"					".date("Y-m-d H:i:s")." PROCESANDO IMAGENES:						- "); 
					self::product_LoadImagesProduct($id_product,$images);
				}
				
		}else{
				fwrite($ddf,"FAIL - Informacion incompleta\n"); 
			 }
		
		fwrite($ddf,"			".date("Y-m-d H:i:s")." PROCESADO ".$product->itemCode."\n");
		fclose($ddf);
		//echo " - termine - <br>";
		flush();
		
		if($return)
			return $id_product;
	}
	
	private function product_LoadImagesProduct($id_product, $images)
	{
		$ddf 	= fopen(dirname(__FILE__).'/../loadproducts.log','a');
		$time	= time();
		fwrite($ddf,"\n						".date("Y-m-d H:i:s")." NRO IMAGENES:					- ".sizeof($images)."\n"); 
		fwrite($ddf,"						".date("Y-m-d H:i:s")." VALIDANDO TAMANO IMAGENES \n"); 
		fwrite($ddf,"						".date("Y-m-d H:i:s")."	----------------------------------------------------------------------------\n"); 
		foreach($images as $d => $v)
		{
			fwrite($ddf,"							".date("Y-m-d H:i:s")."- $v						");
			if(filesize($v)>Configuration::get("PS_PRODUCT_PICTURE_MAX_SIZE"))
			{
				fwrite($ddf,"No - eliminada \n");
				unset($images[$d]);
			}else{
					fwrite($ddf,"Si\n");
				 }
		}
		
		fwrite($ddf,"						".date("Y-m-d H:i:s")." CARGANDO IMAGENES \n"); 
		fwrite($ddf,"						".date("Y-m-d H:i:s")."	----------------------------------------------------------------------------\n"); 
		foreach($images as $d => $v)
		{
			$time = time();
			fwrite($ddf,"							".date("Y-m-d H:i:s")."- $v 					- "); 
			$image = new Image();
			$image->id_product 	= (int)($id_product);
			$image->position 	= Image::getHighestPosition((int)($id_product)) + 1;
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
			}
			fwrite($ddf,"Ok - ".(time()-$time)." Seg \n");
		}
		fclose($ddf);
	}
	
	
	private function createCombinations()
	{
		//error_reporting(E_ALL);
		//self::setCombinations();
		$_product = NULL;
		foreach($this->_combination as $d)
		{
			$_product = NULL;
			if(Product::getIdproductByExistsRefInDatabase($d['itemCode']))
			{
				$_product = $d;
				break;
			}
		}
		
		if(is_array($_product) && sizeof($_product)>0)
		{
			$key = $_product['itemCode'];
			$this->_product = $_product;
		}else{
			 	$key = key($this->_combination);
				$this->_product = current($this->_combination);
			 } 
		$subgroupCode = array();
		$modelo = $this->_combination[$key]['model'];
		$id_product = self::createProduct(true);
		
		//echo "<h2>Combinacion $key - $id_product - ".$modelo."</h2>";
		$ddf = fopen(dirname(__FILE__).'/../error.log','a');
		fwrite($ddf,"Combinacion $key - $id_product - ".$modelo." - ".date('H:i:s'));
		fclose($ddf);
		//leo todas las imagenes
		$newimages = array();
		foreach($this->_combination as $product)
		{
			$path = dirname(__FILE__).'/../files/'.$product['itemCode'];
			$images = glob($path."/images/*.jpg");
			foreach($images as $d => $v)
				$newimages[] = $v;
		}
		
		//cargo todas las imagenes
		self::product_LoadImagesProduct($id_product,$newimages);
		
		//self::createProduct();
		// creo los colores si no existen
		$Product  		= new Product($id_product,false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT')); 
		$Attribute 		= new Attribute(NULL,(int)Configuration::get('PS_LANG_DEFAULT'), (int)Configuration::get('PS_SHOP_DEFAULT'));
		$Combination	= new Combination();
		$Image			= new Image();
		$images			= $Image->getImages((int)Configuration::get('PS_LANG_DEFAULT'),$id_product);
		$refprice		= $this->_product['price'];
		//echo "<h1>$refprice</h1>";
		$default		=1;
		$WarehouseCode  = array();
		
		//echo "<pre>IMAGENES ORIGINALES"; print_r($newimages); echo "</pre>";
		//echo "<pre>ID IMAGENES CARGADAS"; print_r($images); echo "</pre>";
		
		foreach($this->_combination as $product)
		{
			// creando los colores
			"<h3>  - combinacion ".$product['itemCode']." - ".$modelo."</h3>";
			$colorexists = Db::getInstance()->getValue('SELECT count(*) as position FROM `' . _DB_PREFIX_ . 'attribute` WHERE id_sap = "'.$product['color']['code'].'"');
 			if((int)$colorexists==0)
			{	
				$name = strtolower($product['color']['name']);
				$name = strtoupper(substr($name,0,1)).strtolower(substr($name,1));
				$Attribute->id_attribute_group = 2;
				$Attribute->name 	= $name;
				$Attribute->color 	= $product['color']['hexa']=='' ? '#FFFFFF' : '#'.strtoupper($product['color']['hexa']);
				$Attribute->id_sap 	= $product['color']['code'];
				$Attribute->add();											
			}
			$id_attribute = Db::getInstance()->getValue('SELECT id_attribute FROM `' . _DB_PREFIX_ . 'attribute` WHERE id_sap = "'.$product['color']['code'].'"');
			
			// extraigo las imagenes de cada combinacion
			$path 		= dirname(__FILE__).'/../files/'.$product['itemCode'];
			$imagesitem = glob($path."/images/*.jpg");
			$id_images = array();
			//echo "<h2>Seleccionando imagen para cada iteracion</h2>";
			for($i=0;$i<sizeof($imagesitem);$i++)
			{
				$key = key($images);
				array_push($id_images,current(current($images)));
				unset($images[$key]);
			}
			

			$price 					 = self::_calculatePrice($refprice,$product['price']); 
			$reference 				 = $product['itemCode'];
			$itemname 				 = pSQL(utf8_encode($product['itemName']));
			$itemname				 = strtoupper(substr($itemname,0,1)).strtolower(substr($itemname,1));
			$description 			 = pSQL(utf8_encode($product['description']));
			$id_product_attribute    = Db::getInstance()->getValue('SELECT id_product_attribute 
																	FROM `' . _DB_PREFIX_ . 'product_attribute` 
																	WHERE id_product = "'.$id_product.'"	
																			AND reference = "'.$reference.'"');
																			
			array_push($subgroupCode, $product['subgroupCode']);																																			

			//temporal
			
			if($id_product_attribute)
			{
				//echo "actualizo la combinacion $id_product_attribute<br>";
				
				$Product->updateAttribute(
											$id_product_attribute, 
											0, 
											$price, 
											$weight, 
											$unit, 
											$ecotax,
											$id_images, 
											$reference,
											$ean13, 
											$default,
											null,
											null,
											null,
											null,
											true,
											array(),
											$itemname,
											$description
										);
							
				$id_combination = $id_product_attribute;					
				
				Db::getInstance()->update(
						'product_attribute_combination', 
						array('id_attribute' => (int) $id_attribute), 
						'id_product_attribute = '.(int)$id_product_attribute
					);
				//echo "termine de actualizar<br>";	
			
			}else{
					$id_combination = $Product->addAttribute(
						$price, 
						$weight, 
						$unit_impact, 
						$ecotax, 
						$id_images, 
						$reference, 
						$ean13,
						$default, 
						NULL, 
						NULL, 
						$minimal_quantity = 1,
						array(),
						$itemname,
						$description
					);
					
					
					
					$attributes_list = array(
									'id_product_attribute' => (int)$id_combination,
									'id_attribute' => (int)$id_attribute,
								);
					Db::getInstance()->insert('product_attribute_combination', $attributes_list);

				}
			
			$stock = $product['stock'];
			if(sizeof($stock))
			{
				$quantity = 0;
				$WarehouseCode = array();
				foreach($stock as $d => $v)
				{ 
					$quantity+= (int)$stock[$d]['quantity'];
					array_push($WarehouseCode,$stock[$d]['warehouseCode']);
				}
				StockAvailable::setQuantity($id_product,$id_combination,(int)$quantity);
			}
			$default =0;	
		} 


		

		$WarehouseCode = implode(',',$WarehouseCode);
		$Product->available_now = pSQL($WarehouseCode);
		$Product->update();
		
		$ddf = fopen(dirname(__FILE__).'/../error.log','a');
		fwrite($ddf," Termine ".date('H:i:s')."\n");
		fclose($ddf);

		$subgroupCode = array_unique($subgroupCode);
		if(sizeof($subgroupCode)>0)
		{
			//print_r($subgroupCode); 
			//echo "$reference  - subgrupo ------ ".$subgroupCode."<br>";
			$Product->deleteCategories(true);
			foreach($subgroupCode as $d => $v)
			{
				$condition.= 'or subgrupo like "%'.$v.'" ';
			}
			$condition = substr($condition,3); 
			if($condition)
			{
				$sql = 'SELECT id_category 
						FROM ' . _DB_PREFIX_ . 'category
						WHERE LENGTH( subgrupo ) =11 and ('.$condition.')
						GROUP BY id_category';
				//echo $sql;
				$Categories = Db::getInstance()->ExecuteS($sql);
				if(sizeof($Categories)>0)
				{
					$newcategories = array();
					foreach($Categories as $d => $v)
					{
						array_push($newcategories, $Categories[$d]['id_category']);
					}
						
				}
				
				$Product->addToCategories($newcategories);
			}
		}
		//echo "<pre>"; print_r($Categories); echo "</pre>";
		//echo $Product->id."<pre>"; print_r($subgroupCode); echo "</pre>";
		unset($this->_product);
		self::createProduct(); 
	}
	
	private function _calculatePrice($refprice,$newprice)
	{
		if($refprice==$newprice)
			return 0;
			
		if($refprice>$newprice)
			return ($newprice-$refprice);
		
		if($refprice<$newprice)
			return ($refprice-$newprice);
			
	}
	
	private function loadImagesProducts()
	{
		//echo "<h1>CARGA DE IMAGENES</H1>";
		$products = Db::getInstance()->ExecuteS('SELECT id_product, reference FROM `' . _DB_PREFIX_ . 'product`');
		foreach($products as $d => $v)
		{
			$path = dirname(__FILE__).'/../files/'.$products[$d]['reference'];
			//echo '<h2>'.$products[$d]['reference'].'</h2> - '.$path.'<br>';
			$images = glob($path."/images/*.jpg");
			//echo sizeof($images);
			if(sizeof($images)==0)
			{
				$Product = new Product($products[$d]['id_product'],false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT'));
				$Product->active = false;
				$Product->update();
				//echo "<h2>desactivado</h2>";
			}else{
					$Product = new Product($products[$d]['id_product'],false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT'));
					$Product->active = true;
					$Product->update();
				 }
			
			//echo "<pre>"; print_r($images); echo "</pre>";
			
			//echo "<hr>";
			ob_flush();
			 
			
/*			
					if(sizeof(glob($path."/images/*.jpg")))
			
if(is_dir($path))
			{
				if(sizeof(glob($path."/images/*.jpg"))>0)
				{
					$Product = new Product($products[$d]['id_product'],false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT'));
					$Product->active = false;
					$Product->update();
					echo $products[$d]['reference'].' existe<br>';	
					

					
				}else{
						echo $products[$d]['reference'].' existe sin imagenes<br>';	
					 }
			}else{
					echo $products[$d]['reference'].' no existe<br>';
					$Product = new Product($products[$d]['id_product'],false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT'));
					$Product->active = false;
				 }*/
		}
	}
	

}
?>