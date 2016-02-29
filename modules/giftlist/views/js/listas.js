$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();
	//modals
    $('#btnAdd').fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600, 
		'speedOut'		:	200, 
		'overlayShow'	:	false,
		'type'			: 	'ajax',
		afterShow		: 	function(){
            validation();				
            $('#event_date').datetimepicker({
                 minDate:'1',
                 format:"Y-m-d H:i",
                 mask:true
            });
            $('#tel').mask("000-00-00", {placeholder: "___-__-__"});
            $('#cel').mask("000-000-0000", {placeholder: "___-___-____"});
        }
	});
	
	$(document).on('click', '.popup-modal-dismiss', function (e) {
		e.preventDefault();
		$.fancybox.close();
	});
	
	function validation() {
		$.validator.addMethod("selectRequired",function(value,element){
			return value != 0;
		}, "El campo es requerido");
		
		$.validator.addMethod("guestNumber",function(value,element){
			return value > 1;
		}, "El valor ingresado en este campo debe ser un número entero mayor que 1.");
		
		$.validator.addMethod("noSpaceStart", function(value, element) { 
		    return value.indexOf(" ") != 0; 
		}, "El campo es requerido");

		$.validator.addMethod("noSpaceEnd", function(value, element) { 
		    return value.lastIndexOf(" ") != value.length - 1; 
		}, "El campo es requerido");
				
		$("#frmSaveList").validate({
			rules:{
				name: {
					required:true,
					noSpaceStart:true,
					noSpaceEnd:true
				},
				event_type: "selectRequired",
				event_date: {
					required:true,
					noSpaceStart:true,
					noSpaceEnd:true
				},
				guest_number: {
					required: true,
					number:true,
					guestNumber:true
				},
				message: {
					maxlength:1000
				},
				city:{
					required:true,
					noSpaceStart:true,
					noSpaceEnd:true
				},
				town:{
					required:true,
					noSpaceStart:true,
					noSpaceEnd:true
				},
				tel:{
					required:true,
					noSpaceStart:true,
					noSpaceEnd:true
				},
				cel:{
					required:true,
					noSpaceStart:true,
					noSpaceEnd:true
				},
				email_cocreator: "email"
			},
			message:{
				required:"El campo es requerido"
			}/*,
			submitHandler: function(form) {
				$(form).submit();
			}*/
		});	
	}
	
	
	//eliminar
	$(".delete-list").on('click', function(e){
		e.preventDefault();
		$.ajax({
			url: $(".actions").attr("action"),
			type: 'POST',
			data: {
				ajax: true,
				method: "delete",
				id_list: $(this).val()
			},
			headers: { "cache-control": "no-cache" },
			success: function(result){
				result = JSON.parse(result);
				alert(result.msg);
				$("#list-"+result.id).remove();
			}
		});
	});
	
	//compartir
	
	$(".share-list").fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600, 
		'speedOut'		:	200, 
		'overlayShow'	:	false,
		'type'			: 	'ajax',
		afterShow		: 	validateShareList
	});
	
	$(".share-list").click(function(){
		$(this).addClass("clicked");
	});

	 
	setTimeout(function() {
		$("#closeMsg").parent().remove();
	}, 8000);
	
	$("body").on('submit','#share-email',function(e){
		callAjaxSend(e);
	});
	
});

function validateShareList(){
	$("#share-email").validate({
		rules:{
			email: {
				email:true,
				required:true
			}
		}
	});
}

function callAjaxSend(e){
	e.preventDefault();
	var id_list = $(".clicked").attr("data-id");
	$(".clicked").removeClass("clicked");
	$.ajax({
		url:'',
		type: 'POST',
		data: {
			ajax: true,
			method: "share",
			id_list: id_list,
			email: $("#email").val()
		},
		headers: { "cache-control": "no-cache" },
		success: function(result){
			alert(result);
		}
	});
}

