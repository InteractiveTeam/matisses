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
{if $banners}
<div class="custombanners {$hook_name|escape:'html'}" data-hook="{$hook_name|escape:'html'}">
	<div class="banners-in-carousel" style="display:none;">
		<div class="carousel" data-settings="{$carousel_settings|escape:'html'}">{* filled dynamically *}</div>
	</div>
		{if $hook_name|escape:'html' =='displayHome'}
		<div class="container">
		{/if}
		<div class="banners-one-by-one">
		{foreach name=items from=$banners item=banner}
			<div class="banner-item {if isset($banner.class)} {$banner.class|escape:'html'}{/if} {if $banner.in_carousel == 1}in_carousel{/if}
			banner_{$smarty.foreach.items.iteration}" {if $hook_name|escape:'html' =='displayBanner' && (isset($banner.img) && $banner.img)}style="background-image:url({$banner.img|escape:'html'});"{/if}>
				{if $hook_name|escape:'html' =='displayTopColumn' || $hook_name|escape:'html' =='displayCustomBanners3'}
					<div class="inner-banner-item {if $hook_name|escape:'html' =='displayCustomBanners3'}hover_scale{/if}">
				{/if}
				{if $hook_name|escape:'html' !='displayBanner'}
					{if isset($banner.img) && $banner.img}
						{if isset($banner.link) && $banner.link}
						<a href="{$banner.link.href|escape:'html'}"{if isset($banner.link._blank)} target="_blank"{/if}>
						{/if}
							<img src="{$banner.img|escape:'html'}"{if isset($banner.title)} title="{$banner.title|escape:'html'}"{/if} class="banner-img">	
						{if $hook_name|escape:'html' != 'displayTopColumn' && $hook_name|escape:'html' !='displayCustomBanners3'}			
							{if isset($banner.link) && $banner.link}
								</a>
							{/if}
						{/if}
					{/if}
				{/if}
					{if isset($banner.html) && $banner.html}					
						<div class="custom-html">
							{$banner.html}
						</div>
					{/if}
					{if $hook_name|escape:'html' == 'displayTopColumn' || $hook_name|escape:'html' == 'displayCustomBanners3'}
						{if $banner.img}
							{if isset($banner.link) && $banner.link}
								</a>
							{/if}
						{/if}
					{/if}
				{if $hook_name|escape:'html' =='displayTopColumn' || $hook_name|escape:'html' =='displayCustomBanners3'}
					</div>
				{/if}
			</div>
		{/foreach}
	</div>
	{if $hook_name|escape:'html' =='displayHome'}
	</div>
	{/if}
</div>
{/if}