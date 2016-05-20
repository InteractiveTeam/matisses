{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com> *  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!DOCTYPE HTML>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7 " lang="{$lang_iso}"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 ie7" lang="{$lang_iso}"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 ie8" lang="{$lang_iso}"><![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9" lang="{$lang_iso}"><![endif]-->
<html lang="{$lang_iso}" class="{if $page_name == 'pagenotfound'}{$page_name|escape:'html':'UTF-8'}{/if}">
<head>
<meta charset="utf-8" />
<title>{$meta_title|escape:'html':'UTF-8'}</title>
{if isset($meta_description) AND $meta_description}
<meta name="description" content="{$meta_description|escape:'html':'UTF-8'}" />
{/if}
{if isset($meta_keywords) AND $meta_keywords}
<meta name="keywords" content="{$meta_keywords|escape:'html':'UTF-8'}" />
{/if}
<meta name="generator" content="PrestaShop" />
<meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
<meta name="viewport" content="width=device-width, minimum-scale=0.25, maximum-scale=1.6, initial-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
<link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700,600' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="{$css_dir}bootstrap.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="{$css_dir}grid.css" type="text/css" media="all" />
<link rel="shortcut icon" type="image/x-icon" href="/themes/matisses/img/favicon/apple-icon-57x57.png" />
<link rel="apple-touch-icon" sizes="57x57" href="/themes/matisses/img/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/themes/matisses/img/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/themes/matisses/img/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/themes/matisses/img/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/themes/matisses/img/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/themes/matisses/img/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/themes/matisses/img/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/themes/matisses/img/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/themes/matisses/img/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="/themes/matisses//android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="/themes/matisses/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/themes/matisses/img/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="/themes/matisses/img/favicon/favicon-16x16.png">
<link rel="manifest" href="img/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="img/favicon/ms-icon-144x144.png">
{if isset($css_files)}
	{foreach from=$css_files key=css_uri item=media}
<link rel="stylesheet" href="{$css_uri|escape:'html':'UTF-8'}" type="text/css" media="{$media|escape:'html':'UTF-8'}" />
{/foreach}
{/if}
{if isset($js_defer) && !$js_defer && isset($js_files) && isset($js_def)}
	{$js_def}
	{foreach from=$js_files item=js_uri}
<script type="text/javascript" src="{$js_uri|escape:'html':'UTF-8'}"></script>
{/foreach}
{/if}
		{$HOOK_HEADER}
<!--[if IE 8]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		
<!--Chaordic-->		
<script type="text/javascript" src="{$js_dir}ax-chaordic.js"></script>
{literal}
<script type="text/javascript">
    var data = {};
    var page = '{/literal}{$page_name}{literal}';
    var islogged = '{/literal}{if $logged}true{else}false{/if}{literal}';
    {/literal}
        {if !empty($category)}
            data.category = '{$category->name}';
            data.idcategory = '{$category->id}';
            data.leveldepth = {$category->level_depth};
            data.parents = {$parents};
        {/if}
        {if $logged}
            data.idcustomer = '{$idcustomer}';
            data.customername = '{$customername}';
            data.username = '{$customeremail}';
            data.customeremail = '{$customeremail}';
            data.customercharter = '{$customercharter}';
            {if !empty($customernewsletter)}
                var newl = {$customernewsletter};
                if (newl == 1) {
                    data.newsletter = true;   
                } else {
                    data.newsletter = false;
                }
            {else}
                data.newsletter = false;
            {/if}
        {/if}
        {if $page_name == 'index'}
            data.emailsubscribe = '{$emailsubscribe}';
        {/if}
        {if $page_name == 'product'}
            data.idproduct = '{$idproduct}';
            data.nameproduct = '{$nameproduct}';
            var linkp = '{$linkproduct}';
            data.linkproduct = linkp.replace(/http:|https:/g,'');
            data.descproduct = '{$descproduct}';
            data.imageproduct = '{$imageproduct}';
            data.categoriesp = {$categoriesp};
            {if !empty($priceproduct)}
                data.priceproduct = {$priceproduct};
            {else}
                data.priceproduct = 0;
            {/if}
            data.productcolors = {$productcolors};
            data.productskuattr = {$productskuattr};
            {if !empty($tagsproduct)}
                data.tagsproduct = {$tagsproduct};
            {/if}
            {if $statusproduct > 0}
                data.statusproduct = 'available';
            {else}
                data.statusproduct = 'unavailable';
            {/if}
            data.productcondition = '{$productcondition}';
        {/if}
        {if $page_name == 'search'}
            data.search_q = '{$search_query}';
        {/if}
        {if $page_name == 'order' }
            {if !empty($idcart)}
                data.idcart = '{$idcart}';
                data.prodincart = {$prodincart};
            {/if}
            {if !empty($cartbyurl)}
                location.href = '{$base_dir}pedido';    
                data.cartbyurl = {$cartbyurl};
            {/if}
        {/if}
        {if $page_name == 'order-confirmation' }
            {if !empty($orderproducts)}
                data.orderproducts = {$orderproducts};
                data.signature = '{$signature}';
            {/if}
        {/if}
    {literal}
    data.page = page;
    data.loggeduser = islogged;         
    ax.setChaordic(data);
         
</script>
{/literal}
<script src="//static.chaordicsystems.com/static/loader.js" type="text/javascript"></script>
{if $page_name == 'cms'}
<script type="text/javascript">
    $(window).load(function() {
        $('#lhnHelp-faqs').click(function() {
            OpenLHNChat();
        });
    });    
</script>
{/if}
</head>
<!--
<div class="ax-cont-preload">
    <div class="ax-preload">
        <div class="ax-text"></div>
        <div class="ax-icon"></div>
    </div>
</div>-->
<body{if isset($page_name)} id="{$page_name|escape:'html':'UTF-8'}"{/if} class="{if isset($page_name)}{$page_name|escape:'html':'UTF-8'}{/if}{if isset($body_classes) && $body_classes|@count} {implode value=$body_classes separator=' '}{/if}{if $hide_left_column} hide-left-column{/if}{if $hide_right_column} hide-right-column{/if}{if isset($content_only) && $content_only} content_only{/if} lang_{$lang_iso}" itemscope itemtype="http://schema.org/WebPage">
	{if !isset($content_only) || !$content_only}
		{if isset($restricted_country_mode) && $restricted_country_mode}
			<div id="restricted-country">
				<p>{l s='You cannot place a new order from your country.'} <span class="bold">{$geolocation_country|escape:'html':'UTF-8'}</span>
</p>
</div>
{/if}
<div id="page">

<div class="header-container">
  	<header id="header">
    	<div class="main_panel cf">
          	<div id="menu-left" class="grid_5 menu-left">
	            <div class="left-up-menu cf">
	              <ul class="menu">
	                <li id="tiendas"><a href="{$link->getPageLink('stores')}">{l s='Tiendas'}</a></li>
	                <li id="metodos-envio"><a href="{$link->getCMSLink('9')}">{l s='Métodos de envío'}</a></li>
	                <li id="garantias"><a href="{$link->getCMSLink(14)}">{l s='Garantías'}</a></li>
	              </ul>
	              {*$HOOK_TOP*}
			  	</div>


            	<div class="left-down-menu cf"> {hook h="displayMatMegamenu"}
	              <ul id="menu" class="grid_10 menu-experiencias" style="color:black">
                    <li id="experiencias"><a href="{$link->getModuleLink('matisses','experiences')}">{l s='Experiencias'}</a></li>
	                <li id="wishlist">{hook h="displayMatWishlist"}</li>
	                <li id="giftlist"><a href="javascript:void(0)"><span></span>{l s='Lista de regalos'}</a></li>
	              </ul>
            	</div>
          	</div>
          	<div id="header_logo" class="grid_2">
				<a class="logo-desktop" href="{$base_dir}" title="{$shop_name|escape:'html':'UTF-8'}">
					<img class="logo img-responsive" src="{$logo_url}" alt="{$shop_name|escape:'html':'UTF-8'}"{if isset($logo_image_width) && $logo_image_width} width="{$logo_image_width}"{/if}{if isset($logo_image_height) && $logo_image_height} height="{$logo_image_height}"{/if}/>
				</a>
				<a class="logo-sticky" href="{$base_dir}" title="{$shop_name|escape:'html':'UTF-8'}">
					<img src="/themes/matisses/img/logo-sticky.png">
				</a>
			</div>

	        <div id="menu-right" class="grid_5 menu-right">
	        	<div class="cf right-up-menu">
	              <ul>
	                <li id="redes">{hook h='displayMatRedes'}</li>
	                <li id="cart">{hook h='displayMatCart'}</li>
	                <li id="user">{hook h='displayMatUser'}</li>
	              </ul>
	            </div>
	            <div class="cf right-down-menu">
	              	<ul>
		                <li id="chat" class="chat">
                            <div id="lhnContainerDone" style="text-align: center; width: auto; top: 150px; right: 0px; position: fixed; z-index: 9999;">
                                 <div id="lhnChatButton" style="width: auto;">
                                     <a href="javascript:void(0)" onclick="OpenLHNChat();return false;" id="aLHNBTN">
                                         <img id="lhnchatimg" border="0" alt="Live help" src="http://www.livehelpnow.net/lhn/functions/imageserver.ashx?lhnid=24694&amp;java=No&amp;zimg=4827&amp;sres=1920x1080&amp;sdepth=24&amp;custom1=&amp;custom2=&amp;custom3=&amp;t=t&amp;d=29011&amp;rnd=0.36317845692275763&amp;ck=true&amp;referrer=&amp;pagetitle=MATISSES&amp;pageurl=http%3A//www.matisses.co/">
                                     </a>
                             </div>
                             <script type="text/javascript" src="http://www.livehelpnow.net/lhn/scripts/livehelpnow.aspx?lhnid=24694&amp;iv=1&amp;ivid=0&amp;d=29011&amp;ver=5.3&amp;rnd=0.8177507956510826"></script></div>
  	            			<script src="//www.livehelpnow.net/lhn/widgets/chatbutton/lhnchatbutton-current.min.js" type="text/javascript" id="lhnscript"></script>
						</li>
		            	<li id="blog" class="blog">
		                  	<a href="{$link->getModuleLink('news','list')}">{l s='Blog'}</a>
						</li>
		            	<li id="search" class="search">
		                  	<a href="javascript:void(0)" class="fa fa-search"></a>
						</li>
                        <li id="cart">{hook h='displayMatCart'}</li>
                        <li id="user">{hook h='displayMatUser'}</li>

	        		</ul>
	        	</div>
	        </div>
    	</div>
    	<div class="search-container"> {hook h="displayMatBuscador"} </div>
  	</header>
</div>

<div class="main-container">

{if $page_name !='index' && $page_name !='pagenotfound'}
	<div class="top_banner_wrap"> {*hook h="displayBanner"*} </div>
{/if}
<div id="columns" class="cf {if $page_name !='index' && $page_name !='product' && $page_name != 'module-guestbookwithavatars-guestbook'}{/if}">
{if $page_name !='index' && $page_name !='pagenotfound'}
						{if $page_name =='product' || $page_name == 'module-guestbookwithavatars-guestbook'}
{/if}

  {include file="$tpl_dir./breadcrumb.tpl"}
  {if $page_name =='product'  || $page_name == 'module-guestbookwithavatars-guestbook'}
{/if}
					{/if}
{if $page_name =='index' && false}

<div id="slider_row">
	  <div id="top_column" class="center_column">
		  	<div class="container">
			    <!-- hook displayTopColumn -->
			    {hook h="displayTopColumn"}
			    <!-- end hook displayTopColumn -->
			    <!-- hook displayEasyCarousel2 -->
			    {hook h='displayEasyCarousel2'}
			    <!-- end hook displayEasyCarousel2 -->
			    <!-- hook dislayCustomBanners2 -->
			    {hook h='displayCustomBanners2'}
			    <!-- end hook dislayCustomBanners2 -->
			</div>
	  </div>
</div>
{/if}
<div class="{if $page_name !='index' && $page_name !='pagenotfound'}{/if}">

{if $page_name =='category'}
    {assign var="haschildrens" value=Category::getChildren($category->id,$cookie->id_lang,1,$cookie->id_shop)|count}
    {if $haschildrens>0}
        {assign var="left_column_size" value=0}
    {/if}
{/if}

{if isset($left_column_size) && !empty($left_column_size) && ($page_name != 'module-news-new')}

    {if $page_name =='category'}
		<!--Bloque1 Visualizados-->
    
	    <div id="displayed-category" class="displayed-category">
			<div class="container">
			    <!-- Chaordic Top -->
                <div chaordic="top"></div>
			</div>
	    </div>
		<!--Fin Bloque1 Visualizados-->
    {/if}


		<!--Bloque2 Parrilla Productos-->
		<div class="parrilla-productos">
			<div class="container">
			    <div class='ax-btn-filter'><p>Filtrar por: <i class='fa fa-sliders'></i></p></div>
				<div id="left_column" class="column grid_{$left_column_size|intval} alpha ">{$HOOK_LEFT_COLUMN}</div>
{/if}
{if isset($left_column_size) && isset($right_column_size)}{assign var='cols' value=(12 - $left_column_size - $right_column_size)}{else}{assign var='cols' value=12}{/if}
    <div id="center_column" class="center_column  grid_{$cols|intval} omega alpha">
{/if}