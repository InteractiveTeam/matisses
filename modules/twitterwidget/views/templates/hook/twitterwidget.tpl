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
* @copyright 2007-2015 PrestaShop SA
* @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*

**
* This file will be removed in 1.6
*} 

<div class="block twitter-box">
<ul>
{foreach from=$TWITTER_RESPONSE item=t}
{if isset($t.text)}
<li><b>{$t.text|escape:'intval'}</b> <span>{$t.created_at|escape:'intval'}</span></li>
{else}
<li><b>YOUR TWITTER LINE IS EMPTY!</b><span>Check your login in configuration!</span></li>
{/if}
{/foreach}
</ul>


<table align="center">
    <tr>
        <td rowspan="2"><a href="http://www.twitter.com/{$TWITTLOGIN|escape:'intval'}" target="_blank"><img src="{$modules_dir|escape:'intval'}/twitterwidget/img/twittmain.png" title="prew twitt"></img></a></td>
        <td id="twittcontent" rowspan="2"></td>
	<td id="twittbuttontop" colspan="2"></td>
</tr>
    <tr>
        <td id="nextbutton"><a id="prewTwittLink" href=""><img src="{$modules_dir|escape:'intval'}/twitterwidget/img/twittleft.png" title="prew twitt"></img></a></td><td><a id="nextTwittLink" href=""><img src="{$modules_dir|escape:'intval'}/twitterwidget/img/twittright.png" title="next twitt"></img></a></td>
    </tr>
</table>
</div>
