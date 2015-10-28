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

{foreach $posts item=post}	
	<div class="postRow clearfix" data-id="{$post.id_post|intval}" data-position="{$post.position|intval}">
	<form class="form-horizontal">
		<div class="ajax_errors alert alert-danger" style="display:none;"></div>
		<input type="hidden" name="id_post" value="{$post.id_post|intval}">		
		<input type="hidden" name="id_shop" value="{$post.id_shop|intval}">
		<input type="hidden" name="post_position" value="{$post.position|intval}">
		<i class="dragger icon icon-arrows" title="{l s='Drag it' mod='testimonialswithavatars'}"></i>
		<div class="avatar editable">
			<div class="imgholder">
				<div style="background-image:url({$twa->getAvatarPath($post.avatar|escape:'html')})" class="avatarImg"></div>
				<div class="hidden">
					<input id="av_{$post.id_post|intval}" type="file" name="avatar_file">
					<input type="hidden" name="avatar" value="{$post.avatar|escape:'html'}">
				</div>
			</div>
			<span class="help-block">{$post.visitor_ip|escape:'html'}</span>			
		</div>
		<div class="data_row clearfix">			
			<div class="actions col-lg-3 pull-right">
				<div class="btn-group pull-right">
					<button class="editPost btn btn-default current_val" title="{l s='Edit' mod='testimonialswithavatars'}">					
						<i class="icon-pencil"></i> {l s='Edit' mod='testimonialswithavatars'}
					</button>
					<button class="savePost btn btn-default new_val" title="{l s='Save' mod='testimonialswithavatars'}" >
						<i class="icon icon-save"></i> {l s='Save' mod='testimonialswithavatars'}
					</button>
					<button class="cancelEditing btn btn-default new_val" title="{l s='Cancel' mod='testimonialswithavatars'}" >
						<i class="icon icon-times"></i> {l s='Cancel' mod='testimonialswithavatars'}
					</button>
					<button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<i class="icon-caret-down"></i>
					</button>
					<ul class="dropdown-menu">			
						<li>
							<a class="deletePost" href="#" onclick="event.preventDefault();">
								<i class="icon icon-trash"></i>
								{l s='Delete' mod='testimonialswithavatars'}
							</a>
						</li>			
					</ul>
				</div>
				<a class="activatePost list-action-enable action-{if $post.active}enabled{else}disabled{/if} pull-right" href="#" title="{l s='Activate/Deactivate' mod='testimonialswithavatars'}">
					<i class="icon-check"></i>
					<i class="icon-remove"></i>
					<input type="hidden" name="active" value="{$post.active|intval}">
				</a>
			</div>
			<label class="control-label col-lg-1">
				{l s='Name' mod='testimonialswithavatars'}:
			</label>
			<div class="col-lg-7 customer_name field editable">				
				<div class="current_val">{$post.customer_name|escape:'html'}</div>
				<div class="new_val">
					<input class="input" type="text" value="{$post.customer_name|escape:'html'}" name="customer_name">
				</div>
			</div>			
		</div>
		<div class="data_row clearfix">
			<label class="control-label col-lg-1">
				{l s='Subject' mod='testimonialswithavatars'}:
			</label>
			<div class="col-lg-7 subject field editable">
				<div class="current_val">{$post.subject|escape:'html'}</div>
					<div class="new_val">
					<input class="input" type="text" value="{$post.subject|escape:'html'}" name="subject">
				</div>
			</div>
		</div>
		{if $general_settings.rating_num}
		<div class="data_row clearfix">
			<label class="control-label col-lg-1">
				{l s='Rating' mod='testimonialswithavatars'}:
			</label>
			<div class="col-lg-7 field editable">
				<div class="post_rating stars_holder">
					<input type="hidden" name="rating" value="{$post.rating|intval}">
					{for $r=1 to $general_settings.rating_num}
						<i class="rating_star icon icon-{$general_settings.rating_class|escape:'html'}{if $post.rating >= $r} on{/if}" data-rating="{$r|intval}"></i>
					{/for}
				</div>
			</div>
		</div>
		{/if}
		<div class="data_row clearfix">
			<label class="control-label col-lg-1">
				{l s='Date' mod='testimonialswithavatars'}:
			</label>
			<div class="col-lg-7 date_add field editable">
				<div class="current_val">{$post.date_add|escape:'html'}</div>
				<div class="new_val">					
					<input class="input datepicker" type="text" value="{$post.date_add|escape:'html'}" name="date_add">
				</div>
			</div>
		</div>
		<div class="data_row clearfix">
			<label class="control-label col-lg-1">
				{l s='Content' mod='testimonialswithavatars'}:
			</label>
			<div class="col-lg-7 content field editable ta">
				<div class="current_val">{$twa->bbCodeToHTML($post.content|escape:'html')}</div>
				<div class="new_val">					
					<div id="content_{$post.id_post|intval}" class="inline_edit">{$twa->bbCodeToHTML($post.content|escape:'html')}</div>
				</div>
			</div>
		</div>
	</form>
	</div>
{/foreach}
