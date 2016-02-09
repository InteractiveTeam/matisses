// JavaScript Document
$(document).ready(function(e) {
	

	
    $('.experiences-list').bxSlider({
	  minSlides: 1,
	  maxSlides: 3,
	  slideWidth: 390,
	  slideMargin: 10,
	  pager: false,
	  infiniteLoop: false,
	  onSliderLoad: function(){
    		$('.experiences-list li').eq(0).addClass('slide-active');
			$('.bx-prev').click(function(e) {
				$('#directionslider').val('prev');
			});	
			
			$('.bx-next').click(function(e) {
				$('#directionslider').val('next');
			});	
  		},
  	  onSlideAfter: function(){
		var total   = $('.experiences-list li').size(); 
		var cactive = $('.experiences-list li.slide-active') .index();
		if($('#directionslider').val()=='next')
		{
			if($('.experiences-list li').eq((cactive+2)))
			{
				$('.experiences-list li').removeClass('slide-active');
				$('.experiences-list li').eq((cactive+2)).addClass('slide-active');
			}
		}
		
		if($('#directionslider').val()=='prev')
		{
			if($('.experiences-list li').eq((cactive-2)))
			{
				$('.experiences-list li').removeClass('slide-active');
				$('.experiences-list li').eq((cactive-2)).addClass('slide-active');
			}
		}
  	  }
	});

	$(".module-matisses-experiences .pointer").hover(function(){
		classes = $(this).attr("class");
		$("div.pointer-detail",this).prepend("<div class='pointerAdded'></div>");
		$(".pointerAdded").addClass(classes);
	},
	function(){
		 $(".pointerAdded").remove();
	});

});