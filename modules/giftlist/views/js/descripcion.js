var valForm;

$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();
    
    $("#ax-img-prof").click(function(){
        $("#ax-prof-up").trigger("click");
    });

    $("#ax-img").click(function(){
        $("#ax-cover-up").trigger("click");
    });
    
    $('.owl-carousel').owlCarousel({
        loop:true,
        margin:10,
        nav:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:3
            },
            1000:{
                items:5
            }
        }
    });

	$(document).on('click', '.popup-modal-dismiss', function (e) {
		e.preventDefault();
		$.fancybox.close();
	});
    
    $(".ax-cancel").on('click', function (e) {
		e.preventDefault();
		$.fancybox.close();
	});

	setTimeout(function() {
		$("#closeMsg").parent().remove();
	}, 8000);

	$(".product-card").hover(function(){
		$(this).find(".add_container").toggle();
	});

    $(".share-list").fancybox({
		'autoSize'      :   false,
        'height'        :   'auto',
        'width'			:    300,
		'speedIn'		:	600, 
		'speedOut'		:	200, 
		'overlayShow'	:	false,
		'type'			: 	'ajax',
		afterShow		: 	validateShareList
	});
	
	$(".share-list").click(function(){
		$(this).addClass("clicked");
	});
    
    $(".ax-edit-address").fancybox({
        'autoSize'      :   false,
        'height'        :   'auto',
        'width'			:    600,
        'transitionIn'	:	'elastic',
        'transitionOut'	:	'elastic',
        'speedIn'		:	600,
        'speedOut'		:	200,
        'overlayShow'	:	false,
        afterShow		: 	validateAddressForm
	});
    
    $("#ax-edit").click(function(){
        var mc = $("#ax-message-content");
        var m = mc.text();
        mc.hide();
        var bedit = $("#ax-edit");
        var bdelete = $("#ax-delete");
        bedit.hide();
        bdelete.hide();
        var textdiv = '<div id="changemessage"><textarea class="ax-new-message">'+m+'</textarea><a href="javascript:void(0);" id="ax-save">Guardar</a></div>';
        $(".ax-message").on('click','#ax-save',saveMessage);
        $(".ax-message").append(textdiv);
    });
    $("#ax-prof-up").change(function(){
        if($(this).val() !== "")
            uploadImage(true,$(this));
    });
    $("#ax-cover-up").change(function(){
        if($(this).val() !== "")
            uploadImage(false,$(this));
    });
    
    $("#ax-prof-delete").click(function(){
        deleteImage("1",$(this));
    });
    
    $("#ax-cover-delete").click(function(){
        deleteImage("0",$(this));
    });
    
    $("body").on('submit','#share-email',function(e){
		callAjaxSend(e);
	});
    
    $(".ax-list-edit").click(function(){
        $(".delete-product").removeClass('hidden');
        $(".delete-product").parent().addClass('ax-edit-list');
        $(".ax-finish-edit").removeClass('hidden');
        $(this).addClass("hidden");
        $(".ax-bond-value").addClass("hidden");
        $(".ax-bond-card").append('<div class="ax-bond-cont"><label for="min_amount">Monto mínimo</label><input type="number" step="20000" min="0" id="min_amount" value="'+min_amount+'" name="min_amount"></div>');
    });
    
    $(".ax-finish-edit").click(function(){
        var val = $("#min_amount").val();
        min_amount = val;
            $.ajax({
                type: 'POST',
                data: {
                    'ajax':true,
                    'method':"updateAmount",
                    'id_list': $(".products-associated").attr('data-id'),
                    'value': val
                },
                success: function(){
                    $(".delete-product").addClass('hidden');
                    $(".delete-product").parent().removeClass('ax-edit-list');
                    $(".ax-list-edit").removeClass('hidden');
                    $(".ax-finish-edit").addClass("hidden");
                    $(".ax-bond-value").removeClass("hidden");
                    $(".ax-bond-cont").remove();
                    $.fancybox({
                     'autoScale': true,
                     'transitionIn': 'elastic',
                     'transitionOut': 'elastic',
                     'speedIn': 500,
                     'speedOut': 300,
                     'autoDimensions': true,
                     'centerOnScroll': true,
                     'content' : '<div><p class="fancybox-error">Se ha editado la lista</p></div>'
                    });
                } 
            });                      
    }); 
    
    $("#ax-delete").click(function(){
        deleteMsg();
    });
    
    setTown($("#city option:selected").val());
    $("#town").trigger("chosen:updated");
    
    $("#city").on('change',function(){
        setTown($("#city option:selected").val());
        $("#town").trigger("chosen:updated");
    });
    
    $(".ax-save").on('click',saveAddress);
});

function deleteMsg(){
    $.ajax({
        type: 'POST',
        data: {
            'ajax':true,
            'method':"deleteMsg",
            'id_list': $(".products-associated").attr('data-id')
        },
        success: function(){
        $("#ax-message-content").text("");
        }
    });
}

function uploadImage(prof,input){
    var data = new FormData();
    $.each(input[0].files, function(i, file) {
        data.append('file-'+i, file);
    });
    data.append('ajax',true);
    data.append('prof',prof);
    data.append('method',"uploadImage");
    data.append('id_list', $(".products-associated").attr('data-id'));
    $.ajax({
        type: 'POST',
        data: data,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function(res){
            var today = new Date();
            if(prof)
                $(".ax-profile-img").attr("src",res+"?"+today.getTime());
            else
                $(".ax-cover-img").attr("src",res+"?"+today.getTime());
        }
    });
}

function deleteImage(prof){
    $.ajax({
        type: 'POST',
        data: {
            'ajax':true,
            'prof':prof,
            'method':"deleteImage",
            'id_list': $(".products-associated").attr('data-id')
        },
        success: function(res){
            var today = new Date();
            if(prof == "1")
                $(".ax-profile-img").attr("src",res+"?"+today.getTime());
            else
                $(".ax-cover-img").attr("src",res+"?"+today.getTime());
        }
    });
}

function saveAddress(){
    var form = $("#address-form").serializeObject();
    if(valForm.form()){
        $.ajax({
            type: 'POST',
            data: {
                ajax: true,
                method: "saveAddress",
                id_list: $(".products-associated").attr('data-id'),
                form: form,
            },
            success: function(res){
                res = JSON.parse(res);
                res.data = JSON.parse(res.data);
                if(!res.error){
                    $(".ax_address_bef").text(res.a_b + " " + res.data.town + " " + res.data.city +", "+ res.data.country);
                    $(".ax_address_af").text(res.a_a + " " + res.data.town + " " + res.data.city +", "+ res.data.country);
                    $.fancybox.close();
                     $.fancybox({
                         'autoScale': true,
                         'transitionIn': 'elastic',
                         'transitionOut': 'elastic',
                         'speedIn': 500,
                         'speedOut': 300,
                         'autoDimensions': true,
                         'centerOnScroll': true,
                         'content' : '<div><p class="fancybox-error">'+res.response+'</p></div>'
                    });
                }
            }
        });
    }
}

function setTown(id_state){
   var states = countries[id_state].states;
    $("#town").empty().append($('<option>', {
        value: 0,
        text: "Seleccione una opción"
    }));
    for(i = 0; i < states.length; i++){
        var op = $('<option>', {
            value: states[i].name,
            text: states[i].name,
        });
        if(sel_town === states[i].name)
            op.attr("selected",true);
        
        $("#town").append(op);
        $("#town_chosen .chosen-drop .chosen-results").append('<li class="active-result" data-option-array-index="'+states[i].name+'">'+states[i].name+sel_town+'</li>');
    }
}

function saveMessage(){
    var message = $(".ax-new-message").val();
    $(".ax-new-message").remove();
    $("#ax-save").remove();
    var mc = $("#ax-message-content");
    $.ajax({
        method: 'post',
        data: {
            ajax: true,
            method: "saveMessage",
            id_list: $(".products-associated").attr('data-id'),
            message: message,
        },
        success: function(res){
            $("#message").text(JSON.parse(res));
            $.fancybox({
                 autoSize    : true,
                autoScale   : true,
                fitToView   : true,
                autoDimensions:	true,
                 'transitionIn': 'elastic',
                 'transitionOut': 'elastic',
                 'speedIn': 500,
                 'speedOut': 300,
                 'href' : '#contentdiv'
            });
        }, 
    }).always(function(){
        mc.text(message);
        mc.show();
        $("#ax-edit").show();
        $("#ax-delete").show();
    });
}


function validateAddressForm(){
    $.validator.addMethod("selectRequired",function(value,element){
        return value != 0;
    }, "El campo es requerido");

    valForm = $("#address-form").validate({
        lang: 'es',
        rules:{
            firstname:'required',
            lastname:'required',
            tel:'required',
            address:'required',
            dir_before:'required',
            dir_after:'required',
        },
        message:{
            required:"El campo es requerido"
        }
    });
}


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
	var id_list = $(".products-associated").attr('data-id');
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
            $.fancybox.close();
            $.fancybox({
                 'autoScale': true,
                 'transitionIn': 'elastic',
                 'transitionOut': 'elastic',
                 'speedIn': 500,
                 'speedOut': 300,
                 'autoDimensions': true,
                 'centerOnScroll': true,
                 'content' : '<div><p class="fancybox-error">'+result+'</p></div>'
            });
		}
	})
}
    
