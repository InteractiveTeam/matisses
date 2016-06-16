$(document).ready(function(e) {
	setTimeout(function(){
			window.location.hash = '';
		},1500)
	$('.product-360').on('click',function(e){
		e.preventDefault();
		url = $(this).attr('data-url');
		if(url)
			//$.fancybox('<iframe width="650" allowfullscreen height="500" src="'+window.location.origin+url+'"></iframe>');
            $.fancybox({
                href:window.location.origin+url,
                type: 'iframe',
                maxWidth:650,
                width:650,
                height:500
            });
	})
	
	$('.product-wow').on('click',function(e){
		e.preventDefault();
		url = $(this).attr('data-url');
		if(url)
			$.fancybox('<iframe scrolling="no" width="640" height="426" src="'+url+'"></iframe>');
	})
	
	
	$('.product-scheme').on('click',function(e){
		e.preventDefault();
		url = $(this).attr('data-url');
		if(url)
			$.fancybox('<img src="'+window.location.origin+url+'">');
	})
	
	
	
    $( "#tabs" ).tabs();
	$('.open-comment-form').fancybox({
		'autoSize' : false,
		'width' : 600,
		'height' : 'auto',
		'hideOnContentClick': false
	});
	
	

	$('input.star').rating();
	$('.auto-submit-star').rating();

	if (!!$.prototype.fancybox)
		$('.open-comment-form').fancybox({
			'autoSize' : false,
			'width' : 600,
			'height' : 'auto',
			'hideOnContentClick': false
		});

	$(document).on('click', '#id_new_comment_form .closefb', function(e){
		e.preventDefault();
		$.fancybox.close();
	});

	$(document).on('click', 'a[href=#idTab5]', function(e){
		$('*[id^="idTab"]').addClass('block_hidden_only_for_screen');
		$('div#idTab5').removeClass('block_hidden_only_for_screen');

		$('ul#more_info_tabs a[href^="#idTab"]').removeClass('selected');
		$('a[href="#idTab5"]').addClass('selected');
	});

	$(document).on('click', 'button.usefulness_btn', function(e){
		var id_product_comment = $(this).data('id-product-comment');
		var is_usefull = $(this).data('is-usefull');
		var parent = $(this).parent();

		$.ajax({
			url: productcomments_controller_url + '?rand=' + new Date().getTime(),
			data: {
				id_product_comment: id_product_comment,
				action: 'comment_is_usefull',
				value: is_usefull
			},
			type: 'POST',
			headers: { "cache-control": "no-cache" },
			success: function(result){
				parent.fadeOut('slow', function() {
					parent.remove();
				});
			}
		});
	});

	$(document).on('click', 'span.report_btn', function(e){
		if (confirm(confirm_report_message))
		{
			var idProductComment = $(this).data('id-product-comment');
			var parent = $(this).parent();

			$.ajax({
				url: productcomments_controller_url + '?rand=' + new Date().getTime(),
				data: {
					id_product_comment: idProductComment,
					action: 'report_abuse'
				},
				type: 'POST',
				headers: { "cache-control": "no-cache" },
				success: function(result){
					parent.fadeOut('slow', function() {
						parent.remove();
					});
				}
			});
		}
	});	
});