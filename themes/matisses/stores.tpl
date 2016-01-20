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

{capture name=path}{l s='Our stores'}{/capture}

<h1 class="page-heading">
    {l s='Our stores'}
</h1>



{if $simplifiedStoresDiplay}
    {if $stores|@count}
    
    	<div id="map"></div>
    
        <div id="accordion-resizer" class="ui-widget-content">
          <div id="accordion-stores">
          	{foreach $stores as $store}
            <h3>{$store.name|escape:'html':'UTF-8'}</h3>
            <div>
				<ul>
                	<li>
                       {if $store.has_picture}
                            <div class="store-image">
                                <img src="{$img_store_dir}{$store.id_store}.jpg" alt="" />
                            </div>
                        {/if}
                    </li>
                	<li><b>{l s='Nombre:'} {$store.name|escape:'html':'UTF-8'}</b></li>
                    <li><b>{l s='Ciudad:'} {$store.city|escape:'html':'UTF-8'}</b></li>
                    <li>
                    	<b>{l s='Horario de atención:'} </b>
                    	{if isset($store.working_hours)}{$store.working_hours}{/if}
                    </li>
                    <li>
                    	<b>{l s='Dirección:'} </b>
                        {assign value=$store.id_store var="id_store"}
                        {foreach from=$addresses_formated.$id_store.ordered name=adr_loop item=pattern}
                            {assign var=addressKey value=" "|explode:$pattern}
                            {foreach from=$addressKey item=key name="word_loop"}
                                <span {if isset($addresses_style[$key])} class="{$addresses_style[$key]}"{/if}>
                                    {$addresses_formated.$id_store.formated[$key|replace:',':'']|escape:'html':'UTF-8'}
                                </span>
                            {/foreach}
                        {/foreach}
                    
                    </li>
                    <li><b>{l s='Teléfono:'} </b>{$store.phone}</li>
                </ul>
            </div>
            {/foreach}
            
            
           
          </div>
        </div>    
    {/if}
{else}

    <!-- <div class="txt-intro">
        <p>
            {l s='Enter a location (e.g. zip/postal code, address, city or country) in order to find the nearest stores.'}
        </p>
    </div> -->
    <div class="store-content cf grid_12 alpha omega">
        <div class="address-input grid_6 alpha">
            <label for="addressInput">{l s='Your location:'}</label>
            <input class="form-control grey" placeholder="Dirección, Código postal, Estado o País" type="text" name="location" id="addressInput" value="{l s='Address, zip / postal code, city, state or country'}" />
        </div>
        <div class="radius-input grid_6 omega">
            <label for="radiusSelect">{l s='Radius:'}</label>
            <select name="radius" id="radiusSelect" class="form-control">
                <option value="15">15</option>
                <option value="25">25</option>
                <option value="50">50</option>
                <option value="100">100</option>
            </select>
            <img src="{$img_ps_dir}loader.gif" class="middle" alt="" id="stores_loader" />
        </div>
		<div class="store-content-select selector3 grid_6 alpha">
	    	<select id="locationSelect" class="form-control">
                <option>-</option>
            </select>
        </div>
    </div>

	<div class="grid_12 alpha omega">
        <button name="search_locations" class="button btn btn-default btn-red">
            {l s='Search'}
        </button>
    </div>
    <table id="stores-table" class="table table-bordered">
        <thead>
            <tr>
                <th class="num">#</th>
                <th>{l s='Store'}</th>
                <th>{l s='Address'}</th>
                <th>{l s='Distance'}</th>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>

{/if}
{strip}
{addJsDef map=''}
{addJsDef markers=array()}
{addJsDef infoWindow=''}
{addJsDef locationSelect=''}
{addJsDef defaultLat=$defaultLat}
{addJsDef defaultLong=$defaultLong}
{addJsDef hasStoreIcon=$hasStoreIcon}
{addJsDef distance_unit=$distance_unit}
{addJsDef img_store_dir=$img_store_dir}
{addJsDef img_ps_dir=$img_ps_dir}
{addJsDef searchUrl=$searchUrl}
{addJsDef logo_store=$logo_store}
{addJsDefL name=translation_1}{l s='No stores were found. Please try selecting a wider radius.' js=1}{/addJsDefL}
{addJsDefL name=translation_2}{l s='store found -- see details:' js=1}{/addJsDefL}
{addJsDefL name=translation_3}{l s='stores found -- view all results:' js=1}{/addJsDefL}
{addJsDefL name=translation_4}{l s='Phone:' js=1}{/addJsDefL}
{addJsDefL name=translation_5}{l s='Get directions' js=1}{/addJsDefL}
{addJsDefL name=translation_6}{l s='Not found' js=1}{/addJsDefL}
{/strip}