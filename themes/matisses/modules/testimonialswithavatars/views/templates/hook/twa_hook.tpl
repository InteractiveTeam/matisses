{*
* 2007-2015 PrestaShop
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2015 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="twa_container both-style {if $in_column} block {else} row none-column {if $displayType == 1} home-carousel-reviews {else} no-carousel-reviews{/if}{/if}">
	{if $in_column}
	{else}
	<div class="container">
	{/if}
	<h2 class="{if $in_column}title_block {else}title_main_section white_clr{/if}">
		<a href="{$link->getModuleLink('testimonialswithavatars', 'testimonials')|escape:'html'}" title="{l s='View all' mod='testimonialswithavatars'}">
		<span>
		{l s='Testimonials' mod='testimonialswithavatars'}
		</span>
		</a>
	</h2>
	<div class="twa_posts{if $displayType == 1} carousel{else if $displayType == 2 && !$in_column} grid{else} list{/if}">
		{include file="./../front/post-list.tpl" posts=$posts displayType=$displayType}	
	</div>
	<div class="button-wrap">
		<a class="view_all neat btn btn-default" href="{$link->getModuleLink('testimonialswithavatars', 'testimonials')|escape:'html'}" title="{l s='View all' mod='testimonialswithavatars'}">
			{l s='View all' mod='testimonialswithavatars'}
		</a>
	</div>
	{if $in_column}
	{else}
	</div>
	{/if}
</div>
