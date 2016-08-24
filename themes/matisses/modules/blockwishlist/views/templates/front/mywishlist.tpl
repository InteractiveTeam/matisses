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
<div class="container">
<div id="mywishlist" class="mywishlist">
	{capture name=path}
		<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">
			{l s='My account' mod='blockwishlist'}
		</a>
		<span class="navigation-pipe">
			{$navigationPipe}
		</span>
		<span class="navigation_page">
			{l s='Lista de deseos' mod='blockwishlist'}
		</span>
	{/capture}

	<h1 class="page-headings">{l s='Lista de deseos' mod='blockwishlist'}</h1>

	{include file="$tpl_dir./errors.tpl"}

	{if $id_customer|intval neq 0}
		<form method="post" class="std box" id="form_wishlist">
			<fieldset>
				<h2 class="page-subheading">{l s='New wishlist' mod='blockwishlist'}</h2>
				<div class="form-group">
					<input type="hidden" name="token" value="{$token|escape:'html':'UTF-8'}" />
					<label class="align_right" for="name">
						{l s='Name' mod='blockwishlist'}
					</label>
					<input type="text" id="name" name="name" class="inputTxt form-control" value="{if isset($smarty.post.name) and $errors|@count > 0}{$smarty.post.name|escape:'html':'UTF-8'}{/if}" />
				</div>
				<div class="submit">
                    <button id="submitWishlist" class="btn btn-default btn-red" type="submit" name="submitWishlist">
                    	{l s='Save' mod='blockwishlist'}
                    </button>
				</div>
			</fieldset>
		</form>
		{if $wishlists}
			<div id="block-history" class="block-history tbl-responsive">
                {section name=i loop=$wishlists}
                   <div class="ax-wishlits-cont" id="wishlist_{$wishlists[i].id_wishlist|intval}">
                    <div class="ax-wishlist-item">
                        <p class="first_item">{l s='Name' mod='blockwishlist'}</p>
                        <a class="ax-wishlist-list" href="javascript:;" onclick="javascript:WishlistManage('block-order-detail', '{$wishlists[i].id_wishlist|intval}');">{$wishlists[i].name|truncate:30:'...'|escape:'html':'UTF-8'}</a>
                    </div>
                    <div class="ax-wishlist-item">
                        <p class="item mywishlist_first">{l s='Qty' mod='blockwishlist'}</p>
                        <p class="mywishlist_num">
                            {assign var=n value=0}
                            {foreach from=$nbProducts item=nb name=i}
                                {if $nb.id_wishlist eq $wishlists[i].id_wishlist}
                                    {assign var=n value=$nb.nbProducts|intval}
                                {/if}
                            {/foreach}
                            {if $n}
                                {$n|intval}
                            {else}
                                0
                            {/if}
                        </p>
                    </div>
                    <div class="ax-wishlist-item">
                        <p class="item mywishlist_first">{l s='Viewed' mod='blockwishlist'}</p>
                        <p class="mywishlist_num">{$wishlists[i].counter|intval} </p>
                    </div>
                    <div class="ax-wishlist-item">
                        <p class="item mywishlist_second">{l s='Created' mod='blockwishlist'}</p>
                        <p class="mywishlist_num">{$wishlists[i].date_add|date_format:"%Y-%m-%d"}</p>
                    </div>
                    <div class="ax-wishlist-item">
                        <p class="item mywishlist_second">{l s='Direct Link' mod='blockwishlist'}</p>
                        <a href="javascript:;" onclick="javascript:WishlistManage('block-order-detail', '{$wishlists[i].id_wishlist|intval}');">{l s='View' mod='blockwishlist'}</a>
                    </div>
                    <div class="ax-wishlist-item wishlist_delete">
                        <p class="last_item mywishlist_first">{l s='Delete' mod='blockwishlist'}</p>
                        <a href="javascript:;"onclick="return (WishlistDelete('wishlist_{$wishlists[i].id_wishlist|intval}', '{$wishlists[i].id_wishlist|intval}', '{l s='Do you really want to delete this wishlist ?' mod='blockwishlist' js=1}'));">{l s='Delete' mod='blockwishlist'}</a>
                    </div>
                </div>
                {/section}
			</div>
			<div id="block-order-detail" class="block-order-detail">&nbsp;</div>
		{/if}
	{/if}
	<div class="footer_links grid_12 omega alpha">
        <a class="btn btn-default  btn-red" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}"> <i class="fa fa-chevron-left"></i>{l s='Volver a mi cuenta' mod='matisses'}</a>
    </div>
</div>
</div>
