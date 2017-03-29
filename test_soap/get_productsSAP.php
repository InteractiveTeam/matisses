<?php
set_time_limit(-1);
ini_set("soap.wsdl_cache_enabled", 0);ini_set('memory_limit', '-1');
include "nusoap/nusoap.php";
ini_set("default_socket_timeout", -1);

       $result = file_get_contents( "http://181.143.4.46:8280/WebIntegrator/GenericFacade?WSDL");
       print_r($result);

try{
	//echo "<pre>";print_r(get_headers("http://181.143.4.46:8280/WebIntegrator/GenericFacade?wsdl"));echo "</pre>";
	$client = new SoapClient("http://181.143.4.46:8280/WebIntegrator/GenericFacade?wsdl",array('location' => "http://181.143.4.46:8280/WebIntegrator/GenericFacade"));
									
	//$client = new nusoap_client('http://181.143.4.46:8280/WebIntegrator/GenericFacade?wsdl','wsdl');
	//$proxy =& $client->getProxy();
	//echo $proxy;
		//echo "<pre>";print_r($client);echo "</pre>";
    //10500000000000001503 13500000000000000024
	$s = array('genericRequest' => array('data'=>'<inventoryItemDTO><itemCode>10000000000000000078</itemCode></inventoryItemDTO>','object'=>"inventoryItem",'operation'=>"getItemInfo",'source'=>"prestashop"));
	//$result = $client->call('callService',$s);
	$result = $client->callService($s);
	
	echo "<pre>";print_r($result);echo "</pre>";
	
}catch(SoapFault  $s){
	echo $s->getMessage();
	echo "<pre>";	
	print_r($s->faultcode);
	
	//print_r($client->__getFunctions()); 
	//print_r($client->__getTypes());
	print_r($client);
	echo "</pre>";
}
?>