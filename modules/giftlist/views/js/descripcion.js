var valForm;
var valFormInfo;
var jp;

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
                items:2
            },
            568:{
                items:2
            },
            768:{
                items:4
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
    
    $('.cant_prod').on('change',function(){
        updateQty($(this));
    });
    
    $(".ax-list-edit").click(function(){
        $(".delete-product").removeClass('hidden');
        $(".delete-product").parent().addClass('ax-edit-list');
        $(".ax-finish-edit").removeClass('hidden');
        $(".cant_prod").attr("disabled",false);
        $(this).addClass("hidden");
        $(".ax-bond-value").addClass("hidden");
        $(".fa-heart").addClass("ax-fav-icon");
        $(".ax-bond-card").append('<div class="ax-bond-cont"><label for="min_amount">Monto mínimo</label><input type="number" step="20000" min="0" id="min_amount" value="'+min_amount+'" name="min_amount"></div>');
        var min_val = document.getElementById('min_amount');
        var cant_prod = document.getElementsByClassName("cant_prod");
        for(var i = 0; i < cant_prod.length; i++){
            cant_prod[i].onkeydown = function(e) {
                if(!((e.keyCode > 95 && e.keyCode < 106)
                  || (e.keyCode > 47 && e.keyCode < 58) 
                  || e.keyCode == 8)) {
                    return false;
                }
            };
        }
        if(min_val != null){
            cant_prod.onkeydown = min_val.onkeydown = function(e) {
                if(!((e.keyCode > 95 && e.keyCode < 106)
                  || (e.keyCode > 47 && e.keyCode < 58) 
                  || e.keyCode == 8)) {
                    return false;
                }
            };
        }
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
                    $(".cant_prod").attr("disabled",true);
                    $(".delete-product").parent().removeClass('ax-edit-list');
                    $(".ax-list-edit").removeClass('hidden');
                    $(".ax-finish-edit").addClass("hidden");
                    $(".ax-bond-value").removeClass("hidden");
                    $(".fa-heart").removeClass("ax-fav-icon");
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
    
    $(".fa-heart").click(function(){
        if($(this).hasClass('ax-fav-icon'))
            favoriteProduct($(this));
    });
    
    $("#ax-delete").click(function(){
        $.fancybox({
            'autoScale': true,
            'transitionIn': 'elastic',
            'transitionOut': 'elastic',
            'minWidth': 250,
            'minHeight':120,
            'speedIn': 500,
            'speedOut': 300,
            'autoDimensions': true,
            'centerOnScroll': true,
            'content' : '<div><p class="fancybox-error">¿Estás seguro de que deseas eliminar el mensaje?</p><a href="#" id="cancel"  class="cancel btn btn-default btn-lista-regalos">Cancelar</a><a href="javascript:void(0);" id="acept" class="acept btn btn-default btn-lista-regalos">Aceptar</a></div>'
        });
        $("#cancel").on('click',function(){
            $.fancybox.close();
        });
        $("#acept").on('click',function(){
            $.fancybox.close();
            deleteMsg();
        });
    });
    
    setTown($("#city option:selected").val());
    $("#town").trigger("chosen:updated");
    
    $("#city").on('change',function(){
        setTown($("#city option:selected").val());
        $("#town").trigger("chosen:updated");
    });
    
    $(".ax-save").on('click',saveAddress);
    
    jp = $('#ax-products').jplist({				
      itemsBox: '.ax-prod-cont', 
      itemPath: '.product-card' ,
      panelPath: '.jplist-panel',
      redrawCallback: function(){
          if($(".ax-list-edit").hasClass("hidden")){
            $(".delete-product").removeClass('hidden');
            $(".delete-product").parent().addClass('ax-edit-list');
            $(".ax-bond-value").addClass("hidden");
            $(".fa-heart").addClass("ax-fav-icon");
            if($(".ax-bond-cont").length == 0 ){
                $(".ax-bond-card").append('<div class="ax-bond-cont"><label for="min_amount">Monto mínimo</label><input type="number" step="20000" min="0" id="min_amount" value="'+min_amount+'" name="min_amount"></div>');
                $(".cant_prod").attr("disabled",false);
                var min_val = document.getElementById('min_amount');
                var cant_prod = document.getElementsByClassName("cant_prod");
                for(var i = 0; i < cant_prod.length; i++){
                    cant_prod[i].onkeydown = function(e) {
                        if(!((e.keyCode > 95 && e.keyCode < 106)
                          || (e.keyCode > 47 && e.keyCode < 58) 
                          || e.keyCode == 8)) {
                            return false;
                        }
                    };
                }
                if(min_val != null){
                    min_val.onkeydown = function(e) {
                        if(!((e.keyCode > 95 && e.keyCode < 106)
                            || (e.keyCode > 47 && e.keyCode < 58) 
                            || e.keyCode == 8)) {
                        return false;
                        }
                    };
                }
            }
          }
          else if($(".ax-finish-edit").hasClass("hidden")){
              $(".cant_prod").attr("disabled",true);
              $(".fa-heart").removeClass("ax-fav-icon");
              $(".delete-product").addClass('hidden');
              $(".delete-product").parent().removeClass('ax-edit-list');
              $(".ax-bond-value").removeClass("hidden");
              $(".ax-bond-cont").remove();
          }
      }
   });
    
    $(".delete-product").click(function(){
		var id_product = $(this).parent().attr("data-id");
		$.ajax({
			type: 'POST',
			data: {
				ajax: true,
				method: "delete-product",
				id_product: id_product,
				id_list: $(".products-associated").attr("data-id")
			},
			headers: { "cache-control": "no-cache" },
			success: function(result){
                $.fancybox({
                     'autoScale': true,
                     'transitionIn': 'elastic',
                     'transitionOut': 'elastic',
                     'minWidth': 240,
                     'minHeight': 50,
                     'speedIn': 500,
                     'speedOut': 300,
                     'autoDimensions': true,
                     'centerOnScroll': true,
                     'content' : '<div><p class="fancybox-error">'+result+'</p></div>'
                });
                jp.jplist({
                      command: 'del'
                      ,commandData: {
                         $item:  $("#prod-"+id_product)
                      }
                   });
                }
		});
	});
    
    $(".ax-edit-info").fancybox({
        'autoSize'      :   false,
        'width'			:   600,
        'height'        :   360,
        'transitionIn'	:	'elastic',
        'transitionOut'	:	'elastic',
        'speedIn'		:	600,
        'speedOut'		:	200,
        'overlayShow'	:	false,
        afterShow		: 	editInfo
	});
    
    $(".ax-save-info").click(function(){
        saveInfo();  
    });
});

function saveInfo(){
    if(valFormInfo.form()){
        $.ajax({
            type:"post",
            data:{
                'id_list': $(".products-associated").attr('data-id'),
                'data':$("#info-form").serializeObject(),
                'ajax':true,
                'method':"editInfo",
            },
            success:function(res){
                res = JSON.parse(res);
                if(!res.error){
                    $(".ax-creator-name").text(res.name);
                    $(".ax-event-date").text(res.date);
                    $(".ax-event-type").text(res.event);
                }
                $.fancybox.close();
                $.fancybox({
                 'autoScale': true,
                 'minWidth': 250,
                 'minHeight': 50,
                 'transitionIn': 'elastic',
                 'transitionOut': 'elastic',
                 'speedIn': 500,
                 'speedOut': 300,
                 'autoDimensions': true,
                 'centerOnScroll': true,
                 'content' : '<div><p class="fancybox-error">'+res.msg+'</p></div>'
                });
            }
        });
    }
}

function editInfo(){
    $.validator.addMethod("selectRequired",function(value,element){
        return value != 0;
    }, "El campo es requerido");

    valFormInfo = $("#info-form").validate({
        lang: 'es',
        rules:{
            firstname:'required',
            lastname:'required',
            event_type:'selectRequired',
            days:'selectRequired',
            months:'selectRequired',
            years:'selectRequired',
        },
        message:{
            required:"El campo es requerido"
        }
    });
}

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
            $.fancybox({
            'autoScale': true,
            'transitionIn': 'elastic',
            'transitionOut': 'elastic',
            'minWidth': 250,
            'minHeight': 60,
            'speedIn': 500,
            'speedOut': 300,
            'autoDimensions': true,
            'centerOnScroll': true,
            'content' : '<div><p class="fancybox-error">El mensaje se ha eliminado</p></div>'
        });
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
                $(".ax-profile-img").css("background-image","url("+res+"?"+today.getTime()+")");
            else
                $(".ax-cover-img").css("background-image","url("+res+"?"+today.getTime()+")");
            $.fancybox({
             'autoScale': true,
             'minWidth': 250,
             'minHeight': 50,
             'transitionIn': 'elastic',
             'transitionOut': 'elastic',
             'speedIn': 500,
             'speedOut': 300,
             'autoDimensions': true,
             'centerOnScroll': true,
             'content' : '<div><p class="fancybox-error">Imagen cargada con éxito.</p></div>'
            });
        }
    });
}

function deleteImage(prof,el){
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
                $(".ax-profile-img").css("background-image","url("+res+"?"+today.getTime()+")");
            else
                $(".ax-cover-img").css("background-image","url("+res+"?"+today.getTime()+")");
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
                    $(".ax-creator-name").text(res.name);
                    $.fancybox.close();
                     $.fancybox({
                         'autoScale': true,
                         'transitionIn': 'elastic',
                         'transitionOut': 'elastic',
                         'minWidth': 250,
                         'minHeight': 50,
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
                 'minWidth': 250,
                 'minHeight': 50,
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
                 'minWidth': 240,
                 'minHeight': 50,
                 'speedIn': 500,
                 'speedOut': 300,
                 'autoDimensions': true,
                 'centerOnScroll': true,
                 'content' : '<div><p class="fancybox-error">'+result+'</p></div>'
            });
		}
	})
}

function favoriteProduct(el){
    var isFav = (el.hasClass("ax-favorite") ? 0 : 1);
    var idProd = el.parents(".product-card").attr( "data-id");
    $.ajax({
        type: 'POST',
		data: {
			ajax: true,
			method: "changeFavorite",
			id_list: $(".products-associated").attr('data-id'),
			id_prod: idProd,
            fav : isFav
		},
        success: function(result){
            result = JSON.parse(result);
            if(!result.error){
                if(!isFav)
                    $("div[data-id="+idProd+"]").find(".fa-heart").removeClass("ax-favorite");
                else
                    $("div[data-id="+idProd+"]").find(".fa-heart").addClass("ax-favorite");
            }else{
                console.log(result.error);
            }
		}
    });
}

function updateQty(el){
    var idProd = el.parents(".product-card").attr( "data-id");
    $.ajax({
        type: 'POST',
		data: {
			ajax: true,
			method: "updateQty",
			id_list: $(".products-associated").attr('data-id'),
			id_prod: idProd,
            cant : el.val()
		},
        success: function(result){
            result = JSON.parse(result);
            if(result.error){
                $.fancybox({
                 'autoScale': true,
                 'transitionIn': 'elastic',
                 'transitionOut': 'elastic',
                 'speedIn': 500,
                 'speedOut': 300,
                 'autoDimensions': true,
                 'centerOnScroll': true,
                 dataType : 'html',
                 'content' : '<div><p class="fancybox-error">'+result.msg+'</p></div>'
                });
            }
		}
    });
}