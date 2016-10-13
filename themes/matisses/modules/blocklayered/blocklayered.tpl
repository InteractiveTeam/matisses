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
*  International Registred Trademark & Property of PrestaShop SA
*}
<!-- Block layered navigation module -->
{if $nbr_filterBlocks != 0}
<script type="text/javascript">
current_friendly_url = '#{$current_friendly_url}';
{if version_compare($smarty.const._PS_VERSION_,'1.5','>')}
param_product_url = '#{$param_product_url}';
{else}
param_product_url = '';
{/if}
</script>
<div id="layered_block_left" class="layered-left grid_12 alpha omega">
	<div class="block_content">
		<form action="#" id="layered_form">
			<div>
				{if isset($selected_filters) && $n_filters > 0 && false}
				<div id="enabled_filters" class="enabled-filters">

					<ul>
					{foreach from=$selected_filters key=filter_type item=filter_values}
						{foreach from=$filter_values key=filter_key item=filter_value name=f_values}
							{foreach from=$filters item=filter}
								{if $filter.type == $filter_type && isset($filter.values)}
									{if isset($filter.slider)}
										{if $smarty.foreach.f_values.first}
											<li>
												<a href="javascript:void(0)" data-rel="layered_{$filter.type}_slider" title="{l s='Cancel' mod='blocklayered'}"></a>
												{if $filter.format == 1}
													{l s='%1$s: %2$s - %3$s'|sprintf:$filter.name:{displayPrice price=$filter.values[0]}:{displayPrice price=$filter.values[1]}|escape:html:'UTF-8' mod='blocklayered'} 2
												{else}
													{l s='%1$s: %2$s %4$s - %3$s %4$s'|sprintf:$filter.name:$filter.values[0]:$filter.values[1]:$filter.unit|escape:html:'UTF-8' mod='blocklayered'} 1
												{/if}
											</li>
										{/if}
									{else}
										{foreach from=$filter.values key=id_value item=value}
											{if $id_value == $filter_key && !is_numeric($filter_value) && ($filter.type eq 'id_attribute_group' || $filter.type eq 'id_feature') || $id_value == $filter_value && $filter.type neq 'id_attribute_group' && $filter.type neq 'id_feature'}
												<li>
													<a href="javascript:void(0)" data-rel="layered_{$filter.type_lite}_{$id_value}" title="{l s='Cancel' mod='blocklayered'}"></a>
													{l s='%1$s' mod='blocklayered' sprintf=[$value.name]}
												</li>
											{/if}
										{/foreach}
									{/if}
								{/if}
							{/foreach}
						{/foreach}
					{/foreach}
					</ul>
				</div>
				{/if}
                {if $category}
                    {assign var="cat" value=Category::getParents($category->id)}
                {else}
                    {assign var="cat" value=Category::getParents(Tools::getValue('id_category'))}
                {/if}
                {assign var=nCat value=count($cat)}
                {*pre>{$cat|print_r}</pre>*}
				
                {for $i=0 to $nCat - 1}
                    {if $i == 0}
                        <div id="enabled_filters" class="ax-title-parents">
                            <ul>
                                <li>
                                    <a href="/{$cat[$i]['id_category']}-{$cat[$i]['link_rewrite']}">{$cat[$i]['name']}</a>
                                 </li>
                             </ul>
                         </div>
                     {else}
                        {if $cat[$i]['level_depth'] > 4}
                            <h2 class="layered_subtitle"> {l s='Subcategoría'}</h2>
                        {else}
                            <h2 class="layered_subtitle"> {l s='Categoría'}</h2>
                        {/if}
                        <div id="enabled_filters" class="enabled-filters">
                            <ul>
                                <li>
                                <a href="/{$cat[$i-1]['id_category']}-{$cat[$i-1]['link_rewrite']}" title="Cancelar"></a>
                                {$cat[$i]['name']}
                                 </li>
                             </ul>
                        </div>
                     {/if}
                {/for}
                
                {$filter2 = Hook::exec('actionSortFilters', ['filters' => $filters], null, true)}
                {assign var='filters' value=$filter2.matisses}

				{foreach from=$filters item=filter}

					{if isset($filter.values)}
						{if isset($filter.slider)}
						<div class="layered_{$filter.type}" style="display: none;">
						{else}
						<div class="layer-attributes">

						{/if}

                        	{if $filter.name|strstr:"material"}
                        	{if $cont==0}
                            <h2 class="layered_subtitle"> {l s='Material'}</h2>
                            {$cont = $cont + 1}
                        	{/if}
                        	{else}
                            {if $filter.type == "category"}
                                {if $nCat >= 2}
				                    <h2 class="layered_subtitle"> {l s='Subcategorías'}</h2>
                                {else}
                                    <h2 class="layered_subtitle"> {l s='Categorías'}</h2>
                                {/if}
                            {else}
                                 <h2 class="layered_subtitle"> {$filter.name|escape:html:'UTF-8'}</h2>
                            {/if}

                        {/if}
      {if isset($selected_filters) && $n_filters > 0}

					{foreach from=$selected_filters key=s_filter_type item=s_filter_values}
						{foreach from=$s_filter_values key=s_filter_key item=s_filter_value name=s_f_values}
							{foreach from=$filters item=s_filter}

                            	{if $filter.name == $s_filter.name}

                                    {if $s_filter.type == $s_filter_type && isset($s_filter.values)}

                                        {if isset($s_filter.slider)}
                                            {if $smarty.foreach.s_f_values.first}
                                            <div id="enabled_filters" class="enabled-filters">

													<ul>
		                                                <li>
		                                                    <a href="javascript:void(0)" data-rel="layered_{$s_filter.type}_slider" title="{l s='Cancel' mod='blocklayered'}"></a>
                                                                {l s='%1s %2s - %3s'|sprintf:'':{displayPrice price=$s_filter.values[0]}:{displayPrice price=$s_filter.values[1]}|escape:html:'UTF-8' mod='blocklayered'}
		                                                </li>
		                                             </ul>
											</div>
                                            {/if}
                                        {else}
                                            {foreach from=$s_filter.values key=id_value item=value}
                                                {if $id_value == $s_filter_key && !is_numeric($s_filter_value) && ($s_filter.type eq 'id_attribute_group' || $s_filter.type eq 'id_feature') || $id_value == $s_filter_value && $s_filter.type neq 'id_attribute_group' && $s_filter.type neq 'id_feature'}
                                                    <div id="enabled_filters" class="enabled-filters">
														<ul>
                                                   			<li>
                                                            	{$filterssel[$id_value] = $id_value}
                                                        		<a href="javascript:void(0)" data-rel="layered_{$s_filter.type_lite}_{$id_value}" title="{l s='Cancel' mod='blocklayered'}"></a>
                                                        		{l s='%1$s' mod='blocklayered' sprintf=[$value.name]}
                                                    		</li>
                                                        </ul>
                                                	</div>
                                                {/if}
                                            {/foreach}
                                        {/if}

                                    {/if}

                                {/if}


							{/foreach}
						{/foreach}
					{/foreach}

       {/if}
                        <span class="layered_close"><a href="javascript:void(0)" data-rel="ul_layered_{$filter.type}_{$filter.id_key}">v</a></span>
						<div class="{if !isset($filter.slider)} scroll-left scroll-pane {/if}">
						<ul id="ul_layered_{$filter.type}_{$filter.id_key}" class="{Tools::link_rewrite($filter.name)}">
						{if !isset($filter.slider)}
							{if $filter.filter_type == 0}
								{foreach from=$filter.values key=id_value item=value name=fe}
									{if $value.nbr || !$hide_0_values}
						  <li class="nomargin {if in_array($id_value, $filterssel)} active {/if} {if $filter_selected==$id_value} active {/if}{if $smarty.foreach.fe.index >= $filter.filter_show_limit}hiddable{/if} {if isset($filter.is_color_group) && $filter.is_color_group}color-item{/if}">
									<label for="layered_{$filter.type_lite}_{$id_value}"{if !$value.nbr} class="disabled"{else}{if isset($filter.is_color_group) && $filter.is_color_group} data-name="layered_{$filter.type_lite}_{$id_value}" class="layered_color" data-rel="{$id_value}_{$filter.id_key}"{/if}{/if}>

                                        {if isset($filter.is_color_group) && $filter.is_color_group}
											<input class="color-option {if isset($value.checked) && $value.checked}on{/if} {if !$value.nbr}disable{/if}" type="button" name="layered_{$filter.type_lite}_{$id_value}" data-rel="{$id_value}_{$filter.id_key}" id="layered_id_attribute_group_{$id_value}" {if !$value.nbr}disabled="disabled"{/if} style="background: {if isset($value.color)}{if file_exists($col_img_dir|cat:$id_value|cat:'.jpg')}url({$img_col_dir}{$id_value}.jpg){else}{$value.color}{/if}{else}#CCC{/if};" title="{$value.name|escape:html:'UTF-8'}" value="{$value.name|escape:html:'UTF-8'}"/>
											{if isset($value.checked) && $value.checked}<input type="hidden" name="layered_{$filter.type_lite}_{$id_value}" value="{$id_value}" />{/if}
										{else}
                                        	
                                        	
											<input 
                                            	type="checkbox" 
                                                class="checkbox" 
                                                name="layered_{$filter.type_lite}_{$id_value}" 
                                                id="layered_{$filter.type_lite}{if $id_value || $filter.type == 'quantity'}_{$id_value}{/if}" 
                                                value="{$id_value}{if $filter.id_key}_{$filter.id_key}{/if}"{if isset($value.checked)} checked="checked"{/if}
                                                {if !$value.nbr} disabled="disabled"{/if} />
										{/if}
											<a>{$value.name|escape:html:'UTF-8'}{if $layered_show_qties}<span> ({$value.nbr})</span>{/if}</a>
										</label>
									</li>
									{/if}
								{/foreach}
							{else}
								{if $filter.filter_type == 1}
								{foreach from=$filter.values key=id_value item=value name=fe}
									{if $value.nbr || !$hide_0_values}
									<li class="nomargin {if $smarty.foreach.fe.index >= $filter.filter_show_limit}hiddable{/if} {if isset($filter.is_color_group) && $filter.is_color_group} color-item{/if}">
										<label for="layered_{$filter.type_lite}_{$id_value}"{if !$value.nbr} class="disabled"{else}{if isset($filter.is_color_group) && $filter.is_color_group} data-name="layered_{$filter.type_lite}_{$id_value}" class="layered_color" data-rel="{$id_value}_{$filter.id_key}"{/if}{/if}>
                                        {if isset($filter.is_color_group) && $filter.is_color_group}
											<input class="radio color-option {if isset($value.checked) && $value.checked}on{/if} {if !$value.nbr}disable{/if}" type="button" name="layered_{$filter.type_lite}_{$id_value}" data-rel="{$id_value}_{$filter.id_key}" id="layered_id_attribute_group_{$id_value}" {if !$value.nbr}disabled="disabled"{/if} style="background: {if isset($value.color)}{if file_exists($col_img_dir|cat:$id_value|cat:'.jpg')}url({$img_col_dir}{$id_value}.jpg){else}{$value.color}{/if}{else}#CCC{/if};" title="{$value.name|escape:html:'UTF-8'}"/>
											{if isset($value.checked) && $value.checked}<input type="hidden" name="layered_{$filter.type_lite}_{$id_value}" value="{$id_value}" />{/if}
										{else}
											<input type="radio" class="radio layered_{$filter.type_lite}_{$id_value}" name="layered_{$filter.type_lite}{if $filter.id_key}_{$filter.id_key}{else}_1{/if}" id="layered_{$filter.type_lite}{if $id_value || $filter.type == 'quantity'}_{$id_value}{if $filter.id_key}_{$filter.id_key}{/if}{/if}" value="{$id_value}{if $filter.id_key}_{$filter.id_key}{/if}"{if isset($value.checked)} checked="checked"{/if}{if !$value.nbr} disabled="disabled"{/if} />
										{/if}
											<a>{$value.name|escape:html:'UTF-8'}{if $layered_show_qties}<span> ({$value.nbr})</span>{/if}</a>
										</label>
									</li>
									{/if}
								{/foreach}
								{else}
									<li>
									<select class="select" {if $filter.filter_show_limit > 1}multiple="multiple" size="{$filter.filter_show_limit}"{/if}>
										<option value="">{l s='No filters' mod='blocklayered'}</option>
										{foreach from=$filter.values key=id_value item=value}
										{if $value.nbr || !$hide_0_values}
											<option style="color: {if isset($value.color)}{$value.color}{/if}" id="layered_{$filter.type_lite}{if $id_value || $filter.type == 'quantity'}_{$id_value}{/if}" value="{$id_value}_{$filter.id_key}" {if isset($value.checked) && $value.checked}selected="selected"{/if} {if !$value.nbr}disabled="disabled"{/if}>
												{$value.name|escape:html:'UTF-8'}{if $layered_show_qties}<span> ({$value.nbr})</span>{/if}</a>
											</option>
										{/if}
										{/foreach}
									</select>
									</li>
								{/if}
							{/if}
						{else}
							{if $filter.filter_type == 0}
								<li>
								<label>{l s='Range:' mod='blocklayered'}</label>
								<div class="layered_slider_container">
									<div class="layered_slider" id="layered_{$filter.type}_slider" data-type="{$filter.type}" data-format="{$filter.format}" data-unit="{$filter.unit}"></div>
								</div>
								<span id="layered_{$filter.type}_range"></span>
								<script type="text/javascript">
								{literal}
									var filterRange = {/literal}{$filter.max}-{$filter.min}{literal};
									var step = filterRange / 100;
									if (step > 1)
										step = parseInt(step);
									addSlider('{/literal}{$filter.type}{literal}',{
										range: true,
										step: step,
										min: {/literal}{$filter.min}{literal},
										max: {/literal}{$filter.max}{literal},
										values: [ {/literal}{$filter.values[0]}{literal}, {/literal}{$filter.values[1]}{literal}],
										slide: function( event, ui ) {
											stopAjaxQuery();
											{/literal}
											{if $filter.format < 5}
											{literal}
												from = blocklayeredFormatCurrency(ui.values[0], {/literal}{$filter.format}{literal}, '{/literal}{$filter.unit}{literal}');
												to = blocklayeredFormatCurrency(ui.values[1], {/literal}{$filter.format}{literal}, '{/literal}{$filter.unit}{literal}');
											{/literal}
											{else}
											{literal}
												from = ui.values[0]+'{/literal}{$filter.unit}{literal}';
												to = ui.values[1]+'{/literal}{$filter.unit}{literal}';
											{/literal}
											{/if}
											{literal}
											$('#layered_{/literal}{$filter.type}{literal}_range').html(from+' - '+to);
										},
										stop: function () {
											reloadContent();
										}
									}, '{/literal}{$filter.unit}{literal}', {/literal}{$filter.format}{literal});
								{/literal}
								</script>
								</li>
							{else}
								{if $filter.filter_type == 1}
								<li class="nomargin">
									{l s='From' mod='blocklayered'} <input class="layered_{$filter.type}_range layered_input_range_min layered_input_range" id="layered_{$filter.type}_range_min" type="text" value="{$filter.values[0]}"/>
									<span class="layered_{$filter.type}_range_unit">{$filter.unit}</span>
									{l s='to' mod='blocklayered'} <input class="layered_{$filter.type}_range layered_input_range_max layered_input_range" id="layered_{$filter.type}_range_max" type="text" value="{$filter.values[1]}"/>
									<span class="layered_{$filter.type}_range_unit">{$filter.unit}</span>
									<span class="layered_{$filter.type}_format" style="display:none;">{$filter.format}</span>
								  	<script type="text/javascript">
									{literal}
										$('#layered_{/literal}{$filter.type}{literal}_range_min').attr('limitValue', {/literal}{$filter.min}{literal});
										$('#layered_{/literal}{$filter.type}{literal}_range_max').attr('limitValue', {/literal}{$filter.max}{literal});
									{/literal}
									</script>
								</li>
								{else}
								{foreach from=$filter.list_of_values  item=values}
									<li class="nomargin {if $filter.values[1] == $values[1] && $filter.values[0] == $values[0]}layered_list_selected{/if} layered_list" onclick="$('#layered_{$filter.type}_range_min').val({$values[0]});$('#layered_{$filter.type}_range_max').val({$values[1]});reloadContent();">
										- {l s='From' mod='blocklayered'} {$values[0]} {$filter.unit} {l s='to' mod='blocklayered'} {$values[1]} {$filter.unit}
									</li>
								{/foreach}
								<li style="display: none;">
									<input class="layered_{$filter.type}_range" id="layered_{$filter.type}_range_min" type="hidden" value="{$filter.values[0]}"/>
									<input class="layered_{$filter.type}_range" id="layered_{$filter.type}_range_max" type="hidden" value="{$filter.values[1]}"/>
								</li>
								{/if}
							{/if}
						{/if}
						{if count($filter.values) > $filter.filter_show_limit && $filter.filter_show_limit > 0 && $filter.filter_type != 2}
							<span class="hide-action more">{l s='Show more' mod='blocklayered'}</span>
							<span class="hide-action less">{l s='Show less' mod='blocklayered'}</span>
						{/if}
						</ul>
						</div>
					</div>
                    
					<script type="text/javascript">
					{literal}
						$('.layered_{/literal}{$filter.type}{literal}').show();
					{/literal}
					</script>
					{/if}
				{/foreach}
            <script type=text/javascript>
            {literal}
                $(function() {
                    $.fn.sortList = function() {
                    var mylist = $('#layered_form ul.material');
                    var listitems = $('li', mylist).get();
                    listitems.sort(function(a, b) {
                        var compA = $(a).text().toUpperCase();
                        var compB = $(b).text().toUpperCase();
                        return (compA < compB) ? -1 : 1;
                    });
                    $.each(listitems, function(i, itm) {
                        mylist.append(itm);
                    });
                   }
                    $("#layered_form ul.material").sortList();
                });
            {/literal}
            </script>
			</div>
			<input type="hidden" name="id_category_layered" value="{$id_category_layered}" />
			{foreach from=$filters item=filter}
				{if $filter.type_lite == 'id_attribute_group' && isset($filter.is_color_group) && $filter.is_color_group && $filter.filter_type != 2}
					{foreach from=$filter.values key=id_value item=value}
						{if isset($value.checked)}
							<input type="hidden" name="layered_id_attribute_group_{$id_value}" value="{$id_value}_{$filter.id_key}" />
						{/if}
					{/foreach}
				{/if}
			{/foreach}
			<span class='ax-close-filter' onclick="cerrarBoton()">Cerrar filtro</span>
		</form>
	</div>
	<div id="layered_ajax_loader" style="display: none;">
		<p><img src="{$img_ps_dir}loader.gif" alt="" /><br />{l s='Loading...' mod='blocklayered'}</p>
	</div>
</div>
{else}
<div id="layered_block_left" class="block">
	<div class="block_content">
		<form action="#" id="layered_form">
			<input type="hidden" name="id_category_layered" value="{$id_category_layered}" />
		</form>
	</div>
	<div style="display: none;">
		<p style=""><img src="{$img_ps_dir}loader.gif" alt="" /><br />{l s='Loading...' mod='blocklayered'}</p>
	</div>
</div>
{/if}
<!-- /Block layered navigation module -->