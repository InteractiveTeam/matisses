/**
*  @author    Amazzing
*  @copyright Amazzing
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)*  
*/

$(document).ready(function(){	
	// activating hooks in editable areas
	for (c = 1; c <= 3; c++){
		var orig_value = '{hook h=\'testimonials'+c+'\'}';
		var new_value = '<div class="dynamic_testimonials" data-hook="testimonials'+c+'"></div>';
		replaceTextInDom(orig_value, new_value);
	}

	$('.dynamic_testimonials').each(function(){
		var $el = $(this);
		var hook = $el.data('hook');		
		$.ajax({
			type: 'POST',
			url: twa_ajax_path,
			dataType : 'json',
			data: {
				hook: hook,
				ajaxAction: 'loadDynamicTestimonials'
			},
			success: function(r)
			{
				// console.dir(r);
				$el.html(r.html);				
				prepareCarousels();	
				normalizeColumns(true);											
			},
			error: function(r)
			{
				console.warn(r);				
			}
		});
	});
	
	prepareCarousels();
	normalizeColumns(true);	
	
	$(document).on('click', '.twa_posts .expand', function(){
		
		var parent = $(this).closest('.post');
		var origHeight = parent.find('.content_wrapper').outerHeight();
		parent.toggleClass('expanded');
		var newHeight = parent.find('.content_wrapper').outerHeight();
		var topPos = parent.offset().top;
		var expanded  = parent.hasClass('expanded');
		
		//normalize columns in same row
		parent.nextAll().each(function(){
			if ($(this).offset().top != topPos)
				return false;			
			if (expanded)
				$(this).find('.content_wrapper').css('margin-bottom', (newHeight-origHeight)+'px');
			else
				$(this).find('.content_wrapper').css('margin-bottom', '0');			
		});
		parent.prevAll().each(function(){
			if ($(this).offset().top != topPos)
				return false;			
			if (expanded)
				$(this).find('.content_wrapper').css('margin-bottom', (newHeight-origHeight)+'px');
			else
				$(this).find('.content_wrapper').css('margin-bottom', '0');
			
		});
	})
});

function normalizeColumns(keepAdjusted){
	
	if (!keepAdjusted)
		$('.post.adjusted').removeClass('adjusted');
	
	var $elements = $('.twa_posts.grid, .twa_posts.list').find('.content_wrapper').not('.adjusted');
	var colsNum = 0;
	var currentCol = 0;
	var rowHeights = [];
	
	$elements.each(function(){
		if (!colsNum)
			colsNum = Math.floor($(this).closest('.twa_posts').outerWidth() / $(this).outerWidth());
		var $post_content = $(this).find('.post_content');
		if ($post_content.prop('scrollHeight') != $post_content.prop('offsetHeight'))
			$(this).closest('.post').addClass('expandable');
		
		if (currentCol == 0)
			$(this).closest('.post').prevAll().addClass('adjusted');
		
		rowHeights.push($(this).outerHeight());
		currentCol++;
		
		if (currentCol == colsNum || $(this).closest('.post').next().length < 1){			
			var h = Math.max.apply(Math, rowHeights);
			var newCSS = {'min-height': h+'px'}; 
			$(this).css(newCSS).closest('.post').prevAll().not('.adjusted').find('.content_wrapper').css(newCSS);
			rowHeights = [];
			currentCol = 0; 
			if ($(this).closest('.post').next().length < 1)
				colsNum = 0;
		}
	});
}

function prepareCarousels(){
	$('.twa_container .carousel').not('.owl-carousel').each(function(){		
		var container_is_narrow = false;			
			if ($(this).closest('.twa_container').innerWidth() < 700)
				container_is_narrow = true;
		$(this).owlCarousel({
			slideSpeed : 300,
			paginationSpeed : 400,
			items : 2,
			itemsDesktop : [1199,2],
			itemsDesktopSmall : [980,2],
			itemsTablet: [768,1],			
			itemsMobile: [479,1],
			/*singleItem: container_is_narrow ? true : false, - default string*/
			singleItem: true, /*Saerty add a custom string*/
			navigation:true, /*Saerty add a custom string*/
			pagination:false, /*Saerty add a custom string*/
			navigationText:['<i class="font-left-open-big"></i>','<i class="font-right-open-big"></i>'], /*Saerty add a custom string*/
		});
		
		// normalize heights in carousel
		var carouselHeights = [];
		$(this).find('.post_content').each(function(){			
			if ($(this).prop('scrollHeight') != $(this).prop('offsetHeight'))
				$(this).closest('.post').addClass('expandable');
			carouselHeights.push($(this).outerHeight());			
			if ($(this).closest('.owl-item').next().length < 1){
				var h = Math.max.apply(Math,carouselHeights);								
				$(this).css('height', h+'px').closest('.owl-item').prevAll().find('.post_content').css('height', h+'px');
				carouselHeights = [];
			}
		});		
	});
}

function replaceTextInDom(original_value, new_value){
	var reg_exp =  new RegExp(original_value, 'g');
	$('div:contains('+original_value+')').each(function(){	
		if ($(this).clone().children('div').remove().end().text().indexOf(original_value) >= 0)	
			$(this).html($(this).html().replace(reg_exp, new_value));
	});
}
