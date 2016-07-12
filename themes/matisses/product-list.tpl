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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if isset($products) && $products}
	{*define numbers of product per line in other page for desktop*}
	{if $page_name !='index' && $page_name !='product'}
		{assign var='nbItemsPerLine' value=3}
		{assign var='nbItemsPerLineTablet' value=2}
		{assign var='nbItemsPerLineMobile' value=3}
	{else}
		{assign var='nbItemsPerLine' value=4}
		{assign var='nbItemsPerLineTablet' value=3}
		{assign var='nbItemsPerLineMobile' value=2}
	{/if}
	{*define numbers of product per line in other page for tablet*}
	{assign var='nbLi' value=$products|@count}
	{math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
	{math equation="nbLi/nbItemsPerLineTablet" nbLi=$nbLi nbItemsPerLineTablet=$nbItemsPerLineTablet assign=nbLinesTablet}
	<!-- Products list -->
	<div{if isset($id) && $id} id="{$id}"{/if} class="{if $page_name != 'index'}category_list {/if} product_list grid row{if isset($class) && $class} {$class}{/if}">
	<div class="inner-product-list cf" itemscope itemtype="http://schema.org/ItemList">
    {foreach from=$products item=product name=products}
		{math equation="(total%perLine)" total=$smarty.foreach.products.total perLine=$nbItemsPerLine assign=totModulo}
		{math equation="(total%perLineT)" total=$smarty.foreach.products.total perLineT=$nbItemsPerLineTablet assign=totModuloTablet}
		{math equation="(total%perLineT)" total=$smarty.foreach.products.total perLineT=$nbItemsPerLineMobile assign=totModuloMobile}
		{if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
		{if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}
		{if $totModuloMobile == 0}{assign var='totModuloMobile' value=$nbItemsPerLineMobile}{/if}

		<div itemscope itemprop="itemListElement" itemtype="http://schema.org/Product" class="ajax_block_product{if $page_name == 'index' || $page_name == 'product'} grid_4 {else} grid_4 {/if}{if $smarty.foreach.products.iteration%$nbItemsPerLine == 0} last-in-line{elseif $smarty.foreach.products.iteration%$nbItemsPerLine == 1} first-in-line{/if}{if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - $totModulo)} last-line{/if}{if $smarty.foreach.products.iteration%$nbItemsPerLineTablet == 0} last-item-of-tablet-line{elseif $smarty.foreach.products.iteration%$nbItemsPerLineTablet == 1} first-item-of-tablet-line{/if}{if $smarty.foreach.products.iteration%$nbItemsPerLineMobile == 0} last-item-of-mobile-line{elseif $smarty.foreach.products.iteration%$nbItemsPerLineMobile == 1} first-item-of-mobile-line{/if}{if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - $totModuloMobile)} last-mobile-line{/if}">
			<div class="product-container" id="{$product.id_product}">
				<div class="left-block">
					<div class="product-image-container">
					<div class="wrap_image_list">
						<a class="product_img_link"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
							<img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" itemprop="image" />
						</a>
					</div>
						{if ($product.allow_oosp || $product.quantity > 0)}
							<div class="wrap_features">
								{if isset($product.new) && $product.new == 1}
									<a class="new tag" href="{$product.link|escape:'html':'UTF-8'}">
										<span class="new-label">{l s='New'}</span>
									</a>
								{/if}
							{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
								<a class="tag sale" href="{$product.link|escape:'html':'UTF-8'}">
									<span class="sale-label">{l s='Sale!'}</span>
								</a>
							{/if}
							{if $product.specific_prices.reduction_type == 'percentage'}
											<span class="tag price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
							{/if}
							</div>
						{/if}
						{if (!$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
							{if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
								<span itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="availability scale_hover_in hidden-list">
									{if ($product.allow_oosp || $product.quantity > 0)}
										{*<span class="{if $product.quantity <= 0 && !$product.allow_oosp}out-of-stock{else}available-now{/if}">
											<link itemprop="availability" href="http://schema.org/InStock" />{if $product.quantity <= 0}{if $product.allow_oosp}{if isset($product.available_later) && $product.available_later}{$product.available_later}{else}{l s='In Stock'}{/if}{else}{l s='Out of stock'}{/if}{else}{if isset($product.available_now) && $product.available_now}{$product.available_now}{else}{l s='In Stock'}{/if}{/if}
										</span>*}
									{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
										<span class="tag out diff">
											<link itemprop="availability" href="http://schema.org/LimitedAvailability" />{l s='Available different options'}
										</span>
									{else}
										<span class="tag out">
											<link itemprop="availability" href="http://schema.org/OutOfStock" />{l s='Out of stock'}
										</span>
									{/if}
								</span>
							{/if}
						{/if}
					</div>
						{hook h="displayProductDeliveryTime" product=$product}
						{hook h="displayProductPriceBlock" product=$product type="weight"}
				</div>
				<div class="right-block">
					<div class="wrap_content_price">
						{hook h='displayProductListReviews' product=$product}
						<div class="header-products cf">
							<h2 class="product-name" itemprop="name">
								{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
								<a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
									{$product.name|truncate:45:'...'|escape:'html':'UTF-8'}
								</a>
							</h2>

						</div>


						<p class="product-desc" itemprop="description">
							{$product.description_short|strip_tags:'UTF-8'|truncate:300:'...'}
						</p>
						{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
							<div class="content_price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
								{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
								{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
										{hook h="displayProductPriceBlock" product=$product type="old_price"}
										<span class="old-price product-price">
											{displayWtPrice p=$product.price_without_reduction}
										</span>
									{/if}
									<span itemprop="price" class="price product-price">
										{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
									</span>
									<meta itemprop="priceCurrency" content="{$currency->iso_code}" />

									{hook h="displayProductPriceBlock" product=$product type="price"}
									{hook h="displayProductPriceBlock" product=$product type="unit_price"}
								{/if}
								<div class="colors">
                            	{if substr_count($product.color_list,'color_pick') > 1 } 
                                	{substr_count($product.color_list,'color_pick')} 
                                   	{l s='Colores'}
                                {else}
                                	{substr_count($product.color_list,'color_pick')} 
                                   	{l s='Color'}
                                {/if}
                                </div>
							</div>
						{/if}
					</div>

					<div class="product-flags">
						{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
							{if isset($product.online_only) && $product.online_only}
								<span class="online_only">{l s='Online only'}</span>
							{/if}
						{/if}
						{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
							{elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
								<span class="discount">{l s='Reduced price!'}</span>
							{/if}
					</div>

				</div>
				<div class="wrap_view wrap_visible_hover">


					{if isset($quick_view) && $quick_view}
					<a class="scale_hover_in quick-view" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
						<i class="font-eye"></i><span>{l s='Quick view'}</span>
					</a>
					{/if}
					{hook h='displayProductListFunctionalButtons' product=$product}
					<a itemprop="url" class="scale_hover_in lnk_view" href="{$product.link|escape:'html':'UTF-8'}" title="{l s='View'}">
						<i class="fa fa-search"></i>
						<span>{l s='More'}</span>
					</a>

					{if $page_name != 'index'}
						{if isset($comparator_max_item) && $comparator_max_item}
							<a class="add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}">
							<span>{l s='Add to Compare'}</span></a>
						{/if}
					{/if}

					<div class="button-container cf">
                    	<a class="btn btn-default showmore" href="{$product.link|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Descubre más'}" data-id-product="{$product.id_product|intval}">
							<span>{l s='Descubre más'}</span>
						</a>

						{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
							{if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
								{if isset($static_token)}
									<!--<a class="btn btn-default buy-now ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">-->
                                    <a class="btn btn-default buy-now customAddToCart" href="javascript:void(0)" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}" onclick="customAddTocart({$product.id_product},{$product.id_product_attribute})">
										<span>{l s='Comprar ahora'}</span>
									</a>
								{else}
									<!--<a class=" btn btn_border ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}" >-->
									
									<a class=" btn btn_border customAddToCart" href="javascript:void(0)" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}"  onclick="customAddTocart({$product.id_product},{$product.id_product_attribute})">
										<span>{l s='Add to cart'}</span>
									</a>
								{/if}
							{else}
								<span class=" btn btn_border ajax_add_to_cart_button disabled">
									<span>{l s='Add to cart'}</span>
								</span>
							{/if}
						{/if}
					</div>
                        {if isset($product.color_list)}
                            <div class="color-list-container">{$product.color_list}</div>
                        {/if}
                        {if false}
						<div class="share_product">
							<a data-target="https://plus.google.com/share?url=[{$product.link|escape:'html':'UTF-8'}]" class="btn_google" target="_blank"><i class="fa fa-google-plus"></i></a>
							<a data-target="http://www.linkedin.com/shareArticle?mini=true&amp;url={$product.link|escape:'html':'UTF-8'}&amp;title={$product.name|escape:'html':'UTF-8'}&amp;source={$base_dir}" class="btn_in" target="_blank"> <i class="fa fa-linkedin" ></i></a>
							<a data-target="http://twitter.com/home?status={$product.name|escape:'html':'UTF-8'} + {$product.link|escape:'html':'UTF-8'}" class="btn_twitter" target="_blank"><i class="fa fa-twitter"></i></a>
							<a data-target="http://www.facebook.com/sharer.php?u={$product.link|escape:'html':'UTF-8'}&amp;t={$product.name|escape:'html':'UTF-8'}" class="btn_facebook" target="_blank"><i class="fa fa-facebook"></i></a>
						</div>
                        {/if}
					</div>
			</div><!-- .product-container> -->

		</div>
	{/foreach}
	</div>
	</div>
{addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}
{/if}
