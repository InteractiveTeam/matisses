/*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* https://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to https://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    https://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/
//global variables

/*
$(window).load(function() {
    var timerStart = Date.now();
    $('.ax-preload .ax-text').css({transform: 'scale(0.7)', opacity :'0'});
    $('.ax-preload .ax-icon').css({transform: 'scale(1.2)'});
    $('.ax-preload').delay(400).animate({opacity:'0'},function(){
            $('.ax-cont-preload').delay(600).fadeOut();
        })
    $('body').delay((Date.now()-timerStart)).css({'overflow':'visible'});
})
*/

$(document).ready(function() {
    
    $('body').animate({'opacity':'1'}, 1000 );
    var btnMaps = $(".ax-btn-view-maps");

    btnMaps.on('click', function(){
        $(this).parent().siblings('.ax-maps').find('.ax-image').fadeToggle();
        $(this).find('i').toggleClass('fa-times');
    })
    
    btnMaps.toggle(function() {
      $(this).html("Cerrar mapa<i class='fa fa-times'></i>")
    }, function() {
      $(this).html("Ver mapa<i class='fa fa-angle-right'></i>")
    });
        
})

var responsiveflag = false;

$(document).ready(function(){
	setTimeout(function(){
	$('#birth-arrows .chosen-single div').html('<p class="up"></p><p class="down"></p>').promise().done(function(){
		$('#birth-arrows .up').live('click',function(e){
			e.preventDefault();
		})
		$('#birth-arrows .down').live('click',function(e){
			e.preventDefault()
		})
		
	});
	}, 300);
	
	
	highdpiInit();
	responsiveResize();
	$(window).resize(responsiveResize);
	if (navigator.userAgent.match(/Android/i))
	{
		var viewport = document.querySelector('meta[name="viewport"]');
		viewport.setAttribute('content', 'initial-scale=1.0,maximum-scale=1.0,user-scalable=0,width=device-width,height=device-height');
		window.scrollTo(0, 1);
	}
	blockHover();
	if (typeof quickView !== 'undefined' && quickView)
		quick_view();
	dropDown();

	if (typeof page_name != 'undefined' && !in_array(page_name, ['index', 'product']))
	{
		bindGrid();

 		$(document).on('change', '.selectProductSort', function(e){
			if (typeof request != 'undefined' && request)
				var requestSortProducts = request;
 			var splitData = $(this).val().split(':');
			if (typeof requestSortProducts != 'undefined' && requestSortProducts)
				document.location.href = requestSortProducts + ((requestSortProducts.indexOf('?') < 0) ? '?' : '&') + 'orderby=' + splitData[0] + '&orderway=' + splitData[1];
    	});

		$(document).on('change', 'select[name="n"]', function(){
			$(this.form).submit();
		});

		$(document).on('change', 'select[name="manufacturer_list"], select[name="supplier_list"]', function() {
			if (this.value != '')
				location.href = this.value;
		});

		$(document).on('change', 'select[name="currency_payement"]', function(){
			setCurrency($(this).val());
		});
	}

	$(document).on('click', '.back', function(e){
		e.preventDefault();
		history.back();
	});

	jQuery.curCSS = jQuery.css;
	if (!!$.prototype.cluetip)
		$('a.cluetip').cluetip({
			local:true,
			cursor: 'pointer',
			dropShadow: false,
			dropShadowSteps: 0,
			showTitle: false,
			tracking: true,
			sticky: false,
			mouseOutClose: true,
			fx: {
		    	open:       'fadeIn',
		    	openSpeed:  'fast'
			}
		}).css('opacity', 0.8);

	if (!!$.prototype.fancybox)
		$.extend($.fancybox.defaults.tpl, {
			closeBtn : '<a title="' + FancyboxI18nClose + '" class="fancybox-item fancybox-close" href="javascript:;"></a>',
			next     : '<a title="' + FancyboxI18nNext + '" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>',
			prev     : '<a title="' + FancyboxI18nPrev + '" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'
		});

	if($('.owl-item').size()<=3)
	{
		$('.owl-controls').addClass('hidden')
	}
    
     $('.tooltipDetail').tooltip();
});

function highdpiInit()
{
	if($('.replace-2x').css('font-size') == "1px")
	{
		var els = $("img.replace-2x").get();
		for(var i = 0; i < els.length; i++)
		{
			src = els[i].src;
			extension = src.substr( (src.lastIndexOf('.') +1) );
			src = src.replace("." + extension, "2x." + extension);

			var img = new Image();
			img.src = src;
			img.height != 0 ? els[i].src = src : els[i].src = els[i].src;
		}
	}
}


// Used to compensante Chrome/Safari bug (they don't care about scroll bar for width)
function scrollCompensate()
{
    var inner = document.createElement('p');
    inner.style.width = "100%";
    inner.style.height = "200px";

    var outer = document.createElement('div');
    outer.style.position = "absolute";
    outer.style.top = "0px";
    outer.style.left = "0px";
    outer.style.visibility = "hidden";
    outer.style.width = "200px";
    outer.style.height = "150px";
    outer.style.overflow = "hidden";
    outer.appendChild(inner);

    document.body.appendChild(outer);
    var w1 = inner.offsetWidth;
    outer.style.overflow = 'scroll';
    var w2 = inner.offsetWidth;
    if (w1 == w2) w2 = outer.clientWidth;

    document.body.removeChild(outer);

    return (w1 - w2);
}

function responsiveResize()
{
	compensante = scrollCompensate();
	if (($(window).width()+scrollCompensate()) <= 767 && responsiveflag == false)
	{
		accordion('enable');
	    accordionFooter('enable');
		responsiveflag = true;
	}
	else if (($(window).width()+scrollCompensate()) >= 768)
	{
		accordion('disable');
		accordionFooter('disable');
	    responsiveflag = false;
	}
	/*if (typeof page_name != 'undefined' && in_array(page_name, ['category']))
		resizeCatimg();*/
}

function blockHover(status)
{
	$(document).off('mouseenter').on('mouseenter', '.product_list.grid .ajax_block_product .product-container', function(e){

		if ($('body').find('.container').width() == 1170)
		{
			var pcHeight = $(this).parent().outerHeight();
			var pcPHeight = $(this).parent().find('.button-container').outerHeight() + $(this).parent().find('.comments_note').outerHeight() + $(this).parent().find('.functional-buttons').outerHeight();
			$(this).parent().addClass('hovered').css({'height':pcHeight + pcPHeight, 'margin-bottom':pcPHeight * (-1)});
		}
	});

	$(document).off('mouseleave').on('mouseleave', '.product_list.grid .ajax_block_product .product-container', function(e){
		if ($('body').find('.container').width() == 1170)
			$(this).parent().removeClass('hovered').css({'height':'auto', 'margin-bottom':'0'});
	});
}

function quick_view()
{
	$(document).on('click', '.quick-view:visible, .quick-view-mobile:visible', function(e)
	{
		e.preventDefault();
		var url = this.rel;
		if (url.indexOf('?') != -1)
			url += '&';
		else
			url += '?';

		if (!!$.prototype.fancybox)
			$.fancybox({
				'padding':  0,
				'width':    1087,
				'height':   610,
				'type':     'iframe',
				'href':     url + 'content_only=1'
			});
	});
}

function bindGrid()
{
	var view = $.totalStorage('display');

	if (!view && (typeof displayList != 'undefined') && displayList)
		view = 'list';

	if (view && view != 'grid')
		display(view);
	else
		$('.display').find('li.grid').addClass('selected');

	$(document).on('click', '.display .grid-btn', function(e){
		e.preventDefault();
		display('grid');
	});

	$(document).on('click', '.list-btn', function(e){
		e.preventDefault();
		display('list');
	});
}

function display(view)
{
	if (view == 'list')
	{
		$('.product_list').removeClass('grid').addClass('list row');
		$('.product_list .ajax_block_product').removeClass('grid_4').addClass('grid_4');
		$('.product_list .ajax_block_product').each(function(index, element) {
			html = '';
			html = '<div class="product-container"><div class="row">';
				html += '<div class="left-block grid_4">' + $(element).find('.left-block').html() + '</div>';
				html += '<div class="center-block grid_5">';
					html += '<div class="product-flags">'+ $(element).find('.product-flags').html() + '</div>';
					html += '<h5 itemprop="name">'+ $(element).find('h5').html() + '</h5>';
					html += '<p class="product-desc">'+ $(element).find('.product-desc').html() + '</p>';
					var colorList = $(element).find('.color-list-container').html();
					if (colorList != null) {
						html += '<div class="color-list-container">'+ colorList +'</div>';
					}
				html += '</div>';
					html += '<div class="right-block grid_3"><div class="right-block-content row">';
					html += '<div class=" comments_note  cf">'+ $(element).find('.comments_note').html() + '</div>';
					var price = $(element).find('.content_price').html();       // check : catalog mode is enabled
					if (price != null) {
						html += '<div class="content_price grid_12">'+ price + '</div>';
					}
					html += '<div class="wrap_view grid_12">'+ $(element).find('.wrap_view ').html() +'</div>';
				html += '</div>';
			html += '</div></div>';
		$(element).html(html);
		});
		$('.display').find('li.list').addClass('selected');
		$('.display').find('li.grid').removeAttr('class');
		$.totalStorage('display', 'list');
	}
	else
	{
		$('.product_list').removeClass('list').addClass('grid row');
		$('.product_list .ajax_block_product').removeClass('grid_12').addClass('grid_4');
		$('.product_list .ajax_block_product').each(function(index, element) {
		html = '';
		html += '<div class="product-container">';
			html += '<div class="left-block">' + $(element).find('.left-block').html() + '</div>';
			html += '<div class="right-block"><div class="wrap_content_price">';
				html += '<div class="comments_note  cf">'+ $(element).find('.comments_note').html() + '</div>';
				html += '<div class="product-flags">'+ $(element).find('.product-flags').html() + '</div>';

				html += '<h5 itemprop="name">'+ $(element).find('h5').html() + '</h5>';
				html += '<p itemprop="description" class="product-desc">'+ $(element).find('.product-desc').html() + '</p>';
				var price = $(element).find('.content_price').html(); // check : catalog mode is enabled
					if (price != null) {
						html += '<div class="content_price">'+ price + '</div>';
					}
				var colorList = $(element).find('.color-list-container').html();
				if (colorList != null) {
					html += '<div class="color-list-container">'+ colorList +'</div>';
				}
			html += '</div></div>';
			html += '<div class="wrap_view">'+ $(element).find('.wrap_view ').html() +'</div>';
		html += '</div>';
		$(element).html(html);
		});
		$('.display').find('li.grid').addClass('selected');
		$('.display').find('li.list').removeAttr('class');
		$.totalStorage('display', 'grid');
	}
}

function dropDown()
{
	elementClick = '#header .current';
	elementSlide =  'ul.toogle_content';
	activeClass = 'active';

	$(elementClick).on('click', function(e){
		e.stopPropagation();
		var subUl = $(this).next(elementSlide);
		if(subUl.is(':hidden'))
		{
			subUl.slideDown();
			$(this).addClass(activeClass);
		}
		else
		{
			subUl.slideUp();
			$(this).removeClass(activeClass);
		}
		$(elementClick).not(this).next(elementSlide).slideUp();
		$(elementClick).not(this).removeClass(activeClass);
		e.preventDefault();
	});

	$(elementSlide).on('click', function(e){
		e.stopPropagation();
	});

	$(document).on('click', function(e){
		e.stopPropagation();
		var elementHide = $(elementClick).next(elementSlide);
		$(elementHide).slideUp();
		$(elementClick).removeClass('active');
	});
}

function accordionFooter(status)
{
	if(status == 'enable')
	{
		$('#footer .footer-block h4').on('click', function(){
			$(this).toggleClass('active').parent().find('.toggle-footer').stop().slideToggle('medium');
		})
		$('#footer').addClass('accordion').find('.toggle-footer').slideUp('fast');
	}
	else
	{
		$('.footer-block h4').removeClass('active').off().parent().find('.toggle-footer').removeAttr('style').slideDown('fast');
		$('#footer').removeClass('accordion');
	}
}

function accordion(status)
{
	leftColumnBlocks = $('#left_column');
	if(status == 'enable')
	{
		$('#right_column .block:not(#new-products_block_right,#best-sellers_block_right) .title_block, #left_column .block:not(#new-products_block_right,#best-sellers_block_right) .title_block, #left_column #newsletter_block_left h4').on('click', function(){
			$(this).toggleClass('active').parent().find('.block_content').stop().slideToggle('medium');
		})
		$('#right_column, #left_column').addClass('accordion').find('.block:not(#new-products_block_right,#best-sellers_block_right) .block_content').slideUp('fast');
	}
	else
	{
		$('#right_column .block .title_block, #left_column .block .title_block, #left_column #newsletter_block_left h4').removeClass('active').off().parent().find('.block_content').removeAttr('style').slideDown('fast');
		$('#left_column, #right_column').removeClass('accordion');
	}
}

function resizeCatimg()
{
	var div = $('.cat_desc').parent('div');
	var image = new Image;
	$(image).load(function(){
	    var width  = image.width;
	    var height = image.height;
		var ratio = parseFloat(height / width);
		var calc = Math.round(ratio * parseInt(div.outerWidth(false)));
		div.css('min-height', calc);
	});
	if (div.length)
		image.src = div.css('background-image').replace(/url\("?|"?\)$/ig, '');
}


//Ancho menú
$(document).ready(function(){

	var ancho = $(window).width();
	//alert(ancho);
	$(".sf-menu > li > ul").width(ancho);   
    
    var heightScrolling = $('#slider').height();
    var btnScrollingB = $("<div class='btn_scroll'>");
    
    $('#homeslider .homeslider-container').append(btnScrollingB);
    
    $('.btn_scroll').on('click', function(){
        $("html, body").animate({scrollTop:heightScrolling+58+"px"});
    })
    
    
})
//ANIMAR SCROLL
    function bannerDinamic(){
        $(window).scroll(function(){
            var numCont = $(document).scrollTop();
            var dimmer = $('.homepage-slider .dimmer');
            var opaci = numCont*0.005;
            var slider = $('.homepage-slider');

            dimmer.css('opacity', opaci*0.3);
            slider.css('transform', 'translateY('+numCont*0.4+'px)');
        })
    }
    
//añadir filtros
$(document).ready(function(){
    var elementFilterRp = $('<div></div>');
    elementFilterRp.addClass('ax-filterRp');
    
    $('.ax-btn-filter').on('click', function(){
        $('.parrilla-productos #layered_block_left').slideToggle();
    })
    
})

function FilterRp() {
    
    var widthPage = $(window).width();    
    
    if(widthPage < 768){
        $('.ax-block-content').append($('.ax-blog-select-category'));
        $('.right-down-menu .search').prependTo($('.right-up-menu > ul'));
    }else {
        $('.parrilla-productos #layered_block_left').show();
        $('.right-down-menu > ul li:eq(1)').after($('.right-up-menu .search'))
        bannerDinamic();
    }
} 

FilterRp()

$(window).resize(
    function() {
        FilterRp()
    }
)
/*ayo ayo*/

/*********************************************************************
 * #### jQuery Awesome Sosmed Share Button / AyoShare.js v11 ####
 * Coded by Ican Bachors 2014.
 * https://ibacor.com/labs/jquery-awesome-sosmed-share-button/
 * Updates will be posted to this site.
 *********************************************************************/

$.fn.ayoshare = function() {

    var b = encodeURIComponent(url),
        a = ($(document).attr('title') != null) ? $(document).attr('title') : '',
        desk = ($('meta[name="description"]').attr('content') != null) ? $('meta[name="description"]').attr('content') : '',
        img = ($('meta[property="og:image"]').attr('content') != null) ? $('meta[property="og:image"]').attr('content') : '',
        html = '';
		
	var xxx = ($(this).attr('id') != null) ? '#'+$(this).attr('id') : '.'+$(this).attr('class');
    
	if (facebook == true) {
        html += '<p><a href="https://www.facebook.com/sharer/sharer.php?u=' + b + '" onclick="javascript:void window.open(\'https://www.facebook.com/sharer/sharer.php?u=' + b + '\',\'ibacor.com\',\'width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0\');return false;" class="ayo-btn ayo-facebook" title="Facebook"><i class="fa fa-facebook"></i></a></p>'
        ayo_facebook(b, xxx)
    }
    if (twitter == true) {
        html += '<p><a href="https://twitter.com/share?text=' + a + '+-+via @bachors&url=' + b + '" onclick="javascript:void window.open(\'https://twitter.com/share?text=' + a + '+-+via @bachors&url=' + b + '\',\'ibacor.com\',\'width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0\');return false;" class="ayo-btn ayo-twitter" title="Twitter"><i class="fa fa-twitter"></i></a></p>'
        //ayo_twitter(b, xxx)
    }
    if (google == true) {
        html += '<p><a href="https://plus.google.com/share?url=' + b + '" onclick="javascript:void window.open(\'https://plus.google.com/share?url=' + b + '\',\'ibacor.com\',\'width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0\');return false;" class="ayo-btn ayo-google" title="Google+"><i class="fa fa-google-plus"></i></a></p>'
        ayo_google(b, xxx)
    }
    if (reddit == true) {
        html += '<p><a href="https://reddit.com/submit?url=' + b + '&title=' + a + '+-+via @bachors" onclick="javascript:void window.open(\'https://reddit.com/submit?url=' + b + '&title=' + a + '+-+via @bachors\',\'ibacor.com\',\'width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0\');return false;" class="ayo-btn ayo-reddit" title="Reddit"><i class="fa fa-reddit"></i></a></p>'
        ayo_reddit(b, xxx)
    }
    if (linkedin == true) {
        html += '<p><a href="https://www.linkedin.com/shareArticle?mini=true&url=' + b + '&title=' + a + '&summary=' + desk + '" onclick="javascript:void window.open(\'https://www.linkedin.com/shareArticle?mini=true&url=' + b + '&title=' + a + '&summary=' + desk + '\',\'ibacor.com\',\'width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0\');return false;" class="ayo-btn ayo-linkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></p>'
        ayo_linkedin(b, xxx)
    }
    if (pinterest == true) {
        html += '<p><a href="https://pinterest.com/pin/create/button/?url=' + b + '&media=' + img + '&description=' + desk + '" onclick="javascript:void window.open(\'https://pinterest.com/pin/create/button/?url=' + b + '&media=' + img + '&description=' + desk + '\',\'ibacor.com\',\'width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0\');return false;" class="ayo-btn ayo-pinterest" title="Pinterest"><i class="fa fa-pinterest"></i></a></p>'
        ayo_pinterest(b, xxx)
    }
    if (stumbleupon == true) {
        html += '<p><a href="https://www.stumbleupon.com/badge/?url=' + b + '" onclick="javascript:void window.open(\'https://www.stumbleupon.com/badge/?url=' + b + '\',\'ibacor.com\',\'width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0\');return false;" class="ayo-btn ayo-stumbleupon" title="Stumbleupon"><i class="fa fa-stumbleupon"></i></a></p>'
        ayo_stumbleupon(b, xxx)
    }
    if (bufferapp == true) {
        html += '<p><a href="https://bufferapp.com/add?url=' + b + '&text=' + desk + '" onclick="javascript:void window.open(\'https://bufferapp.com/add?url=' + b + '&text=' + desk + '\',\'ibacor.com\',\'width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0\');return false;" class="ayo-btn ayo-buffer" title="Bufferapp"><i class="fa fa-bars"></i></a></p>'
        ayo_bufferapp(b, xxx)
    }
    if (vk == true) {
        html += '<p><a href="https://vk.com/share.php?url=' + b + '" onclick="javascript:void window.open(\'https://vk.com/share.php?url=' + b + '\',\'ibacor.com\',\'width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0\');return false;" class="ayo-btn ayo-vk" title="VK"><i class="fa fa-vk"></i></a></p>'
        ayo_vk(b, xxx)
    }
    if (pocket == true) {
        html += '<p><a href="https://getpocket.com/save?title=' + a + '&url=' + b + '" onclick="javascript:void window.open(\'https://getpocket.com/save?title=' + a + '&url=' + b + '\',\'ibacor.com\',\'width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0\');return false;" class="ayo-btn ayo-pocket" title="Pocket"><i class="fa fa-get-pocket"></i></a></p>'
        ayo_pocket(b, xxx)
    }
    
    /*if (houzz == true) {
        html += "<p><a class='houzz-share-button' data-url='"+b+"' data-hzid='Mat225' data-title='"+a+"' data-img='"+img+"' data-desc='"+desk+"' data-category='Category keywords ' data-showcount='1 ' href='https://www.houzz.com'></a></p>";
       (function(d,s,id){if(!d.getElementById(id)){var js=d.createElement(s);js.id=id;js.async=true;js.src="//platform.houzz.com/js/widgets.js?"+(new Date().getTime());var ss=d.getElementsByTagName(s)[0];ss.parentNode.insertBefore(js,ss);}})(document,"script","houzzwidget-js");
    }*/

    $(this).html(html);

    function ayo_bufferapp(c, xxx) {
        $.ajax({
            url: 'https://api.bufferapp.com/1/links/shares.json?url=' + c,
            crossDomain: true,
            dataType: 'jsonp',
            success: function(a) {
                var b = ayo_num(a.shares);
                $(xxx + ' .ayo_count_bf').html(b)
            },
            error: function() {
                $(xxx + ' .ayo_count_bf').html(0)
            }
        })
    }

    function ayo_facebook(c, xxx) {
        $.ajax({
            url: 'https://api.facebook.com/method/links.getStats?urls=' + c + '&format=json',
            crossDomain: true,
            dataType: 'jsonp',
            success: function(a) {
                var b = ayo_num(a[0].share_count);
                $(xxx + ' .ayo_count_fb').html(b)
            },
            error: function() {
                $(xxx + ' .ayo_count_fb').html(0)
            }
        })
    }

    function ayo_linkedin(c, xxx) {
        $.ajax({
            url: 'https://www.linkedin.com/countserv/count/share?url=' + c + '&callback=?',
            crossDomain: true,
            dataType: 'json',
            success: function(a) {
                var b = ayo_num(a.count);
                $(xxx + ' .ayo_count_in').html(b)
            },
            error: function() {
                $(xxx + ' .ayo_count_in').html(0)
            }
        })
    }

    function ayo_pinterest(c, xxx) {
        $.ajax({
            url: 'https://api.pinterest.com/v1/urls/count.json?url=' + c + '&callback=?',
            crossDomain: true,
            dataType: 'json',
            success: function(a) {
                var b = ayo_num(a.count);
                $(xxx + ' .ayo_count_pn').html(b)
            },
            error: function() {
                $(xxx + ' .ayo_count_pn').html(0)
            }
        })
    }

    function ayo_vk(f, xxx) {
        $.ajax({
            type: "GET",
            dataType: "xml",
            url: "https://query.yahooapis.com/v1/public/yql",
            data: {
                q: "SELECT content FROM data.headers WHERE url=\"https://vk.com/share.php?act=count&index=1&url=" + f + "\" and ua=\"#Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36\"",
                format: "xml",
                env: "https://datatables.org/alltables.env"
            },
            success: function(a) {
                var b = $(a).find("content").text();
                var c = b.split(",");
                var d = c[1].split(")");
                var e = ayo_num(d[0]);
                $(xxx + ' .ayo_count_vk').html(e)
            },
            error: function() {
                $(xxx + ' .ayo_count_vk').html(0)
            }
        })
    }

    function ayo_reddit(d, xxx) {
        $.ajax({
            url: 'https://www.reddit.com/api/info.json?url=' + d,
            crossDomain: true,
            dataType: 'json',
            success: function(a) {
                var b = (a.data.children != null) ? a.data.children.length : 0;
				var c = (b == 25) ? 25 + '+' : b;
                $(xxx + ' .ayo_count_rd').html(c)
            },
            error: function() {
                $(xxx + ' .ayo_count_rd').html(0)
            }
        })
    }

    function ayo_google(e, xxx) {
        $.ajax({
            type: "GET",
            dataType: "xml",
            url: "https://query.yahooapis.com/v1/public/yql",
            data: {
                q: "SELECT content FROM data.headers WHERE url=\"https://plusone.google.com/_/+1/fastbutton?url=" + e + "\" and ua=\"#Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36\"",
                format: "xml",
                env: "https://datatables.org/alltables.env"
            },
            success: function(a) {
                var b = $(a).find("content").text();
                var c = b.match(/window\.__SSR[\s*]=[\s*]{c:[\s*](\d+)/i);
                var d = (c !== null) ? ayo_num(c[1]) : 0;
                $(xxx + ' .ayo_count_gp').html(d)
            },
            error: function() {
                $(xxx + ' .ayo_count_gp').html(0)
            }
        })
    }

    function ayo_stumbleupon(e, xxx) {
        $.ajax({
            type: "GET",
            dataType: "xml",
            url: "https://query.yahooapis.com/v1/public/yql",
            data: {
                q: "SELECT content FROM data.headers WHERE url=\"https://www.stumbleupon.com/services/1.01/badge.getinfo?url=" + e + "\" and ua=\"#Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36\"",
                format: "xml",
                env: "https://datatables.org/alltables.env"
            },
            success: function(a) {
                var b = $(a).find("content").text();
                var c = b.match(/views\":([0-9]+),/i);
                var d = (c !== null) ? ayo_num(c[1]) : 0;
                $(xxx + ' .ayo_count_up').html(d)
            },
            error: function() {
                $(xxx + ' .ayo_count_up').html(0)
            }
        })
    }

    function ayo_pocket(e, xxx) {
        $.ajax({
            type: "GET",
            dataType: "xml",
            url: "https://query.yahooapis.com/v1/public/yql",
            data: {
                q: "SELECT content FROM data.headers WHERE url=\"https://widgets.getpocket.com/v1/button?label=pocket&count=horizontal&v=1&url=" + e + "\" and ua=\"#Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36\"",
                format: "xml",
                env: "https://datatables.org/alltables.env"
            },
            success: function(a) {
                var b = $(a).find("content").text();
                var c = b.match(/<em\sid=\"cnt\">([0-9]+)<\/em>/i);
                var d = (c !== null) ? ayo_num(c[1]) : 0;
                $(xxx + ' .ayo_count_pc').html(d)
            },
            error: function() {
                $(xxx + ' .ayo_count_pc').html(0)
            }
        })
    }

	function ayo_twitter(d, xxx) {
		$.ajax({
			url: 'https://cdn.api.twitter.com/1/urls/count.json?url=' + d,
			crossDomain: true,
			dataType: 'jsonp',
            success: function(a) {
                var b = ayo_num(a.count);
                $(xxx + ' .ayo_count_tw').html(b)
            },
            error: function() {
                $(xxx + ' .ayo_count_tw').html(0)
            }
        })
	}
    
    function ayo_num(a) {
        var b = parseInt(a, 10);
        if (b === null) {
            return 0
        }
        if (b >= 1000000000) {
            return (b / 1000000000).toFixed(1).replace(/\.0$/, "") + "G"
        }
        if (b >= 1000000) {
            return (b / 1000000).toFixed(1).replace(/\.0$/, "") + "M"
        }
        if (b >= 1000) { 
            return (b / 1000).toFixed(1).replace(/\.0$/, "") + "K"
        }
        return b
    }
  
};

$(function() {
        $("#share").ayoshare(
            url = location.href, // Dynamic url 
            google = false, // true or false
            stumbleupon = false,
            facebook = true,
            linkedin = false,
            pinterest = true,
            bufferapp = false,
            reddit = false,
            vk = false,
            pocket = false,
            twitter = true
        ); 
    });

function cerrarBoton() {
    $('#layered_block_left').slideToggle();
    $("html, body").animate({scrollTop:275+"px"});
}


$(document).ready(function(){
    //border triangle
    var heightResultList = $('.ax-text-result-list').outerHeight();
    $('.ax-text-result-list').prepend("<span class='before-line'></span>");
    $('.ax-text-result-list').append("<span class='after-line'></span>");
    
    $('.before-line, .after-line').css({ 'border-top-width':heightResultList/2, 'border-bottom-width':heightResultList/2 });
    
})