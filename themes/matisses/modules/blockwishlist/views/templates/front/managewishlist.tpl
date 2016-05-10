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

{if $products}
    {if !$refresh}
        <div class="wishlistLinkTop">
            <div class="order-close grid_12">
                <a id="hideSendWishlist" href="javascript:void(0)" onclick="WishlistVisibility('wishlistLinkTop', 'SendWishlist'); return false;" rel="nofollow" title="{l s='Close this wishlist' mod='blockwishlist'}">
                    <i class="fa fa-times"></i>
                </a>
            </div>
            <div class="display_list grid_12 alpha omega">
                <ul class="cf">
                    <li>
                        <a  id="hideBoughtProducts" class="button_account" href="javascript:void(0)" onclick="WishlistVisibility('wlp_bought', 'BoughtProducts'); return false;" title="{l s='Hide products' mod='blockwishlist'}">
                            {l s='Ocultar productos' mod='blockwishlist'}
                            <i class="fa fa-sort-asc"></i>
                        </a>
                        <a id="showBoughtProducts" class="button_account" href="javascript:void(0)" onclick="WishlistVisibility('wlp_bought', 'BoughtProducts'); return false;" title="{l s='Show products' mod='blockwishlist'}">
                            {l s='Mostrar productos' mod='blockwishlist'}
                            <i class="fa fa-sort-desc"></i>
                        </a>
                    </li>
                    {if count($productsBoughts)}
                        <!-- <li>
                            <a id="hideBoughtProductsInfos" class="button_account" href="javascript:void(0)" onclick="WishlistVisibility('wlp_bought_infos', 'BoughtProductsInfos'); return false;" title="{l s='Hide products' mod='blockwishlist'}">
                                {l s="Ocultar información del producto comprado" mod='blockwishlist'}
                            </a>
                            <a id="showBoughtProductsInfos" class="button_account" href="javascript:void(0)" onclick="WishlistVisibility('wlp_bought_infos', 'BoughtProductsInfos'); return false;" title="{l s='Show products' mod='blockwishlist'}">
                                {l s="Mostrar información de productos comprados" mod='blockwishlist'}
                            </a>
                        </li> -->
                    {/if}
                </ul>
            </div>
            <div class="wishlisturl form-group grid_12">
                <label>{l s='Permalink' mod='blockwishlist'}:</label>
                <input type="text" class="form-control" value="{$link->getModuleLink('blockwishlist', 'view', ['token' => $token_wish])|escape:'html':'UTF-8'}" readonly="readonly"/>
            </div>
            <div class="submit grid_12 hidden">
                <a id="showSendWishlist" class="btn btn-default btn-red" href="javascript:void(0)" onclick="WishlistVisibility('wl_send', 'SendWishlist'); return false;" title="{l s='Send this wishlist' mod='blockwishlist'}">
                    {l s='Send this wishlist' mod='blockwishlist'}
                </a>
            </div>
        {/if}
    <div class="wlp_bought grid_12 alpha omega">
        {assign var='nbItemsPerLine' value=4}
        {assign var='nbItemsPerLineTablet' value=3}
        {assign var='nbLi' value=$products|@count}
        {math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
        {math equation="nbLi/nbItemsPerLineTablet" nbLi=$nbLi nbItemsPerLineTablet=$nbItemsPerLineTablet assign=nbLinesTablet}
        <ul class="row wlp_bought_list">
            {foreach from=$products item=product name=i}
                {math equation="(total%perLine)" total=$smarty.foreach.i.total perLine=$nbItemsPerLine assign=totModulo}
                {math equation="(total%perLineT)" total=$smarty.foreach.i.total perLineT=$nbItemsPerLineTablet assign=totModuloTablet}
                {if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
                {if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}
                <li id="wlp_{$product.id_product}_{$product.id_product_attribute}"
                    class="grid_3 {if $smarty.foreach.i.iteration%$nbItemsPerLine == 0} last-in-line{elseif $smarty.foreach.i.iteration%$nbItemsPerLine == 1} first-in-line{/if} {if $smarty.foreach.i.iteration > ($smarty.foreach.i.total - $totModulo)}last-line{/if} {if $smarty.foreach.i.iteration%$nbItemsPerLineTablet == 0}last-item-of-tablet-line{elseif $smarty.foreach.i.iteration%$nbItemsPerLineTablet == 1}first-item-of-tablet-line{/if} {if $smarty.foreach.i.iteration > ($smarty.foreach.i.total - $totModuloTablet)}last-tablet-line{/if}">
                    <div class="row">
                        <div class="grid_12 alpha omega">
                            <div class="product_image">
                                <a href="{$link->getProductlink($product.id_product, $product.link_rewrite, $product.category_rewrite)|escape:'html':'UTF-8'}" title="{l s='Product detail' mod='blockwishlist'}">
                                    <img class="replace-2x img-responsive"  src="{$link->getImageLink($product.link_rewrite, $product.cover, 'home_default')|escape:'html':'UTF-8'}" alt="{$product.name|escape:'html':'UTF-8'}"/>
                                </a>
                            </div>
                        </div>
                        <div class="grid_12 alpha omega">
                            <div class="product_infos">
                                <a class="lnkdel" href="javascript:;" onclick="WishlistProductManage('wlp_bought', 'delete', '{$id_wishlist}', '{$product.id_product}', '{$product.id_product_attribute}', $('#quantity_{$product.id_product}_{$product.id_product_attribute}').val(), $('#priority_{$product.id_product}_{$product.id_product_attribute}').val());" title="{l s='Delete' mod='blockwishlist'}">
                                    <i class="fa fa-trash-o"></i>
                                </a>

                                <div id="s_title" class="product-name">
                                    {$product.name|truncate:30:'...'|escape:'html':'UTF-8'}
                                    {if isset($product.attributes_small)}
                                        <a href="{$link->getProductlink($product.id_product, $product.link_rewrite, $product.category_rewrite)|escape:'html':'UTF-8'}" title="{l s='Product detail' mod='blockwishlist'}">
                                        {$product.attributes_small|escape:'html':'UTF-8'}
                                        </a>
                                    {/if}
                                </div>
                                <div class="wishlist_product_detail">
                                    <div class="form-group">
                                        <label for="quantity_{$product.id_product}_{$product.id_product_attribute}">
                                            {l s='Quantity' mod='blockwishlist'}:
                                        </label>
                                        <input type="text" class="form-control grey" id="quantity_{$product.id_product}_{$product.id_product_attribute}" value="{$product.quantity|intval}" size="3"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="priority_{$product.id_product}_{$product.id_product_attribute}">
                                            {l s='Priority' mod='blockwishlist'}:
                                        </label>
                                        <select id="priority_{$product.id_product}_{$product.id_product_attribute}" class="form-control grey">
                                            <option value="0"{if $product.priority eq 0} selected="selected"{/if}>
                                                {l s='High' mod='blockwishlist'}
                                            </option>
                                            <option value="1"{if $product.priority eq 1} selected="selected"{/if}>
                                                {l s='Medium' mod='blockwishlist'}
                                            </option>
                                            <option value="2"{if $product.priority eq 2} selected="selected"{/if}>
                                                {l s='Low' mod='blockwishlist'}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="btn_action">
                                    <a class="btn btn-default btn-red"  href="javascript:;" onclick="WishlistProductManage('wlp_bought_{$product.id_product_attribute}', 'update', '{$id_wishlist}', '{$product.id_product}', '{$product.id_product_attribute}', $('#quantity_{$product.id_product}_{$product.id_product_attribute}').val(), $('#priority_{$product.id_product}_{$product.id_product_attribute}').val());" title="{l s='Save' mod='blockwishlist'}">
                                        {l s='Save' mod='blockwishlist'}
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            {/foreach}
        </ul>
    </div>
    {if !$refresh}
        <form method="post" class="wl_send box unvisible grid_12 " onsubmit="return (false);">
            <fieldset>
            	<div class="row">
                    <div class="col-md-8" id="email">
                        <div class="form-group">
                            <label for="email">{l s='Email' mod='blockwishlist'}</label>
                            <input type="text" name="" id="email" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                    <button class="btn btn-default btn-red" type="button" id="AddEmail">
                                {l s='Adicionar Correo' mod='blockwishlist'}
                     </button>
                    </div>
                </div>
                <div class="emails"></div>
                <div class="row">
                <div class="submit">
                    <button class="btn btn-default btn-red" type="submit" name="submitWishlist"
                            onclick="WishlistSend('wl_send', '{$id_wishlist}', 'email');">
                        {l s='Send' mod='blockwishlist'}
                    </button>
                </div>
                </div>
                <!-- <p class="required">
                    <sup>*</sup> {l s='Required field' mod='blockwishlist'}
                </p> -->
            </fieldset>
        </form>
        {if count($productsBoughts) && false}
            <table class="wlp_bought_infos unvisible table table-bordered table-responsive">
                <thead>
                <tr>
                    <th class="first_item">{l s='Product' mod='blockwishlist'}</th>
                    <th class="item">{l s='Quantity' mod='blockwishlist'}</th>
                    <th class="item">{l s='Offered by' mod='blockwishlist'}</th>
                    <th class="last_item">{l s='Date' mod='blockwishlist'}</th>
                </tr>
                </thead>
                <tbody>
                {foreach from=$productsBoughts item=product name=i}
                    {foreach from=$product.bought item=bought name=j}
                        {if $bought.quantity > 0}
                            <tr>
                                <td class="first_item">
									<span style="float:left;">
										<img                                 src="{$link->getImageLink($product.link_rewrite, $product.cover, 'small')|escape:'html':'UTF-8'}"
                                            alt="{$product.name|escape:'html':'UTF-8'}"/>
									</span>
									<span style="float:left;">
										{$product.name|truncate:40:'...'|escape:'html':'UTF-8'}
                                        {if isset($product.attributes_small)}
                                            <br/>
                                            <i>{$product.attributes_small|escape:'html':'UTF-8'}</i>
                                        {/if}
									</span>
                                </td>
                                <td class="item align_center">
                                    {$bought.quantity|intval}
                                </td>
                                <td class="item align_center">
                                    {$bought.firstname} {$bought.lastname}
                                </td>
                                <td class="last_item align_center">
                                    {$bought.date_add|date_format:"%Y-%m-%d"}
                                </td>
                            </tr>
                        {/if}
                    {/foreach}
                {/foreach}
                </tbody>
            </table>
        {/if}
    {/if}
{else}
    <div class="alert alert-warning">
        {l s='No products' mod='blockwishlist'}
    </div>
{/if}
