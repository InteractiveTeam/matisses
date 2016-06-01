<?php
session_start();
class ws_product extends matisses
{
	
	public function product_listDetailedLastDayStockChanges($datos)
	{
		if(!is_object($datos))
			return false;
			
		$products = $datos->changes;	
		foreach($products as $product)
		{
			$operation = ($id_product = Product::getIdproductByExistsRefInDatabase($product->itemCode)) ? 'update' : 'create';
			$this->product_ParseProduct($product, $operation, $id_product);
		}
	}
	
	
	public function product_listDetailedLastAllStockChanges($datos)
	{
		if(!is_object($datos))
			return false;
		
		$products = $datos->changes;	
		foreach($products as $product)
		{
			$operation = ($id_product = Product::getIdproductByExistsRefInDatabase($product->itemCode)) ? 'update' : 'create';
			$this->product_ParseProduct($product, $operation, $id_product);
		} 
	}
	
	
	public function product_ParseProduct($product, $opt, $id_product= 1)
	{
		echo "<pre><h1>operation => $opt</h1>"; print_r($product); echo "</pre>";
		
		$name 							= strtolower(str_replace(' ','-',$product->itemName));
		$Product 						= new Product($id_product,false,(int)Configuration::get('PS_SHOP_DEFAULT'),(int)Configuration::get('PS_LANG_DEFAULT'));
		$Product->name					= pSQL(current($product->itemName));
		$Product->reference				= pSQL(trim(current($product->itemCode)));
		$Product->price					= pSQL(current($product->price));
		$Product->description			= pSQL(current($product->description));
		$Product->meta_keywords			= pSQL(str_replace(array(' ','/','+'),',',current($product->keyWords)));
		$Product->link_rewrite			= pSQL(str_replace(array(' ','/','+',':',',',';','  '),'-',strtolower(trim($Product->name))));
		$Product->model					= pSQL(current($product->model));
		$Product->id_category_default	= pSQL((int) Configuration::get('PS_HOME_CATEGORY'));
		$Product->description_short		= pSQL(Tools::truncate(current($product->description),200,'...'));
		$Product->meta_description		= pSQL(Tools::truncate(current($product->description),200,'...'));
		$Product->meta_title			= $Product->name; 
		$stock = $product->stock;
		if(sizeof($stock))
		{
			$WarehouseCode = array();
			$Product->quantity= 0;
			foreach($stock as $d => $v)
			{ 
				$Product->quantity+= (int)current($v->quantity);
				array_push($WarehouseCode,current($v->warehouseCode));
			}
			$WarehouseCode = implode(',',$WarehouseCode);
			$Product->available_now = pSQL($WarehouseCode);
		}  
		switch($opt)
		{
			case 'create': $Product->add(); break;
			case 'update': 
				$images = Image::getImages((int)Configuration::get('PS_LANG_DEFAULT'),$id_product);
				$Image	= new Image();
				foreach($images as $d => $v)
				{
					$Image->id = $images[$d]['id_image'];
					$Image->delete();
				}
				$Product->update(); 
			break;
		}
		
		$CategoriesProduct= array();
		$Categories = Category::getCategories((int)Configuration::get('PS_LANG_DEFAULT'),true, false, " AND c.subgrupo LIKE '%".$product->subgroup."'");
		foreach($Categories as $d => $v)
		{
			array_push($CategoriesProduct,$Categories[$d]['id_category']);
		}
		$Product->addToCategories($CategoriesProduct);
		if($Product->quantity)
			StockAvailable::setQuantity($Product->getIdproductByExistsRefInDatabase($Product->reference),0,(int)$Product->quantity);
		
		// Proceso imagenes y 360
		$path = dirname(__FILE__).'/../files/'.$Product->reference.'/';
		echo sizeof(glob($path));
		if(sizeof(glob($path)))
		{
			sizeof(glob($path."images/*.jpg")) ? $this->product_LoadImagesProduct((int)$Product->getIdproductByExistsRefInDatabase($Product->reference),glob($path."images/*.jpg")) : NULL;
		}
	}
	
	public function product_LoadImagesProduct($id_product, $images)
	{
		foreach($images as $d => $v)
		{
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
			//unlink($v);
		}
	}
	

	public function product_listStockChangesProductAttribute($datos)
	{

		
		if(!is_array($datos))
			return false;
			
			
		

		$inventario		= $datos['inventoryChangesDTO']['changes'];
		foreach($inventario as $d => $v)
		{
			$reference	= $inventario[$d]['itemCode'];
			$id_product	= $this->getIdProductByReference($reference);
			if($id_product && $reference)
			{
				$stock 			= $inventario[$d]['stock'];
				$StockSum		= 0;
				$WarehouseCode	= array();
				foreach($stock as $dd => $vv)
				{
					$StockSum		+= (int) $stock[$dd]['quantity'];
					$stock[$dd]['quantity'] ? array_push($WarehouseCode,$stock[$dd]['warehouseCode']) : NULL;
				}
				$WarehouseCode = implode(',',array_filter(array_unique($WarehouseCode)));
				StockAvailable::setQuantity($id_product,0,$StockSum);
				$Product = new Product($id_product);
				$Product->available_now = pSQL($WarehouseCode);
				$Product->update();
			}else{
					//return false;
					break;
				 }
		}
		return true;
	}

	public function product_listStockChanges($datos){                
		if(!$_SESSION['datos'])
			$_SESSION['datos'] = $datos;
			
		$datos = $_SESSION['datos'];	
		
		if(!is_array($datos))
			return false;
		
		$inventario = $datos['inventoryChangesDTO']['changes'];
		$stock = array();
		echo "<pre>"; print_r($inventario); echo "</pre>";
		foreach($inventario as $k => $v)
		{
			$_Quantity  = 0;
			$_Row 		= Db::getInstance()->getRow('SELECT id_product, id_product_attribute FROM '._DB_PREFIX_.'product_attribute WHERE reference = "'.trim($v['itemCode']).'"');
			//$isArray 	= filter_var($v['stock'],'array');
            echo "davinnnn33333<pre>"; print_r($_Row); echo "</pre>";
			if($_Row['id_product']!='' && $_Row['id_product_attribute']!='') {
				//echo "<pre>"; print_r($_Row); echo "</pre>";
				if(count(array_filter($v['stock'],'is_array'))==0) {
                    echo 'Davinsooooooon123456';
					$_Quantity = $v['stock']['quantity'];
					StockAvailable::setQuantity($_Row['id_product'],$_Row['id_product_attribute'],$_Quantity);
				}else if(count($v['stock'])){//if(count(array_filter($v['stock'],'is_array'))>0)
					$stock = $v['stock'];
                    echo 'Davinsooooooon';
					foreach($stock  as $d => $vv) {
						$_Quantity += $vv['quantity'];
					}
					StockAvailable::setQuantity($_Row['id_product'],$_Row['id_product_attribute'],$_Quantity);
				}
			 	echo $_Row['id_product']." - ".$_Row['id_product_attribute'].' - '.$v['itemCode'].' - '.$_Quantity."<br>";
			}
		}

		return true;
	}
	
	public function product_post($datos)
	{
		global $errors;
		$original = $datos;
		$datos = $this->xml_to_array($datos);

		if(!array_key_exists('product',$datos))
			return $this->array_to_xml(array('codigo'=>9007, 'detalle'=>$this->l('wrong xml data')));
		unset($datos['product']);	
		$this->validate('id','isNumeric',$datos['id'],true);
		if($errors)
		{
			$response 	= $this->array_to_xml(array('codigo'=>9006, 'detalle'=>'error'));
			$error 	 	= $this->array_to_xml($errors,2,false);
			$response 	= str_replace ('error',trim($error),$response);
			return $response; 
				 
		}else{
				$result = new Product((int)$datos['id']);
				$result = $this->object2array($result);
				$result = $this->array_to_xml($result);
				return $result;
			 }
	}
	
	public function product_get($datos)
	{
		global $errors;
		$original = $datos;
		$datos = $this->xml_to_array($datos);

		if(!array_key_exists('product',$datos))
			return $this->array_to_xml(array('codigo'=>9007, 'detalle'=>$this->l('wrong xml data')));
		unset($datos['product']);	
		$this->validate('id','isNumeric',$datos['id'],true);
		if($errors)
		{
			$response 	= $this->array_to_xml(array('codigo'=>9006, 'detalle'=>'error'));
			$error 	 	= $this->array_to_xml($errors,2,false);
			$response 	= str_replace ('error',trim($error),$response);
			return $response; 	 
		}else{
				$result = new Product((int)$datos['id']);
				$result = $this->object2array($result);
				$result = $this->array_to_xml($result);
				return $result;
			 }
	}
	
	public function product_delete($datos)
	{
		global $errors;
		$original = $datos;
		$datos = $this->xml_to_array($datos);

		if(!array_key_exists('product',$datos))
			return $this->array_to_xml(array('codigo'=>9007, 'detalle'=>$this->l('wrong xml data')));
		unset($datos['product']);	
		$this->validate('id','isNumeric',$datos['id'],true);
		if($errors)
		{
			$response 	= $this->array_to_xml(array('codigo'=>9006, 'detalle'=>'error'));
			$error 	 	= $this->array_to_xml($errors,2,false);
			$response 	= str_replace ('error',trim($error),$response);
			return $response; 
				 
		}else{
				$product = new Product((int)$datos['id']);
				if($product->delete())
				{
					return $this->array_to_xml(array('codigo'=>0000, 'detalle'=>$this->l('Product deleted')));
				}else{
						return $this->array_to_xml(array('codigo'=>9012, 'detalle'=>$this->l('Product can\'t delate')));
					 }
				/* $sql = "DELETE FROM `" . _DB_PREFIX_ . "customer` WHERE id_customer = ".$this->id;
				if($customer->delete() && Db::getInstance()->Execute($sql))
				{
					return $this->array_to_xml(array('codigo'=>0000, 'detalle'=>$this->l('Customer deleted')));
				}else{
						return $this->array_to_xml(array('codigo'=>9009, 'detalle'=>$this->l('User can\'t delate')));
					 } */
			 }
	}
	
	public function getIdProductByReference($reference)
	{
		if(!$reference)
			return false;
		
		$sql = 'SELECT  id_product from `' . _DB_PREFIX_ . 'product` WHERE reference = "'.pSQL($reference).'"';
		return Db::getInstance()->getValue($sql);
	}
	
}
?>
