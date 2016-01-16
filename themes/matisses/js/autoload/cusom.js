$(document).ready(function(){
	setTimeout(function(){
		fullWidthVideo();
	},100);
	//drop nav link
	$("#drop_links").click(function(){
		if($(".header_user_info").hasClass("opened")) {
			$(".dropdown_links").slideUp();
			$(this).parent().removeClass("opened");
			return false;
			}
		else{
		$(this).parent().addClass("opened");
		$(".dropdown_links").slideDown();
		return false;
		}
	});
	$(document).on('click',function(e){
		 if ($(e.target).closest('.header_user_info').length) return;
 		$('.dropdown_links').slideUp();
 		$(".dropdown_links").removeClass("opened");
 		e.stopPropagation();
	});
	/*smooth scrool page*/
	var body = document.body,
		timer;
 		goToPage();
	window.addEventListener('scroll', function() {
	  clearTimeout(timer);
	  if(!body.classList.contains('disable-hover')) {
		body.classList.add('disable-hover')
	  }

	  timer = setTimeout(function(){
		body.classList.remove('disable-hover')
	  },500);
	}, false);
	/*map fix*/
	$('.maps_content').click(function () {
		$('.maps_content iframe').css("pointer-events", "auto");
	});
		/*smooth scroll*/
		$('.tp-caption.scroll_down').bind('click.smoothscroll',function (e) {
		e.preventDefault();
		var target = this.hash;
		$target = $('#center_column');
		$('html, body').stop().animate({
			'scrollTop': $target.offset().top
		}, 1000, 'swing', function () {

		});
	});

	var videoPlay = document.getElementById('video-promo-wrap');
	if (videoPlay !== null){
		var posterVideo = $('#video-in').attr('poster');
		if (posterVideo !== undefined){
			$('#video-promo-wrap .poster-video').css('background-image', 'url(' + posterVideo + ')');
		}
		videoPlay.onclick = playPause;
	}
	/*
	$('.breadcrumb .navigation-pipe').html('/'); 
*/
	$('body:not(#order-opc)').find('select:not(#id_state,.layered_select,.none-chosen)').chosen();

	$('#product_comments_block_extra .comments_note').prependTo($('.rate_wrap'));

	setTimeout(function(){
		$('#index .tp-leftarrow.tparrows').prepend('<i class="font-left-open-big"></i>');
		$('#index .tp-rightarrow.tparrows').prepend('<i class="font-right-open-big"></i>');
	},3000);

	$('#product_comments_block_extra').appendTo($('.wrap_buttons').children('.row'));
	$('#bxslider,#bxslider1').owlCarousel({
		items:4,
		itemsDesktop:[1199,3],
		itemsDesktopSmall:[979,3],
		itemsTablet:[768,2],
		itemsMobile:[579,1],
		pagination:false,
		navigation:true,
		slideSpeed:800,
		navigationText:['<i class="font-left-open-big"></i>','<i class="font-right-open-big"></i>'],
		addClassActive:true
	});


	$('#new-products_block_right .products,#best-sellers_block_right .products,.twitter_carousel').bxSlider({
	  minSlides: 1,
	  maxSlides: 4,
	  slideWidth: 390,
	  slideMargin: 10,
	  infiniteLoop: false,
	  hideControlOnEnd: true,
	  controls: false,
	});

/*
	$('#new-products_block_right .products,#best-sellers_block_right .products,.twitter_carousel').owlCarousel({
		singleItem:true,
		pagination:false,
		navigation:true,
		slideSpeed:1200,
		navigationText:['<i class="font-left-open-big"></i>','<i class="font-right-open-big"></i>'],
		mouseDrag:false,
		touchDrag:false
	});

	*/

		$('.twits_cont .owl-prev,.twits_cont .owl-next').click(function(){
			addClassOnSlide();
		});
	/*responsive thumbs list on product page*/
		responsiveWidthThumbs();
		$(window).resize(function(){
  			responsiveWidthThumbs();
  			fullWidthVideo();
		});
		function responsiveWidthThumbs(){
			var widthElemThumb = 0;
			var widthThumbList =  $('#thumbs_list').outerWidth();
			if (($(window).width() + scrollWidth())>991){
				widthElemThumb = widthThumbList/3;
			}else if(($(window).width() + scrollWidth())>768){
				widthElemThumb = widthThumbList/4;
			}else if(($(window).width() + scrollWidth())>540){
				widthElemThumb = widthThumbList/4;
			}else{
				widthElemThumb = widthThumbList/3;
			}
			$('#thumbs_list li').css('width',widthElemThumb+'px');
		}

	/*Scroll to top*/
		$('#back-top').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 2000);
			return false;
		});

		/*smooth scroll*/
		$('.tp-caption.scroll_down a').bind('click.smoothscroll',function (e) {
		e.preventDefault();
		var target = this.hash;
			$target = $(target);
		$('html, body').stop().animate({
			'scrollTop': $target.offset().top
		}, 1000, 'swing', function () {

		});
	});

	/*width of a scroll bar*/
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

			$(window).resize(function(){
 				addDropDown();
			});

			function addDropDown(){
				if(scrollWidth() + $(window).width()<992){
						$('#drop_content_user').css('display','block').addClass('dropdown_links');
				}else{
						$('#drop_content_user').css('display','block').removeClass('dropdown_links');
				}
			}

			setTimeout(function(){
				addDropDown();
			},500);
	/*Fixed menu on scroll*/

	 var isTouch = function() {
					return $(window).width() < 0 ? true : false;
			};
			//  ==========
			//  = Scroll inspector =
			//  ==========
			var stickyNavbar = function() {
					if (isTouch()) {
							$(window).off("scroll.onlyDesktop");
					} else {
							if(($(window).width() +  scrollWidth()) < 768){
								$('#header').removeClass('fixedHeader').css('margin-top','0');
							}
							$navbarTop = $("#topMain").outerHeight();

							$(window).on("scroll.onlyDesktop", function() {
									var scrollX = $(window).scrollTop();
									if (scrollX > $navbarTop && ($(window).width() +  scrollWidth()) >767) {
											$("#header").addClass('fixedHeader').css('margin-top', '0');
											$('.local-block .current').each(
												function(){
													if($(this).hasClass('active')){
														$(this).click();
													}
												});
											$('.header_user_info').each(
												function(){
													if($(this).hasClass('opened')){
														$(this).children('#drop_links').click();
													}
												});
									} else {
											$("#header").removeClass('fixedHeader').css('margin-top','0');
									}
							});
					}
			};
			//  ==========
			//  = Functions which has to be reinitiated when the window size is changed =
			//  ==========
			var triggeredOnResize = function() {
					// sticky navbar
					stickyNavbar();
			};
			stickyNavbar();
			var fromLastResize;
			// counter in miliseconds
			$(window).resize(function() {
					clearTimeout(fromLastResize);
					fromLastResize = setTimeout(function() {
							triggeredOnResize();
					}, 250);
			});

			//  ==========
			//  = Last but not the least - trigger the page scroll and resize =
			//  ==========
			$(window).trigger("scroll").trigger("resize");
});

/*shaking bird of twitter */
	function addClassOnSlide(){
		$('.twitter_bird').addClass('shake animated');
		setTimeout(function(){
			$('.twitter_bird').removeClass('shake animated');
		},1200);
	}

/*video*/
function playPause(){
	var videoPromo = document.getElementById('video-in');
	var videoJquery = $('#video-in');
	if(videoPromo.paused){
		videoPromo.play();
		console.log('play');
		videoJquery.parent().addClass('play').removeClass('pause');
	}
	else{
		videoPromo.pause();
		console.log('pause');
		videoJquery.parent().removeClass('play').addClass('pause');
		}
}
function goToPage()
{

	$('.share_product a').each(function (){
		var url = $(this).attr('data-target');
		$(this).click(function () {
		window.open(url,'_blank');
		})

	});
}

function fullWidthVideo(){
	var curVideo = $('#video-in');
	var widthVideo = $(curVideo).outerWidth();
		curVideo.css('height', widthVideo/1.77777778 + 'px');
}
