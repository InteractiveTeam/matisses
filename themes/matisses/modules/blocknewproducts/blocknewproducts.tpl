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
<!-- MODULE Block new products -->
<div id="new-products_block_right" class="block products_block">
	<div class="btn-title cf">
		<h1 class="title_block">
    		<a href="{$link->getPageLink('new-products')|escape:'html'}" title="{l s='New products' mod='blockproducts'}">{l s='Nuevos productos' mod='blockproducts'}</a>
    	</h1>
		<div class="btn-view-products">
			<a href="{$link->getPageLink('new-products')|escape:'html'}" title="{l s='All new products' mod='blockproducts'}" class="btn btn-default button button-small">{l s='Ver todos' mod='blockproducts'}</a>
		</div>
	</div>
    <div class="block_content products-block">
        {if $new_products !== false}
            <div class="products product_list grid">
                {foreach from=$new_products item=product name=myLoop}
                    <div class="clearfix item product-container">
						<div class="product-content">

                            <div class="rate_left_product">{hook h='displayProductListReviews' product=$product}</div>

								<h2>
	                            	<a class="product-name" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">{$product.name|strip_tags|escape:html:'UTF-8'}</a>
	                            </h2>

							<div class="cf">
	                            {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
	                            	{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
	                                    <div class="price-box">
	                                        <span class="price product-price">
	                                        	{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
	                                        </span>
	                                    </div>
	                                {/if}
	                            {/if}

								{if isset($product.new) && $product.new == 1}
										<a class="new tag " href="{$product.link|escape:'html':'UTF-8'}">
											<span class="new-label">{l s='Nuevo'}</span>
										</a>
								{/if}
								{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
									<a class="tag sale" href="{$product.link|escape:'html':'UTF-8'}">
										<span class="sale-label">{l s='Venta!'}</span>
									</a>
								{/if}
							</div>

                        </div>
                        <div class="wrap_image_left">
	                        <a class="wrap_scale products-block-image" href="{$product.link|escape:'html'}" title="{$product.legend|escape:html:'UTF-8'}"><img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" /></a>

                        </div>
						<div class="logo-matisses cf"></div>
						<div class="product-description">
							<p>{$product.description_short|strip_tags:'UTF-8'|truncate:75:'...'}</p>
						</div>
				<div class="wrap_view wrap_visible_hover">
							<a itemprop="url" class="scale_hover_in lnk_view" href="{$product.link|escape:'html':'UTF-8'}" title="{l s='View'}">
								<i class="fa fa-search"></i>
								<span>{l s='More'}</span>
							</a>
							{hook h='displayProductListFunctionalButtons' product=$product}
							{if isset($quick_view) && $quick_view}
								<a class="scale_hover_in quick-view" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
									<i class="font-eye"></i><span>{l s='Quick view'}</span>
								</a>
							{/if}
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
										<a class=" btn btn-default
buy-now ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;id_product_attribute={$product.id_product_attribute|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Comprar ahora'}" data-id-product="{$product.id_product|intval}">
											<span>{l s='Comprar ahora'}</span>
										</a>
									{else}
										<a class=" btn btn_border ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
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
                        <div class="product-colors">
                        	{include file="$tpl_dir./product-list-colors.tpl"}
                        </div>
                        {if false}
                        
						<div class="share_product">
							<a data-target="https://plus.google.com/share?url=[{$product.link|escape:'html':'UTF-8'}]" class="btn_google" target="_blank"><i class="fa fa-google-plus"></i></a>
							<a data-target="http://www.linkedin.com/shareArticle?mini=true&amp;url={$product.link|escape:'html':'UTF-8'}&amp;title={$product.name|escape:'html':'UTF-8'}&amp;source={$base_dir}" class="btn_in" target="_blank"> <i class="fa fa-linkedin" ></i></a>
							<a data-target="http://twitter.com/home?status={$product.name|escape:'html':'UTF-8'} + {$product.link|escape:'html':'UTF-8'}" class="btn_twitter" target="_blank"><i class="fa fa-twitter"></i></a>
							<a data-target="http://www.facebook.com/sharer.php?u={$product.link|escape:'html':'UTF-8'}&amp;t={$product.name|escape:'html':'UTF-8'}" class="btn_facebook" target="_blank"><i class="fa fa-facebook"></i></a>
						</div>
                        {/if}
					</div>
                    </div>
                {/foreach}
            </div>

        {else}
        	<p>&raquo; {l s='Do not allow new products at this time.' mod='blockproducts'}</p>
        {/if}
    </div>
</div>
<!-- /MODULE Block new products -->
