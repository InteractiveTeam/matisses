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

{capture name=path}{l s='Search'}{/capture}
<!-- Chaordic Top -->
<div chaordic="top"></div>

<h1
{if isset($instant_search) && $instant_search}id="instant_search_results"{/if}
class="page-heading {if !isset($instant_search) || (isset($instant_search) && !$instant_search)} product-listing{/if}">
    {l s='Search'}&nbsp;
    {if $nbProducts > 0}
        <span class="lighter">
            "{if isset($search_query) && $search_query}{$search_query|escape:'html':'UTF-8'}{elseif $search_tag}{$search_tag|escape:'html':'UTF-8'}{elseif $ref}{$ref|escape:'html':'UTF-8'}{/if}"
        </span>
    {/if}
    {if isset($instant_search) && $instant_search}
        <a href="javascript:void(0)" class="close">
            {l s='Return to the previous page'}
        </a>
    {else}

        <span class="heading-counter">
            {if $nbProducts == 1}{l s='%d Resultado encontrado' sprintf=$nbProducts|intval}{else}{l s='%d Resultados encontrados' sprintf=$nbProducts|intval}{/if}
        </span>
    {/if}
</h1>

<!-- Chaordic Middle -->
<div chaordic="middle"></div>

{include file="$tpl_dir./errors.tpl"}
{if !$nbProducts}
	<p class="alert alert-warning">
		{if isset($search_query) && $search_query}
			{l s='No results were found for your search'}&nbsp;"{if isset($search_query)}{$search_query|escape:'html':'UTF-8'}{/if}"
		{elseif isset($search_tag) && $search_tag}
			{l s='No results were found for your search'}&nbsp;"{$search_tag|escape:'html':'UTF-8'}"
		{else}
			{l s='Please enter a search keyword'}
		{/if}
	</p>
{else}
	{if isset($instant_search) && $instant_search}
        <p class="alert alert-info">
            {if $nbProducts == 1}{l s='%d result has been found.' sprintf=$nbProducts|intval}{else}{l s='%d results have been found.' sprintf=$nbProducts|intval}{/if}
        </p>
    {/if}
    <div class="content_sortPagiBar cf grid_12 alpha omega">
        <div class="sortPagiBar grid_9 alpha omega bottom_pagi {if isset($instant_search) && $instant_search} instant_search{/if}">
            {include file="./product-compare.tpl"}
            {include file="./product-sort.tpl"}
            {if !isset($instant_search) || (isset($instant_search) && !$instant_search)}
                {include file="./nbr-product-page.tpl"}
            {/if}
        </div>
    	<div class="top-pagination-content grid_3 alpha omega">
            {if !isset($instant_search) || (isset($instant_search) && !$instant_search)}
                {include file="$tpl_dir./pagination.tpl"}
            {/if}
        </div>
	</div>
	<div class="parrilla-productos">
	    {include file="$tpl_dir./product-list.tpl" products=$search_products}    
	</div>	
    <div class="content_sortPagiBar cf grid_12 alpha omega">
        <div class="sortPagiBar grid_9 alpha omega bottom_pagi">
            {include file="./product-compare.tpl"}
            {include file="./product-sort.tpl"}
            {if !isset($instant_search) || (isset($instant_search) && !$instant_search)}
                {include file="./nbr-product-page.tpl"}
            {/if}
         </div>
    	<div class="top-pagination-content grid_3 alpha omega">
        	{if !isset($instant_search) || (isset($instant_search) && !$instant_search)}
                {include file="$tpl_dir./pagination.tpl" paginationId='bottom'}
            {/if}
        </div>
    </div>
{/if}

<!-- Chaordic Bottom -->
<div chaordic="bottom"></div>