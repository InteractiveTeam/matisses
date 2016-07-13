$(document).ready(function(e) {
	
		switch($('#typeslide').val())
		{
			case 'imagen': 
				$('#videoid').parent().parent().addClass('hidden');
				$('#image_1').parent().parent().parent().parent().removeClass('hidden');
			break;	
			/*case 'Video': 
				$('#image_1').parent().parent().parent().parent().addClass('hidden');
				$('#videoid').parent().parent().removeClass('hidden');
			break;	*/
		}

    	$('#typeslide').live('change',function(e){
		e.preventDefault();
		switch($(this).val())
		{
			case 'imagen': 
				$('#videoid').parent().parent().addClass('hidden');
				$('#image_1').parent().parent().parent().parent().removeClass('hidden');
			break;	
			/*case 'Video': 
				$('#image_1').parent().parent().parent().parent().addClass('hidden');
				$('#videoid').parent().parent().removeClass('hidden');
			break;	*/
		}
	})
});