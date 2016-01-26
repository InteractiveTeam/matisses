// JavaScript Document
$(document).ready(function(e) {
    $('.experiences-list').bxSlider({
	  minSlides: 1,
	  maxSlides: 3,
	  slideWidth: 390,
	  slideMargin: 10,
	  pager: false,
	  infiniteLoop: false,
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