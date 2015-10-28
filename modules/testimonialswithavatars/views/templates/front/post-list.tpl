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
<div class="post" data-idpost="{$post.id_post|intval}">	
	<div class="post_avatar text-center">
		<img src="{$twa->getAvatarPath($post.avatar|escape:'html')}">		
	</div>
	<div class="content_wrapper">
		<div class="post_content">
			<h5>
				{$post.subject|escape:'html'}
				{if $general_settings.rating_num}
					<span class="post_rating">
						{for $r=1 to $general_settings.rating_num}
							<i class="rating_star icon icon-{$general_settings.rating_class|escape:'html'}{if $post.rating >= $r} on{/if}"></i>
						{/for}
					</span>
				{/if}
			</h5>
			{$twa->bbCodeToHTML($post.content|escape:'html')}			
		</div>
		<div class="expand middle-line">
			 <i class="icon icon-angle-down"></i>			 
		</div>
		<div class="post_footer">
			<span class="customer_name b">{$post.customer_name|escape:'html'}</span>, <span class="date_add i"> {$post.date_add|date_format}</span>
		</div>
	</div>
</div>
{/foreach}