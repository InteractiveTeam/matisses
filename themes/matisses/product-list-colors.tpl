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
<script type="text/javascript">
    function changeImageColor(idprod,namec,image,idattr) {
        var name = namec.replace(" ", "_");
        $('.product-container[id='+idprod+'] .left-block .product_img_link img').attr("src", image);
        
        var linkp = $('.product-container[id='+idprod+'] .button-container .showmore').attr("href").split("#");
        $('.product-container[id='+idprod+'] .button-container .showmore').attr("href", linkp[0]+"#/color-"+name.toLowerCase());
        
        if (idattr) {
            if ($('.product-container[id='+idprod+'] .button-container .showmore input')) {
                $('.product-container[id='+idprod+'] .button-container .showmore input').remove();   
            }

            $('.product-container[id='+idprod+'] .button-container .showmore').append("<input type='hidden' id='idCombination' value='"+idattr+"'/>");
        }
    }
</script>
