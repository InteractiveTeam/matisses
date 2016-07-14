$(function(){
	$(".keep-buy").click(function(){
		$.fancybox.close();
	});

	$("#btn_gift_list").click(function(e){
		e.preventDefault();
		$("#cant").val($("#quantity_wanted").val());
	});

	$("#btn_gift_list").fancybox({
		'autoSize'      :   false,
		'height'        :   340,
		'width'			:    600,
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600, 
		'speedOut'		:	200, 
		'overlayShow'	:	false
	});

	$("#group").click(function(){
		$("#group-options").toggle();
	});
	
	$("#add-list").click(function(e){
        e.preventDefault();
		if($("#lists").val() != 0){
			var dataForm = {
					'list': $("#lists").val(),
					'cant':$("#cant").val(),
					'cant_group': $("#group").prop("checked") ? $("#cant_group").val() : null,
					'message': $("#message").val(),
					'fav': ($("#fav").prop("checked") ? 1 : 0),
					'group': ($("#group").prop("checked") ? 1 : 0),
					'form': $("#buy_block").serializeArray()
				}
			$.ajax({
				type: "post",
				url: url_desc,
				data: {
					ajax: true,
					id: id_product,
					method: "addProduct",
					data: dataForm
				},
				success: function(res){
                    $.fancybox.close();
					res = JSON.parse(res);
                    if(res.error == true){
                         $.fancybox({
                            'autoScale': true,
                            'transitionIn': 'elastic',
                            'transitionOut': 'elastic',
                            'minWidth': 435,
                            'speedIn': 500,
                            'speedOut': 300,
                            'autoDimensions': true,
                            'centerOnScroll': true,
                            'content' : res.msg
                        });
                        $("#add-list").removeAttr("id");
                    }else{
                        $(".response").text(res.msg);
                        $(".prod_name").text(res.prod_name);
                        res.attributes.forEach(function(row){
                            $(".att").append("<p>"+row.value+"</p>");
                        });
                        $(".price").text(res.price);
                        $(".image-prod").css("background","url("+res.image+") center");
                        $(".see-list").attr("href",res.description_link);
                        $.fancybox.close();
                        $.fancybox({
                             'autoScale': true,
                             'transitionIn': 'elastic',
                             'transitionOut': 'elastic',
                             'minWidth': 435,
                             'speedIn': 500,
                             'speedOut': 300,
                             'autoDimensions': true,
                             'centerOnScroll': true,
                             'href' : '#contentdiv'
                          });
                    }
				},
				error: function(res){
					 $.fancybox({
                        'autoScale': true,
                        'transitionIn': 'elastic',
                        'transitionOut': 'elastic',
                        'minWidth': 435,
                        'speedIn': 500,
                        'speedOut': 300,
                        'autoDimensions': true,
                        'centerOnScroll': true,
                        'content' : 'No se puedo añadir a la lista, intentalo mas tarde'
                    });
				}
			});
		}else{
            var group = $("#lists").parents(".form-group");
            if(!group.find(".label-error").length){
                var errorLb = $("<span>").addClass("label-error").text("Selecciona una lista");
                group.append(errorLb);
            }
            return false;
		}
	});
    
    $("#lists").on('change',function(){
        var group = $("#lists").parents(".form-group");
        if(group.find(".label-error").length){
            group.find(".label-error").remove();
        }
    });
});