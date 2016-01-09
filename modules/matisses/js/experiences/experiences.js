var ps_force_friendly_product =1;
var PS_ALLOW_ACCENTED_CHARS_URL =0;

$(document).ready(function(e) {
	
	  // load products
	  var products = $('.adminexperiences #products').val()
	  if(products)
	  {
		  products = JSON.parse(products)
		  $(products).each(function(index, element) {
           	$('#image-images-thumbnails').prepend('<div class="experience-pointer '+element.market+'" style="left:'+element.left+'%; top:'+element.top+'%;"></div>');
          });
	  }
	
	
	 $('#experience-productadd').live('click',function(){
		 $('#experiences-points .error').remove();
		var url_experience = currentIndex;
			url_experience += '&token='+token;
			
		var data = {
					'left': $('#experiences-points #coordinates-left').val(),
					'top': $('#experiences-points #coordinates-top').val(),
					'market': $('#experiences-points #market').val(),
					'orientation': $('#experiences-points #orientation').val(),
					'status': $('#experiences-points #status').val(),
					'product': $('#experiences-points #product').val(),
					'poid': $('#experiences-points #poid').val(),
					'pointers': $('#products').val(),
					'id_experience': $('#id_experience').val(),
					}
			
			$.ajax({
					url: url_experience,
					data:{
							'ajax': true,
							'action': 'experienceAddProduct',
							'data': data,
							
						 },
						 success: function(data){
						 	data = JSON.parse(data);
							console.log(data);
							if(data.haserror==true)
							{
								$('#experiences-points').prepend(data.message);
							}else{
									console.log(data.pointer);
									$('#products').val(data.configurations);
									$('#image-images-thumbnails').prepend(data.pointer);
									$.fancybox.close();
								 }
							
						 }
				   })		
		
			
	 })
	
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
							'ajax': true,
							'action': 'experienceAssociations',
							'left': left,
							'top': top,
							'poid': poid,
							
							
						 },
						 success: function(data){
						 	$.fancybox(data)
						 }
				   })
			
			
		}

		//$('.adminexperiences #image-images-thumbnails').append('<div class="experience_pointer" style="top:'+top+'%; left:'+left+'%" id="'+poid+'"></div>')
	})
});