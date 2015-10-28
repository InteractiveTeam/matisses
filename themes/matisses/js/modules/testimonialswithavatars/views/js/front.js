/**
*  @author    Amazzing
*  @copyright Amazzing
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)*
*/

$(document).ready(function(){

	// load more
	$('.twa').on('click', '#loadMore', function(e){
		e.preventDefault();
		var currentIds = [];
		$('.twa .twa_posts .post').each(function(){
			currentIds.push($(this).attr('data-idpost'));
		})
		loadMorePosts(currentIds);
	});

	// add new
	$('.twa').on('click', '#addNew', function(){
		//At least one div.post inside $('.twa .twa_posts') is required for proper animation
		if ($('.twa .twa_posts').find('.post').first().length < 1);
			$('.twa .twa_posts').append('<div class="post"></div>');		
		
		if ($('.addForm .allow_html').length > 0){
			tinymce.init({
				// language_url : '/ps16/js/tiny_mce/langs/ru.js',
				selector: '#post_content',
				plugins: 'bbcode paste emoticons',
				toolbar1: 'bold italic underline emoticons',
				menubar: false,
				statusbar: false,
				paste_as_text: true,
				forced_root_block: false,
			});
		}
		
		$(this).hide().siblings('.addForm').show();
	});

	// avatar
	$('.twa').on('click', '.imgholder > div', function(){
		$(this).next().find('input').click();
	});

	$('.twa').on('change', 'input[name="avatar_file"]', function(){
		var el = $(this);
		el.closest('.imgholder').removeClass('alert-danger');
		var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader)
			return;
        if (/^image/.test( files[0].type)){
            var reader = new FileReader();
            reader.readAsDataURL(files[0]);
            reader.onloadend = function(){
				el.closest('.imgholder').removeClass('alert-danger').find('.avatarImg').css('background-image', 'url('+this.result+')').addClass('requires-update');
            }
        }
		else
			el.closest('.imgholder').addClass('alert-danger').find('.avatarImg').removeClass('requires-update');
    });

	//send post
	$('.addForm').on('submit', function(e){
		 e.preventDefault();
		 addPost();
	});

	$('.twa').on('click', '.red-border input, .red-border textarea, .red-border .mce-edit-area', function(){
		$(this).closest('.red-border').removeClass('red-border').find('.field_error').html('').hide();
	});
	
	/* rating */
	$('.stars_holder .rating_star').on('mouseenter', function(){
		$(this).parent().children().removeClass('highlighted');
		$(this).addClass('highlighted').prevAll('.rating_star').addClass('highlighted');
	});
	
	$('.stars_holder .rating_star').on('mouseleave', function(){
		$(this).parent().children().removeClass('highlighted');
	});
	
	$('.stars_holder .rating_star').on('click', function(){
		$(this).parent().children().removeClass('highlighted on');
		$(this).addClass('on').prevAll('.rating_star').addClass('on');		
		$(this).siblings('input').val($(this).attr('data-rating'));
	})

	// ajax progress
	$('body').append('<div id="re-progress"><div class="progress-inner"></div></div>');
	$(document).ajaxStart(function(){
		$('#re-progress .progress-inner').width(0).fadeIn('fast').animate({'width':'70%'},500);
	})
	.ajaxSuccess(function(){
		$('#re-progress .progress-inner').animate({'width':'100%'},500,function(){
			$(this).fadeOut('fast');
		});
	})
})

function loadMorePosts(currentIds){
	$('#loadMore i').show().siblings().hide();	
	$.ajax({
		type: 'POST',
		url: twa_ajax_path,
		dataType : 'json',
		data: {
			ids_to_exclude: currentIds,
			ajaxAction: 'loadMore'
		},
		success: function(r)
		{
			$('#loadMore i').hide().siblings().show();			
			if (r.posts)
				$('.twa .twa_posts').append(utf8_decode(r.posts));
			else
				$('#loadMore').hide();
			// normalizeColumns defined in front_simple.js			
			normalizeColumns(true);
		},
		error: function(r)
		{
			console.warn(r.responseText);			
			$('#loadMore span').show().siblings().hide();
		}
	});
}

function addPost(){	
	$('.addForm .ajax_errors').removeClass('alert alert-danger').html('').hide();
	$('.addForm .field_error').html('').hide();
	$('.red-border').removeClass('red-border');
	var formData = new FormData($('#add_new_post')[0]);
	$.ajax({
		type: 'POST',
		url: twa_ajax_path,
		dataType : 'json',
		data: formData,
		contentType: false,
        processData: false,
		cache: false,
		success: function(r)
		{
			// console.dir(r);			
			$('#submitPost').removeClass('blocked');
			var hasError = false;			
			for (var e in r.errors){
				if ($('.field.'+e).length > 0)
					$('.field.'+e).find('.field_error').show().html(r.errors[e]).parent().addClass('red-border');
				else
					$('.addForm .ajax_errors').show().addClass('alert alert-danger').append('<div>'+r.errors[e]+'</div>');
				hasError = true;				
			}		
			if (hasError)
				return;			
			if (!r.instant_publish){
				$('.addForm').hide();
				$('#thanks_message').show();
			}
			else{
				$('.addForm').hide().find('input, textarea').val('');
				var postsWrapper = $('.twa .twa_posts');
				var newPostInDom = $(utf8_decode(r.new_post));

				var initialStyle = {
					'top' : postsWrapper.outerHeight()+'px',
					'position' : 'absolute',
					'z-index' : '99999',
				}
				var animatePosition = postsWrapper.find('.post').first().position();
				var animateStyle = {
					'top': animatePosition.top+'px',
					'left': animatePosition.left+'px',
				}
				var finalStyle = {
					'left' : '0',
					'top' : '0',
					'position' : 'relative',
				}
				newPostInDom.appendTo(postsWrapper).css(initialStyle).animate(
					animateStyle,
					1000,
					function(){
						newPostInDom.addClass('just_added').css(finalStyle).prependTo(postsWrapper);
						if ($('#loadMore').is(':visible'))
							postsWrapper.find('.post').last().remove();
						// normalizeColumns defined in front_simple.js						
						normalizeColumns(false);
					}
				);
				$('html, body').animate({
					scrollTop: postsWrapper.offset().top - 35
				}, 700);
			}			
		},
		error: function(r)
		{
			console.warn(r.reponseText);			
			$('#submitPost').removeClass('blocked');
		}
	});
}

/**
 * Copy of the php function utf8_decode()
 */
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