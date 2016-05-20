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
{capture name=path}
	<span class="navigation_page">{l s='Testimonials' mod='testimonialswithavatars'}</span>	
{/capture}

<div class="twa container">
	<h1>{l s='Testimonials' mod='testimonialswithavatars'}</h1>
	{if $displayType == 2}
	<div class="row twa_posts grid">	
	{else}
	<div class="twa_posts list">
	{/if}	
		{include file="./post-list.tpl" posts=$posts}			
	</div>
	{if $show_load_more}
	<div id="loadMore" class="middle-line">		
		<a class="neat" href="javascript:void(0)">{l s='View more' mod='testimonialswithavatars'}</a>
		<i class="icon icon-refresh icon-spin" style="display:none;"></i>		
	</div>
	{/if}
	<button id="addNew" class="btn btn-primary">
		<i class="icon icon-plus"></i>
		{l s='Add new' mod='testimonialswithavatars'}
	</button>
	<div id="thanks_message" class="alert alert-success text-center" style="display:none;">{l s='Thanks for the review! It will be published right after approval' mod='testimonialswithavatars'}</div>
	<div class="addForm row clearfix" style="display:none;">		
		<form id="add_new_post" enctype="multipart/form-data">
			<div class="ajax_errors"></div>			
			<div class="post_avatar text-center">
				<div class="imgholder">
					<div style="background-image:url({$twa->getAvatarPath({$avatar|escape:'html'})})" class="avatarImg"></div>
					<div class="hidden">
						<input id="postAvatar" type="file" name="avatar_file" class="hidden">
					</div>
				</div>
				<span class="centered_label">{l s='Upload your avatar' mod='testimonialswithavatars'}</span>
			</div>			
			<div class="new_content_wrapper">
				<div class="customer_name field">
					<div class="field_error" style="display:none;"></div>
					<input type="text" value="{$customer_name|escape:'html'}" name="customer_name" placeholder="{l s='Your Name' mod='testimonialswithavatars'}">
				</div>				
				<div class="subject field">
					<div class="field_error" style="display:none;"></div>
					<input type="text" value="" name="subject" placeholder="{l s='Post subject' mod='testimonialswithavatars'}">
				</div>
				<div class="content field {if $allow_html == 1}allow_html{/if}">
					<div class="field_error" style="display:none;"></div>					
					<textarea id="post_content" class="" rows="7" name="content" placeholder="{l s='Post text' mod='testimonialswithavatars'}"></textarea>
				</div>
				{if $general_settings.rating_num}
					<div class="field editable_rating">
						<div class="stars_holder">
							<input type="hidden" name="rating" value="{$general_settings.rating_num|intval}">
							{for $r=1 to $general_settings.rating_num}
								<i class="rating_star icon icon-{$general_settings.rating_class|escape:'html'}" data-rating="{$r|intval}"></i>
							{/for}						
						</div>
						<br />
						<span class="centered_label">{l s='Leave your rating' mod='testimonialswithavatars'}</span>
					</div>
				{/if}				
				<input type="hidden" name="ajaxAction" value="addPost">
				<button class="btn btn-primary" id="submitPost">{l s='OK' mod='testimonialswithavatars'}</button>
			</div>
		</form>
	</div>
</div>