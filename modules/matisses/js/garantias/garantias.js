// JavaScript Document
$(document).ready(function(e) {
	
		var slider;
		var sliders = new Array;
		
		$('.slider-result').bxSlider({
				startSlide: 0,
				infiniteLoop: false,
				hideControlOnEnd: true,
				minSlides: 4
			});
				
		$("#fileUpload").live('change', function () {
			
		if (typeof (slider) != "undefined") {
			slider.destroySlider();
		}
	
		 //Get count of selected files
		 var countFiles = $(this)[0].files.length;
	
		 var imgPath = $(this)[0].value;
		 var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
		 var image_holder = $("#image-holder");
		 var html = '';
		 var captions = '';
		 image_holder.empty();
		 $(html).html('');
		 if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
			 if (typeof (FileReader) != "undefined") {
	
				 //loop for each file selected for uploaded.
				 var cont = 0;
				 for (var i = 0; i < countFiles; i++) {
	
					 var reader = new FileReader();
					 reader.onload = function (e) {
						 
							html='<li><img style="width:100%; height: auto" src="'+e.target.result+'" class="img-responsive" /></li>';
							$(html).appendTo(image_holder);
						
						cont = cont +1;
						
					 }

					 image_holder.show();
					 reader.readAsDataURL($(this)[0].files[i]);
				 }
			 } else {
				// alert("This browser does not support FileReader.");
			 }
		 } else {
			 //alert("Pls select only images");
		 }
		 
		 setTimeout(function(){
            slider = $('.slider').bxSlider({
				startSlide: 0,
				infiniteLoop: false,
				hideControlOnEnd: true,
				minSlides: 4
			});
		 },500)
		 
	 });			
	
	$(".scroll-pane").mCustomScrollbar();
	
	
	setTimeout(function(){
			$('#form1').append('<input type="file" name="imagen[]" style="display:none" id="fileUpload" multiple="" data-placeholder="Cargar imagen">');
		},2000);
	
	$('#tipo-dano li').on('click',function(e){
		e.preventDefault();
		var tipo = $('#tipo').val();
		if(tipo.split(',').length < nrodanos)
		{
			if(tipo)
			{
                iddanos = $('#id-tipo').val().split(',');
				for(var i = 0; i < iddanos.length; i++){
					if(iddanos[i] == $(this).attr('data-id')){
						$.fancybox('<div class="error">No puedes seleccionar más de una vez el mismo daño</div>');
						return;
					}
				}
				var danos = $('#tipo').val()+', '+$(this).attr('data-value');
                var ids = $('#id-tipo').val()+','+$(this).attr('data-id');
			}else{
                var danos = $(this).attr('data-value');
                var ids = $(this).attr('data-id');
             }
			$('#tipo').val(danos);
			$('#id-tipo').val(ids);
		}else{
				$.fancybox('<div class="error">No puedes seleccionar más daños</div>')
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
				$(' * #showdetail').show();
				$(' * #closedetail').hide();
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
				
				if(!sliders[Id+'slider'])
				{
					sliders[Id+'slider'] = $(Id+' .slider').bxSlider({
						  pagerCustom: Id+' .captions'
					});
				}else{
						//sliders[Id+'slider'].reloadSlider();
					 }
					 
				if(!sliders[Id+'captions'])
				{
					sliders[Id+'captions'] = $(Id+' .captions').bxSlider({
						startSlide: 0,
						infiniteLoop: false,
						hideControlOnEnd: true,
						minSlides: 4	
					});
				}else{
						//sliders[Id+'captions'].reloadSlider();
					 }
			})
		}
	})
	
	$(".material").click(function(){
        var id_val = $(this).attr("data-id");
        $(".danos"+id_val).slideToggle();
    });

	//comentario

	$(".addComment").click(function(){
		$(".add").removeClass("hidden");
		$(this).hide();
	});

	$(".cancelComment").click(function(){
		$(".add").addClass("hidden");
		$(".addComment").show();
	});

	function getDate() {         
		var hoy = new Date();  
        var yyyy = hoy.getFullYear().toString();                                    
        var mm = (hoy.getMonth()+1).toString(); // getMonth() is zero-based
        var dd  = hoy.getDate().toString();             
                            
        return yyyy + '/' + (mm[1]?mm:"0"+mm[0]) + '/' + (dd[1]?dd:"0"+dd[0]);
   };  

	$(".sendComment").click(function(){
		if($(this).parent().find("textarea").val().trim() != ""){
			comment = $(this).parent().find("textarea").val().trim();
			$.ajax({
				type : "POST",
				data : {
					ajax: true,
					method: "addComment",
					id_request: $(this).data("value"),
					comment: comment
				},
				success: function(e){
					
					var html = '<tr><td width="105px"><span>' + getDate() + '</span></td><td>'+ comment + "</td></tr>";
					$(".tbl-history").append(html)
				},
				complete: function(){
					$(".add").addClass("hidden");
					$(".addComment").show();
					$(this).parent().find("textarea").val("");
				}
			})
		}
	});
});