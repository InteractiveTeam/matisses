$(document).ready(function() {
	$('#btn-edit').magnificPopup({
		type: 'ajax',
		preloader: false,
		focus: '#name',
		modal: true,

		// When elemened is focused, some mobile browsers in some cases zoom in
		// It looks not nice, so we disable it:
		callbacks: {
			beforeOpen: function() {
				if($(window).width() < 700) {
					this.st.focus = false;
				} else {
					this.st.focus = '#name';
				}
			},
			ajaxContentAdded: function(){
				$('#event_date').datetimepicker({
					 minDate:'1',
					 format:"d/m/Y H:i",
					 mask:true
				});
				validate();
				$('#tel').mask("000-00-00", {placeholder: "___-__-__"});
				$('#cel').mask("000-000-0000", {placeholder: "___-___-____"});
				//fill form
				$("#form-title").text("Editar Lista");
				$("#name").val(list_desc.name);
				$("#id_list").val(list_desc.id);
				$("#event_type").val(list_desc.event_type);
				$("#event_date").val(list_desc.event_date);
				$("#guest_number").val(list_desc.guest_number);
				$("#max_amount").val(list_desc.max_amount);
				$("#message").val(list_desc.message);
				$('#public').prop('checked',list_desc.public == 1 ? 'checked' : '');
				$('#recieve_bond').prop('checked',list_desc.recieve_bond == 1 ? 'checked' : '');
				var dir = JSON.parse(list_desc.info_creator);
				$("#city").val(dir.city);
				$("#town").val(dir.town);
				$("#address").val(dir.address);
				$("#tel").val(dir.tel);
				$("#cel").val(dir.cel);
				//issetcocreator
				if(typeof address_cocreator != 'undefinded' && address_cocreator != ""){
					$('#tel_co').mask("000-00-00", {placeholder: "___-__-__"});
					$('#cel_co').mask("000-000-0000", {placeholder: "___-___-____"});
					$("#id_list_co").val($(".products-associated").attr("data-id"));
					$("#city_co").val(address_cocreator.city);
					$("#town_co").val(address_cocreator.town);
					$("#address_co").val(address_cocreator.address);
					$("#tel_co").val(address_cocreator.tel);
					$("#cel_co").val(address_cocreator.cel);
				}
			}
		}
	});

	$('#btn-edit-info').magnificPopup({
		type: 'ajax',
		preloader: false,
		focus: '#city',
		modal: true,

		// When elemened is focused, some mobile browsers in some cases zoom in
		// It looks not nice, so we disable it:
		callbacks: {
			beforeOpen: function() {
				if($(window).width() < 700) {
					this.st.focus = false;
				} else {
					this.st.focus = '#name';
				}
			},
			ajaxContentAdded: function(){
				validate();
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
		}
	});

	$(document).on('click', '.popup-modal-dismiss', function (e) {
		e.preventDefault();
		$.magnificPopup.close();
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
 			}
	});
});

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

	//validar
function validate(){
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
			}
		},
		message:{
			required:"El campo es requerido"
		}/*,
		submitHandler: function(form) {
			$(form).submit();
		}*/
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
			alert("Impossible to add the product to the cart.\n\ntextStatus: '" + textStatus + "'\nerrorThrown: '" + errorThrown + "'\nresponseText:\n" + XMLHttpRequest.responseText);
			//reactive the button when adding has finished
			$('#add_to_cart input').removeAttr('disabled').addClass('exclusive').removeClass('exclusive_disabled');
		}
	});
}
