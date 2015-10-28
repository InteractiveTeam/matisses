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
<div class="custombanners row {$hook_name|escape:'html'}" data-hook="{$hook_name|escape:'html'}">
	<div class="banners-in-carousel" style="display:none;">
		<div class="carousel" data-settings="{$carousel_settings|escape:'html'}">{* filled dynamically *}</div>
	</div>
	<div class="banners-one-by-one">
		<div class="row">
		{foreach $banners item=banner}
			<div class="banner-item{if isset($banner.class)} {$banner.class|escape:'html'}{/if}{if $banner.in_carousel == 1} in_carousel{/if}">
				<div class="banner-item-content">
				{if isset($banner.img) && $banner.img}
					{if isset($banner.link) && $banner.link}
					<a href="{$banner.link.href|escape:'html'}"{if isset($banner.link._blank)} target="_blank"{/if}>
					{/if}
						<img src="{$banner.img|escape:'html'}"{if isset($banner.title)} title="{$banner.title|escape:'html'}"{/if} class="banner-img">					
					{if isset($banner.link) && $banner.link}
					</a>
					{/if}
				{/if}
				{if isset($banner.html) && $banner.html}					
					<div class="custom-html">
						{$banner.html|escape:''}
					</div>
				{/if}
				</div>
			</div>
		{/foreach}
		</div>
	</div>
</div>
{/if}