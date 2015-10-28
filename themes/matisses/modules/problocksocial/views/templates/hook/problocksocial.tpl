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
<!-- problocksocial -->
<section id="prosocial_block" class="col-lg-3 col-md-4 col-sm-5 col-xs-12">
	<h4 class="hidden-xs hidden-sm text_upper">{l s='Socialize' mod='problocksocial'}</h4>
	<ul>
		{if $twitter_url != ''}
			<li class="twitter">
				<a target="_blank" href="{$twitter_url|escape:html:'UTF-8'}">
					<i class="fa fa-twitter"></i>
				</a>
			</li>
		{/if}
		{if $facebook_url != ''}
			<li class="facebook">
				<a target="_blank" href="{$facebook_url|escape:html:'UTF-8'}">
					<i class="fa fa-facebook"></i>
				</a>
			</li>
		{/if}
		{if $vimeo_url != ''}
	        <li class="vimeo">
	        	<a target="_blank" href="{$vimeo_url|escape:html:'UTF-8'}">
	        		<i class="font-vimeo"></i>
	        	</a>
	        </li>
        {/if}
        {if $google_plus_url != ''}
        	<li class="google-plus">
        		<a  target="_blank" href="{$google_plus_url|escape:html:'UTF-8'}">
        			<i class="fa fa-google-plus"></i>
        		</a>
        	</li>
        {/if}
		{if $youtube_url != ''}
        	<li class="youtube">
        		<a target="_blank"  href="{$youtube_url|escape:html:'UTF-8'}">
        			<i class="fa fa-youtube"></i>
        		</a>
        	</li>
        {/if}
		{if $pinterest_url != ''}
        	<li class="pinterest">
        		<a target="_blank"  href="{$pinterest_url|escape:html:'UTF-8'}">
        			<i class="fa fa-pinterest"></i>
        		</a>
        	</li>
        {/if}
		{if $rss_url != ''}
			<li class="rss">
				<a target="_blank" href="{$rss_url|escape:html:'UTF-8'}">
					<i class="fa fa-rss"></i>
				</a>
			</li>
		{/if}

	</ul>
</section>
<!-- problocksocial -->