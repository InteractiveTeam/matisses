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
<div class="new-products {if !isset($new_products) || !$new_products}hidden{/if}">
	{if isset($new_products) && $new_products}
	<div class="container">
		{*Nuevos productos*}
		<div class="row">
			<div id="wrap_new" class="tab-pane">
				<div class="btn-title cf grid_12 alpha omega">
					<h1>
						<a href="{$link->getPageLink('new-products')|escape:'html'}" id="ax-more" alt="More">
							{l s='Nuevos productos' mod='blocknewproducts'}
						</a>
					</h1>
				</div>
				<div class="inner_products">
					{include file="$tpl_dir./product-list.tpl" products=$new_products class='blocknewproducts' id='blocknewproducts'}
				</div>
				<div class="link_more">
					<a href="{$link->getPageLink('new-products')|escape:'html'}" title="{l s='All new products' mod='blocknewproducts'}" class="btn btn-default button button-small pull-right">{l s='Ver más' mod='blocknewproducts'}</a>
				</div>
			</div>
		</div>
	</div>
	{/if}
</div>