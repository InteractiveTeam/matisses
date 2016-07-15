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
{include file="$tpl_dir./errors.tpl"}
{if $errors|@count == 0}
	{if !isset($priceDisplayPrecision)}
		{assign var='priceDisplayPrecision' value=2}
	{/if}
	{if !$priceDisplay || $priceDisplay == 2}
		{assign var='productPrice' value=$product->getPrice(true, $smarty.const.NULL, $priceDisplayPrecision)}
		{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(false, $smarty.const.NULL)}
	{elseif $priceDisplay == 1}
		{assign var='productPrice' value=$product->getPrice(false, $smarty.const.NULL, $priceDisplayPrecision)}
		{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(true, $smarty.const.NULL)}
	{/if}
<div itemscope itemtype="http://schema.org/Product">
	<div class="container">
	<div class="primary_block grid_12 alpha omega">
		{if isset($adminActionDisplay) && $adminActionDisplay}
			<div id="admin-action">
				<p>{l s='This product is not visible to your customers.'}
					<input type="hidden" id="admin-action-product-id" value="{$product->id}" />
					<input type="submit" value="{l s='Publish'}" name="publish_button" class="exclusive" />
					<input type="submit" value="{l s='Back'}" name="lnk_view" class="exclusive" />
				</p>
				<p id="admin-action-result"></p>
			</div>
		{/if}
		{if isset($confirmation) && $confirmation}
			<p class="confirmation">
				{$confirmation}
			</p>
		{/if}
		<!-- left infos-->
		<div class="pb-left-column grid_6 alpha">
			<!-- product img-->
			<div id="image-block" class="cf grid_12 alpha omega">
				<div class="wrap_image_block">
				{if $have_image}
					<span id="view_full_size">

						{if $jqZoomEnabled && $have_image && !$content_only}
							<a class="jqzoom" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" rel="gal1" href="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'thickbox_default')|escape:'html':'UTF-8'}" itemprop="url">
								<img itemprop="image" src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')|escape:'html':'UTF-8'}" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" alt="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}"/>
							</a>
						{else}
							<img id="bigpic" itemprop="image" src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')|escape:'html':'UTF-8'}" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" alt="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}"/>
							{if !$content_only}
								<span class="span_link no-print"></span>
							{/if}
						{/if}
					</span>
				{else}
					<span id="view_full_size">
						<img itemprop="image" src="{$img_prod_dir}{$lang_iso}-default-large_default.jpg" id="bigpic" alt="" title="{$product->name|escape:'html':'UTF-8'}" width="{$largeSize.width}" height="{$largeSize.height}"/>
						{if !$content_only}
							<span class="span_link">
								{l s='View larger'}
							</span>
						{/if}
					</span>
				{/if}
				<div class="wrap_condition_prod">
					{if $product->new}
						<span class="new tag">
							{l s='New'}
						</span>
					{/if}
					{if $product->on_sale}
						<span class="sale tag">
							{l s='Sale!'}
						</span>
					{/if}
					<span id="reduction_percent" class="tag price-percent-reduction" {if !$product->specificPrice || $product->specificPrice.reduction_type != 'percentage'} style="display:none;"{/if}>
						<span id="reduction_percent_display">
							{if $product->specificPrice && $product->specificPrice.reduction_type == 'percentage'}-{$product->specificPrice.reduction*100}%{/if}
						</span>
					</span>
					<span id="reduction_amount" class="tag price-percent-reduction" {if !$product->specificPrice || $product->specificPrice.reduction_type != 'amount' || $product->specificPrice.reduction|floatval ==0} style="display:none"{/if}>
						<span id="reduction_amount_display">
							{if $product->specificPrice && $product->specificPrice.reduction_type == 'amount' && $product->specificPrice.reduction|floatval !=0}
											-{convertPrice price=$productPriceWithoutReduction-$productPrice|floatval}
							{/if}
						</span>
					</span>
				</div>
				</div>
			</div> <!-- end image-block -->
            {hook h="displaySchemesProduct" product=$product}
			{if isset($images) && count($images) > 0}
				<!-- thumbnails -->
				<div id="views_block" class="cf grid_6 alpha omega {if isset($images) && count($images) < 2}hidden{/if}">
					{if isset($images) && count($images) > 3}
						<span class="view_scroll_spacer">
							<a id="view_scroll_left" class="" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">

							</a>
						</span>
					{/if}
					<div id="thumbs_list">
						<ul id="thumbs_list_frame">
						{if isset($images)}
                        {$first_key = key($images)}
							{foreach from=$images item=image name=thumbnails}
								{assign var=imageIds value="`$product->id`-`$image.id_image`"}
								{if !empty($image.legend)}
									{assign var=imageTitle value=$image.legend|escape:'html':'UTF-8'}
								{else}
									{assign var=imageTitle value=$product->name|escape:'html':'UTF-8'}
								{/if}
								<li id="thumbnail_{$image.id_image}"  class="{if $smarty.foreach.thumbnails.last}last{/if}
                                {if $images[$first_key]['id_product_attribute'] != $image.id_product_attribute}ax-hide-temp{/if}">
									<a{if $jqZoomEnabled && $have_image && !$content_only} href="javascript:void(0);" rel="{literal}{{/literal}gallery: 'gal1', smallimage: '{$link->getImageLink($product->link_rewrite, $imageIds, 'large_default')|escape:'html':'UTF-8'}',largeimage: '{$link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')|escape:'html':'UTF-8'}'{literal}}{/literal}"{else} href="{$link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')|escape:'html':'UTF-8'}"	data-fancybox-group="other-views" class="fancybox{if $image.id_image == $cover.id_image} shown{/if}"{/if} title="{$imageTitle}">
										<img class="img-responsive" id="thumb_{$image.id_image}" src="{$link->getImageLink($product->link_rewrite, $imageIds, 'medium_default')|escape:'html':'UTF-8'}" alt="{$imageTitle}" title="{$imageTitle}" itemprop="image" />
									</a>
								</li>
							{/foreach}
						{/if}
						</ul>
					</div> <!-- end thumbs_list -->
					{if isset($images) && count($images) > 3}
						<a id="view_scroll_right" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">

						</a>
					{/if}
				</div> <!-- end views-block -->
				<!-- end thumbnails -->
			{/if}
			{if isset($images) && count($images) > 1}
				<p class="resetimg clear no-print">
					<span id="wrapResetImages" style="display: none;">
						<a href="{$link->getProductLink($product)|escape:'html':'UTF-8'}">
							<i class="icon-repeat"></i>
							{l s='Display all pictures'}
						</a>
					</span>
				</p>
			{/if}
		</div> <!-- end pb-left-column -->
		<!-- end left infos-->
		<!-- pb-right-column-->
		<div class="pb-right-column grid_6 omega">
			{if $product->online_only}
				<p class="online_only">{l s='Online only'}</p>
			{/if}
			<h1 itemprop="name" class="titleProduct">{$product->itemname|escape:'html':'UTF-8'}</h1>
            <li id="product_reference"{if empty($product->reference) || !$product->reference} style="display: none;"{/if}>
				<label>{l s='Referencia:'} </label>
				<span class="editable" itemprop="sku">{if !isset($groups)}{hook h="actionMatChangeReference" reference=$product->reference}{/if}</span>
			</li>
            
         
			<div class="rate_wrap"></div>

			{if !$content_only}
				<a class="print_prod" href="javascript:print();">
					<i class="fa fa-file-o"></i>{l s='Print'}
				</a>
			{/if}
			<ul class="wrap_attr">
			{if isset($product->manufacturer_name)}
			<li class="man_name"><label>{l s='Brand:'} </label>
				<span>
					{$product->manufacturer_name}</span>
			</li>
			{/if}

				{if $PS_STOCK_MANAGEMENT}
				<!-- availability -->
				<li id="availability_statut"{if ($product->quantity <= 0 && !$product->available_later && $allow_oosp) || ($product->quantity > 0 && !$product->available_now) || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none;"{/if}>
					<span id="availability_label">{l s='Availability:'}</span>
					<span id="availability_value"{if $product->quantity <= 0 && !$allow_oosp} class="warning_inline"{/if}>{if $product->quantity <= 0}{if $allow_oosp}{$product->available_later}{else}{l s='This product is no longer in stock'}{/if}{else}{$product->available_now}{/if}</span>
				</li>
				{hook h="displayProductDeliveryTime" product=$product}
				<li class="warning_inline" id="last_quantities"{if ($product->quantity > $last_qties || $product->quantity <= 0) || $allow_oosp || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none"{/if} >{l s='Warning: Last items in stock!'}</li>
			{/if}
			{if $product->condition}
			<li id="product_condition">
				<label>{l s='Condition:'} </label>
				{if $product->condition == 'new'}
					<link itemprop="itemCondition" href="http://schema.org/NewCondition"/>
					<span class="editable">{l s='New'}</span>
				{elseif $product->condition == 'used'}
					<link itemprop="itemCondition" href="http://schema.org/UsedCondition"/>
					<span class="editable">{l s='Used'}</span>
				{elseif $product->condition == 'refurbished'}
					<link itemprop="itemCondition" href="http://schema.org/RefurbishedCondition"/>
					<span class="editable">{l s='Refurbished'}</span>
				{/if}
			</li>
			{/if}

			<li id="availability_date"{if ($product->quantity > 0) || !$product->available_for_order || $PS_CATALOG_MODE || !isset($product->available_date) || $product->available_date < $smarty.now|date_format:'%Y-%m-%d'} style="display: none;"{/if}>
				<span id="availability_date_label">{l s='Availability date:'}</span>
				<span id="availability_date_value">{dateFormat date=$product->available_date full=false}</span>
			</li>
			{if ($display_qties == 1 && !$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && $product->available_for_order)}
				<!-- number of item in stock -->
				<li id="pQuantityAvailable"{if $product->quantity <= 0} style="display: none;"{/if}>
					<span {if $product->quantity > 1} style="display: none;"{/if} id="quantityAvailableTxt">{l s='Item:'}</span>
					<span {if $product->quantity == 1} style="display: none;"{/if} id="quantityAvailableTxtMultiple">{l s='Items:'}</span>
					<span id="quantityAvailable">{$product->quantity|intval}</span>

				</li>
			{/if}

			</ul>
			{if $product->description_short || $packItems|@count > 0}
				<div id="short_description_block">
					{if $product->description_short}
						<div id="short_description_content" class="rte align_justify" itemprop="description">{$product->description_short|truncate:130}</div>
					{/if}

					{if $product->description}
						<p class="buttons_bottom_block">
							<a href="javascript:{ldelim}{rdelim}" class="button">
								{l s='More details'}
							</a>
						</p>
					{/if}
					<!--{if $packItems|@count > 0}
						<div class="short_description_pack">
						<h3>{l s='Pack content'}</h3>
							{foreach from=$packItems item=packItem}

							<div class="pack_content">
								{$packItem.pack_quantity} x <a href="{$link->getProductLink($packItem.id_product, $packItem.link_rewrite, $packItem.category)|escape:'html':'UTF-8'}">{$packItem.name|escape:'html':'UTF-8'}</a>
								<p>{$packItem.description_short}</p>
							</div>
							{/foreach}
						</div>
					{/if}-->
				</div> <!-- end short_description_block -->
			{/if}
			{if ($product->show_price && !isset($restricted_country_mode)) || isset($groups) || $product->reference || (isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS)}
			<!-- add to cart form-->
			<form id="buy_block"{if $PS_CATALOG_MODE && !isset($groups) && $product->quantity > 0} class="hidden"{/if} action="{$link->getPageLink('cart')|escape:'html':'UTF-8'}" method="post">
				<!-- hidden datas -->
				<p class="hidden">
					<input type="hidden" name="token" value="{$static_token}" />
					<input type="hidden" name="id_product" value="{$product->id|intval}" id="product_page_product_id" />
					<input type="hidden" name="add" value="1" />
					<input type="hidden" name="id_product_attribute" id="idCombination" value="" />
				</p>
				
				<div class="box-info-product">
					<div class="product_attributes cf">
						{if isset($groups)}
							<!-- attributes -->
							<div id="attributes" class="attributes cf">
								{foreach from=$groups key=id_attribute_group item=group}
									{if $group.attributes|@count}
										<fieldset class="attribute_fieldset">
											<label class="attribute_label" {if $group.group_type != 'color' && $group.group_type != 'radio'}for="group_{$id_attribute_group|intval}"{/if}>{$group.name|escape:'html':'UTF-8'}&nbsp;</label>
											{assign var="groupName" value="group_$id_attribute_group"}
											<div class="attribute_list">
												{if ($group.group_type == 'select')}
													<select data-placeholder="{ l s ='Выберите страну'}" name="{$groupName}" id="group_{$id_attribute_group|intval}" class="form-control attribute_select no-print">
														{foreach from=$group.attributes key=id_attribute item=group_attribute}
															<option value="{$id_attribute|intval}"{if (isset($smarty.get.$groupName) && $smarty.get.$groupName|intval == $id_attribute) || $group.default == $id_attribute} selected="selected"{/if} title="{$group_attribute|escape:'html':'UTF-8'}">{$group_attribute|escape:'html':'UTF-8'}</option>
														{/foreach}
													</select>
												{elseif ($group.group_type == 'color')}
													
													<ul id="color_to_pick_list" class="cf">
														{assign var='dataCombinations' value=matisses::getProductAttributeCombinations($product->id)}
														
														{assign var="default_colorpicker" value=""}
														{foreach from=$group.attributes key=id_attribute item=group_attribute}
															{assign var='img_color_exists' value=file_exists($col_img_dir|cat:$id_attribute|cat:'.jpg')}
																
															{foreach from=$dataCombinations key=key item=itemCombination}
																
																{if $itemCombination.id_attribute == $id_attribute && 
																$itemCombination.quantity > 0}

																<li{if $group.default == $id_attribute} class="selected"{/if}>
																	<a href="{$link->getProductLink($product)|escape:'html':'UTF-8'}" id="color_{$id_attribute|intval}" class="color_pick{if ($group.default == $id_attribute)} selected{/if}"{if !$img_color_exists && isset($colors.$id_attribute.value) && $colors.$id_attribute.value} style="background:{$colors.$id_attribute.value|escape:'html':'UTF-8'};"{/if} title="{$colors.$id_attribute.name|escape:'html':'UTF-8'}">
																		{if $img_color_exists}
																			<img src="{$img_col_dir}{$id_attribute|intval}.jpg" alt="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" title="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" />
																		{/if}
																	</a> 
																</li>
																{/if}
															{/foreach}

															{if ($group.default == $id_attribute)}
																{$default_colorpicker = $id_attribute}
															{/if}
														{/foreach}
													</ul>
													<input type="hidden" class="color_pick_hidden" name="{$groupName|escape:'html':'UTF-8'}" value="{$default_colorpicker|intval}" />
												{elseif ($group.group_type == 'radio')}
													<ul>
														{foreach from=$group.attributes key=id_attribute item=group_attribute}
															<li>
																<input type="radio" class="attribute_radio" name="{$groupName|escape:'html':'UTF-8'}" value="{$id_attribute}" {if ($group.default == $id_attribute)} checked="checked"{/if} />
																<span>{$group_attribute|escape:'html':'UTF-8'}</span>
															</li>
														{/foreach}
													</ul>
												{/if}
											</div> <!-- end attribute_list -->
										</fieldset>
									{/if}
								{/foreach}
							</div> <!-- end attributes -->
						{/if}
					</div> <!-- end product_attributes -->
					<div class="wrap_bottom grid_12 alpha omega">
						<div class="content_prices cf grid_12 alpha omega">
						{if $product->show_price && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
							<!-- prices -->
							<div class="price">
								<p class="our_price_display price product-price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
									<span id="old_price"{if (!$product->specificPrice || !$product->specificPrice.reduction) && $group_reduction == 0} class="hidden"{/if}>
									{if $priceDisplay >= 0 && $priceDisplay <= 2}
										{hook h="displayProductPriceBlock" product=$product type="old_price"}
										<span id="old_price_display">{if $productPriceWithoutReduction > $productPrice}{convertPrice price=$productPriceWithoutReduction}{/if}</span>
										<!-- {if $tax_enabled && $display_tax_label == 1}{if $priceDisplay == 1}{l s='tax excl.'}{else}{l s='tax incl.'}{/if}{/if} -->
									{/if}
									</span>
									{if $product->quantity > 0}<link itemprop="availability" href="http://schema.org/InStock"/>{/if}
									{if $priceDisplay >= 0 && $priceDisplay <= 2}
										<span id="our_price_display" {if (!$product->specificPrice || !$product->specificPrice.reduction) && $group_reduction == 0}class="no-reduce"{/if} itemprop="price">{convertPrice price=$productPrice}</span>
										<!--{if $tax_enabled  && ((isset($display_tax_label) && $display_tax_label == 1) || !isset($display_tax_label))}
											{if $priceDisplay == 1}{l s='tax excl.'}{else}{l s='tax incl.'}{/if}
										{/if}-->
										<meta itemprop="priceCurrency" content="{$currency->iso_code}" />
										{hook h="displayProductPriceBlock" product=$product type="price"}
									{/if}
								</p>
								{if $priceDisplay == 2}
									<br />
									<span id="pretaxe_price">
										<span id="pretaxe_price_display">{convertPrice price=$product->getPrice(false, $smarty.const.NULL)}</span>
										{l s='tax excl.'}
									</span>
								{/if}
                                <p class="ax-iva">{l s='tax incl.'}</p>
							</div> <!-- end prices -->
							{if $packItems|@count && $productPrice < $product->getNoPackPrice()}
								<p class="pack_price">{l s='Instead of'} <span style="text-decoration: line-through;">{convertPrice price=$product->getNoPackPrice()}</span></p>
							{/if}
							{if $product->ecotax != 0}
								<p class="price-ecotax">{l s='Including'} <span id="ecotax_price_display">{if $priceDisplay == 2}{$ecotax_tax_exc|convertAndFormatPrice}{else}{$ecotax_tax_inc|convertAndFormatPrice}{/if}</span> {l s='for ecotax'}
									{if $product->specificPrice && $product->specificPrice.reduction}
									<br />{l s='(not impacted by the discount)'}
									{/if}
								</p>
							{/if}
							{if !empty($product->unity) && $product->unit_price_ratio > 0.000000}
								{math equation="pprice / punit_price"  pprice=$productPrice  punit_price=$product->unit_price_ratio assign=unit_price}
								<p class="unit-price"><span id="unit_price_display">{convertPrice price=$unit_price}</span> {l s='per'} {$product->unity|escape:'html':'UTF-8'}</p>
								{hook h="displayProductPriceBlock" product=$product type="unit_price"}
							{/if}
						{/if} {*close if for show price*}
						{hook h="displayProductPriceBlock" product=$product type="weight"}
						<div class="clear"></div>
					</div> <!-- end content_prices -->
					<div class="wrap_quan grid_12 alpha omega">
						<label class="">{l s='QTY'}</label>
						<!-- quantity wanted -->
						{if !$PS_CATALOG_MODE}
						<div id="quantity_wanted_p" class="grid_3 alpha"{if (!$allow_oosp && $product->quantity <= 0) || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none;"{/if}>
							<h2>Cantidad</h2>
							<input type="text" name="qty" id="quantity_wanted" class="text" value="{if isset($quantityBackup)}{$quantityBackup|intval}{else}{if $product->minimal_quantity > 1}{$product->minimal_quantity}{else}1{/if}{/if}" readonly="readonly" />
							<div class="wrap_up_down">
							<a href="#" data-field-qty="qty" class="button-plus product_quantity_up">
								<i class="icon-plus">+</i>
							</a>
							<a href="#" data-field-qty="qty" class="button-minus product_quantity_down">
								<i class="icon-minus">-</i>
							</a>
							</div>
							<span class="cf"></span>
						</div>

                        {hook h='displayAvailableProduct' product=$product}

						{/if}
						<!-- minimal quantity wanted -->
						<p id="minimal_quantity_wanted_p"{if $product->minimal_quantity <= 1 || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none;"{/if}>
							{l s='This product is not sold individually. You must select at least'} <b id="minimal_quantity_label">{$product->minimal_quantity}</b> {l s='quantity for this product.'}
						</p>
						</div>
						<div class="box-cart-bottom">
							<div{if (!$allow_oosp && $product->quantity <= 0) || !$product->available_for_order || (isset($restricted_country_mode) && $restricted_country_mode) || $PS_CATALOG_MODE} class="unvisible"{/if}>
								<div id="add_to_cart" class="add_to_cart">
									<button type="submit" name="Submit" class="button">
										{if $content_only && (isset($product->customization_required) && $product->customization_required)}{l s='Customize'}{else}{l s='Comprar'}{/if}
									</button>
								</div>
						</div>
					</div>
					</div> <!-- end box-cart-bottom -->
					<div class="wrap_buttons cf">
						<div class="grid_12 omega alpha">
							{if isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS}{$HOOK_PRODUCT_ACTIONS}{/if}
							{if !$content_only}
								<!-- usefull links-->
								<ul id="usefull_link_block" class="elem_butt no-print">
									{if $HOOK_EXTRA_LEFT}{$HOOK_EXTRA_LEFT}{/if}
									{if $have_image && !$jqZoomEnabled}{/if}
								</ul>
							{/if}
						</div>
					</div>
				</div> <!-- end box-info-product -->
			</form>
			{/if}
			<div class="wrap_extra_right">
			{*if isset($HOOK_EXTRA_RIGHT) && $HOOK_EXTRA_RIGHT}{$HOOK_EXTRA_RIGHT}{/if*}
			
			<div class="ax-shareContent ax-shareContentProduct">
               <div class="newTopActions">
                    <a href="javascript:window.print()" class="productPrint"><i class="fa fa-print" aria-hidden="true"></i></a>
                    <!-- AddThis Button BEGIN -->
                        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-57058c3b661b8e1a"></script>
                    <!-- AddThis Button END -->
                </div>
                <div id="share" class="share-product"></div>
                <p><a class='ayo-btn ayo-houzz' href='http://www.houzz.es/pro/matisses/matisses' target='_blank'><i class='fa fa-houzz'></i></a></p>
                <p><a class='ayo-btn ayo-instagram' href='https://www.instagram.com/matisses/' target='_blank'><i class='fa fa-instagram'></i></a></p>
            </div>
            {if $socialButtonHtml}
            <div>
                {$socialButtonHtml}
            </div>
            {/if}
            
			</div>
			<!-- Out of stock hook -->
			<div id="oosHook"{if $product->quantity > 0} style="display: none;"{/if}>
				{$HOOK_PRODUCT_OOS}
			</div>
		</div> <!-- end pb-right-column-->
		<!-- center infos -->




		<div class="pb-center-column col-xs-12 col-md-3 ">
			{hook h='displayCustomBanners3'}
		</div>
		<!-- end center infos-->
	</div> <!-- end primary_block -->
	
	{if !$content_only}
		   {if $product->description || $features || $HOOK_PRODUCT_TAB || $attachments}
			<!-- <div class="row"> -->
			<div id="more_info_block" class="clear">
				<ul id="more_info_tabs" class="idTabs idTabsShort clearfix">
					{if $product->description}<li><a id="more_info_tab_more_info" class="selected" href="#idTab1">{l s='Description'}</a></li>{/if}
					{if $features}<li><a id="more_info_tab_data_sheet" href="#idTab2">{l s='Data sheet'}</a></li>{/if}
					{if $attachments}<li><a id="more_info_tab_attachments" href="#idTab3">{l s='Download'}</a></li>{/if}
					{if isset($accessories) AND $accessories}<li><a href="#idTab4">{l s='Accessories'}</a></li>{/if}
					{if (isset($quantity_discounts) && count($quantity_discounts) > 0)}
					<li><a href="#idTab6">{l s='Discounts'}</a></li>
					{/if}
					{$HOOK_PRODUCT_TAB}
				</ul>
				<div id="more_info_sheets" class="sheets align_justify">
					{if $product->description}
						<!-- full description -->
						<div id="idTab1">{$product->description}</div>
					{/if}
					{if $features}
						<!-- product's features -->
						<ul id="idTab2" class="bullet">
							{foreach from=$features item=feature}
								<li class="row"><div class="clearfix"><span class="name_bullet col-md-4 col-xs-6">{$feature.name|escape:'htmlall':'UTF-8'}</span> <span class="value_bullet col-md-8 col-xs-6">{$feature.value|escape:'htmlall':'UTF-8'}</span></div></li>
							{/foreach}
						</ul>
					{/if}
					{if $attachments}
						<ul id="idTab3" class="bullet">
							{foreach from=$attachments item=attachment}
								<li><a href="{$link->getPageLink('attachment.php', true)}?id_attachment={$attachment.id_attachment}">{$attachment.name|escape:'htmlall':'UTF-8'}</a><br />{$attachment.description|escape:'htmlall':'UTF-8'}</li>
							{/foreach}
						</ul>
					{/if}
				   {if isset($accessories) && $accessories}
					<!--Accessories -->
					<section id="idTab4" class="page-product-box">
						<div class=" accessories-block clearfix">
							<div class="block_content">
								<div id="bxslider" class="product_list grid clearfix">
									{foreach from=$accessories item=accessory name=accessories_list}
										{if ($accessory.allow_oosp || $accessory.quantity_all_versions > 0 || $accessory.quantity > 0) && $accessory.available_for_order && !isset($restricted_country_mode)}
											{assign var='accessoryLink' value=$link->getProductLink($accessory.id_product, $accessory.link_rewrite, $accessory.category)}
											<div class="ajax_block_product">
								<div class="product-container" itemscope itemtype="http://schema.org/Product">
				<div class="left-block">
					<div class="product-image-container">
					<div class="wrap_image_list">
						<a class="product_img_link"	href="{$accessory.link|escape:'html':'UTF-8'}" title="{$accessory.name|escape:'html':'UTF-8'}" itemprop="url">
							<img class="replace-2x img-responsive" src="{$link->getImageLink($accessory.link_rewrite, $accessory.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($accessory.legend)}{$accessory.legend|escape:'html':'UTF-8'}{else}{$accessory.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($accessory.legend)}{$accessory.legend|escape:'html':'UTF-8'}{else}{$accessory.name|escape:'html':'UTF-8'}{/if}" itemprop="image" />
						</a>
					</div>
						{if ($accessory.allow_oosp || $accessory.quantity > 0)}
							<div class="wrap_features">
								{if isset($accessory.new) && $accessory.new == 1}
									<a class="new tag" href="{$accessory.link|escape:'html':'UTF-8'}">
										<span class="new-label">{l s='New'}</span>
									</a>
								{/if}
							{if isset($accessory.on_sale) && $accessory.on_sale && isset($accessory.show_price) && $accessory.show_price && !$PS_CATALOG_MODE}
								<a class="tag sale" href="{$accessory.link|escape:'html':'UTF-8'}">
									<span class="sale-label">{l s='Sale!'}</span>
								</a>
							{/if}
							{if $accessory.specific_prices.reduction_type == 'percentage'}
											<span class="tag price-percent-reduction">-{$accessory.specific_prices.reduction * 100}%</span>
							{/if}
							</div>
						{/if}
						{if (!$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($accessory.show_price) && $accessory.show_price) || (isset($accessory.available_for_order) && $accessory.available_for_order)))}
							{if isset($accessory.available_for_order) && $accessory.available_for_order && !isset($restricted_country_mode)}
								<span itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="availability scale_hover_in hidden-list">
									{if ($accessory.allow_oosp || $accessory.quantity > 0)}
										{*<span class="{if $accessory.quantity <= 0 && !$accessory.allow_oosp}out-of-stock{else}available-now{/if}">
											<link itemprop="availability" href="http://schema.org/InStock" />{if $accessory.quantity <= 0}{if $accessory.allow_oosp}{if isset($accessory.available_later) && $accessory.available_later}{$accessory.available_later}{else}{l s='In Stock'}{/if}{else}{l s='Out of stock'}{/if}{else}{if isset($accessory.available_now) && $accessory.available_now}{$accessory.available_now}{else}{l s='In Stock'}{/if}{/if}
										</span>*}
									{elseif (isset($accessory.quantity_all_versions) && $accessory.quantity_all_versions > 0)}
										<span class="tag out">
											<link itemprop="availability" href="http://schema.org/LimitedAvailability" />{l s='Available different options'}
										</span>
									{else}
										<span class="tag out">
											<link itemprop="availability" href="http://schema.org/OutOfStock" />{l s='Out of stock'}
										</span>
									{/if}
								</span>
							{/if}
						{/if}
					</div>
						{hook h="displayProductDeliveryTime" product=$accessory}
						{hook h="displayProductPriceBlock" product=$accessory type="weight"}
				</div>
				<div class="right-block">
					<div class="wrap_content_price">
						{hook h='displayProductListReviews' product=$accessory}
						<h5 class="product-name" itemprop="name">
							{if isset($accessory.pack_quantity) && $accessory.pack_quantity}{$accessory.pack_quantity|intval|cat:' x '}{/if}
							<a href="{$accessory.link|escape:'html':'UTF-8'}" title="{$accessory.name|escape:'html':'UTF-8'}" itemprop="url" >
								{$accessory.name|truncate:45:'...'|escape:'html':'UTF-8'}
							</a>
						</h5>
						<p class="product-desc" itemprop="description">
							{$accessory.description_short|strip_tags:'UTF-8'|truncate:300:'...'}
						</p>
						{if (!$PS_CATALOG_MODE AND ((isset($accessory.show_price) && $accessory.show_price) || (isset($accessory.available_for_order) && $accessory.available_for_order)))}
							<div class="content_price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
								{if isset($accessory.show_price) && $accessory.show_price && !isset($restricted_country_mode)}
								{if isset($accessory.specific_prices) && $accessory.specific_prices && isset($accessory.specific_prices.reduction) && $accessory.specific_prices.reduction > 0}
										{hook h="displayProductPriceBlock" product=$accessory type="old_price"}
										<span class="old-price product-price">
											{displayWtPrice p=$accessory.price_without_reduction}
										</span>
									{/if}
									<span itemprop="price" class="price product-price">
										{if !$priceDisplay}{convertPrice price=$accessory.price}{else}{convertPrice price=$accessory.price_tax_exc}{/if}
									</span>
									<meta itemprop="priceCurrency" content="{$currency->iso_code}" />

									{hook h="displayProductPriceBlock" product=$accessory type="price"}
									{hook h="displayProductPriceBlock" product=$accessory type="unit_price"}
								{/if}
							</div>
						{/if}
					</div>
					{if isset($accessory.color_list)}
						<div class="color-list-container">{$accessory.color_list}</div>
					{/if}
					<div class="product-flags">
						{if (!$PS_CATALOG_MODE AND ((isset($accessory.show_price) && $accessory.show_price) || (isset($accessory.available_for_order) && $accessory.available_for_order)))}
							{if isset($accessory.online_only) && $accessory.online_only}
								<span class="online_only">{l s='Online only'}</span>
							{/if}
						{/if}
						{if isset($accessory.on_sale) && $accessory.on_sale && isset($accessory.show_price) && $accessory.show_price && !$PS_CATALOG_MODE}
							{elseif isset($accessory.reduction) && $accessory.reduction && isset($accessory.show_price) && $accessory.show_price && !$PS_CATALOG_MODE}
								<span class="discount">{l s='Reduced price!'}</span>
							{/if}
					</div>

				</div>
				<div class="wrap_view wrap_visible_hover">
							<a itemprop="url" class="scale_hover_in lnk_view" href="{$accessory.link|escape:'html':'UTF-8'}" title="{l s='View'}">
								<i class="fa fa-search"></i>
								<span>{l s='More'}</span>
							</a>
							{hook h='displayProductListFunctionalButtons' product=$accessory}
							{if isset($quick_view) && $quick_view}
								<a class="scale_hover_in quick-view" href="{$accessory.link|escape:'html':'UTF-8'}" rel="{$accessory.link|escape:'html':'UTF-8'}">
									<i class="font-eye"></i><span>{l s='Quick view'}</span>
								</a>
							{/if}
						<div class="button-container clearfix">
							{if ($accessory.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $accessory.available_for_order && !isset($restricted_country_mode) && $accessory.minimal_quantity <= 1 && $accessory.customizable != 2 && !$PS_CATALOG_MODE}
								{if (!isset($accessory.customization_required) || !$accessory.customization_required) && ($accessory.allow_oosp || $accessory.quantity > 0)}
									{if isset($static_token)}
										<a class=" btn btn_border ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$accessory.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$accessory.id_product|intval}">
											<span>{l s='Add to cart'}</span>
										</a>
									{else}
										<a class=" btn btn_border ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$accessory.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$accessory.id_product|intval}">
											<span>{l s='Add to cart'}</span>
										</a>
									{/if}
								{else}
									<span class=" btn btn_border ajax_add_to_cart_button disabled">
										<span>{l s='Add to cart'}</span>
									</span>
								{/if}
							{/if}
						</div>
					</div>
			</div><!-- .product-container> -->
							</div>
														{/if}
									{/foreach}
								</div>
							</div>
						</div>
					</section>
					<!--end Accessories -->
				{/if}
				{if (isset($quantity_discounts) && count($quantity_discounts) > 0)}
			<!-- quantity discount -->
			<section id="idTab6" class="page-product-box">
				<h3 class="page-product-heading">{l s='Volume discounts'}</h3>
				<div id="quantityDiscount">
					<table class="std table-product-discounts">
						<thead>
							<tr>
								<th>{l s='Quantity'}</th>
								<th>{if $display_discount_price}{l s='Price'}{else}{l s='Discount'}{/if}</th>
								<th>{l s='You Save'}</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$quantity_discounts item='quantity_discount' name='quantity_discounts'}
							<tr id="quantityDiscount_{$quantity_discount.id_product_attribute}" class="quantityDiscount_{$quantity_discount.id_product_attribute}" data-discount-type="{$quantity_discount.reduction_type}" data-discount="{$quantity_discount.real_value|floatval}" data-discount-quantity="{$quantity_discount.quantity|intval}">
								<td>
									{$quantity_discount.quantity|intval}
								</td>
								<td>
									{if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
										{if $display_discount_price}
											{convertPrice price=$productPrice-$quantity_discount.real_value|floatval}
										{else}
											{convertPrice price=$quantity_discount.real_value|floatval}
										{/if}
									{else}
										{if $display_discount_price}
											{convertPrice price = $productPrice-($productPrice*$quantity_discount.reduction)|floatval}
										{else}
											{$quantity_discount.real_value|floatval}%
										{/if}
									{/if}
								</td>
								<td>
									<span>{l s='Up to'}</span>
									{if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
										{$discountPrice=$productPrice-$quantity_discount.real_value|floatval}
									{else}
										{$discountPrice=$productPrice-($productPrice*$quantity_discount.reduction)|floatval}
									{/if}
									{$discountPrice=$discountPrice*$quantity_discount.quantity}
									{$qtyProductPrice = $productPrice*$quantity_discount.quantity}
									{convertPrice price=$qtyProductPrice-$discountPrice}
								</td>
							</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</section>
		{/if}

		{if isset($HOOK_PRODUCT_TAB_CONTENT) && $HOOK_PRODUCT_TAB_CONTENT}{$HOOK_PRODUCT_TAB_CONTENT}{/if}
			</div><!-- end container -->
		</div>
			</div>
		{/if}
		{if isset($HOOK_PRODUCT_FOOTER) && $HOOK_PRODUCT_FOOTER}{$HOOK_PRODUCT_FOOTER}{/if}
		<!-- description & features -->
		<div class="container">
		{if (isset($product) && $product->description) || (isset($features) && $features) || (isset($accessories) && $accessories) || (isset($HOOK_PRODUCT_TAB) && $HOOK_PRODUCT_TAB) || (isset($attachments) && $attachments) || isset($product) && $product->customizable}
			{if isset($attachments) && $attachments}
			<!--Download -->
			<section class="page-product-box">
				<h3 class="page-product-heading">{l s='Download'}</h3>
				{foreach from=$attachments item=attachment name=attachements}
					{if $smarty.foreach.attachements.iteration %3 == 1}<div class="row">{/if}
						<div class="col-lg-4">
							<h4><a href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")|escape:'html':'UTF-8'}">{$attachment.name|escape:'html':'UTF-8'}</a></h4>
							<p class="text-muted">{$attachment.description|escape:'html':'UTF-8'}</p>
							<a class="btn btn-default btn-block" href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")|escape:'html':'UTF-8'}">
								<i class="icon-download"></i>
								{l s="Download"} ({Tools::formatBytes($attachment.file_size, 2)})
							</a>
							<hr />
						</div>
					{if $smarty.foreach.attachements.iteration %3 == 0 || $smarty.foreach.attachements.last}</div>{/if}
				{/foreach}
			</section>
			<!--end Download -->
			{/if}
			{if isset($product) && $product->customizable}
			<!--Customization -->
			<section class="page-product-box">
				<h3 class="page-product-heading">{l s='Product customization'}</h3>
				<!-- Customizable products -->
				<form method="post" action="{$customizationFormTarget}" enctype="multipart/form-data" id="customizationForm" class="clearfix">
					<p class="infoCustomizable">
						{l s='After saving your customized product, remember to add it to your cart.'}
						{if $product->uploadable_files}
						<br />
						{l s='Allowed file formats are: GIF, JPG, PNG'}{/if}
					</p>
					{if $product->uploadable_files|intval}
						<div class="customizableProductsFile">
							<h5 class="product-heading-h5">{l s='Pictures'}</h5>
							<ul id="uploadable_files" class="clearfix">
								{counter start=0 assign='customizationField'}
								{foreach from=$customizationFields item='field' name='customizationFields'}
									{if $field.type == 0}
										<li class="customizationUploadLine{if $field.required} required{/if}">{assign var='key' value='pictures_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
											{if isset($pictures.$key)}
												<div class="customizationUploadBrowse">
													<img src="{$pic_dir}{$pictures.$key}_small" alt="" />
														<a href="{$link->getProductDeletePictureLink($product, $field.id_customization_field)|escape:'html':'UTF-8'}" title="{l s='Delete'}" >
															<img src="{$img_dir}icon/delete.gif" alt="{l s='Delete'}" class="customization_delete_icon" width="11" height="13" />
														</a>
												</div>
											{/if}
											<div class="customizationUploadBrowse form-group">
												<label class="customizationUploadBrowseDescription">
													{if !empty($field.name)}
														{$field.name}
													{else}
														{l s='Please select an image file from your computer'}
													{/if}
													{if $field.required}<sup>*</sup>{/if}
												</label>
												<input type="file" name="file{$field.id_customization_field}" id="img{$customizationField}" class="form-control customization_block_input {if isset($pictures.$key)}filled{/if}" />
											</div>
										</li>
										{counter}
									{/if}
								{/foreach}
							</ul>
						</div>
					{/if}
					{if $product->text_fields|intval}
						<div class="customizableProductsText">
							<h5 class="product-heading-h5">{l s='Text'}</h5>
							<ul id="text_fields">
							{counter start=0 assign='customizationField'}
							{foreach from=$customizationFields item='field' name='customizationFields'}
								{if $field.type == 1}
									<li class="customizationUploadLine{if $field.required} required{/if}">
										<label for ="textField{$customizationField}">
											{assign var='key' value='textFields_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
											{if !empty($field.name)}
												{$field.name}
											{/if}
											{if $field.required}<sup>*</sup>{/if}
										</label>
										<textarea name="textField{$field.id_customization_field}" class="form-control customization_block_input" id="textField{$customizationField}" rows="3" cols="20">{strip}
											{if isset($textFields.$key)}
												{$textFields.$key|stripslashes}
											{/if}
										{/strip}</textarea>
									</li>
									{counter}
								{/if}
							{/foreach}
							</ul>
						</div>
					{/if}
					<p id="customizedDatas">
						<input type="hidden" name="quantityBackup" id="quantityBackup" value="" />
						<input type="hidden" name="submitCustomizedDatas" value="1" />
						<button class="button btn btn-default button button-small" name="saveCustomization">
							<span>{l s='Save'}</span>
						</button>
						<span id="ajax-loader" class="unvisible">
							<img src="{$img_ps_dir}loader.gif" alt="loader" />
						</span>
					</p>
				</form>
				<p class="clear required"><sup>*</sup> {l s='required fields'}</p>
			</section>
			<!--end Customization -->
			{/if}
		{/if}
		{if isset($packItems) && $packItems|@count > 0}
		<section id="blockpack">
			<h3 class="page-product-heading">{l s='Pack content'}</h3>
			{include file="$tpl_dir./product-list.tpl" products=$packItems}
		</section>
		{/if}
	{/if}    
</div> <!-- itemscope product wrapper -->

<div class="ax-showcase-product">
    <div chaordic="top"></div>
    <div chaordic="middle"></div>		
    <div chaordic="bottom"></div>
</div>

{strip}
{if isset($smarty.get.ad) && $smarty.get.ad}
	{addJsDefL name=ad}{$base_dir|cat:$smarty.get.ad|escape:'html':'UTF-8'}{/addJsDefL}
{/if}
{if isset($smarty.get.adtoken) && $smarty.get.adtoken}
	{addJsDefL name=adtoken}{$smarty.get.adtoken|escape:'html':'UTF-8'}{/addJsDefL}
{/if}
{addJsDef allowBuyWhenOutOfStock=$allow_oosp|boolval}
{addJsDef availableNowValue=$product->available_now|escape:'quotes':'UTF-8'}
{addJsDef availableLaterValue=$product->available_later|escape:'quotes':'UTF-8'}
{addJsDef attribute_anchor_separator=$attribute_anchor_separator|escape:'quotes':'UTF-8'}
{addJsDef attributesCombinations=$attributesCombinations}
{addJsDef currencySign=$currencySign|html_entity_decode:2:"UTF-8"}
{addJsDef currencyRate=$currencyRate|floatval}
{addJsDef currencyFormat=$currencyFormat|intval}
{addJsDef currencyBlank=$currencyBlank|intval}
{addJsDef currentDate=$smarty.now|date_format:'%Y-%m-%d %H:%M:%S'}
{if isset($combinations) && $combinations}
	{addJsDef combinations=$combinations}
	{addJsDef combinationsFromController=$combinations}
	{addJsDef displayDiscountPrice=$display_discount_price}
	{addJsDefL name='upToTxt'}{l s='Up to' js=1}{/addJsDefL}
{/if}
{if isset($combinationImages) && $combinationImages}
	{addJsDef combinationImages=$combinationImages}
{/if}
{addJsDef customizationFields=$customizationFields}
{addJsDef default_eco_tax=$product->ecotax|floatval}
{addJsDef displayPrice=$priceDisplay|intval}
{addJsDef ecotaxTax_rate=$ecotaxTax_rate|floatval}
{addJsDef group_reduction=$group_reduction}
{if isset($cover.id_image_only)}
	{addJsDef idDefaultImage=$cover.id_image_only|intval}
{else}
	{addJsDef idDefaultImage=0}
{/if}
{addJsDef img_ps_dir=$img_ps_dir}
{addJsDef img_prod_dir=$img_prod_dir}
{addJsDef id_product=$product->id|intval}
{addJsDef jqZoomEnabled=$jqZoomEnabled|boolval}
{addJsDef maxQuantityToAllowDisplayOfLastQuantityMessage=$last_qties|intval}
{addJsDef minimalQuantity=$product->minimal_quantity|intval}
{addJsDef noTaxForThisProduct=$no_tax|boolval}
{addJsDef customerGroupWithoutTax=$customer_group_without_tax|boolval}
{addJsDef oosHookJsCodeFunctions=Array()}
{addJsDef productHasAttributes=isset($groups)|boolval}
{addJsDef productPriceTaxExcluded=($product->getPriceWithoutReduct(true)|default:'null' - $product->ecotax)|floatval}
{addJsDef productBasePriceTaxExcluded=($product->base_price - $product->ecotax)|floatval}
{addJsDef productBasePriceTaxExcl=($product->base_price|floatval)}
{addJsDef productReference=$product->reference|escape:'html':'UTF-8'}
{addJsDef productAvailableForOrder=$product->available_for_order|boolval}
{addJsDef productPriceWithoutReduction=$productPriceWithoutReduction|floatval}
{addJsDef productPrice=$productPrice|floatval}
{addJsDef productUnitPriceRatio=$product->unit_price_ratio|floatval}
{addJsDef productShowPrice=(!$PS_CATALOG_MODE && $product->show_price)|boolval}
{addJsDef PS_CATALOG_MODE=$PS_CATALOG_MODE}
{if $product->specificPrice && $product->specificPrice|@count}
	{addJsDef product_specific_price=$product->specificPrice}
{else}
	{addJsDef product_specific_price=array()}
{/if}
{if $display_qties == 1 && $product->quantity}
	{addJsDef quantityAvailable=$product->quantity}
{else}
	{addJsDef quantityAvailable=0}
{/if}
{addJsDef quantitiesDisplayAllowed=$display_qties|boolval}
{if $product->specificPrice && $product->specificPrice.reduction && $product->specificPrice.reduction_type == 'percentage'}
	{addJsDef reduction_percent=$product->specificPrice.reduction*100|floatval}
{else}
	{addJsDef reduction_percent=0}
{/if}
{if $product->specificPrice && $product->specificPrice.reduction && $product->specificPrice.reduction_type == 'amount'}
	{addJsDef reduction_price=$product->specificPrice.reduction|floatval}
{else}
	{addJsDef reduction_price=0}
{/if}
{if $product->specificPrice && $product->specificPrice.price}
	{addJsDef specific_price=$product->specificPrice.price|floatval}
{else}
	{addJsDef specific_price=0}
{/if}
{addJsDef specific_currency=($product->specificPrice && $product->specificPrice.id_currency)|boolval} {* TODO: remove if always false *}
{addJsDef stock_management=$stock_management|intval}
{addJsDef taxRate=$tax_rate|floatval}
{addJsDefL name=doesntExist}{l s='This combination does not exist for this product. Please select another combination.' js=1}{/addJsDefL}
{addJsDefL name=doesntExistNoMore}{l s='This product is no longer in stock' js=1}{/addJsDefL}
{addJsDefL name=doesntExistNoMoreBut}{l s='with those attributes but is available with others.' js=1}{/addJsDefL}
{addJsDefL name=fieldRequired}{l s='Please fill in all the required fields before saving your customization.' js=1}{/addJsDefL}
{addJsDefL name=uploading_in_progress}{l s='Uploading in progress, please be patient.' js=1}{/addJsDefL}
{addJsDefL name='product_fileDefaultHtml'}{l s='No file selected' js=1}{/addJsDefL}
{addJsDefL name='product_fileButtonHtml'}{l s='Choose File' js=1}{/addJsDefL}
{/strip}
{/if}