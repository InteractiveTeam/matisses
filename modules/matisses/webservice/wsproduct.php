<?php
include('../../config/config.inc.php');
require_once dirname(__FILE__)."/../matisses.php";

class wsproduct extends matisses
{
	public $_wsdl		= 'http://hercules.matisses.co:8380/WebIntegrator/GenericFacade?wsdl'; 
	public $_products	= NULL; 
	
	public function init()
	{
		$this->__getProducts();
		
	}
	
	private function __getProducts()
	{
		$models = $this->callService('inventoryItem','listModelsWithStock','prestashop','');
	}
	
	private function callService($object,$operation,$origen='prestashop',$data=NULL)
	{
		$s 		= array('genericRequest' => array('data'=>$data,'object'=>$object,'operation'=>$operation,'source'=>$origen)); 
		$client = new SoapClient($this->_wsdl,array("trace"=>1,"exceptions"=>0));
		$result 	= $client->callService($s);
		echo "resultado <pre>"; print_r($result); echo "</pre>"; 
	}
}

?>