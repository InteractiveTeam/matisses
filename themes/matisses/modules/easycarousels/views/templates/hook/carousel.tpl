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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{*** NOTE: Main layout starts after functions. ***}

{function displayManufacturerDetails item = ''}
	<a class="item-name" href="{$link->getManufacturerLink($item.id_manufacturer, $item.link_rewrite)|escape:'html'}" title="{l s='More about %s' sprintf=[$item.name] mod='easycarousels'}">
		<img class="replace-2x img-responsive" src="{$item.image_url|escape:'html'}" alt="{$item.name|escape:'html'}"/>
		<h5>{$item.name|escape:'html':'UTF-8'}</h5>
	</a>
{/function}

{function displaySupplierDetails item = ''}
	<a class="item-name" href="{$link->getSupplierLink($item.id_supplier, $item.link_rewrite)|escape:'html'}" title="{l s='More about %s' sprintf=[$item.name] mod='easycarousels'}">
		<img class="replace-2x img-responsive" src="{$item.image_url|escape:'html'}" alt="{$item.name|escape:'html'}"/>
		<h5>{$item.name|escape:'html':'UTF-8'}</h5>
	</a>
{/function}

{function displayProductDetails item = '' general_settings = ''}
	<div class="product-container" itemscope itemtype="http://schema.org/Product">
	<div class="left-block">
		<div class="product-image-container">
			<div class="wrap_image_list">
				<a class="product_img_link"	href="{$item.link|escape:'html':'UTF-8'}" title="{$item.name|escape:'html':'UTF-8'}" itemprop="url">
					<img class="replace-2x img-responsive" src="{$link->getImageLink($item.link_rewrite, $item.id_image, $general_settings.image_type)|escape:'html':'UTF-8'}" alt="{if !empty($item.legend)}{$item.legend|escape:'html':'UTF-8'}{else}{$item.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($item.legend)}{$item.legend|escape:'html':'UTF-8'}{else}{$item.name|escape:'html':'UTF-8'}{/if}" {if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if} itemprop="image" />
				</a>
			</div>
			{if ($item.allow_oosp || $item.quantity > 0)}
				{if $general_settings.show_stickers}
					<div class="wrap_features">
						{if isset($item.new) && $item.new == 1}
							<a class="tag new" href="{$item.link|escape:'html':'UTF-8'}">
								<span class="new-label">{l s='New' mod='easycarousels'}</span>
							</a>
						{/if}
						{if isset($item.on_sale) && $item.on_sale && isset($item.show_price) && $item.show_price && !$PS_CATALOG_MODE}
							<a class="tag sale" href="{$item.link|escape:'html':'UTF-8'}">
								<span class="sale-label">{l s='Sale!' mod='easycarousels'}</span>
							</a>
						{/if}
						{if $item.specific_prices.reduction_type == 'percentage'}
						<span class="tag price-percent-reduction">-{($item.specific_prices.reduction * 100)|escape:'html'}%</span>
					{/if}
					</div>
				{/if}
			{/if}
			{if ($general_settings.show_stock && !$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($item.show_price) && $item.show_price) || (isset($item.available_for_order) && $item.available_for_order)))}
			{if isset($item.available_for_order) && $item.available_for_order && !isset($restricted_country_mode)}
				<span itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="availability">
					{if ($item.allow_oosp || $item.quantity > 0)}
						{*<span class="{if $item.quantity <= 0 && !$item.allow_oosp}out-of-stock{else}available-now{/if}">
							<link itemprop="availability" href="http://schema.org/InStock" />{if $item.quantity <= 0}{if $item.allow_oosp}{if isset($item.available_later) && $item.available_later}{$item.available_later}{else}{l s='In Stock' mod='easycarousels'}{/if}{else}{l s='Out of stock' mod='easycarousels'}{/if}{else}{if isset($item.available_now) && $item.available_now}{$item.available_now}{else}{l s='In Stock' mod='easycarousels'}{/if}{/if}
						</span>*}
					{elseif (isset($item.quantity_all_versions) && $item.quantity_all_versions > 0)}
						<span class="tag out diff">
							<link itemprop="availability" href="http://schema.org/LimitedAvailability" />{l s='Available with different options' mod='easycarousels'}
						</span>
					{else}
						<span class="tag out">
							<link itemprop="availability" href="http://schema.org/OutOfStock" />{l s='Out of stock' mod='easycarousels'}
						</span>
					{/if}
				</span>
			{/if}
		{/if}
		</div>
		{hook h="displayProductDeliveryTime" product=$item}
		{hook h="displayProductPriceBlock" product=$item type="weight"}
	</div>
	<div class="right-block">
		<div class="wrap_content_price">
			{hook h='displayProductListReviews' product=$item}
			<h5 class="product-name" itemprop="name">
				{if isset($item.pack_quantity) && $item.pack_quantity}{$item.pack_quantity|intval|cat:' x '}{/if}
				<a href="{$item.link|escape:'html':'UTF-8'}" title="{$item.name|escape:'html':'UTF-8'}" itemprop="url" >
					{$item.name|truncate:45:'...'|escape:'html':'UTF-8'}
				</a>
			</h5>
			{if ($general_settings.show_price && !$PS_CATALOG_MODE && ((isset($item.show_price) && $item.show_price) || (isset($item.available_for_order) && $item.available_for_order)))}
			<div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="content_price main">
				{if isset($item.show_price) && $item.show_price && !isset($restricted_country_mode)}
					<meta itemprop="priceCurrency" content="{$currency->iso_code|escape:'html'}" />
					{if isset($item.specific_prices) && $item.specific_prices && isset($item.specific_prices.reduction) && $item.specific_prices.reduction > 0}
						{hook h="displayProductPriceBlock" product=$item type="old_price"}
						<span class="old-price product-price">
							{displayWtPrice p=$item.price_without_reduction}
						</span>
						{hook h="displayProductPriceBlock" id_product=$item.id_product type="old_price"}
						{if $item.specific_prices.reduction_type == 'percentage'}
							{*<span class="price-percent-reduction">-{($item.specific_prices.reduction * 100)|escape:'html'}%</span>*}
						{/if}
					{/if}
					<span itemprop="price" class="price product-price">
						{if !$priceDisplay}{convertPrice price=$item.price}{else}{convertPrice price=$item.price_tax_exc}{/if}
					</span>
					{hook h="displayProductPriceBlock" product=$item type="price"}
					{hook h="displayProductPriceBlock" product=$item type="unit_price"}
				{/if}
			</div>
			{/if}
		</div>
		{if isset($item.color_list)}
			{*<div class="color-list-container">{$item.color_list}</div>*}
		{/if}
	</div>
			<div class="wrap_view wrap_visible_hover">
			{if $general_settings.show_view_more}
				{*<a itemprop="url" class="scale_hover_in lnk_view" href="{$item.link|escape:'html':'UTF-8'}" title="{l s='View' mod='easycarousels'}">
					<i class="fa fa-search"></i>
					<span>{if (isset($item.customization_required) && $item.customization_required)}{l s='Customize' mod='easycarousels'}{else}{l s='More' mod='easycarousels'}{/if}</span>
				</a>*}
			{/if}
			{hook h='displayProductListFunctionalButtons' product=$item}
			{if $general_settings.show_quick_view}
				<a class="scale_hover_in quick-view" href="{$item.link|escape:'html':'UTF-8'}" rel="{$item.link|escape:'html':'UTF-8'}">
					<i class="font-eye"></i><span>{l s='Quick view' mod='easycarousels'}</span>
				</a>
			{/if}
			<div class="button-container clearfix">
			{if $general_settings.show_add_to_cart}
				{if ($item.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $item.available_for_order && !isset($restricted_country_mode) && $item.customizable != 2 && !$PS_CATALOG_MODE}
					{if (!isset($item.customization_required) || !$item.customization_required) && ($item.allow_oosp || $item.quantity > 0)}
						{capture}add=1&amp;id_product={$item.id_product|intval}{if isset($static_token)}&amp;token={$static_token}{/if}{/capture}
						<a class="btn btn_border ajax_add_to_cart_button" href="{$link->getPageLink('cart', true, NULL, $smarty.capture.default, false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='easycarousels'}" data-id-product="{$item.id_product|intval}" data-minimal_quantity="{if isset($item.product_attribute_minimal_quantity) && $item.product_attribute_minimal_quantity > 1}{$item.product_attribute_minimal_quantity|intval}{else}{$item.minimal_quantity|intval}{/if}">
							<span>{l s='Add to cart' mod='easycarousels'}</span>
						</a>
					{else}
						<span class="btn btn_border ajax_add_to_cart_button disabled">
							<span>{l s='Add to cart' mod='easycarousels'}</span>
						</span>
					{/if}
				{/if}
			{/if}
		</div>
		<div class="share_product">
			<a data-target="https://plus.google.com/share?url=[{$item.link|escape:'html':'UTF-8'}]" class="btn_google" target="_blank"><i class="fa fa-google-plus"></i></a>
			<a data-target="http://www.linkedin.com/shareArticle?mini=true&url={$item.link|escape:'html':'UTF-8'}&title={$item.name|escape:'html':'UTF-8'}&source=$base_dir}" class="btn_in" target="_blank"> <i class="fa fa-linkedin" ></i></a>
			<a data-target="http://twitter.com/home?status={$item.name|escape:'html':'UTF-8'} + {$item.link|escape:'html':'UTF-8'}" class="btn_twitter" target="_blank"><i class="fa fa-twitter"></i></a>
			<a data-target="http://www.facebook.com/sharer.php?u={$item.link|escape:'html':'UTF-8'}
&t={$item.name|escape:'html':'UTF-8'}" class="btn_facebook" target="_blank"><i class="fa fa-facebook"></i></a>
		</div>
		</div>
	</div>
{/function}

{function generateCarousel hook_name = '' carousel = '' in_tabs = false}
	<div id="{$hook_name|escape:'html'}_{$carousel.carousel_type|escape:'html'}" class="{$carousel.general_settings.custom_class|escape:'html'}{if $in_tabs} tab-pane{else} single_carousel {/if}{if $smarty.foreach.cit_details.first} active{/if} {if $carousel.carousel_type|escape:'html'=='manufacturers' || $carousel.carousel_type|escape:'html'=='suppliers' && $hook_name|escape:'html' != 'displayFooterProduct'}container{/if} {if $carousel.carousel_type|escape:'html' != 'manufacturers' && $carousel.carousel_type|escape:'html' != 'suppliers'} product_carousel_block {/if} carousel_block {$carousel.carousel_type|escape:'html'}">
		{if !$in_tabs && isset($carousel.name)}
			<h2 class="title_main_section carousel_title"><span>{$carousel.name|escape:'html'}</span></h2>
			{if $carousel.carousel_type|escape:'html'=='manufacturers'}
				<h3 class="undertitle_main"><span>
        		{l s='Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.' mod='tfblockmanufacturer' mod='easycarousels'}</span></h3>
        	{elseif $carousel.carousel_type|escape:'html'=='samecategory'}
				<h3 class="undertitle_main"><span>
        		{l s='Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.' mod='easycarousels'}</span></h3>
        	{/if}
		{/if}
		<div class="easycarousel {if !$in_tabs && isset($carousel.name)}block_content{/if}" data-settings="{$carousel.owl_settings|escape:'html'}">
			{foreach from=$carousel.items item=item}
				<div class="carousel_col">
					{foreach from=$item item=i key=k}
						<div class="c_item {if $carousel.carousel_type == 'manufacturers' || $carousel.carousel_type == 'suppliers'}man-sup-item{/if}">
							{if $carousel.carousel_type == 'manufacturers'}
								{displayManufacturerDetails item = $i}
							{else if $carousel.carousel_type == 'suppliers'}
								{displaySupplierDetails item = $i}
							{else}
								{displayProductDetails item = $i general_settings = $carousel.general_settings}
							{/if}
						</div>
					{/foreach}
				</div>
			{/foreach}
		</div>
	</div>
{/function}

<!-- carousels grouped in tabs -->
{if $carousels_in_tabs|count > 0}
	<div class="easycarousels in_tabs clearfix">
		{if $hook_name|escape:'html' == 'displayEasyCarousel2'}
			<h2 class="title_main_section"><span>{l s='Featured products' mod='easycarousels'}</span></h2>
			<h3 class="undertitle_main">
			{l s='Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.' mod='easycarousels'}</h3>
		{/if}
		<ul id="{$hook_name|escape:'html'}_easycarousel_tabs" class="tabs_carousel nav nav-tabs easycarousel_tabs closed" data-tabs="tabs" role="tablist">
			{foreach from=$carousels_in_tabs item=carousel name=cit}
				{if $smarty.foreach.cit.first}
					<li class="responsive_tabs_selection title_block">
						<a href="" title="{$carousel.name|escape:'html'}" onclick="event.preventDefault();">
							<span class="selection">{$carousel.name|escape:'html'}</span>
							<i class="icon icon-angle-down x2"></i>
						</a>
					</li>
				{/if}
				<li class="{if $smarty.foreach.cit.first}first active{/if} carousel_title">
					<a data-toggle="tab" href="#{$hook_name|escape:'html'}_{$carousel.carousel_type|escape:'html'}">{if isset($carousel.name)}{$carousel.name|escape:'html'}{/if}</a>
				</li>
			{/foreach}
		</ul>
		<div class="tab-content row">
		{foreach from=$carousels_in_tabs item=carousel name=cit_details}
			{generateCarousel hook_name = $hook_name carousel = $carousel in_tabs = true}
		{/foreach}
		</div>
	</div>
{/if}

<!-- carousels out of tabs -->
{if $carousels_one_by_one|count > 0}
	<div class="easycarousels one_by_one clearfix row">
		{foreach from=$carousels_one_by_one item = carousel}
			{generateCarousel hook_name = $hook_name carousel = $carousel}
		{/foreach}
	</div>
{/if}
