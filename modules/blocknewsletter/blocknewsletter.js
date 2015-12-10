$(document).ready(function(e) {
   $('#submitNewsletter').on('click',function(e){
   		e.preventDefault();
		$('#newsletter_block_left .error').slideUp(400);
		if($('#newsletter #habeas').prop('checked'))
		{
			if(!$('#newsletter .newsletter-input').val().match(/^[a-z\p{L}0-9!#$%&\'*+\/=?^`{}|~_-]+[.a-z\p{L}0-9!#$%&\'*+\/=?^`{}|~_-]*@[a-z\p{L}0-9]+(?:[.]?[_a-z\p{L}0-9-])*\.[a-z\p{L}0-9]+$/))
			{
				$('#newsletter_block_left .error').html(error2)
				$('#newsletter_block_left .error').slideDown(400);
			}else{
					$('#newsletter').submit();
				 }
		}else{
				$('#newsletter_block_left .error').html(error1)
				$('#newsletter_block_left .error').slideDown(400);
			 }
   })
});  