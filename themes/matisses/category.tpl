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
{include file="$tpl_dir./errors.tpl"}
{if isset($category)}

	{if $category->id AND $category->active}
		{if $scenes || $category->description || $category->id_image}
			<div class="content_scene_cat">
				 {if $scenes}
					<div class="content_scene">
						<!-- Scenes -->
						{include file="$tpl_dir./scenes.tpl" scenes=$scenes}
						{if $category->description}
							<div class="cat_desc rte">
							{if Tools::strlen($category->description) > 350}
								<div id="category_description_short">{$description_short}</div>
								<div id="category_description_full" class="unvisible">{$category->description}</div>
								<a href="{$link->getCategoryLink($category->id_category, $category->link_rewrite)|escape:'html':'UTF-8'}" class="lnk_more">{l s='More'}</a>
							{else}
								<div>{$category->description}</div>
							{/if}
							</div>
						{/if}
					</div>
				{else}
					<!-- Category image -->
					<div class="content_scene_cat_bg"{if $category->id_image} style="background:url({$link->getCatImageLink($category->link_rewrite, $category->id_image, 'category_default')|escape:'html':'UTF-8'}) right center no-repeat; background-size:cover; min-height:{$categorySize.height}px;"{/if}>
						{if $category->description}
							<div class="cat_desc">
							<span class="category-name">
								{strip}
									{$category->name|escape:'html':'UTF-8'}
									{if isset($categoryNameComplement)}
										{$categoryNameComplement|escape:'html':'UTF-8'}
									{/if}
								{/strip}
							</span>
							{if Tools::strlen($category->description) > 350}
								<div id="category_description_short" class="rte">{$description_short}</div>
								<div id="category_description_full" class="unvisible rte">{$category->description}</div>
								<a href="{$link->getCategoryLink($category->id_category, $category->link_rewrite)|escape:'html':'UTF-8'}" class="lnk_more">{l s='More'}</a>
							{else}
								<div class="rte">{$category->description}</div>
							{/if}
							</div>
						{/if}
					 </div>
				  {/if}
			</div>
		{/if}
		{*<h1 class="page-heading{if (isset($subcategories) && !$products) || (isset($subcategories) && $products) || !isset($subcategories) && $products} product-listing{/if}"><span class="cat-name">{$category->name|escape:'html':'UTF-8'}{if isset($categoryNameComplement)}&nbsp;{$categoryNameComplement|escape:'html':'UTF-8'}{/if}</span>{include file="$tpl_dir./category-count.tpl"}</h1>*}
		{if isset($subcategories)}
		{if (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories) }
		<!-- Subcategories -->
		<div id="subcategories" class="subcategories">
			<h1 class="subcategory-heading">{$category->name}</h1>
			
			<ul class="cf">			
			{foreach from=$subcategories item=subcategory}
				<li>
					<div class="subcategory-image">
						<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
						{if $subcategory.id_image}
							<img class="replace-2x" src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'medium_default')|escape:'html':'UTF-8'}" alt="" width="{$mediumSize.width}" height="{$mediumSize.height}" />
							<div class="mask"></div>
						{else}
							<img class="replace-2x" src="{$img_cat_dir}default-medium_default.jpg" alt="" width="{$mediumSize.width}" height="{$mediumSize.height}" />
							<div class="mask"></div>
						{/if}
						</a>
					</div>
						<h2><a class="subcategory-name" href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}">{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'|truncate:350}</a></h2>
						{if $subcategory.description}
							<div class="cat_desc">{$subcategory.description}</div>
						{/if}
				</li>
			{/foreach}
			</ul>
		</div>
		{/if}
		{/if}
		<div class="slider_container cf grid_12 alpha omega">
		{hook h="underList"}
		</div>
		{*if $products && $subcategories*}
		{if $products}
		<div class="content_sortPagiBar cf grid_12 alpha omega">
			<div class="sortPagiBar grid_9 alpha omega">
				{include file="./product-compare.tpl"}
				{include file="./product-sort.tpl"}
				{include file="./nbr-product-page.tpl"}
			</div>
			<div class="top-pagination-content grid_3 alpha omega">
				{include file="$tpl_dir./pagination.tpl"}
			</div>
		</div>
        <ul class="view display hidden-xs">
            <li class="grid-btn">
                <a rel="nofollow" href="#" title="Cuadrícula">
                    <span></span>
                </a>
            </li>
            <li class="list-btn">
                <a rel="nofollow" href="#" title="Lista">
                    <span></span>
                </a>
            </li>
        </ul>
			{include file="./product-list.tpl" products=$products categoryname=$category->name}
			<div class="content_sortPagiBar cf grid_12 alpha omega bottom_pagi">
				<div class="sortPagiBar grid_9 alpha omega">
					{include file="./product-compare.tpl" paginationId='bottom'}
					{include file="./product-sort.tpl" paginationId='bottom'}
					{include file="./nbr-product-page.tpl" paginationId='bottom'}
				</div>
				<div class="bottom-pagination-content grid_3 alpha omega">
					{include file="./pagination.tpl" paginationId='bottom'}
				</div>
			</div>
		{/if}
	{elseif $category->id}
		<p class="alert alert-warning">{l s='This category is currently unavailable.'}</p>
	{/if}



{/if}
