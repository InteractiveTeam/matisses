// JavaScript Document
$(document).ready(function(e) {
   var slider = $('.viewedslider').bxSlider({
					pager: false,
					controls: true,
					nextSelector: '#slider-prev',
				  	prevSelector: '#slider-next',
				  	nextText: '→',
				  	prevText: '←'
					
				});
				
	$('#reload-slider').click(function(e){
	  e.preventDefault();
	  slider.reloadSlider();
	});	
		
});