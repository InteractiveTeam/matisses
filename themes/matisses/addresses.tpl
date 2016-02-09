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
{capture name=path}<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">{l s='My account'}</a><span class="navigation-pipe">{$navigationPipe}</span><span class="navigation_page">{l s='My addresses'}</span>{/capture}

	<h1 class="page-heading">{l s='My addresses'}</h1>
	<div class="txt-address grid_12">
		<p>{l s='Configure sus datos de pago y envío, estos serán seleccionados por defecto cuando haga su pedido. Puede añadir direcciones adicionales, algo específicamente útil para enviar regalos o recibir pedidos de oficina.'}</p>
		<br>
		{if isset($multipleAddresses) && $multipleAddresses}
		<p>{l s='Sus direcciones se muestran a continuación (Asegúrese de actualizar sus datos si han cambiado).'}</p>
		<br>
		{assign var="adrs_style" value=$addresses_style}
	</div>
	<div class="block_addresses grid_12 alpha omega">
	{foreach from=$multipleAddresses item=address name=myLoop}
    	<div class="grid_4">
			<div class="address-cont {if $smarty.foreach.myLoop.last}last_item{elseif $smarty.foreach.myLoop.first}first_item{/if}{if $smarty.foreach.myLoop.index % 2} alternate_item{else} item{/if} box ">
				<h2 class="page-subheading">{$address.object.alias}</h2>
				{foreach from=$address.ordered name=adr_loop item=pattern}
			        {assign var=addressKey value=" "|explode:$pattern}
			        <p>
			        {foreach from=$addressKey item=key name="word_loop"}
			            <span {if isset($addresses_style[$key])} class="{$addresses_style[$key]}"{/if}>
			                {$address.formated[$key|replace:',':'']|escape:'html':'UTF-8'}
			            </span>
			        {/foreach}
					</p>
	            {/foreach}
            </div>

			<div class="adress_update grid_12 alpha omega">
				<a class="btn btn-default btn-red" href="{$link->getPageLink('address', true, null, "id_address={$address.object.id|intval}")|escape:'html':'UTF-8'}" title="{l s='Update'}">{l s='Update'}</a>

				<a class="btn btn-default btn-red" href="{$link->getPageLink('address', true, null, "id_address={$address.object.id|intval}")|escape:'html':'UTF-8'}" title="{l s='Update'}">{l s='Modificar'}</a>

				<a class="btn btn-default btn-red" href="{$link->getPageLink('address', true, null, "id_address={$address.object.id|intval}&delete")|escape:'html':'UTF-8'}" onclick="return confirm('{l s='Are you sure?' js=1}');" title="{l s='Delete'}">{l s='Delete'}</a>
			</div>
        </div>
	{if $smarty.foreach.myLoop.index % 2 && !$smarty.foreach.myLoop.last}

	</div>
	<div class="block_adresses ">
	{/if}
	{/foreach}
	</div>

{else}
	<p class="alert alert-warning">{l s='No addresses are available.'}&nbsp;<a href="{$link->getPageLink('address', true)|escape:'html':'UTF-8'}">{l s='Add a new address'}</a></p>
{/if}


<div class="footer-links-address grid_12">

		<a href="{$link->getPageLink('address', true)|escape:'html':'UTF-8'}" title="{l s='Add an address'}" class="btn btn-default btn-red">{l s='Add a new address'}</a>

		<a class="btn btn-default button btn-red" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}"> <i class="fa fa-chevron-left"></i> {l s='Volver a mi cuenta'}

		</a>

</div>
