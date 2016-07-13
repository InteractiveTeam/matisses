$('document').ready(function(){
    $("#ax-buscar").submit(function(e){
        if($("#name").val() === "" && $("#lastname").val() === "" && $("#code").val() === ""){
            $.fancybox({
                 'autoScale': true,
                 'transitionIn': 'elastic',
                 'transitionOut': 'elastic',
                 'minWidth': 320,
                 'minHeight': 100,
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
                 'autoScale': true,
                 'transitionIn': 'elastic',
                 'transitionOut': 'elastic',
                 'speedIn': 500,
                 'speedOut': 320,
                 'minWidth': 300,
                 'minHeight': 100,
                 'autoDimensions': true,
                 'centerOnScroll': true,
                 'content' : '<div><p class="fancybox-error">Debes completar los campos Nombre y Apellido para realizar la búsqueda de la(s) listas deseadas.</p></div>'
            });
             e.preventDefault();
        }
    });   
    
   $("#name").change(function(){
	   if($("#name").val() !== "" || $("#lastname").val() !== ""){
		   disableCodeField();
	   }
	   else{
		   enableCodeField();
	   }
   });
   
   $("#lastname").change(function(){
	   if($("#name").val() !== "" || $("#lastname").val() !== ""){
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
    
if($(window).width() <= 568) {
    tabRpListAdmin()
}else {
    $('.ax-text-result-list').next().show();
}

function tabRpListAdmin(){
    $('.ax-text-result-list').next().hide();

    $('.ax-text-result-list').on('click', function(){
        $(this).next().slideToggle();
    })
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