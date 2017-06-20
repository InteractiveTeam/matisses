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
<!-- Block Viewed products -->
<div class="viewed-products">
	<div class="container">
		<div class="row">
			<div id="viewed-products_block_left" class="block">
				<div class="btn-title cf grid_12 alpha omega">
						<h1>
							<a href="javascript:void(0)" id="ax-more" alt="More">
							{l s='Productos Visualizados' mod='blockviewed'}
							</a>
						</h1>
					</div>
					<div class="btns-viewed">
						<div class="reload">
							<a href="javascript:void(0)" id="reload-slider"> refresh</a>
						</div>
						<div class="outside">
							<span id="slider-next" class="next-viewed"></span>
							<span id="slider-prev" class="prev-viewed"></span>
						</div>
					</div>
				</div>
				<div class="block_content products-block grid_12 alpha omega">
					{if $First}
					<ul class="grid_3 alpha">

					<li class="item cf first_item item">
								<a
								class="wrap_scale products-block-image"
								href="{$First->product_link|escape:'html':'UTF-8'}"
								title="{l s='More about %s' mod='blockviewed' sprintf=[$First->name|escape:'html':'UTF-8']}" >
									<img class="img-responsive"
									src="{if isset($First->id_image) && $First->id_image}{$link->getImageLink($First->link_rewrite, $First->cover, 'home_default')}{else}{$img_prod_dir}{$lang_iso}-default-medium_default.jpg{/if}"
									alt="{$First->legend|escape:'html':'UTF-8'}" />
								</a>
								<div class="product-content-view">
									<div class="header-products cf">
										<h2>
											<a class="product-name"
											href="{$First->product_link|escape:'html':'UTF-8'}"
											title="{l s='More about %s' mod='blockviewed' sprintf=[$First->name|escape:'html':'UTF-8']}">
												{$First->name|truncate:25:'...'|escape:'html':'UTF-8'}
											</a>
										</h2>
									</div>
									<!-- <p class="product-description">{$viewedProduct->description_short|strip_tags:'UTF-8'|truncate:60}</p> -->
									<div class="content_price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
										<span itemprop="price" class="price product-price">{convertPrice price=$First->price}</span>
										<meta itemprop="priceCurrency" content="COP">
										<div class="colors">
											{if $First->colors|count ==1} {$First->colors|count} {l s='Color'} {else} {$First->colors|count} {l s='Colores'} {/if}
										</div>
									</div>
								</div>
							</li>
					</ul>
					{/if}
					<div class="grid_9 slide-container omega">
					<ul class="viewedslider" >
					{foreach from=$viewed item=productsViewedObj name=myLoop2}
					<li>
					<ul>
						{foreach from=$productsViewedObj item=viewedProduct name=myLoop}
						{if $smarty.foreach.myLoop.iteration <= Configuration::get('PRODUCTS_VIEWED_NBR')}
							<li class="item clearfix{if $smarty.foreach.myLoop.last} last_item{elseif $smarty.foreach.myLoop.first} {else} item{/if}">

								<a
								class="wrap_scale products-block-image"
								href="{$viewedProduct->product_link|escape:'html':'UTF-8'}"
								title="{l s='More about %s' mod='blockviewed' sprintf=[$viewedProduct->name|escape:'html':'UTF-8']}" >
									<img class="img-responsive"
									src="{if isset($viewedProduct->id_image) && $viewedProduct->id_image}{$link->getImageLink($viewedProduct->link_rewrite, $viewedProduct->cover, 'home_default')}{else}{$img_prod_dir}{$lang_iso}-default-medium_default.jpg{/if}"
									alt="{$viewedProduct->legend|escape:'html':'UTF-8'}" />
								</a>
								<div class="product-content-view">
									<div class="header-products cf">
										<h2>
											<a class="product-name"
											href="{$viewedProduct->product_link|escape:'html':'UTF-8'}"
											title="{l s='More about %s' mod='blockviewed' sprintf=[$viewedProduct->name|escape:'html':'UTF-8']}">
												{$viewedProduct->name|truncate:25:'...'|escape:'html':'UTF-8'}
											</a>
										</h2>
									</div>
									<div class="content_price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
										<span itemprop="price" class="price product-price">{convertPrice price=$viewedProduct->price}</span>
										<meta itemprop="priceCurrency" content="COP">
										<div class="colors">
											{if $viewedProduct->colors|count ==1} {$viewedProduct->colors|count} {l s='Color'} {else} {$viewedProduct->colors|count} {l s='Colores'} {/if}
										</div>
									</div>

									<!-- <p class="product-description">{$viewedProduct->description_short|strip_tags:'UTF-8'|truncate:60}</p> -->
								</div>
							</li>
							{/if}
						{/foreach}
					</li> </ul>
					{/foreach}

					</ul>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>