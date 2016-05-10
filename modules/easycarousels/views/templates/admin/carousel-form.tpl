{*
* 2007-2015 PrestaShop
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2015 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{function switcher_option label = '' tooltip = '' id = '' input_name = '' current_value = '' class = ''}
	<div class="form-group {$class|escape:'html'}">
		<label class="control-label col-lg-6">
			{if $tooltip == ''}
				{$label|escape:'html'}
			{else}
				<span class="label-tooltip" data-toggle="tooltip" title="{$tooltip|escape:'html'}">
					{$label|escape:'html'}
				</span>
			{/if}
		</label>
		<div class=" col-lg-6">
			<span class="switch prestashop-switch">
				<input type="radio" id="{$id|escape:'html'}" name="{$input_name|escape:'html'}" value="1" {if $current_value} checked="checked"{/if} >
				<label for="{$id|escape:'html'}">
					{l s='Yes' mod='easycarousels'}
				</label>
				<input type="radio" id="{$id|escape:'html'}_0" name="{$input_name|escape:'html'}" value="0" {if !$current_value}checked="checked"{/if} >
				<label for="{$id|escape:'html'}_0">
					{l s='No' mod='easycarousels'}
				</label>
				<a class="slide-button btn"></a>
			</span>
		</div>
	</div>
{/function}

<div class="carousel_item clearfix" data-id="{$carousel.id_carousel|intval}">
	<div class="carousel_header clearfix">
		<i class="dragger icon icon-arrows-v icon-2x"></i>
		<span class="carousel_name">
			{if isset($carousel.name)}
				{$carousel.name|escape:'html'}
				{if $carousel.group_in_tabs}
					({l s='in tabs' mod='easycarousels'})
				{/if}
			{/if}
		</span>
		<span class="actions pull-right">
			<a class="activateCarousel list-action-enable action-{if $carousel.active == 1}enabled{else}disabled{/if}" href="javascript:void(0)" title="{l s='Activate/Deactivate' mod='easycarousels'}">
				<i class="icon-check"></i>
				<i class="icon-remove"></i>
			</a>
			<div class="actions btn-group pull-right">
				<button title="{l s='Edit' mod='easycarousels'}" class="editCarousel btn btn-default" data-id="{$carousel.id_carousel|intval}" data-hook="{$carousel.hook_name|escape:'html'}">
					<i class="icon-pencil"></i> {l s='Edit' mod='easycarousels'}
				</button>
				<button title="{l s='Scroll Up' mod='easycarousels'}" class="scrollUp btn btn-default">
					<i class="icon icon-minus"></i> {l s='Scroll Up' mod='easycarousels'}
				</button>
				<button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					<i class="icon-caret-down"></i>
				</button>
				<ul class="dropdown-menu">
					<li>
						<a class="deleteCarousel" href="javascript:void(0)" onclick="event.preventDefault();">
							<i class="icon icon-trash"></i>
							{l s='Delete' mod='easycarousels'}
						</a>
					</li>
				</ul>
			</div>
		</span>
	</div>
	{if $full}
		<form method="post" action="" class="form-horizontal" style="display:none;">
			<div class="ajax_errors alert alert-danger" style="display:none;"></div>
			<div class="col-lg-4">
				<div class="form-group">
					<label class="control-label col-lg-6" for="carousel_type">
						{l s='Carousel type' mod='easycarousels'}
					</label>
					<div class="col-lg-6">
						<select name="carousel_type" id="carousel_type">
							{foreach $type_names item=type key=k}
								<option value="{$k|escape:'html'}" {if $carousel.carousel_type == $k}selected="selected{/if}">
									{$type|escape:'html'}
								</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class="form-group special_option samefeature" style="display:none;">
					<label class="control-label col-lg-6" for="id_feature">
						{l s='Feature to filter by' mod='easycarousels'}
					</label>
					<div class="col-lg-6">
						<select name="general_settings[id_feature]" id="id_feature">
							<option value="0"> - </option>
							{foreach $available_features item=feature}
								<option value="{$feature.id_feature|intval}"{if isset($carousel.general_settings.id_feature)} selected="selected{/if}">{$feature.name|escape:'html'}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class="form-group special_option catproducts" style="display:none;">
					<label class="control-label col-lg-6" for="cat_ids">
						<span class="label-tooltip" data-toggle="tooltip" title="{l s='Enter category ids, separated by comma (1,2,3 ...)' mod='easycarousels'}">
							{l s='Category ids' mod='easycarousels'}
						</span>
					</label>
					<div class="col-lg-6">
						<input type="text" name="general_settings[cat_ids]" id="cat_ids" value="{if isset($carousel.general_settings.cat_ids)}{$carousel.general_settings.cat_ids|escape:'html'}{/if}">
					</div>
				</div>
				<div class="form-group special_option bymanufacturer" style="display:none;">
					<label class="control-label col-lg-6" for="id_m">
						{l s='Manufacturer' mod='easycarousels'}
					</label>
					<div class="col-lg-6">
						<select name="general_settings[id_m]" id="id_m">
							<option value="0"> - </option>
							{foreach $available_manufacturers item=m}
								<option value="{$m.id_manufacturer|intval}"{if isset($carousel.general_settings.id_m) && $carousel.general_settings.id_m == $m.id_manufacturer} selected="selected{/if}">{$m.name|escape:'html'}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class="form-group special_option bysupplier" style="display:none;">
					<label class="control-label col-lg-6" for="id_s">
						{l s='Supplier' mod='easycarousels'}
					</label>
					<div class="col-lg-6">
						<select name="general_settings[id_s]" id="id_s">
							<option value="0"> - </option>
							{foreach $available_suppliers item=s}
								<option value="{$s.id_supplier|intval}"{if isset($carousel.general_settings.id_s) && $carousel.general_settings.id_s == $s.id_supplier} selected="selected{/if}">{$s.name|escape:'html'}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-6" for="custom_class">
						<span class="label-tooltip" data-toggle="tooltip" title="{l s='Custom class that will be added to carousel container. Use \'block\' for carousels in columns' mod='easycarousels'}">
						{l s='Custom class' mod='easycarousels'}
					</label>
					<div class="col-lg-6">
						<input type="text" name="general_settings[custom_class]" id="custom_class" value="{$carousel.general_settings.custom_class|escape:'html'}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-6" for="items_in_carousel">
						{l s='Total items in carousel' mod='easycarousels'}
					</label>
					<div class="col-lg-6">
						<input type="text" name="general_settings[items_in_carousel]" id="items_in_carousel" value="{$carousel.general_settings.items_in_carousel|intval}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-6" for="visible_cols">
						<span class="label-tooltip" data-toggle="tooltip" title="{l s='This value will be applied for screens larger than 1199px. For smaller screens, value will be adjusted basing on width' mod='easycarousels'}">
							{l s='Visible columns' mod='easycarousels'}
						</span>
					</label>
					<div class="col-lg-6">
						<input type="text" name="owl_settings[i]" id="visible_cols" value="{$carousel.owl_settings.i|intval}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-6" for="visible_rows">
						{l s='Visible rows' mod='easycarousels'}
					</label>
					<div class="col-lg-6">
						<input type="text" name="general_settings[rows]" id="visible_rows" value="{$carousel.general_settings.rows|intval}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-6" for="image_type">
						{l s='Image type' mod='easycarousels'}
					</label>
					<div class="col-lg-6">
						<select name="general_settings[image_type]" id="image_type">
							{foreach $sorted_image_types item=types key=resource_type}
								{foreach $types item=type_name}
									<option value="{$type_name|escape:'html'}" class="{$resource_type|escape:'html'}{if $carousel.general_settings.image_type == $type_name} saved{/if}" {if $carousel.general_settings.image_type == $type_name} selected="selected"{/if}>
										{$type_name|escape:'html'}
									</option>
								{/foreach}
							{/foreach}
						</select>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="form-group">
					<label class="control-label col-lg-3" for="carousel_name">
						{l s='Displayed name' mod='easycarousels'}
					</label>
					<div class="col-lg-8">
						{foreach from=$languages item=lang}
							<input type="text" name="name_multilang[{$lang.id_lang|intval}]" class="multilang lang_{$lang.id_lang|intval}" {if isset($carousel.name_multilang[$lang.id_lang])}value="{$carousel.name_multilang[$lang.id_lang]|escape:'html'}"{else}data-saved="false"{/if} style="{if $lang.id_lang != $id_lang_current}display:none;{/if}"
							/>
						{/foreach}
					</div>
					<div class="col-lg-1 pull-right">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							{foreach from=$languages item=lang}
								<span class="multilang lang_{$lang.id_lang|intval}" style="{if $lang.id_lang != $id_lang_current}display:none;{/if}">{$lang.iso_code|escape:'html'}</span>
							{/foreach}
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							{foreach from=$languages item=lang}
							<li>
								<a href="javascript:void(0)" class="lang_switcher" data-id-lang="{$lang.id_lang|intval}" onclick="event.preventDefault();">
									{$lang.name|escape:'html'}
								</a>
							</li>
							{/foreach}
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				{switcher_option
					label = {l s='Group in tabs?' mod='easycarousels'}
					tooltip = {l s='If set to YES, carousels will be grouped in tabs, if no, they will be simply displayed one after another' mod='easycarousels'}
					id = 'group_in_tabs'
					input_name = 'group_in_tabs'
					current_value = {$carousel.group_in_tabs|intval}
				}
				{switcher_option
					label = {l s='Display price?' mod='easycarousels'}
					tooltip = ''
					id = 'show_price'
					input_name = 'general_settings[show_price]'
					current_value = {$carousel.general_settings.show_price|intval}
					class = 'product_option'
				}
				{switcher_option
					label = {l s='Display add to cart?' mod='easycarousels'}
					tooltip = ''
					id = 'show_add_to_cart'
					input_name = 'general_settings[show_add_to_cart]'
					current_value = {$carousel.general_settings.show_add_to_cart|intval}
					class = 'product_option'
				}
				{switcher_option
					label = {l s='Display view more?' mod='easycarousels'}
					tooltip = ''
					id = 'show_view_more'
					input_name = 'general_settings[show_view_more]'
					current_value = {$carousel.general_settings.show_view_more|intval}
					class = 'product_option'
				}
				{switcher_option
					label = {l s='Display quick view?' mod='easycarousels'}
					tooltip = ''
					id = 'show_quick_view'
					input_name = 'general_settings[show_quick_view]'
					current_value = {$carousel.general_settings.show_quick_view|intval}
					class = 'product_option'
				}
			</div>
			<div class="col-lg-4">
				{switcher_option
					label = {l s='Display stock data?' mod='easycarousels'}
					tooltip = ''
					id = 'show_stock'
					input_name = 'general_settings[show_stock]'
					current_value = {$carousel.general_settings.show_stock|intval}
					class = 'product_option'
				}
				{switcher_option
					label = {l s='Display slickers?' mod='easycarousels'}
					tooltip = ''
					id = 'show_stickers'
					input_name = 'general_settings[show_stickers]'
					current_value = {$carousel.general_settings.show_stickers|intval}
					class = 'product_option'
				}
				{switcher_option
					label = {l s='Display pagination?' mod='easycarousels'}
					tooltip = ''
					id = 'show_pagination'
					input_name = 'owl_settings[p]'
					current_value = {$carousel.owl_settings.p|intval}
				}
				{switcher_option
					label={l s='Display navigation?' mod='easycarousels'}
					tooltip=''
					id = 'show_navigation'
					input_name = 'owl_settings[n]'
					current_value = {$carousel.owl_settings.n|intval}
				}
				{switcher_option
					label={l s='Enable autoplay?' mod='easycarousels'}
					tooltip=''
					id = 'autoplay'
					input_name = 'owl_settings[a]'
					current_value = {$carousel.owl_settings.a|intval}
				}
			</div>
			<div class="p-footer">
				<button id="saveCarousel" class="btn btn-default">
					<i class="process-icon-save"></i>
					{l s='Save' mod='easycarousels'}
				</button>
			</div>
		</form>
	{/if}
</div>