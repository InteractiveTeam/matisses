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

{if isset($wishlists) && count($wishlists) > 1}
    <a class="addToWishlist scale_hover_in lnk_view choseWishlist" data-div="wishlist_{$product.id_product}" tabindex="0" data-toggle="popover"  data-trigger="focus" title="{l s='Wishlist' mod='blockwishlist'}" data-placement="bottom">
        <i class="fa fa-heart-o"></i><span>{l s='To wishlist'}</span>
    </a>     
        <div id="wishlist_{$product.id_product}" class="popover-content" style="display: none">
        <h2>{l s='Seleccione la lista de deseos' mod='blockwishlist'}</h2>
          <div class="col-xs-4">
                <select id="wishlist_{$product.id_product}" class="form-control">
                    <option value="">-</option>
                    {foreach name=wl from=$wishlists item=wishlist}
                        <option value="{$wishlist.id_wishlist}">{$wishlist.name}&nbsp;</option>
                    {/foreach}
                </select>
            </div>
         <div class="row">
            <a href="#" title="Adicionar" value="{$wishlist.id_wishlist}" onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', false, 1, $('#wishlist_{$product.id_product}').val());">
                {l s='Adicionar'}
             </a>
         </div>           
        </div>
    
{else}
	<a class="addToWishlist wishlistProd_{$product.id_product|intval}" href="#" {*rel="{$product.id_product|intval}"*} onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', false, 1); return false;">
		<i class="fa fa-heart-o"></i><span>{l s='To wishlist'}</span>
	</a>
{/if}