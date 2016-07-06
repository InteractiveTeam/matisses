$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();
    
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

	$('#btn-edit-info').fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600, 
		'speedOut'		:	200, 
		'overlayShow'	:	false,
		'type'			: 	'ajax',
		afterShow		:   function(){
            $("#info_cocreator").validate();
            $("#id_list").val($(".products-associated").attr("data-id"));
            if(typeof address_cocreator != 'undefined' && address_cocreator !== ""){
                $("#city_co").val(address_cocreator.city);
                $("#town_co").val(address_cocreator.town);
                $("#address_co").val(address_cocreator.address);
                $("#tel_co").val(address_cocreator.tel);
                $("#cel_co").val(address_cocreator.cel);
				
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
    
	//add to cart

	$(".add-to-cart").click(function(e){
		var product_card = $(this).parent().parent();
		total = product_card.find(".total_qty").val() * (typeof product_card.find(".qty_group") != "undefined" ? product_card.find(".qty_group").attr("data-value") : 1);
        if(total > product_card.find(".total_qty").attr("data-value"))
            total = parseInt(product_card.find(".total_qty").attr("data-value"));
		addFromList(product_card.attr("data-id"),product_card.find(".prod-attr").val(), total, $(this),$(".products-associated").attr("data-id"));
	});

	//buy bond
	$("#add_bond").fancybox({
			'autoSize'      :   false,
			'height'        :   'auto',
			'width'			:    600,
			'transitionIn'	:	'elastic',
			'transitionOut'	:	'elastic',
			'speedIn'		:	600,
			'speedOut'		:	200,
			'overlayShow'	:	false,
						type: 'ajax',
			afterShow  :   function() {
				validateBondForm();
                $("#mount").attr("min",$("#min_amount").val());
 			}
	});
    
    validateAddressForm();
    
    $(".ax-edit-address").fancybox({
			'autoSize'      :   false,
			'height'        :   'auto',
			'width'			:    600,
			'transitionIn'	:	'elastic',
			'transitionOut'	:	'elastic',
			'speedIn'		:	600,
			'speedOut'		:	200,
			'overlayShow'	:	false,
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
    });
    
    $(".ax-finish-edit").click(function(){
        $(".delete-product").addClass('hidden');
        $(".delete-product").parent().removeClass('ax-edit-list');
        $(".ax-list-edit").removeClass('hidden');
        $(this).addClass("hidden");
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
            }
        }
    });
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
                 'autoScale': true,
                 'transitionIn': 'elastic',
                 'transitionOut': 'elastic',
                 'speedIn': 500,
                 'speedOut': 300,
                 'autoDimensions': true,
                 'centerOnScroll': true,
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

    $("#address-form").validate({
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

function validateBondForm(){
	$("#bond_form").validate({
		rules:{
			mount: 'required'
		}
	});
	$("#btnCancel").click(function(e){
		e.preventDefault();
		$.fancybox.close();
	});
	$(".keep-buy").click(function(){
		$.fancybox.close();
	});
	$("#btnSave").click(function(e){
		$.ajax({
			data: {
				ajax: true,
				method: "addBond",
				id_list: $(".products-associated").attr('data-id'),
				data: $("#bond_form").serializeObject(),
                summary: true
			},
			headers: { "cache-control": "no-cache" },
			success: function(result){
				result = JSON.parse(result);
				$.fancybox.close();
				$("#message").text(result.msg);
                ajaxCart.refresh();
				$.fancybox({
                     'autoScale': true,
                     'transitionIn': 'elastic',
                     'transitionOut': 'elastic',
                     'speedIn': 500,
                     'speedOut': 300,
                     'autoDimensions': true,
                     'centerOnScroll': true,
                     'href' : '#contentdiv'
                });
			}
		});
		e.preventDefault();
	});
}


/*********************
 * override of add to cart function
 * *******************/

function addFromList(idProduct, idCombination, quantity, callerElement,id_list){
	if ($('#cart_block_list').hasClass('collapsed'))
		this.expand();
	//send the ajax request to the server
	$.ajax({
		type: 'POST',
		headers: { "cache-control": "no-cache" },
		async: true,
		cache: false,
		dataType : "json",
		data: 'controller=cart&addFromList=1&ajax=true&qty=' + ((quantity && quantity != null) ? quantity : '1') + '&id_product=' + idProduct + '&token=' + static_token + ( (parseInt(idCombination) && idCombination != null) ? '&ipa=' + parseInt(idCombination): '')+"&id_list="+id_list,
		success: function(jsonData,textStatus,jqXHR)
		{
			if (!jsonData.hasError)
			{
				if (contentOnly)
					window.parent.ajaxCart.updateCartInformation(jsonData, false);
				else
					ajaxCart.updateCartInformation(jsonData, false);

				if (jsonData.crossSelling)
					$('.crossseling').html(jsonData.crossSelling);

				if (idCombination)
					$(jsonData.products).each(function(){
						if (this.id != undefined && this.id == parseInt(idProduct) && this.idCombination == parseInt(idCombination))
							if (contentOnly)
								window.parent.ajaxCart.updateLayer(this);
							else
								ajaxCart.updateLayer(this);
					});
				else
					$(jsonData.products).each(function(){
						if (this.id != undefined && this.id == parseInt(idProduct))
							if (contentOnly)
								window.parent.ajaxCart.updateLayer(this);
							else
								ajaxCart.updateLayer(this);
					});
				if (contentOnly)
					parent.$.fancybox.close();
			}
			else
			{
				if (contentOnly)
					window.parent.ajaxCart.updateCart(jsonData);
				else
					ajaxCart.updateCart(jsonData);

				$(callerElement).removeProp('disabled');
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown)
		{
			alert("Impossible to add t|he product to the cart.\n\ntextStatus: '" + textStatus + "'\nerrorThrown: '" + errorThrown + "'\nresponseText:\n" + XMLHttpRequest.responseText);
			//reactive the button when adding has finished
			$('#add_to_cart input').removeAttr('disabled').addClass('exclusive').removeClass('exclusive_disabled');
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
			alert(result);
		}
	}).always(function(){
        $.fancybox.close();
    });
}
    
