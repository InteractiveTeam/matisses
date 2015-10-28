/*
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
*/

$(document).ready(function(){
	responsiveFont();

	$(window).resize(function(){
 		responsiveFont();
	});
});

	function responsiveFont(){
		var fontSize, captionSize;
		if($(window).width() + scrollWidth() >1024){
			fontSize = 100;
			captionSize = 24;
		}else if($(window).width() + scrollWidth() >768){
			fontSize = 60;
			captionSize = 16;
		}else if($(window).width() + scrollWidth() > 480){
			fontSize = 40;
			captionSize = 14;
		}else if($(window).width() + scrollWidth() > 380){
			fontSize = 30;
			captionSize = 12;
		}else{
			fontSize = 25;
			captionSize = 12;
		}

		$('#countdown').remove();
		$('.wrap_counter').prepend('<div id="countdown" class="clearfix"></div>');
		$('#countdown').timeTo({
			timeTo: new Date(date_end),
			// determine automatically // displayDays: 2,
			displayCaptions: true,
			fontSize: fontSize,
			captionSize: captionSize,
			lang: 'custom',
			custom_labels: custom_labels,
		});
	}
function scrollWidth()
	{
		var div = $('<div>').css({
			position: "absolute",
			top: "0px",
			left: "0px",
			width: "100px",
			height: "100px",
			visibility: "hidden",
			overflow: "scroll"
		});
		
		$('body').eq
		(0).append(div);
		
		var width = div.get(0).offsetWidth - div.get(0).clientWidth;
		
		div.remove();
		
		return width;
	}
