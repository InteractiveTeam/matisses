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

<div class="bootstrap panel testimonialswithavatars closed clearfix">						
	<form method="post" action="" class="form-horizontal">	
	<h3>		
		<i class="icon-th"></i>
		{l s='Display settings for different hooks' mod='testimonialswithavatars'}
		<i class="icon icon-chevron-down toggle_content"></i>
	</h3>
	<div class="hook_settings_holder" style="display:none;">
	<ul id="gba_tabs" class="nav nav-tabs" data-tabs="tabs" role="tablist">
	{foreach $hooks item=hk}				
		<li class="{if $hk == 'controller'}active{/if}">
			<a href="#{$hk|escape:'html'}" data-toggle="tab">{if $hk != 'controller'}{$hk|escape:'html'}{else}{l s='Testimonials page' mod='testimonialswithavatars'}{/if} {if isset($saved_values.$hk.active) && $saved_values.$hk.active == 1}<span class="icon-check"></span>{/if}</a>
		</li>
	{/foreach}
	</ul>
	<div class="tab-content">
	{foreach $hooks item=hk}		
		<div id="{$hk|escape:'html'}" class="tab-pane {if $hk == 'controller'}active{/if}">
			{if $hk|substr:0:12 == 'testimonials'}
			<div class="alert alert-info">
				{l s='In order to display this hook, use the following code' mod='testimonialswithavatars'}: {literal}{hook h='{/literal}{$hk|escape:'html'}{literal}'}{/literal}<br>
				{l s='You can insert this code anywhere you want - directly in any editable area (CMS page, product description etc), or in any tpl file' mod='testimonialswithavatars'} 
			</div>
			{/if}
			{if $hk != 'controller'}
			<div class="form-group">
				<label class="control-label col-lg-3">
					{l s='Use this hook' mod='testimonialswithavatars'}
				</label>
				<div class="col-lg-2">
					<span class="switch prestashop-switch ">
						<input type="radio" id="activate_{$hk|escape:'html'}" name="activate[{$hk|escape:'html'}]" value="1" {if isset($saved_values.$hk.active) && $saved_values.$hk.active == 1}checked="checked"{/if} >
						<label class="" for="activate_{$hk|escape:'html'}">
						{l s='Yes' mod='testimonialswithavatars'}
						</label>
						<input type="radio" id="deactivate_{$hk|escape:'html'}" name="activate[{$hk|escape:'html'}]" value="0" {if !isset($saved_values.$hk.active) || isset($saved_values.$hk.active) && $saved_values.$hk.active == 0}checked="checked"{/if} >
						<label class="" for="deactivate_{$hk|escape:'html'}">
						{l s='No' mod='testimonialswithavatars'}
						</label>
						<a class="slide-button btn"></a>
					</span>
				</div>
			</div>			
			{/if}
			{foreach $available_params item=param key=k}
			<div class="form-group">
				<label class="control-label col-lg-3" for="{$k|escape:'html'}_{$hk|escape:'html'}">
					{$param.label|escape:'html'}
				</label>
				<div class="col-lg-2">
					{if isset($param.options)}
						<select name="{$k|escape:'html'}[{$hk|escape:'html'}]" id="{$k|escape:'html'}_{$hk|escape:'html'}">
							{foreach $param.options item=option key=val}
								{if $hk == 'controller' && $k == 'displayType' && $val == '1' || 
									$hk == 'displayLeftColumn' && $k == 'displayType' && $val == '2' ||
									$hk == 'displayRightColumn' && $k == 'displayType' && $val == '2'
								}
									{continue}
								{/if}
								<option value="{$val|escape:'html'}" {if $saved_values.$hk.$k == $val}selected="selected"{/if}>{$option|escape:'html'}</option>
								
							{/foreach}
						</select>
					{else}
						<input type="text" id="{$k|escape:'html'}_{$hk|escape:'html'}" name="{$k|escape:'html'}[{$hk|escape:'html'}]" value="{$saved_values.$hk.$k|escape:'html'}"/>	
					{/if}
				</div>
			</div>	
			{/foreach}			
		</div>
	{/foreach}
	</div>
	<div class="clearfix"></div>
	<div class="panel-footer">		
		<button type="submit" name="submitHooksParams" class="btn btn-default">
			<i class="process-icon-save"></i>
			{l s='Save' mod='testimonialswithavatars'}			
		</button>		
	</div>
	</div>
	</form>
</div>
<div class="bootstrap panel testimonialswithavatars closed clearfix">		
	<form method="post" action="" class="form-horizontal">	
	<h3>	
		<i class="icon-cogs"></i>
		{l s='General settings' mod='testimonialswithavatars'}
		<i class="icon icon-chevron-down toggle_content"></i>
	</h3>
	<div class="general_settings_holder" style="display:none;">
	{foreach $general_settings_fields item=s key=k}
		<div class="form-group">
			<label class="control-label col-lg-3">
				{if isset($s.tooltip)}
					<span class="label-tooltip" data-toggle="tooltip" title="{$s.tooltip|escape:'html'}">
						{$s.label|escape:'html'}
					</span>
				{else}
					{$s.label|escape:'html'}
				{/if}
			</label>
			<div class="col-lg-2{if $k == 'rating_class' || isset($s.text_multilang)} has_tail{/if}">
			{if isset($s.options)}				
				<select id="{$k|escape:'html'}" name="general_settings[{$k|escape:'html'}]">
					{foreach $s.options item=display_name key=val}
						<option value="{$val|escape:'html'}"{if $s.value == $val} selected="selected"{/if}>{$display_name|escape:'html'}</option>
					{/foreach}
				</select>
				{if $k == 'rating_class'}					
					<i id="rating_symbol_demo" class="icon icon-{$s.value|escape:'html'}"></i>					
				{/if}				
			{else if isset($s.switcher)}			
				<span class="switch prestashop-switch ">
					<input type="radio" id="{$k|escape:'html'}" name="general_settings[{$k|escape:'html'}]" value="1"{if $s.value == 1} checked="checked"{/if}>
					<label class="" for="{$k|escape:'html'}">
						{l s='Yes' mod='testimonialswithavatars'}
					</label>
					<input type="radio" id="{$k|escape:'html'}_0" name="general_settings[{$k|escape:'html'}]" value="0"{if $s.value != 1} checked="checked"{/if} >
					<label class="" for="{$k|escape:'html'}_0">
						{l s='No' mod='testimonialswithavatars'}
					</label>
					<a class="slide-button btn"></a>
				</span>				
			{else if isset($s.text_multilang)}				
				{foreach from=$languages item=lang}
					<input type="text" id="{$k|escape:'html'}" name="general_settings[{$k|escape:'html'}][{$lang.id_lang|intval}]" class="multilang lang_{$lang.id_lang|intval}" value="{$s.value[$lang.id_lang]|escape:'html'}" style="{if $lang.id_lang != $id_lang_current}display:none;{/if}" >
				{/foreach}				
				<div class="multilang_switcher">
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
			{else}			
				<input type="text" id="{$k|escape:'html'}" name="general_settings[{$k|escape:'html'}]" value="{$s.value|escape:'html'}"/>
			{/if}
			</div>
		</div>
	{/foreach}	
	<div class="clearfix"></div>
	<div class="panel-footer">		
		<button type="submit" name="submitSettingsParams" class="btn btn-default">
			<i class="process-icon-save"></i>
			{l s='Save' mod='testimonialswithavatars'}			
		</button>		
	</div>
	</div>
	</form>
</div>
<div class="bootstrap panel testimonialswithavatars clearfix">	
	<h3>	
		<i class="icon-smile"></i>
		{l s='List of reviews' mod='testimonialswithavatars'}
	</h3>
	<div class="postList">
		{include file="./post-list.tpl" posts=$posts}
	</div>		
	<div class="row loadmore clearfix "> 
		<button id="loadMore" name="loadMore" class="btn btn-primary">
			<span>{l s='Load More' mod='testimonialswithavatars'}</span>
			<i class="icon icon-refresh icon-spin" style="display:none;"></i>
		</button>
		<span class="no_more_posts" style="display:none;">{l s='That is all' mod='testimonialswithavatars'}</span>
	</div>
</div>