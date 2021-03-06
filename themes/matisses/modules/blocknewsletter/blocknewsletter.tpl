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
<!-- Block Newsletter module-->
<div id="newsletter_block_left" class="block newsletter-footer">
	<p>{l s='Sé el primero en descubrir las ofertas exclusivas, los últimos lookbooks y tendencias principales.' mod='blocknewsletter'}</p>
	<div class="block_content">

		{if isset($msg) && $msg}
        	<div class="success" style="color:{$color}">{$msg}</div>
        {/if}
    	<div class="error"></div>
		<form action="{$link->getPageLink('index')|escape:'html':'UTF-8'}" id="newsletter" name="submitNewsletter" method="post">
			<div class="form-group{if isset($msg) && $msg } {if $nw_error}form-error{else}form-ok{/if}{/if}" >
				<div class="cf">
					<input class="inputNew form-control grey newsletter-input" id="newsletter-input" type="text" name="email" size="18" placeholder="{l s='Escriba su correo electrónico' mod='blocknewsletter'}" value="{if isset($value) && $value}{$value}{/if}" />

	                <button type="submit" id="submitNewsletter" class="btn btn-default button button-small btn-enviar">
	                    <span>{l s='Enviar' mod='blocknewsletter'}</span>
	                </button>
				</div>
				<input type="hidden" name="action" value="0" />
                <div class="habeas cf">
                <input type="checkbox" checked="checked" name="habeas" id="habeas" value="1" />
					<p>{l s='Acepto la ley de tratamiento y uso de datos de Matisses' mod='blocknewsletter'}</p>
                </div>
			</div>
		</form>
	</div>
</div>

<script>
	var error1 = "{l s='Debes aceptar nuestra ley de tratamiento de datos'  mod='blocknewsletter'}"
	var error2 = "{l s='Ingresa un email válido'  mod='blocknewsletter'}"
</script>
<!-- /Block Newsletter module-->
{if false}
{strip}
{if isset($msg) && $msg}
{addJsDef msg_newsl=$msg|@addcslashes:'\''}
{/if}
{if isset($nw_error)}
{addJsDef nw_error=$nw_error}
{/if}
{addJsDefL name=placeholder_blocknewsletter}{l s='Enter your e-mail' mod='blocknewsletter' js=1}{/addJsDefL}
{if isset($msg) && $msg}
	{addJsDefL name=alert_blocknewsletter}{l s='Newsletter : %1$s' sprintf=$msg js=1 mod="blocknewsletter"}{/addJsDefL}
{/if}
{/strip}
{/if}
