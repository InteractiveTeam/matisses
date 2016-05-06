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
* Do not edit or add to this file if you wish to upgrade PrestaShop to newersend_friend_form_content
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<div id="idTab5" class="panel-collapse info-opinion">
	<div id="product_comments_block_tab">
		{if $comments}
			{foreach from=$comments item=comment}
				{if $comment.content}
				<div class="comment row" itemprop="review" itemscope itemtype="http://schema.org/Review">
					<div class="comment_author ">

						<div class="star_content clearfix"  itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
							{section name="i" start=0 loop=5 step=1}
								{if $comment.grade le $smarty.section.i.index}
									<div class="star"></div>
								{else}
									<div class="star star_on"></div>
								{/if}
							{/section}
            				<meta itemprop="worstRating" content = "0" />
							<meta itemprop="ratingValue" content = "{$comment.grade|escape:'html':'UTF-8'}" />
            				<meta itemprop="bestRating" content = "5" />
						</div>
						<div class="comment_author_infos">
							<strong itemprop="author">{$comment.customer_name|escape:'html':'UTF-8'}</strong>
							<meta itemprop="datePublished" content="{$comment.date_add|escape:'html':'UTF-8'|substr:0:10}" />
							<em>{dateFormat date=$comment.date_add|escape:'html':'UTF-8' full=0}</em>
						</div>
					</div> <!-- .comment_author -->

					<div class="comment_details ">
						<p itemprop="name" class="title_block">
							<strong>{$comment.title}</strong>
						</p>
						<p itemprop="reviewBody" class="body_review">{$comment.content|escape:'html':'UTF-8'|nl2br}</p>
						<ul>
							{if $comment.total_advice > 0}
								<li>
									<p class="people-say">{l s='%1$d out of %2$d people found this review useful.' sprintf=[$comment.total_useful,$comment.total_advice] mod='productcomments'}</p>
								</li>
							{/if}
							{if $is_logged}
								{if !$comment.customer_advice}
								<li>
									<span class="usefull-comment">{l s='Was this comment useful to you?' mod='productcomments'}</span>
									<button class="usefulness_btn btn btn-default button button-small" data-is-usefull="1" data-id-product-comment="{$comment.id_product_comment}">
										<span>{l s='Yes' mod='productcomments'}</span>
									</button>
									<button class="usefulness_btn btn btn-default button button-small" data-is-usefull="0" data-id-product-comment="{$comment.id_product_comment}">
										<span>{l s='No' mod='productcomments'}</span>
									</button>
								</li>
								{/if}
								{if !$comment.customer_report}
								<li>
									<span class="report_btn" data-id-product-comment="{$comment.id_product_comment}">
										{l s='Report abuse' mod='productcomments'}
									</span>
								</li>
								{/if}
							{/if}
						</ul>
					</div><!-- .comment_details -->

				</div> <!-- .comment -->
				{/if}
			{/foreach}
			{if (!$too_early AND ($is_logged OR $allow_guests))}
			<p class="al_center">
				<a id="new_comment_tab_btn" class="btn btn-default button button-small open-comment-form" href="#new_comment_form">
					<span>{l s='Write your review' mod='productcomments'} !</span>
				</a>
			</p>
			{/if}
		{else}
			{if (!$too_early AND ($is_logged OR $allow_guests))}
			<p class="align_center">
				<a id="new_comment_tab_btn" class="btn btn-default button button-small open-comment-form" href="#new_comment_form">
					<span>{l s='Be the first to write your review' mod='productcomments'}</span>
				</a>
			</p>
			{else}
			<p class="align_center">{l s='No customer comments for the moment.' mod='productcomments'}</p>
			{/if}
		{/if}
	</div> <!-- #product_comments_block_tab -->
</div>

<!-- Fancybox -->
<div style="display: none;">
	<div id="new_comment_form">
		<form id="id_new_comment_form" action="#">
			<h2 class="page-subheading">
				{l s='Write a review' mod='productcomments'}
			</h2>
			<div class="row">
				{if isset($product) && $product}
					<div class="product cf  grid_12 alpha omega">
						<img src="{$productcomment_cover_image}" height="{$mediumSize.height}" width="{$mediumSize.width}" alt="{$product->name|escape:'html':'UTF-8'}" />
						<div class="product_desc">
							<p class="product_name">
								<strong>{$product->name}</strong>
							</p>
							{$product->description_short}
						</div>
					</div>
				{/if}
				<div class="new_comment_form_content grid_12 alpha omega">
					<div id="new_comment_form_error" class="error alert alert-danger" style="display: none;">
						<ul></ul>
					</div>
					{if $criterions|@count > 0}
						<ul id="criterions_list">
						{foreach from=$criterions item='criterion'}
							<li>
								{*<label>{$criterion.name|escape:'html':'UTF-8'}:</label>*}
								<label>{l s='quality' mod='productcomments'}:</label>
								<div class="star_content">
									<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="1" />
									<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="2" />
									<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="3" checked="checked" />
									<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="4" />
									<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="5" />
								</div>
								<div class="clearfix"></div>
							</li>
						{/foreach}
						</ul>
					{/if}
					{if $allow_guests == true && !$is_logged}
						<label>
							{l s='Your name' mod='productcomments'}: <sup class="required">*</sup>
						</label>
						<input class="form-control" id="commentCustomerName" name="customer_name" type="text" value=""/>
					{/if}
					<label for="title">
						{l s='Title' mod='productcomments'}: <sup class="required">*</sup>
					</label>
					<input class="form-control" id="title" name="title" type="text" value=""/>
					<label for="content">
						{l s='Comment' mod='productcomments'}: <sup class="required">*</sup>
					</label>
					<textarea class="form-control" id="content" name="content"></textarea>
				</div>
				<div id="new_comment_form_footer">
						<input id="id_product_comment_send" name="id_product" type="hidden" value='{$id_product_comment_form}' />
						<div class="al_center col-xs-12">
								<a class="closefb button grey_btn" href="javascript:void(0)">
									{l s='Cancel' mod='productcomments'}
								</a>
								<button id="submitNewMessage" name="submitMessage" type="submit" class="button">
									<span>{l s='Send' mod='productcomments'}</span>
								</button>
						</div>
						<div class="cf"></div>
				</div> <!-- #new_comment_form_footer -->
			</div>
		</form><!-- /end new_comment_form_content -->
	</div>
</div>
<!-- End fancybox -->
{strip}
{addJsDef productcomments_controller_url=$productcomments_controller_url|@addcslashes:'\''}
{addJsDef moderation_active=$moderation_active|boolval}
{addJsDef productcomments_url_rewrite=$productcomments_url_rewriting_activated|boolval}
{addJsDef secure_key=$secure_key}

{addJsDefL name=confirm_report_message}{l s='Are you sure that you want to report this comment?' mod='productcomments' js=1}{/addJsDefL}
{addJsDefL name=productcomment_added}{l s='Your comment has been added!' mod='productcomments' js=1}{/addJsDefL}
{addJsDefL name=productcomment_added_moderation}{l s='Your comment has been added and will be available once approved by a moderator' mod='productcomments' js=1}{/addJsDefL}
{addJsDefL name=productcomment_title}{l s='New comment' mod='productcomments' js=1}{/addJsDefL}
{addJsDefL name=productcomment_ok}{l s='OK' mod='productcomments' js=1}{/addJsDefL}
{/strip}
