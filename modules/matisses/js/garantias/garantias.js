// JavaScript Document
$(document).ready(function(e) {
	
	$("label[for=imagen]").click(function(){
		$("input[name=imagen]").trigger('click');
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