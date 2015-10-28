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

<!-- MODULE PROBlock contact infos -->
<div id="block_contact_infos" class="row">
	{if $page_name == 'index'}
		<h2 class="title_main_section underline_border title_contacts_over white_clr"><span>{l s='Contact us' mod='problockcontactinfos'}</span></h2>
		{if $problockcontactinfos_company != ''}
			<h3 class="title_contacts_over undertitle_main white_clr">
				{$problockcontactinfos_company|escape:'html':'UTF-8'}
			</h3>
		{/if}
		<p>{l s='Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed' mod='problockcontactinfos'}</p>
	{/if}
	<div class="content_contacts">
		<div class="container">
			<ul class="row">
				{if $problockcontactinfos_address != ''}
					<li class="address_item col-sm-4 col-xs-12">
						<span class="title_contact_item">{l s='Address:' mod='problockcontactinfos'}</span>
						<span class="content_item">
							{$problockcontactinfos_address|escape:'html':'UTF-8'}
						</span>
						<span class="big-cross"></span>
					</li>
				{/if}
				{if $problockcontactinfos_phone != '' || $problockcontactinfos_phone_2 != ''}
					<li class="phones_item col-sm-4 col-xs-12">
						<span class="title_contact_item">{l s='Phone:' mod='problockcontactinfos'}</span>
						{if $problockcontactinfos_phone != ''}
							<span class="content_item">
								{$problockcontactinfos_phone|escape:'html':'UTF-8'}
							</span>
						{/if}
						{if $problockcontactinfos_phone_2 != ''}
							<span class="content_item">
								{$problockcontactinfos_phone_2|escape:'html':'UTF-8'}
							</span>
						{/if}
						<span class="big-cross"></span>
					</li>
				{/if}
				{if $problockcontactinfos_email != ''}
					<li class="email_item col-sm-4 col-xs-12">
						<span class="title_contact_item">{l s='E-mail:' mod='problockcontactinfos'}</span>
						 <span class="content_item">
						 	{mailto address=$problockcontactinfos_email|escape:'html':'UTF-8' encode="hex"}
						 </span>
					</li>
				{/if}
			</ul>
		</div>
	</div>
</div>
<!-- /MODULE PROBlock contact infos -->
