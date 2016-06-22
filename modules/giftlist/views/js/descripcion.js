$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();

	$('#btn-edit-info').fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600, 
		'speedOut'		:	200, 
		'overlayShow'	:	false,
		'type'			: 	'ajax',
		afterShow		:   function(){
            $("#info_cocreator").validate();
            $('#tel_co').mask("000-00-00", {placeholder: "___-__-__"});
            $('#cel_co').mask("000-000-0000", {placeholder: "___-___-____"});
            $("#id_list").val($(".products-associated").attr("data-id"));
            if(typeof address_cocreator != 'undefinded' && address_cocreator != ""){
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

	setTimeout(function() {
		$("#closeMsg").parent().remove();
	}, 8000);

	$(".product-card").hover(function(){
		$(this).find(".add_container").toggle();
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
});

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
            console.log("gol");
        },
        error: function(res){
            console.log("no :(");
        }, 
    }).always(function(){
            mc.text(message);
            mc.show();
            $("#ax-edit").show();
            $("#ax-delete").show();
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
