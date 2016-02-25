/*
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
*/

var responsiveflagMenu = false;
var categoryMenu = $('ul.sf-menu');
var mCategoryGrover = $('.sf-contener .cat-title');

$(document).ready(function(){

	$('a.parent-link').on('click',function(e){
		e.preventDefault();
		if($(this).parent().hasClass('sfHover'))
		{
			$(this).parent().removeClass('sfHover');
			$(this).parent().removeClass('parent-menu-active');
			$('.submenu-container').hide();
		}else{
				$(this).parent().addClass('sfHover');
				$(this).parent().addClass('parent-menu-active');
				$('.submenu-container').show();
			 }
	})

	categoryMenu = $('ul.sf-menu');
	mCategoryGrover = $('.sf-contener .cat-title');
	responsiveMenu();
	$(window).resize(responsiveMenu);
	$("#category-thumbnail,.category-thumbnail").children('div').addClass('banner_thumb').wrap("<div class=\"grid_4 alpha omega  wrap_scale\"><div class=\"wrap_banner_item\"></div></div>");
	$("#category-thumbnail,.category-thumbnail").find('img').wrap("<a class=\"wrap_scale wrap_image_thumb\">");
	$('.sf-menu').children('li').children('.sf-with-ul').each(function(){
		var categiryLink = $(this).attr('href');
		$(this).parent('li').find('.category-thumbnail a ,#category-thumbnail a').attr('href', categiryLink)
	});
	paddingMenu();
	$(window).resize(paddingMenu);
	function paddingMenu(){
		//var paddingSubmenu = $('.main_panel .container').offset().left;
		//$(".sf-menu .submenu-container").css({paddingLeft:paddingSubmenu +15+ 'px',paddingRight:paddingSubmenu +15+ 'px'});
	}
});

// check resolution
function responsiveMenu()
{
   if ($(document).width() <= 767 && responsiveflagMenu == false)
	{
		menuChange('enable');
		responsiveflagMenu = true;
	}
	else if ($(document).width() >= 768)
	{
		menuChange('disable');
		responsiveflagMenu = false;
	}
}

// init Super Fish Menu for 767px+ resolution
function desktopInit()
{
	mCategoryGrover.off();
	mCategoryGrover.removeClass('active');
	$('.sf-menu > li > ul').removeClass('menu-mobile').parent().find('.menu-mobile-grover').remove();
	$('.sf-menu').removeAttr('style');
	categoryMenu.superfish('init');
	//add class for width define
	$('.sf-menu > li > ul').addClass('submenu-container cf');
	 // loop through each sublist under each top list item
    $('.sf-menu > li > ul').each(function(){
        i = 0;
        //add classes for clearing
        $(this).each(function(){
            if ($(this).attr('id') != "category-thumbnail"){
                i++;
                if(i % 2 == 1)
                    $(this).addClass('grid_12');
                else if (i % 5 == 1)
                    $(this).addClass('grid_12');
            }
        });
    });
}
//$('.sf-menu').css{('display','none')};
function mobileInit()
{

	categoryMenu.superfish('destroy');
	$('.sf-menu').removeAttr('style');

	mCategoryGrover.on('click touchstart', function(e){
		$(this).toggleClass('active').parent().find('ul.menu-content').stop().slideToggle('medium');
		return false;
	});


	$('.sf-menu > li > ul').addClass('menu-mobile cf').parent().prepend('<span class="menu-mobile-grover"></span>');

	$(".sf-menu .menu-mobile-grover").on('click touchstart', function(e){
		var catSubUl = $(this).next().next('.menu-mobile');
		if (catSubUl.is(':hidden'))
		{
			catSubUl.slideDown();
			$(this).addClass('active');
		}
		else
		{
			catSubUl.slideUp();
			$(this).removeClass('active');
		}
		return false;
	});


	$('#block_top_menu > ul:first > li > a').on('click touchstart', function(e){
		var parentOffset = $(this).prev().offset();
	   	var relX = parentOffset.left - e.pageX;
		if ($(this).parent('li').find('ul').length && relX >= 0 && relX <= 20)
		{
			e.preventDefault();
			var mobCatSubUl = $(this).next('.menu-mobile');
			var mobMenuGrover = $(this).prev();
			if (mobCatSubUl.is(':hidden'))
			{
				mobCatSubUl.slideDown();
				mobMenuGrover.addClass('active');
			}
			else
			{
				mobCatSubUl.slideUp();
				mobMenuGrover.removeClass('active');
			}
		}
	});
}

// change the menu display at different resolutions
function menuChange(status)
{
	status == 'enable' ? mobileInit(): desktopInit();
}

//Megamenu-responsive
$(document).ready(function(e){
	var ShowUser = $("<div class='show-user'><div class='selectIcon'><i class='fa fa-angle-down'></i></div></div>");
	$('.header_user_info').append(ShowUser)

	$('.show-user').on('click', function(){
		$('#drop_content_user > a').slideToggle();
	})
	//MENU responsiveMenu

		var itemsMenu = $('.menu-mobile li');

		$.each(itemsMenu, function(indice, objeto){
			var item = $(objeto);

			if(item.find('ul').length > 0) {
				item.prepend('<div class="more"></div>');
			}
		});

		$('.menu-mobile li .more').on('click', function(){
			$(this).siblings('ul').slideToggle();
			$(this).toggleClass('rotate-o');
		})

		var sub = $('li.sfHover');

		//menu footer
		var contmenuFooter = $("<ul class='menuFooterRp'></ul>")
		var itemsMenuFooter = $('#menu-footer li');

		function llamarMenu() {
				var widthPage = $(window).width();
	      if(widthPage < 321){
						$('#menu-footer').append(contmenuFooter)
						$.each(itemsMenuFooter, function(indice, objeto){
								var itemFooter = $(objeto)
								contmenuFooter.append(itemFooter)
						});
				}
		}

		llamarMenu();

		//back relative scroll GARANTIAS
		var contDetails = $('.warranty-history table').width();
		var contInfoG = $('.warranty-history .table-responsive table tr td > .grid_5');
		var contInfoGb = $('.warranty-history .table-responsive table tr td > .grid_7');
		var contInfoGw = $('.warranty-history .table-responsive table tr td > .grid_5').width();
		var padin = contDetails-contInfoGw;

		var lastScrollLeft = 0;

		$('.table-responsive').scroll(function(){
			 var st = $(this).scrollLeft();
		   if (st > 150){
				 lastScrollLeft++;
				 contInfoG.css('marginLeft', lastScrollLeft)
				 contInfoGb.css('marginLeft', lastScrollLeft)
		   } else {
				 lastScrollLeft--;
				 contInfoG.css('marginLeft', lastScrollLeft)
				 contInfoGb.css('marginLeft', lastScrollLeft)
		   }
		   lastScrollLeft = st;
		})
        
        //hover experiencias
        $('.block-img-exp > div.pointer').mouseenter(function() {
            $(this).css('zIndex', 4)
          })
          .mouseleave(function() {
             $(this).css('zIndex', 0)
          });
        
        //list menu
    
        var business = $('ul.submenu-container > li > ul');
        
        $.each(business, function(x,y){
            var category = $(y).children('li');
            var countMax = category.length;

            $.each(category, function(z, w){
                 var subcategory = $(w).find('.SubCategory').children('a');

              for (var i=0; i < subcategory.length; i+=countMax) {
                var group = subcategory.slice(i, i+countMax);
                group.wrapAll('<div class=col />');
              }
            });  
        });

})

//Divs a megamenu
