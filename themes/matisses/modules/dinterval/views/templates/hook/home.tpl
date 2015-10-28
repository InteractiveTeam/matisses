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
<link href="{$css_dir|escape:''}modules/dinterval/views/css/counter.css" rel="stylesheet">
<script type="text/javascript" src="{$js_dir|escape:''}modules/dinterval/views/js/jquery.timeTo.min.js"></script>
<script type="text/javascript" src="{$js_dir|escape:''}modules/dinterval/views/js/countdown.js"></script>
<script>
    {*var date_begin = '{$date_begin|escape:''}';*}
    var countEnd = '{if $date_end|date_format:"%m" == "01"}Jan{elseif $date_end|date_format:"%m" == "02"}Feb{elseif $date_end|date_format:"%m" == "03"}Mar{elseif $date_end|date_format:"%m" == "04"}Apr{elseif $date_end|date_format:"%m" == "05"}May{elseif $date_end|date_format:"%m" == "06"}Jun{elseif $date_end|date_format:"%m" == "07"}Jul{elseif $date_end|date_format:"%m" == "08"}Aug{elseif $date_end|date_format:"%m" == "09"}Sep{elseif $date_end|date_format:"%m" == "10"}Oct{elseif $date_end|date_format:"%m" == "11"}Nov{elseif $date_end|date_format:"%m" == "12"}Dec{/if}';
    var date_end = countEnd + '{$date_end|date_format:" %d %Y %H:%M:%S"}';
	var custom_labels = {
		days:"{l s='days' mod='dinterval'}",
		hours:"{l s='hours' mod='dinterval'}",
		min:"{l s='minutes' mod='dinterval'}",
		sec:"{l s='seconds' mod='dinterval'}",
	};
</script>
<div class="wrap_counter">
	<div id="countdown" class="clearfix"></div>
</div>
