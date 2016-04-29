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
{if $PS_SC_TWITTER || $PS_SC_FACEBOOK || $PS_SC_GOOGLE || $PS_SC_PINTEREST}

	<p class="socialsharing_product list-inline no-print">
        {if $PS_SC_HOUZZ}
			<button data-type="houzz" type="button" {if $PS_SC_HOUZZ_URL} onclick="window.open('{$PS_SC_HOUZZ_URL}','_new','')" {/if} class="btn btn-default btn-houzz social-sharing">
				<i class="fa fa-houzz"></i> <span>{l s="Houzz" mod='socialsharing'}</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/pinterest.gif")}" alt="Pinterest" /> -->
			</button>
		{/if}
        {if $PS_SC_PINTEREST}
			<button data-type="pinterest" type="button" {if $PS_SC_PINTEREST_URL} onclick="window.open('{$PS_SC_PINTEREST_URL}','_new','')" {/if} class="btn btn-default btn-pinterest social-sharing">
				<i class="fa fa-pinterest"></i> <span>{l s="Pinterest" mod='socialsharing'}</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/pinterest.gif")}" alt="Pinterest" /> -->
			</button>
		{/if}
		{if $PS_SC_FACEBOOK}
			<button data-type="facebook" type="button" {if $PS_SC_FACEBOOK_URL} onclick="window.open('{$PS_SC_FACEBOOK_URL}','_new','')" {/if}  class="btn btn-default btn-facebook social-sharing">
				<i class="fa fa-facebook"></i> <span>{l s="Share" mod='socialsharing'}</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/facebook.gif")}" alt="Facebook Like" /> -->
			</button>
		{/if}        
		{if $PS_SC_TWITTER}
			<button data-type="twitter" type="button" {if $PS_SC_TWITTER_URL} onclick="window.open('{$PS_SC_TWITTER_URL}','_new','')" {/if} class="btn btn-default btn-twitter social-sharing">
				<i class="fa fa-twitter"></i> <span>{l s="Tweet" mod='socialsharing'}</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/twitter.gif")}" alt="Tweet" /> -->
			</button>
		{/if}
        
        {if $PS_SC_INSTAGRAM}
			<button data-type="instagram" type="button" {if $PS_SC_INSTAGRAM_URL} onclick="window.open('{$PS_SC_INSTAGRAM_URL}','_new','')" {/if} class="btn btn-default btn-instagram social-sharing">
				<i class="fa fa-instagram"></i> <span>{l s="Instagram" mod='socialsharing'}</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/pinterest.gif")}" alt="Pinterest" /> -->
			</button>
		{/if}

		{if $PS_SC_GOOGLE}
			<button data-type="google-plus" type="button" {if $PS_SC_GOOGLE_URL} onclick="window.open('{$PS_SC_GOOGLE_URL}','_new','')" {/if} class="btn btn-default btn-google-plus social-sharing">
				<i class="fa fa-google-plus"></i> <span>{l s="Google+" mod='socialsharing'}</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/google.gif")}" alt="Google Plus" /> -->
			</button>
		{/if}
        {if $PS_SC_EMAIL}
        {assign var=url value="`$smarty.server.HTTP_HOST``$smarty.server.REQUEST_URI`"}
			<a {if $PS_SC_EMAIL_URL} href="mailto:{$PS_SC_EMAIL_URL}?body={urlencode($url)}" {/if} data-type="email" onclick="MAIL" type="button" class="btn btn-default btn-email social-sharing">
				<i class="fa fa-envelope-o"></i> <span>{l s="Email" mod='socialsharing'}</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/pinterest.gif")}" alt="Pinterest" /> -->
			</a>
		{/if}
        {if $PS_SC_PRINT}
			<button data-type="print" type="button" onclick="window.print()" class="btn btn-default btn-print social-sharing">
				<i class="fa fa-print"></i> <span>{l s="Print" mod='socialsharing'}</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/pinterest.gif")}" alt="Pinterest" /> -->
			</button>
		{/if}
        
	</p>
{/if}