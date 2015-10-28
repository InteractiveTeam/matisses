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

{if $multishop_warning}
<div class="alert alert-warning">	
	{l s='NOTE: All modifications will be applied to more than one shop' mod='easycarousels'}
	<i class="icon icon-times" data-dismiss="alert"></i>
</div>
{/if}
<div class="ajax_errors hidden alert alert-warning"></div>
<div class="bootstrap panel easycarousels general_settings clearfix">
	<h3><i class="icon icon-cogs"></i> {l s='General settings' mod='easycarousels'}</h3>
	<div class="col-lg-5">
		<label class="control-label" for="load_owl">
			<span class="label-tooltip" data-toggle="tooltip" title="{l s='If you already use owl carousel script on your site, you may turn this option OFF in order to avoid multiple loading or possible conflicts' mod='easycarousels'}">
				{l s='Load owl.carousel.js?' mod='easycarousels'}
			</span> <input type="checkbox" name="load_owl" id="load_owl" {if $load_owl}checked="checked"{/if}>
		</label>
	</div>
	<div class="importer col-lg-7 text-right">
		<form method="post" action="" enctype="multipart/form-data">
			<input type="hidden" name="action" value="exportCarousels">
			<button type="submit" class="export btn btn-default">
				<i class="icon icon-cloud-download icon-lg"></i>
				{l s='Export carousels' mod='easycarousels'}
			</button>
		</form>				
		<button class="import btn btn-default">
			<i class="icon icon-cloud-upload icon-lg"></i>
			{l s='Import carousels' mod='easycarousels'}					
		</button>
		<form action="" method="post" enctype="multipart/form-data" style="display:none;">
			<input type="file" name="carousels_data_file" style="display:none;">
		</form>
	</div>
</div>
<div class="bootstrap panel easycarousels carousels clearfix">
	<h3><i class="icon icon-image"></i> {l s='Carousels' mod='easycarousels'}</h3>
	<form class="form-horizontal clearfix">
		<label class="control-label col-lg-1" for="hookSelector">
			{l s='Select hook' mod='easycarousels'}
		</label>
		<div class="col-lg-3">
			<select class="hookSelector">
				{foreach $hooks item=qty key=hk}
					<option value="{$hk}"> {$hk|escape:'html'} ({$qty|intval}) </option>
				{/foreach}
			</select>
		</div>
		<div class="col-lg-7 hook_settings">
			<i class="icon icon-wrench"></i>
			{l s='Hook settings' mod='easycarousels'}:
			<a href="#" class="callSettings" data-settings="exceptions">{l s='page exceptions' mod='easycarousels'}</a>
		</div>
	</form>
	<div id="settings_content" style="display:none;">{* filled dinamically *}</div>
	{foreach $hooks item=qty key=hk}
	<div id="{$hk|escape:'html'}" class="hook_content {if $hk == 'displayHome'}active{/if}">
		{if $hk|substr:0:19 == 'displayEasyCarousel'}
		<div class="alert alert-info">
			{l s='In order to display this hook, insert the following code to any tpl' mod='easycarousels'}: 
			{ldelim}hook h='{$hk|escape:'html'}'{rdelim}
		</div>
		{/if}
		{if $hk == 'displayFooterProduct'}
		<div class="alert alert-info">
			{l s='This hook is used on product page, so you can create carousels for products with same features/categories here' mod='easycarousels'}
		</div>
		{/if}
		<div class="carousel_list">				
			{if isset($carousels.$hk)}
				{foreach $carousels.$hk item=carousel}
					{include file="./carousel-form.tpl"							
						carousel=$carousel
						type_names=$type_names
						full=0
					}
				{/foreach}
			{/if}
		</div>
		<button type="button" class="addCarousel btn btn-default">
			<i class="icon icon-plus"></i> {l s='Add new carousel' mod='easycarousels'}			
		</button>	
	</div>
	{/foreach}	
</div>