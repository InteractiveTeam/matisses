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
{if count($categoryProducts) > 0 && $categoryProducts !== false}
<section class="page-product-box blockproductscategory">
	<h2 class="title_main_section"><span>{l s='Related products' mod='productscategory'}</span>
	</h2>
	<h3 class="undertitle_main">
		    		{l s='Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.' mod='productscategory'}
	</h3>
	<div id="productscategory_list" class="clearfix">
		<div id="bxslider1" class="product_list grid row clearfix">
		 {foreach from=$categoryProducts item='categoryProduct' name=categoryProduct}
			<div class="ajax_block_product col-xs-12">
				<div class="product-container" itemscope itemtype="http://schema.org/Product">
				<div class="left-block">
					<div class="product-image-container">
					<div class="wrap_image_list">
						<a class="product_img_link"	href="{$categoryProduct.link|escape:'html':'UTF-8'}" title="{$categoryProduct.name|escape:'html':'UTF-8'}" itemprop="url">
							<img class="replace-2x img-responsive" src="{$link->getImageLink($categoryProduct.link_rewrite, $categoryProduct.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($categoryProduct.legend)}{$categoryProduct.legend|escape:'html':'UTF-8'}{else}{$categoryProduct.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($categoryProduct.legend)}{$categoryProduct.legend|escape:'html':'UTF-8'}{else}{$categoryProduct.name|escape:'html':'UTF-8'}{/if}" itemprop="image" />
						</a>
					</div>
						{if ($categoryProduct.allow_oosp || $categoryProduct.quantity > 0)}
							<div class="wrap_features">
								{if isset($categoryProduct.new) && $categoryProduct.new == 1}
									<a class="new tag" href="{$categoryProduct.link|escape:'html':'UTF-8'}">
										<span class="new-label">{l s='New' mod='productscategory'}</span>
									</a>
								{/if}
							{if isset($categoryProduct.on_sale) && $categoryProduct.on_sale && isset($categoryProduct.show_price) && $categoryProduct.show_price && !$PS_CATALOG_MODE}
								<a class="tag sale" href="{$categoryProduct.link|escape:'html':'UTF-8'}">
									<span class="sale-label">{l s='Sale!' mod='productscategory'}</span>
								</a>
							{/if}
							{if $categoryProduct.specific_prices.reduction_type == 'percentage'}
											<span class="tag price-percent-reduction">-{$categoryProduct.specific_prices.reduction * 100}%</span>
							{/if}
							</div>
						{/if}
						{if (!$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($categoryProduct.show_price) && $categoryProduct.show_price) || (isset($categoryProduct.available_for_order) && $categoryProduct.available_for_order)))}
							{if isset($categoryProduct.available_for_order) && $categoryProduct.available_for_order && !isset($restricted_country_mode)}
								<span itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="availability scale_hover_in hidden-list">
									{if ($categoryProduct.allow_oosp || $categoryProduct.quantity > 0)}
										{*<span class="{if $categoryProduct.quantity <= 0 && !$categoryProduct.allow_oosp}out-of-stock{else}available-now{/if}">
											<link itemprop="availability" href="http://schema.org/InStock" />{if $categoryProduct.quantity <= 0}{if $categoryProduct.allow_oosp}{if isset($categoryProduct.available_later) && $categoryProduct.available_later}{$categoryProduct.available_later}{else}{l s='In Stock' mod='productscategory'}{/if}{else}{l s='Out of stock' mod='productscategory'}{/if}{else}{if isset($categoryProduct.available_now) && $categoryProduct.available_now}{$categoryProduct.available_now}{else}{l s='In Stock' mod='productscategory'}{/if}{/if}
										</span>*}
									{elseif (isset($categoryProduct.quantity_all_versions) && $categoryProduct.quantity_all_versions > 0)}
										<span class="tag out">
											<link itemprop="availability" href="http://schema.org/LimitedAvailability" />{l s='Available different options' mod='productscategory'}
										</span>
									{else}
										<span class="tag out">
											<link itemprop="availability" href="http://schema.org/OutOfStock" />{l s='Out of stock' mod='productscategory'}
										</span>
									{/if}
								</span>
							{/if}
						{/if}
					</div>
						{hook h="displayProductDeliveryTime" product=$categoryProduct}
						{hook h="displayProductPriceBlock" product=$categoryProduct type="weight"}
				</div>
				<div class="right-block">
					<div class="wrap_content_price">
						{hook h='displayProductListReviews' product=$categoryProduct}
						<h5 class="product-name" itemprop="name">
							{if isset($categoryProduct.pack_quantity) && $categoryProduct.pack_quantity}{$categoryProduct.pack_quantity|intval|cat:' x '}{/if}
							<a href="{$categoryProduct.link|escape:'html':'UTF-8'}" title="{$categoryProduct.name|escape:'html':'UTF-8'}" itemprop="url" >
								{$categoryProduct.name|truncate:45:'...'|escape:'html':'UTF-8'}
							</a>
						</h5>
						<p class="product-desc" itemprop="description">
							{$categoryProduct.description_short|strip_tags:'UTF-8'|truncate:300:'...'}
						</p>
						{if (!$PS_CATALOG_MODE AND ((isset($categoryProduct.show_price) && $categoryProduct.show_price) || (isset($categoryProduct.available_for_order) && $categoryProduct.available_for_order)))}
							<div class="content_price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
								{if isset($categoryProduct.show_price) && $categoryProduct.show_price && !isset($restricted_country_mode)}
								{if isset($categoryProduct.specific_prices) && $categoryProduct.specific_prices && isset($categoryProduct.specific_prices.reduction) && $categoryProduct.specific_prices.reduction > 0}
										{hook h="displayProductPriceBlock" product=$categoryProduct type="old_price"}
										<span class="old-price product-price">
											{displayWtPrice p=$categoryProduct.price_without_reduction}
										</span>
									{/if}
									<span itemprop="price" class="price product-price">
										{if !$priceDisplay}{convertPrice price=$categoryProduct.price}{else}{convertPrice price=$categoryProduct.price_tax_exc}{/if}
									</span>
									<meta itemprop="priceCurrency" content="{$currency->iso_code}" />

									{hook h="displayProductPriceBlock" product=$categoryProduct type="price"}
									{hook h="displayProductPriceBlock" product=$categoryProduct type="unit_price"}
								{/if}
							</div>
						{/if}
					</div>
					{if isset($categoryProduct.color_list)}
						<div class="color-list-container">{$categoryProduct.color_list}</div>
					{/if}
					<div class="product-flags">
						{if (!$PS_CATALOG_MODE AND ((isset($categoryProduct.show_price) && $categoryProduct.show_price) || (isset($categoryProduct.available_for_order) && $categoryProduct.available_for_order)))}
							{if isset($categoryProduct.online_only) && $categoryProduct.online_only}
								<span class="online_only">{l s='Online only' mod='productscategory'}</span>
							{/if}
						{/if}
						{if isset($categoryProduct.on_sale) && $categoryProduct.on_sale && isset($categoryProduct.show_price) && $categoryProduct.show_price && !$PS_CATALOG_MODE}
							{elseif isset($categoryProduct.reduction) && $categoryProduct.reduction && isset($categoryProduct.show_price) && $categoryProduct.show_price && !$PS_CATALOG_MODE}
								<span class="discount">{l s='Reduced price!' mod='productscategory'}</span>
							{/if}
					</div>

				</div>
				<div class="wrap_view wrap_visible_hover">
							<a itemprop="url" class="scale_hover_in lnk_view" href="{$categoryProduct.link|escape:'html':'UTF-8'}" title="{l s='View' mod='productscategory'}">
								<i class="fa fa-search"></i>
								<span>{l s='More' mod='productscategory'}</span>
							</a>
							{hook h='displayProductListFunctionalButtons' product=$categoryProduct}
							{if isset($quick_view) && $quick_view}
								<a class="scale_hover_in quick-view" href="{$categoryProduct.link|escape:'html':'UTF-8'}" rel="{$categoryProduct.link|escape:'html':'UTF-8'}">
									<i class="font-eye"></i><span>{l s='Quick view' mod='productscategory'}</span>
								</a>
							{/if}
						<div class="button-container clearfix">
							{if ($categoryProduct.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $categoryProduct.available_for_order && !isset($restricted_country_mode) && $categoryProduct.minimal_quantity <= 1 && $categoryProduct.customizable != 2 && !$PS_CATALOG_MODE}
								{if (!isset($categoryProduct.customization_required) || !$categoryProduct.customization_required) && ($categoryProduct.allow_oosp || $categoryProduct.quantity > 0)}
									{if isset($static_token)}
										<a class=" btn btn_border ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$categoryProduct.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='productscategory'}" data-id-product="{$categoryProduct.id_product|intval}">
											<span>{l s='Add to cart' mod='productscategory'}</span>
										</a>
									{else}
										<a class=" btn btn_border ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$categoryProduct.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='productscategory'}" data-id-product="{$categoryProduct.id_product|intval}">
											<span>{l s='Add to cart' mod='productscategory'}</span>
										</a>
									{/if}
								{else}
									<span class=" btn btn_border ajax_add_to_cart_button disabled">
										<span>{l s='Add to cart' mod='productscategory'}</span>
									</span>
								{/if}
							{/if}
						</div>
					</div>
			</div><!-- .product-container> -->
			</div>
			{/foreach}
		</div>
	</div>
</section>
{/if}
