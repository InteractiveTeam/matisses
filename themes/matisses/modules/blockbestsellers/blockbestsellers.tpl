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
<!-- MODULE Block best sellers -->
<div id="best-sellers_block_right" class="block products_block">
	<h4 class="title_block">
    	<a href="{$link->getPageLink('best-sales')|escape:'html'}" title="{l s='View a top sellers products' mod='blockbestsellers'}">{l s='Best' mod='blockbestsellers'}</a>
    </h4>
	<div class="block_content">
	{if $best_sellers && $best_sellers|@count > 0}
		<div class="products block_content products-block">
			{foreach from=$best_sellers item=product name=myLoop}
			<div class="clearfix item">
			<div class="wrap_image_left">
				<a href="{$product.link|escape:'html'}" title="{$product.legend|escape:'html':'UTF-8'}" class="wrap_scale products-block-image content_img clearfix">
					<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.legend|escape:'html':'UTF-8'}" />
				</a>
				{if isset($product.new) && $product.new == 1}
								<a class="new tag " href="{$product.link|escape:'html':'UTF-8'}">
									<span class="new-label">{l s='New'}</span>
								</a>
							{/if}
							{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
								<a class="tag sale" href="{$product.link|escape:'html':'UTF-8'}">
									<span class="sale-label">{l s='Sale!'}</span>
								</a>
				{/if}
			</div>
				<div class="product-content">
					<div class="rate_left_product">{hook h='displayProductListReviews' product=$product}</div>
                	<h5>
                    	<a class="product-name" href="{$product.link|escape:'html'}" title="{$product.legend|escape:'html':'UTF-8'}">
                            {$product.name|strip_tags:'UTF-8'|escape:'html':'UTF-8'}
                        </a>
                    </h5>
                    <p class="product-description">{$product.description_short|strip_tags:'UTF-8'|truncate:75:'...'}</p>
                    {if !$PS_CATALOG_MODE}
                        <div class="price-box">
                            <span class="price product-price">
                            	{$product.price}
                            </span>
                        </div>
                    {/if}
                </div>
			</div>
		{/foreach}
		</div>
		<div class="lnk">
        	<a href="{$link->getPageLink('best-sales')|escape:'html'}" title="{l s='All best sellers' mod='blockbestsellers'}"  class="btn btn-default button button-small"><span>{l s='All best sellers' mod='blockbestsellers'}<i class="icon-chevron-right right"></i></span></a>
        </div>
	{else}
		<p>{l s='No best sellers at this time' mod='blockbestsellers'}</p>
	{/if}
	</div>
</div>
<!-- /MODULE Block best sellers -->
