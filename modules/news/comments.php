<?php
	include_once dirname(__FILE__).'/../../config/config.inc.php';
	require_once dirname(__FILE__)."/news.php";
	$news = new News();
	die($news->ajax());
?>