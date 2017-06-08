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
* @author PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2014 PrestaShop SA

* @license http://opensource.org/licenses/afl-3.0.php Academic Free License (AFL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}
<div id="wrap_best" class="wrap_best tab-pane {if !isset($best_sellers) || !$best_sellers} hidden {/if}">
	{if isset($best_sellers) && $best_sellers}
	<div class="btn-title cf grid_12 alpha omega">
		<h1>
			<a href="javascript:void(0)" id="ax-more" alt="More">
				{l s='Más vendidos' mod='blockbestseller'}
			</a>
		</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="inner_products">
				{include file="$tpl_dir./product-list.tpl" products=$best_sellers class='blockbestsellers' id='blockbestsellers'}
			</div>
		</div>
		<div class="link_more">
			<a href="{$link->getPageLink('best-sales')|escape:'html'}" title="{l s='All best sellers' mod='blockbestsellers'}"  class="btn btn-default button button-small pull-right"><span>{l s='View more' mod='blockbestsellers'}</span></a>
		</div>
	</div>
{/if}
</div>
