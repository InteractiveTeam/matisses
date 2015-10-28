{* 
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
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
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2014 PrestaShop SA
* @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*

**
* This file will be removed in 1.6
*} 

<div class=" twitter-box row">
	<div class="container">
		<h2 class="title_main_section">
			<span>
			{l s='Latest tweets' mod='twitterwidget'}
		</span>
		</h2>
		<h3 class="undertitle_main">
			{l s='Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.' mod='twitterwidget'}
		</h3>
		<div class="twits_cont">
		        <a class="twitter_bird" href="http://www.twitter.com/{$TWITTLOGIN|escape:'intval'}" target="_blank"><i class="fa fa-twitter"></i></a>
		         <div class="twitter_carousel">
					{foreach name=tweets from=$TWITTER_RESPONSE item=t}
						{if $smarty.foreach.tweets.iteration <= $NUMBOFTWITTS}
							{if isset($t.text)}
								<div class="item_twits"><p>{$t.text|escape:'intval'}</p> 
									<span>{$t.created_at|escape:'intval'}</span>
								</div>
							{else}
									<div class="item_twits">
										<p>{l s='YOUR TWITTER LINE IS EMPTY!' mod='twitterwidget'}</p>
										<span>{l s='Check your login in configuration' mod='twitterwidget'}!</span>
									</div>
							{/if}
						{/if}
					{/foreach}
				</div>
				<a class="twitter_btn btn_border btn" href="http://www.twitter.com/{$TWITTLOGIN|escape:'intval'}" target="_blank"><i class="fa fa-twitter"></i>
					{l s='Follow us' mod='twitterwidget'}
				</a>
				<div class="wrap_buttons">
			       <a id="prewTwittLink" href=""></a>
			        <a id="nextTwittLink" href=""></a>
		    	</div>
		</div>
	</div>
</div>