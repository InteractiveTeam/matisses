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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA

*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- MODULE PROBlock contact infos -->
<div id="block_contact_infos">
	<h4 class="title_block">{l s='Contact us' mod='problockcontactinfos'}</h4>
	{if $problockcontactinfos_company != ''}
		<h5>{$problockcontactinfos_company|escape:'html':'UTF-8'}</h5>
	{/if}
	{if $problockcontactinfos_text != ''}
		<p>{$problockcontactinfos_text|escape:'html':'UTF-8'}</p>
	{/if}
	<ul>
		{if $problockcontactinfos_address != ''}
			<li>
				{$problockcontactinfos_address|escape:'html':'UTF-8'}
			</li>
		{/if}
		{if $problockcontactinfos_phone != '' || $problockcontactinfos_phone_2 != ''}
			<li>
				<span class="title_phone_contact">{l s='Phone' mod='problockcontactinfos'}</span>
				{if $problockcontactinfos_phone != ''}
					{$problockcontactinfos_phone|escape:'html':'UTF-8'}<br/>
				{/if}
				{if $problockcontactinfos_phone_2 != ''}
					{$problockcontactinfos_phone_2|escape:'html':'UTF-8'}
				{/if}
			</li>
		{/if}
		{if $problockcontactinfos_email != ''}
			<li>
				{l s='E-mail:' mod='problockcontactinfos'} {mailto address=$problockcontactinfos_email|escape:'html':'UTF-8' encode="hex"}
			</li>
		{/if}
	</ul>
</div>
<!-- /MODULE PROBlock contact infos -->
