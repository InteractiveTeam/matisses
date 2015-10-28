/**
*  @author    Amazzing
*  @copyright Amazzing
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)*
*/

var ajax_action_path;

$(document).ready(function() {

	ajax_action_path = window.location.href.replace('#', '')+'&ajax=1';
	activateSortable();
	
	$(document).on('change', '.hookSelector', function(){
		var hook_name = $(this).val();
		$('.hook_content#'+hook_name).addClass('active').siblings().removeClass('active');
		$('#settings_content').hide().html('');
		$('.callSettings').removeClass('active');
	});
	
	$('.hookSelector').change();	
	
	$(document).on('click', '.callSettings', function(e){
		e.preventDefault();
		$el = $(this);
		
		if ($el.hasClass('active'))
		{			
			$('#settings_content').slideUp(function(){
				$(this).html('');
				$('.callSettings').removeClass('active');
			});
			return;
		}
		
		$('#settings_content').hide().html('');
		$('.callSettings').removeClass('active');
		var settings_type = $(this).data('settings');
		var hook_name = $(this).closest('form').find('.hookSelector').val();
		$.ajax({
			type: 'POST',
			url: ajax_action_path+'&action=CallSettingsForm&settings_type='+settings_type+'&hook_name='+hook_name,
			dataType : 'json',
			success: function(r)
			{
				console.dir(r);
				
				$('#settings_content').html(utf8_decode(r.form_html)).slideDown();
				 $('body').tooltip({
					selector: '.label-tooltip'
				});				
				$el.addClass('active');
				
			},
			error: function(r)
			{
				$('#settings_content').hide().html('');
				$('.callSettings').removeClass('active');
				console.warn(r.responseText);
			}
		});		
	});
	
	$(document).on('click', '.chk-action', function(e){
		e.preventDefault();		
		var $checkboxes = $(this).closest('#settings_content').find('input[type="checkbox"]');		
		if ($(this).hasClass('checkall')){
			$checkboxes.each(function(){
				$(this).prop('checked', true);
			});
		} 
		else if ($(this).hasClass('uncheckall')){
			$checkboxes.each(function(){
				$(this).prop('checked', false);
			});
		}
		else if ($(this).hasClass('invert')){
			$checkboxes.each(function(){
				$(this).prop('checked', !$(this).prop('checked'));
			});
		}		
	});	

	$(document).on('click', '.saveHookSettings', function(e){
		e.preventDefault();
		var hook_name = $(this).attr('data-hook');
		var data = $(this).closest('form').serialize();
		$.ajax({
			type: 'POST',
			url: ajax_action_path+'&action=SaveHookSettings&'+data,
			dataType : 'json',
			success: function(r)
			{
				console.dir(r);
				if (r.saved){
					$('#settings_content').slideUp(function(){
						$('.callSettings').removeClass('active');
						$(this).html('');
						$.growl.notice({ title: '', message: r.saved});
					});
				}
			},
			error: function(r)
			{
				console.warn(r.responseText);
			}
		});
	});

	$(document).on('click', '.addCarousel', function(){
		scrollUpAllCarousels();
		var $carousel_list = $(this).closest('.hook_content').find('.carousel_list');
		var hook_name = $(this).closest('.hook_content').attr('id');
		$.ajax({
			type: 'POST',
			url: ajax_action_path+'&action=CallCarouselForm&id_carousel=0&hook_name='+hook_name,
			dataType : 'json',
			success: function(r)
			{
				// console.dir(r);
				$newItem = $(utf8_decode(r));
				$newItem.appendTo($carousel_list).addClass('open').find('form').slideDown().find('#carousel_type').change();
				$('body').tooltip({
					selector: '.label-tooltip'
				});
			},
			error: function(r)
			{
				console.warn(r.responseText);
			}
		});
	});

	$(document).on('click', '.editCarousel', function(){
		scrollUpAllCarousels();
		var $item = $(this).closest('.carousel_item');
		id = $item.attr('data-id');
		var hook_name = $(this).closest('.hook_content').attr('id');
		$.ajax({
			type: 'POST',
			url: ajax_action_path+'&action=CallCarouselForm&id_carousel='+id+'&hook_name='+hook_name,
			dataType : 'json',
			success: function(r)
			{
				// console.dir(r);
				var newItemHTML = $(utf8_decode(r)).html();
				$item.html(newItemHTML).addClass('open').find('form').slideDown().find('#carousel_type').change();
				$('body').tooltip({
					selector: '.label-tooltip'
				});
			},
			error: function(r)
			{
				console.warn(r.responseText);
			}
		});
	});

	$(document).on('click', '.scrollUp', function(){
		scrollUpAllCarousels();
	});

	$(document).on('click', '.deleteCarousel', function(){
		if (!confirm('Are you sure?'))
			return;
		var $item = $(this).closest('.carousel_item');
		id = $item.attr('data-id');
		$.ajax({
			type: 'POST',
			url: ajax_action_path+'&action=DeleteCarousel&id_carousel='+id,
			dataType : 'json',
			success: function(r)
			{
				if (r.deleted) {
					setTimeout(function(){
						$item.fadeOut(function(){$(this).remove()});
					}, 500);
				}
			},
			error: function(r)
			{
				console.warn(r.responseText);
			}
		});
	});

	$(document).on('change', '#carousel_type', function(){
		if ($(this).val() == 'manufacturers' || $(this).val() == 'suppliers') {
			$('.product_option').hide();
			$('#image_type option').addClass('hidden').siblings('.'+$(this).val()).removeClass('hidden');
			var val = $('#image_type option.saved').not('.hidden').first().val();
			if (!val)
				val = $('#image_type option').not('.hidden').first().val();
			$('#image_type').val(val).change();

		}
		else {
			$('.product_option').show();
			$('#image_type option').addClass('hidden').siblings('.products').removeClass('hidden');
			var val = $('#image_type option.saved').not('.hidden').val();
			if (!val)
				val = $('#image_type option').not('.hidden').first().val();
			$('#image_type').val(val).change();
		}

		// special options for some carousel types
		$('.special_option').hide();
		$('.special_option.'+$(this).val()).show();

		// update name field if it is not saved yet
		var carousel_name = $.trim($(this).find('option:selected').text());
		$('input[data-saved="false"]').val(carousel_name);
	});

	$(document).on('click', '#saveCarousel', function(e){
		e.preventDefault();
		var $item = $(this).closest('.carousel_item');
		$item.find('.ajax_errors').slideUp().html('');
		$.ajax({
			type: 'POST',
			url: ajax_action_path+'&action=saveCarousel',
			data: {
				id_carousel: $item.attr('data-id'),
				hook_name: $item.closest('.hook_content').attr('id'),
				carousel_data: $item.find('form').serialize(),
			},
			dataType : 'json',
			success: function(r)
			{
				// console.dir(r);
				if (r.errors.length > 0){
					for (var e in r.errors)
						$item.find('.ajax_errors').append('<div>'+r.errors[e]+'</div>');
					$item.find('.ajax_errors').slideDown();
					return;
				}
				else{
					$.growl.notice({ title: '', message: r.responseText});
					$item.find('form').slideUp(function(){
						$item.replaceWith(utf8_decode(r.updated_form_header));
					});
				}
			},
			error: function(r)
			{
				$item.find('.ajax_errors').slideDown().append('<div>'+r.responseText+'</div>');
			}
		});
	});

	$(document).on('click', '.activateCarousel', function(e){
		e.preventDefault();
		var id_carousel = $(this).closest('.carousel_item').attr('data-id');
		var active = $(this).hasClass('action-enabled') ? 0 : 1;
		var button = $(this);
		$.ajax({
			type: 'POST',
			url: ajax_action_path+'&action=ToggleActiveStatus',
			dataType : 'json',
			data: {
				id_carousel: id_carousel,
				active: active,
			},
			success: function(r)
			{
				if(r.success)
					button.toggleClass('action-enabled action-disabled');
			},
			error: function(r)
			{
				console.warn(r.responseText);
			}
		});

	});

	$('#load_owl').on('change', function(){
		var load_owl = $(this).prop('checked') ? 1 : 0;
		$.ajax({
			type: 'POST',
			url: ajax_action_path+'&action=SetLoadOwl&load_owl='+load_owl,
			dataType : 'json',
			success: function(r)
			{
				if (r.responseText)
					$.growl.notice({ title: '', message: r.responseText});
			},
			error: function(r)
			{
				console.warn(r.responseText);
			}
		});
	});

	$(document).on('click', '.lang_switcher', function(){
		var id_lang = $(this).attr('data-id-lang');
		$('.multilang').hide();
		$('.multilang.lang_'+id_lang).show();
	});
	
	$(document).on('click', '.importer .import', function(){
		$('input[name="carousels_data_file"]').click();		
	});

	$(document).on('change', 'input[name="carousels_data_file"]', function(){
		if (!this.files || this.files[0].type != 'text/plain')		
			return;		
		$('.importer .import i').toggleClass('icon-cloud-upload icon-refresh icon-spin');
		var data = new FormData();
		data.append($(this).attr('name'), $(this).prop('files')[0]);		
		$.ajax({
			type: 'POST',		
			url: ajax_action_path+'&action=ImportCarousels',
			dataType : 'json',
			processData: false,
			contentType: false,
			data: data,
			success: function(r)
			{
				console.dir(r);
				$('.panel.general_settings').before(utf8_decode(r.import_status_html));
				if (r.updated_html){
					$upd = $(utf8_decode('<div>'+r.updated_html+'</div>'));					
					$('.panel.carousels').replaceWith($upd.find('.panel.carousels'));
					$('.panel.carousels').find('.hookSelector').change();					
					activateSortable();
				}
				$('.importer .import i').toggleClass('icon-cloud-upload icon-refresh icon-spin');
					
			},
			error: function(r)
			{
				console.warn(r.responseText);			
				$('.importer .import i').toggleClass('icon-cloud-upload icon-refresh icon-spin');
			}
		});
    });

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
});

function scrollUpAllCarousels(){
	$('.carousel_item').removeClass('open').find('form').slideUp(function(){$(this).html('')});
}

function activateSortable(){
	$('.carousel_list').sortable({
		placeholder: 'new_position_placeholder',
		handle: '.dragger',
		update: function(event, ui) {
			var ordered_ids = [];
			ui.item.closest('.carousel_list').find('.carousel_item').each(function(){
				ordered_ids.push($(this).attr('data-id'));
			});
			$.ajax({
				type: 'POST',				
				url: ajax_action_path+'&action=UpdatePositionsInHook',
				dataType : 'json',
				data: {
					ordered_ids: ordered_ids,
				},
				success: function(r)
				{
					if('successText' in r)
						$.growl.notice({ title: '', message: r.successText});
				},
				error: function(r)
				{
					$.growl.notice({ title: '', message: r.responseText});
				}
			});
		}
	});
}

function utf8_decode(utfstr) {
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