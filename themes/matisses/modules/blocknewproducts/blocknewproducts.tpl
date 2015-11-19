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
	<div class="btn-title-new cf">
		<h1 class="title_block">
    		<a href="{$link->getPageLink('new-products')|escape:'html'}" title="{l s='New products' mod='blocknewproducts'}">{l s='Nuevos productos' mod='blocknewproducts'}</a>
    	</h1>
		<div class="btn-view-products">
			<a href="{$link->getPageLink('new-products')|escape:'html'}" title="{l s='All new products' mod='blocknewproducts'}" class="btn btn-default button button-small">{l s='Ver todos' mod='blocknewproducts'}</a>
		</div>
	</div>
    <div class="block_content products-block">
        {if $new_products !== false}
            <div class="products">
                {foreach from=$new_products item=newproduct name=myLoop}
                    <div class="clearfix item">
						<div class="product-content">
                            <div class="rate_left_product">{hook h='displayProductListReviews' product=$newproduct}</div>

								<h2>
	                            	<a class="product-name" href="{$newproduct.link|escape:'html'}" title="{$newproduct.name|escape:html:'UTF-8'}">{$newproduct.name|strip_tags|escape:html:'UTF-8'}</a>
	                            </h2>

							<div class="cf">
	                            {if (!$PS_CATALOG_MODE AND ((isset($newproduct.show_price) && $newproduct.show_price) || (isset($newproduct.available_for_order) && $newproduct.available_for_order)))}
	                            	{if isset($newproduct.show_price) && $newproduct.show_price && !isset($restricted_country_mode)}
	                                    <div class="price-box">
	                                        <span class="price product-price">
	                                        	{if !$priceDisplay}{convertPrice price=$newproduct.price}{else}{convertPrice price=$newproduct.price_tax_exc}{/if}
	                                        </span>
	                                    </div>
	                                {/if}
	                            {/if}

								{if isset($newproduct.new) && $newproduct.new == 1}
										<a class="new tag " href="{$newproduct.link|escape:'html':'UTF-8'}">
											<span class="new-label">{l s='Nuevo'}</span>
										</a>
								{/if}
								{if isset($newproduct.on_sale) && $newproduct.on_sale && isset($newproduct.show_price) && $newproduct.show_price && !$PS_CATALOG_MODE}
									<a class="tag sale" href="{$newproduct.link|escape:'html':'UTF-8'}">
										<span class="sale-label">{l s='Venta!'}</span>
									</a>
								{/if}
							</div>

                        </div>
                        <div class="wrap_image_left">
	                        <a class="wrap_scale products-block-image" href="{$newproduct.link|escape:'html'}" title="{$newproduct.legend|escape:html:'UTF-8'}"><img class="replace-2x img-responsive" src="{$link->getImageLink($newproduct.link_rewrite, $newproduct.id_image, 'home_default')|escape:'html'}" alt="{$newproduct.name|escape:html:'UTF-8'}" /></a>

                        </div>
						<div class="logo-matisses cf"></div>
						<div class="product-description">
							<p>{$newproduct.description_short|strip_tags:'UTF-8'|truncate:75:'...'}</p>
						</div>

                    </div>
                {/foreach}
            </div>

        {else}
        	<p>&raquo; {l s='Do not allow new products at this time.' mod='blocknewproducts'}</p>
        {/if}
    </div>
</div>
<!-- /MODULE Block new products -->
