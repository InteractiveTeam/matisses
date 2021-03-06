$('document').ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
   //check all jPList javascript options
   $('#lists').jplist({				
      itemsBox: '.list-item' 
      ,itemPath: '.ax-item' 
      ,panelPath: '.jplist-panel'	
   });
    
    $("form[name=searchList]").submit(function(e){
        if($("#name").val() === "" && $("#lastname").val() === "" && $("#code").val() === ""){
            $.fancybox({
                afterShow       :   function(){
                    if(isApple()){ $('body').css({'position': 'fixed'}); }
                },
                'afterClose' : function () {
                    if(isApple()){ $('body').css({'position': ''}); }
                },
                 'autoScale': true,
                 'transitionIn': 'elastic',
                 'transitionOut': 'elastic',
                 'speedIn': 500,
                 'speedOut': 300,
                 'autoDimensions': true,
                 'centerOnScroll': true,
                 'content' : '<div><p class="fancybox-error">Debes completar los campos Nombre y Apellido o Código para realizar la búsqueda de la(s) listas deseadas.</p></div>'
            });
             e.preventDefault();
        }
        if($("#name").val() === "" && $("#lastname").val() !== "" || $("#name").val() !== "" && $("#lastname").val() === ""){
             $.fancybox({
                 afterShow       :   function(){
                    if(isApple()){ $('body').css({'position': 'fixed'}); }
                },
                'afterClose' : function () {
                    if(isApple()){ $('body').css({'position': ''}); }
                },
                 'autoScale': true,
                 'transitionIn': 'elastic',
                 'transitionOut': 'elastic',
                 'speedIn': 500,
                 'speedOut': 300,
                 'autoDimensions': true,
                 'centerOnScroll': true,
                 'content' : '<div><p class="fancybox-error">Debes completar los campos Nombre y Apellido para realizar la búsqueda de la(s) listas deseadas.</p></div>'
            });
             e.preventDefault();
        }
    });
    
   
    $('.jplist-pagingmid').after($('.jplist-label'));
    
   $("#name").change(function(){
	   if($("#name").val() != "" || $("#lastname").val() != ""){
		   disableCodeField();
	   }
	   else{
		   enableCodeField();
	   }
   });
   
   $("#lastname").change(function(){
	   if($("#name").val() != "" || $("#lastname").val() != ""){
		   disableCodeField();
	   }
	   else{
		   enableCodeField();
	   }
   });
   
   $("#code").change(function(){
	   if($("#code").val() != ""){
		   disableNameLastnameFields();
	   }
	   else{
		   enableNameLastnameFields();
	   }
   });
   
   function disableCodeField(){
	   $("#code").attr("disabled",true);
   }
   
   function enableCodeField(){
	   $("#code").attr("disabled",false);
   }
   
   function enableNameLastnameFields(){
	   $("#name").attr("disabled",false);
	   $("#lastname").attr("disabled",false);
   }
   
   function disableNameLastnameFields(){
	   $("#name").attr("disabled",true);
	   $("#lastname").attr("disabled",true);
   }
});