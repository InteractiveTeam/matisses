<?php
	require_once(dirname(__FILE__).'/../../config/config.inc.php');
	require_once(dirname(__FILE__).'/WishList.php');
	require_once(dirname(__FILE__).'/blockwishlist.php');
	global $smarty;
	$Customer = Context::getContext()->customer; 
	//print_r($_REQUEST);
	if($context->customer->isLogged())
	{
		$wishlist = new WishList();
		$userwhislist = $wishlist->getByIdCustomer($context->customer->id);
		if(sizeof($userwhislist) > 1 && !$_REQUEST['id_whislist'])
		{
			$html = '<div class="choosewishlist">';
			$html.= '<h3>Seleccione la lista de deseos</h3>';
			$html.= '<p class="required form-group"><input type="hidden" id="id_product" value="'.$_REQUEST['id_product'].'">';
			$html.= '<select name="wishlist" id="wishlist">';
			foreach($userwhislist as $key => $wishlist)
			{
				$html.= '<option value="'.$wishlist['id_wishlist'].'">'.$wishlist['name'].'</option>';
			}
			$html.= '</select></p>';
			$html.= '<button type="button" name="submitWishlist2" id="submitWishlist2" class="btn btn-default button btn-red">Adicionar';
			$html.= '</button></div>';
			$response['haserror'] = false;
 			$response['message'] = $html; 
			
		}else{
				$wishlist = new WishList($_REQUEST['id_whislist']);
				if(!$_REQUEST['id_whislist'] && sizeof($wishlist->getByIdCustomer($context->customer->id))==1)
					$_REQUEST['id_whislist'] = $context->cookie->id_wishlist;
			
				$wishlist = new WishList($_REQUEST['id_whislist']);
				if(!$_REQUEST['id_whislist'])
				{
					$wishlist->id_shop = $context->shop->id;
					$wishlist->id_shop_group = $context->shop->id_shop_group;
					$wishlist->default = 1;
		
					$mod_wishlist = new BlockWishList();
					$wishlist->name = $mod_wishlist->default_wishlist_name;
					$wishlist->id_customer = (int)$context->customer->id;
					list($us, $s) = explode(' ', microtime());
					srand($s * $us);
					$wishlist->token = strtoupper(substr(sha1(uniqid(rand(), true)._COOKIE_KEY_.$context->customer->id), 0, 16));
					$wishlist->add();
					$context->cookie->id_wishlist = (int)$wishlist->id;
					$_REQUEST['id_whislist'] = $wishlist->id;
				}
				
				
				$wishlist->addProduct($_REQUEST['id_whislist'],$context->customer->id,$_REQUEST['id_product'],0,1);
				$response['haserror'] = false;
 				$response['message'] = 'Agregado a la lista de deseos'; 
			 }
	}else{
			$response['haserror'] = true;
			$response['message'] = 'Debe autenticarse para agregar a la lista de deseos';
		 }
	
	
	

	print_r(json_encode($response));

	//$wishlist->getByIdCustomer();
	
?>
