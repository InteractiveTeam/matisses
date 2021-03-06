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
{if sizeof($wishlists)<=1}
<div class="elem_butt">
	<a id="wishlist_button" href="javascript:void(0)" onclick="WishlistCart('wishlist_block_list', 'add', '{$id_product|intval}', $('#idCombination').val(), document.getElementById('quantity_wanted').value); return false;" rel="nofollow"  title="{l s='Add to my wishlist' mod='blockwishlist'}">
		<span class="hidden-xxs">{l s='Add to wishlist' mod='blockwishlist'}</span>
	</a>
</div>
{else}
<div class="elem_butt">
	<a id="wishlist_button" class="addToWishlist" href="javascript:void(0)" data-product="{$id_product|intval}" rel="nofollow"  title="{l s='Add to my wishlist' mod='blockwishlist'}">
		<span class="hidden-xxs">{l s='Add to wishlist' mod='blockwishlist'}</span>
	</a>
</div>	

<div class="fanbcybox-wishlist" style="display:none">
    <h3>{l s='Seleccione su lista de regalos' mod='blockwishlist'}</h3>
    <ul>
        {foreach from=$wishlists item=wishlist}
        <li>
            <a href="javascript:void(0)" title="{$wishlist.name}" value="{$wishlist.id_wishlist}" onclick="WishlistCart('wishlist_block_list', 'add', '{$id_product|intval}', false, 1, '{$wishlist.id_wishlist}');">
                {l s='%s Adicionar' sprintf=[$wishlist.name] mod='blockwishlist'}
             </a>
        </li>
        {/foreach}
    </ul>
</div>

{/if}


