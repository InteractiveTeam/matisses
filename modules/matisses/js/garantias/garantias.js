// JavaScript Document
$(document).ready(function(e) {
	
	$('#resumen-garantia .slider').bxSlider({
					  pagerCustom: '#resumen-garantia .captions'
				});
	
	$('#step2 .slider').bxSlider({
					  pagerCustom: '#step2 .captions'
				});
	
	
	setTimeout(function(){
			$('#form1').append('<input type="file" name="imagen[]" style="display:none" multiple="" data-placeholder="Cargar imagen">');
		},2000);
	
	$('#tipo-dano li').on('click',function(e){
		e.preventDefault();
		var tipo = $('#tipo').val();
		if(tipo.split(',').length < nrodanos)
		{
			if(tipo)
			{
				var danos = $('#tipo').val()+', '+$(this).attr('data-value');
			}else{
					var danos = $(this).attr('data-value');
				 }
			$('#tipo').val(danos);	
		}else{
				$.fancybox('<div class="error">No puedes seleccionar mas daños</div>')
			 }
	})
	
	$("label[for=imagen]").click(function(){
		$("input[type=file]").trigger('click');
	 });
	
    $('#submitStep1').on('click',function(e){
		$('#error1').slideUp('slow');
		e.preventDefault();
		if($('#accept').prop('checked'))
		{
			$('#step1').submit();
		}else{
				$('#error1').slideDown('slow');
			 }
	})
	
	$('.options #closedetail').live('click',function(e){
		$(parent).css('display','none').parent().find('a#showdetail').css('display','block');
		var Id = $(this).attr('data-id');
		if(Id)
		{
			Id= '#'+Id;
			$(Id).slideUp('slow','linear',function(){
			})
		}
	})
	
	$('.options #showdetail').live('click',function(e){
		e.preventDefault();
		$(' * .details').slideUp('slow');
		$(' * #showdetail').show();
		$(' * #closedetail').hide();
		var parent = this;
		$(parent).css('display','none').parent().find('a#closedetail').css('display','block');
		var Id = $(this).attr('data-id');
		if(Id)
		{
			Id= '#'+Id;
			$(Id).slideDown('slow','linear',function(){
				$(Id+' .slider').bxSlider({
					  pagerCustom: Id+' .captions'
				});
			})
		}
	})
	
	
});