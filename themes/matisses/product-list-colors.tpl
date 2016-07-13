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
<ul class="color_to_pick_list cf">
	{foreach from=$colors_list item='color'}
		{assign var='img_color_exists' value=file_exists($col_img_dir|cat:$color.id_attribute|cat:'.jpg')}
		{assign var='id_image_p' value=matisses::getImagesByAttribute($color.id_product_attribute)}
        {if !empty($id_image_p)}
            {assign var='img_prod_color' value=$link->getImageLink($color.name, $id_image_p, 'home_default')}
        {/if}
		<li>
			<a 
            	data-idproductattribute="{$color.id_product_attribute}" 
            	data-idattribute="{$color.id_attribute}"
                data-idproduct="{$color.id_product}"
                
            href="javascript:void(0)" {if !empty($id_image_p)}onclick="changeImageColor('{$color.id_product}','{$color.name}','{$img_prod_color}','{$color.id_product_attribute}')"{/if} class="color_pick"{if !$img_color_exists && isset($color.color) && $color.color} style="background:{$color.color};"{/if}>
				{if $img_color_exists}
					<img src="{$img_col_dir}{$color.id_attribute|intval}.jpg" alt="{$color.name|escape:'html':'UTF-8'}" title="{$color.name|escape:'html':'UTF-8'}" width="20" height="20" />
				{/if}
			</a>
		</li>
	{/foreach}
</ul>
{literal}
<script type="text/javascript">
    function changeImageColor(idprod,namec,image,idattr) {
        var name = namec.replace(" ", "_").toLowerCase();
        name = getCleanedString(name);
        $('.product-container[id='+idprod+'] .left-block .product_img_link img').attr("src", image);
        
        var linkp = $('.product-container[id='+idprod+'] .button-container .showmore').attr("href").split("#");
        $('.product-container[id='+idprod+'] .button-container .showmore').attr("href", linkp[0]+"#/color-"+name);
        
       /* var linkw = $('.product-container[id='+idprod+'] .wrap_view .quick-view').attr("href").split("#");
        $('.product-container[id='+idprod+'] .wrap_view .quick-view').attr("href", linkw[0]+"#/color-"+name);*/
        
        var linkb = $('.product-container[id='+idprod+'] .wrap_view .lnk_view').attr("href").split("#");
        $('.product-container[id='+idprod+'] .wrap_view .lnk_view').attr("href", linkb[0]+"#/color-"+name);
          
        $('.product-container[id='+idprod+'] .wrap_view .wishlistProd_'+idprod).addClass('addToWS');
        $('.product-container[id='+idprod+'] .wrap_view .addToWS').removeClass('addToWishlist');
        $('.product-container[id='+idprod+'] .wrap_view .addToWS').removeAttr('data-product');
        
		$('.product-container[id='+idprod+'] .wrap_view .addToWS').click(function(){
			WishlistCart('wishlist_block_list', 'add', idprod, idattr, 1);
		});
        
        //$('.product-container[id='+idprod+'] .button-container .ajax_add_to_cart_button').remove();
        $('.product-container[id='+idprod+'] .button-container .customAddToCart').remove();        
        $('.product-container[id='+idprod+'] .button-container .ajax_add_to_cart_b').remove();
        
        $('.product-container[id='+idprod+'] .button-container').append('<a class="btn btn-default buy-now ajax_add_to_cart_b" href="javascript:void(0)"><span>{/literal}{l s="Add to cart"}{literal}</span></a>');
        
		
        $('.product-container[id='+idprod+'] .button-container .ajax_add_to_cart_b').click(function(){			
            customAddTocart(idprod,idattr);
		});
    }
    
    function customAddTocart(idprod,idattr){        
        ajaxCart.add(idprod, idattr, true, null, 1, null);
    }
    
    function getCleanedString(cadena){
       // Definimos los caracteres que queremos eliminar
       var specialChars = "!@#$^&%*()+=-[]\/{}|:<>?,.";

       // Los eliminamos todos
       for (var i = 0; i < specialChars.length; i++) {
           cadena= cadena.replace(new RegExp("\\" + specialChars[i], 'gi'), '');
       }   

       // Lo queremos devolver limpio en minusculas
       cadena = cadena.toLowerCase();

       // Quitamos espacios y los sustituimos por _ porque nos gusta mas asi
       cadena = cadena.replace(/ /g,"_");

       // Quitamos acentos y "ñ". Fijate en que va sin comillas el primer parametro
       cadena = cadena.replace(/á/gi,"a");
       cadena = cadena.replace(/é/gi,"e");
       cadena = cadena.replace(/í/gi,"i");
       cadena = cadena.replace(/ó/gi,"o");
       cadena = cadena.replace(/ú/gi,"u");
       cadena = cadena.replace(/ñ/gi,"n");
       return cadena;
    }
</script>
{/literal}
