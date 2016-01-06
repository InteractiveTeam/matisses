<?php
include_once('../../config/config.inc.php');
require_once(dirname(__FILE__).'/classes/nusoap/nusoap.php');
$server = new soap_server();
$server->configureWSDL('server', 'urn:server');
$server->wsdl->schemaTargetNamespace = 'urn:server';

$server->register('wsmatisses',
			array('data' => 'xsd:string', 'object' => 'xsd:string','operation' => 'xsd:string','source' => 'xsd:string'),
			array('return' => 'xsd:string'),
			'urn:server',
			'urn:server#servicioServer',
			'rpc',
			'encoded',
			'web service integration matisses prestashop');

function wsmatisses($objet,$operation,$source,$data) 
{
	global $webService; 
	require_once(dirname(__FILE__).'/wsmatisses.php');
	$wsmatisses = new wsmatisses();
	$wsmatisses->errors = array();
	return $wsmatisses->wsmatisses_server($data,$objet,$operation,$source) ;
}

 
$HTTP_RAW_POST_DATA = isset($HTTP_RAW_POST_DATA) ? $HTTP_RAW_POST_DATA : '';
 
$server->service($HTTP_RAW_POST_DATA);


?>