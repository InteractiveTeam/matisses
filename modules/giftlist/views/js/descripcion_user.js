var jp;
$(document).ready(function(){
    $(".ax-print").click(function(){
        window.print();
    });
    
    $(document).on('click', '.popup-modal-dismiss', function (e) {
		e.preventDefault();
		$.fancybox.close();
	});
    
    $(".ax-cancel").on('click', function (e) {
		e.preventDefault();
		$.fancybox.close();
	});
    
    //add to cart

	$(".add-to-cart").click(function(e){
		var product_card = $(this).parent().parent();
		total = product_card.find(".total_qty").attr("data-cant");
        if(total > product_card.find(".total_qty").attr("data-value"))
            total = parseInt(product_card.find(".total_qty").attr("data-value"));
		addFromList(product_card.attr("data-id"),product_card.find(".prod-attr").val(), total, $(this),$(".products-associated").attr("data-id"));
	});

	//buy bond
	$("#add_bond").fancybox({
        'autoSize'      :   false,
        'height'        :   340,    
        'width'			:   600,
        'transitionIn'	:	'elastic',
        'transitionOut'	:	'elastic',
        'speedIn'		:	600,
        'speedOut'		:	200,
        'overlayShow'	:	false,
        type: 'ajax',
        afterShow  :   function() {
            $("#luxury_bond").uniform();
            validateBondForm();
            $("#mount").attr("min",min_amount);
        }
    });
    
    $(".ax-more").on("click",function(e){
        var el = $(this);
        $.ajax({
            type: "POST",
            data:{
                'id_prod':el.parent().parent().attr('data-id'),
                ajax:true,
                method:"productDetail",
                id_list: $(".products-associated").attr('data-id'),
            },
            success: function(res){
                res = JSON.parse(res);
                $(".ax-det-img").attr("src",res.image);
                $(".ax-det-name").text(res.name);
                $(".ax-det-ref").text(res.reference);
                $(".ax-det-reviews").html(res.reviews);
                $(".ax-det-desc").html(res.desc);
                $(".ax-det-price").text(res.price);
                $(".ax-det-sol").text(res.total);
                $(".ax-det-falt").text(res.missing);
                $(".color_pick").css("background",res.style);
                $(".color_pick").attr("title",res.colorName);
                $.fancybox({
                'autoSize'      :   false,
                'minHeight'        :   340,    
                'minWidth'			:   600,
                'transitionIn'	:	'elastic',
                'transitionOut'	:	'elastic',
                'speedIn'		:	600,
                'speedOut'		:	200,
                'overlayShow'	:	false,
                href            :   "#productDiv",
                });
            }
        });
    });
    
    jp = $('#ax-products').jplist({				
      itemsBox: '.ax-prod-cont', 
      itemPath: '.product-card' 
      ,panelPath: '.jplist-panel'	
   });
});

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
			var error = "Imposible añadir al carrito";
				if (!!$.prototype.fancybox)
				    $.fancybox.open([
				    {
				        type: 'inline',
				        autoSize    : true,
                        autoScale   : true,
                        fitToView   : true,
				        //minHeight: 30,
				        content: '<p class="fancybox-error">' + error + '</p>'
				    }],
					{
				        padding: 0
				    });
				else
				    alert(error);
				//reactive the button when adding has finished
				if (addedFromProductPage)
					$('#add_to_cart input').removeAttr('disabled').addClass('exclusive').removeClass('exclusive_disabled');
				else
					$(callerElement).removeProp('disabled');
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