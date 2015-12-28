var ps_force_friendly_product =1;
var PS_ALLOW_ACCENTED_CHARS_URL =0;

$(document).ready(function(e) {
    $('.adminexperiences #image-images-thumbnails img').on('click', function(e){
		var sp	= 6.25;
		var Px	= ((e.pageX-sp) - $(this).offset().left);
		var Py	= ((e.pageY-sp) - $(this).offset().top);		
		Px = ((Px/$(this).innerWidth())*100).toFixed(2);
		Py = ((Py/$(this).innerHeight())*100).toFixed(2);
		
		if(Px>100)
			Px = 100;
		
		if(Px<0)
			Px = 0;	
			
		if(Py>100)
			Py = 100;
		
		if(Py<0)
			Py = 0;		

		var left = Px;
		var top	 = Py;
		var poid = 'po'+left+'-'+top;

		if(poid)
		{
			//$.fancybox('<img class="loading-experience" src="'+window.location.origin+'/img/loader.gif">')
			var url_experience = currentIndex;
				url_experience += '&token='+token;

			$.ajax({
					url: url_experience,
					data:{
							ajax: true,
							action: 'experienceAssociations'
						 },
						 success: function(data){
						 	$.fancybox(data)
						 }
				   })
			
			
		}

		//$('.adminexperiences #image-images-thumbnails').append('<div class="experience_pointer" style="top:'+top+'%; left:'+left+'%" id="'+poid+'"></div>')
	})
});