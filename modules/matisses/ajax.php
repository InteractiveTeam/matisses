<?php
	include('../../config/config.inc.php');
	require_once(dirname(__FILE__).'/matisses.php');
	$matisses = new Matisses();
	die($matisses->processAjaxCallback());
	

	
	
?>