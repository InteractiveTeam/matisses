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
});