/**
*  @author    Amazzing
*  @copyright Amazzing
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)*
*/

$(document).ready(function(){	
	
	// .easycarousels wrapper with ajaxpath is generated in easycarousels.php->displayNativeHook
	$('.easycarousels').each(function(){
		var el = $(this);
		$.ajax({
			type: 'POST',			
			url: $(this).attr('data-ajaxpath'),
			dataType : 'json',		
			success: function(r)
			{	
				// console.dir(r);
				el.replaceWith(utf8_decode(r.carousels_html));				
				
				$('.easycarousel').not('.owl-carousel').each(function(){
					
					if ($(this).closest('.column').hasClass('accordion')){
						try {
							accordion('disable');
							accordion('enable');
						}
						catch(e){};
					}
					
					var container_is_narrow = false;			
					if ($(this).closest('.easycarousels').innerWidth() < 300)
						container_is_narrow = true;
					var settings = $(this).data('settings');					
					$(this).owlCarousel({
						items : settings.i,
						pagination : settings.p == 1 ? true : false, 
						navigation : settings.n == 1 ? true : false, 
						autoPlay: settings.a == 1 ? true : false,
						stopOnHover: true,
						slideSpeed : 300,
						paginationSpeed : 400,
						itemsDesktop : [1199, container_is_narrow ? 1 : 4],
						itemsDesktopSmall : [979, container_is_narrow ? 1 : 3],
						itemsTablet: [768, container_is_narrow ? 1 : 2],			
						itemsMobile : [579, container_is_narrow ? 1 : 1],
						navigationText:['<i class="font-left-open-big"></i>','<i class="font-right-open-big"></i>'],
						/** 
						* LazyLoad doesnt work with multiple rows, it loads only images from 1st row
						* so if we want to use it, we need to add some additional code do load all images
						* something like below:
						***
						afterMove: function(elem){									
							// var items = this.$owlItems;
							for (i = this.currentItem; i < this.currentItem + this.options.items; i++) {
								$('#'+elem.attr('id')+' .carousel_col:eq('+i+') img').each(function(){
									$(this).attr('src', $(this).attr('data-src'));
								})								
							}							
						},
						*/
					});
				})				
			},
			error: function(r)
			{
				console.warn(r.responseText);		
			}
		});
	});
	
});

// responsive selector for tabs
$(document).on('click', function(e) {
	var $clicked = $(e.target);
	if ($clicked.parents().hasClass('easycarousel_tabs'))
		return;
	$('.easycarousel_tabs').addClass('closed');
});

$(document).on('click', '.responsive_tabs_selection', function(){		
	var closed = $(this).parent().hasClass('closed');
	$('.easycarousel_tabs').addClass('closed');	
	if (closed)
		$(this).closest('.easycarousel_tabs').removeClass('closed');
});

$(document).on('click', '.easycarousel_tabs li.carousel_title', function(){		
	var text = $(this).text();		
	$(this).closest('ul').addClass('closed').find('.responsive_tabs_selection span').html(text);
});



function utf8_decode (utfstr) {
	var res = '';
	for (var i = 0; i < utfstr.length;) {
		var c = utfstr.charCodeAt(i);

		if (c < 128)
		{
			res += String.fromCharCode(c);
			i++;
		}
		else if((c > 191) && (c < 224))
		{
			var c1 = utfstr.charCodeAt(i+1);
			res += String.fromCharCode(((c & 31) << 6) | (c1 & 63));
			i += 2;
		}
		else
		{
			var c1 = utfstr.charCodeAt(i+1);
			var c2 = utfstr.charCodeAt(i+2);
			res += String.fromCharCode(((c & 15) << 12) | ((c1 & 63) << 6) | (c2 & 63));
			i += 3;
		}
	}
	return res;
}