<?php



	ini_set('display_error',true);
	include_once('../../config/config.inc.php');
	set_time_limit(0);
	require_once dirname(__FILE__)."/matisses.php";
	
	$wsmatisses = new matisses;

	$crontab	= pSQL(Tools::getValue('crontab'));

	if($_POST['consultar'])
	{
		$objeto= 'customer';
		$origen= 'prueba';
		if(filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))
		{
			$datos = '<customerDTO><email>'.$_POST['email'].'</email></customerDTO>';
			$operacion = 'getByEmail';
			
		}else{
				$datos = '<customerDTO><id>'.$_POST['email'].'</id></customerDTO>';
				$operacion = 'get';
		     }
		
		$result = $wsmatisses->wsmatisses_get_data($objeto,$operacion,$origen,$datos);
		if(is_array($result))
		{
			$newresult['id'] = strtolower($result['customerDTO']['id']);
			$newresult['email'] = strtolower($result['customerDTO']['email']);
			$newresult['names'] = strtolower($result['customerDTO']['names']);
			$newresult['lastName1'] = strtolower($result['customerDTO']['lastName1']);
			$newresult['lastName2'] = strtolower($result['customerDTO']['lastName2']);
			$newresult['legalName'] = strtolower($result['customerDTO']['legalName']);
			$newresult['gender'] = $result['customerDTO']['gender'];
			$date = explode('-',$result['customerDTO']['birthDate']);
			$newresult['birthyear'] = $date[0];
			$newresult['birthmonth'] = $date[1];
			$newresult['birthday'] = $date[2];
			$adressess = $result['customerDTO']['addresses'];
			foreach($adressess as $d => $v)
			{
				if($adressess[$d]['addressName']==$result['customerDTO']['defaultBillingAddress'])
				{ 
					$adressess[$d]['id_country']= $wsmatisses->getbyisocity($adressess[$d]['stateCode']);
					$adressess[$d]['id_state']	= $wsmatisses->getbyisostate(str_replace($adressess[$d]['stateCode'],'',$adressess[$d]['cityCode']));
					$newresult['address'] = $adressess[$d];					
				}
			}
 			//print_r(json_encode($newresult));
			$_POST['id_state'] = 1;
			print_r(json_encode($newresult));
			exit;
		}else{
				echo false;
				exit;
			 }
		//print_r(json_encode($result));
		//$wsmatisses->wsmatisses_client();
		
		
		
	}
	switch($crontab)
	{
		case 'listStockChanges': $wsmatisses->wsmatisses_listStockChanges(); die('termine listStockChanges');  break;
		case 'listDetailedLastDayStockChanges': $wsmatisses->wsmatisses_listDetailedLastDayStockChanges(); break;
		case 'getStockChanges': 
/* 		$ddf = fopen('error.log','a');
		fwrite($ddf,"Iniciando proceso de productos \n");
		fclose($ddf);
		*/
		require_once(dirname(__FILE__)."/productos.php"); 
		//$wsmatisses->wsmatisses_getStockChanges(); 
		/*
		$ddf = fopen('error.log','a');
		fwrite($ddf,"termine archivo");
		fclose($ddf); */
	
		
		break;
	}
	

	die('termine');
	exit;
	
?>