var ps_force_friendly_product =1;
var PS_ALLOW_ACCENTED_CHARS_URL =0;

$(document).ready(function(e) {

		updatePointer = function(object){
	  		var id = object.helper.context.attributes['data-pointer'].nodeValue;
			var sp	= 6.25;
			var Px	= ((object.offset.left-sp) - $('.adminexperiences #image-images-thumbnails img').offset().left);
			var Py	= ((object.offset.top-sp) - $('.adminexperiences #image-images-thumbnails img').offset().top);		
			Px = ((Px/$('.adminexperiences #image-images-thumbnails img').innerWidth())*100).toFixed(2);
			Py = ((Py/$('.adminexperiences #image-images-thumbnails img').innerHeight())*100).toFixed(2);
			
			if(Px>100)
				Px = 100;
			
			if(Px<0)
				Px = 0;	
				
			if(Py>100)
				Py = 100;
			
			if(Py<0)
				Py = 0;		

			var products = JSON.parse($('#products').val());
				products[id]['left'] = Px;
				products[id]['top'] = Py;
				
			$('#products').val(JSON.stringify(products));
  	
	  }
	
	  // load products
	  
	  	$('#experience-productdelete').live('click',function(e){
			var id = $('#pointerid').val();
			var products = JSON.parse($('#products').val());
			if(window.confirm('¿Realmente desea eliminar este punto?'))
			{
				$('div[data-pointer='+id+']').remove();
				delete products[id];
				$('#products').val(JSON.stringify(products));
				$('.experience-pointer').draggable({
										stop: function( event, ui ) {
												updatePointer(ui)
												//alert('termine');
											}
										});
					$.fancybox.close();	
			}
		})
	  
	  	$('#experience-productedit').live('click',function(e){
			
			if(!$('#experiences-points #product').val())
			{
				$('#experiences-points .error').remove();
				$('#experiences-points').prepend('<div class="error"><div class="bootstrap"><div class="module_error alert alert-danger"><button type="button" class="close" data-dismiss="alert">×</button>Ingrese un producto válido</div></div></div>');
			}else{
					var id = $('#pointerid').val();
					var products = JSON.parse($('#products').val());
						
						products[id]['market'] = $('#experiences-points #market').val();
						products[id]['orientation'] = $('#experiences-points #orientation').val();
						products[id]['left'] = $('#experiences-points #coordinates-left').val();
						products[id]['top'] = $('#experiences-points #coordinates-top').val();
						products[id]['id_product'] = $('#experiences-points #product').val();
						products[id]['status'] = $('#experiences-points #status').val();
						products[id]['pointer'] = id;
		
					$('#products').val(JSON.stringify(products));
					$('div[data-pointer='+id+']').remove();
					$('#image-images-thumbnails').prepend('<div title="Modificar | Eliminar" data-pointer="'+id+'" class="experience-pointer '+products[id]['market']+'-'+products[id]['orientation']+'" style="left:'+$.trim(products[id]['left'])+'%; top:'+$.trim(products[id]['top'])+'%;"></div>');
					
					$('.experience-pointer').draggable({
										stop: function( event, ui ) {
												updatePointer(ui)
												//alert('termine');
											}
										});
					$.fancybox.close();
			}
		})
	  
	  	$('.experience-pointer').live('click',function(e){
			e.preventDefault();
			
			var pointer = $(this).attr('data-pointer');

			var url_experience = currentIndex;
				url_experience += '&token='+token;

			$.ajax({
					url: url_experience,
					data:{
							'ajax': true,
							'action': 'experienceAssociations',
							'pointer': pointer,
							'data': $('#products').val(),
							
							
						 },
						 success: function(data){
						 	$.fancybox(data)
						 }
				   })
		})

	  var products = $('.adminexperiences #products').val()
	  if(products)
	  {
		  products = JSON.parse(products)
		  $(products).each(function(index, element) {
           	$('#image-images-thumbnails').prepend('<div title="Modificar | Eliminar" data-pointer="'+element.pointer+'" class="experience-pointer '+element.market+'-'+element.orientation+'" style="left:'+$.trim(element.left)+'%; top:'+$.trim(element.top)+'%;"></div>');
          });
		  $('.experience-pointer').draggable({revert: function(e){updatePointer(e);}});
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
									$('#products').val(data.configurations);
									$('#image-images-thumbnails').prepend(data.pointer);
									$('.experience-pointer').draggable({
										stop: function( event, ui ) {
												updatePointer(ui)
												//alert('termine');
											}
										
										});
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