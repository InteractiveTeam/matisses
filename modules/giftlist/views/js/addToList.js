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
		'height'        :   'auto',
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
	
	$("#add-list").click(function(){
		if($("#lists").val() != 0){
			var dataForm = {
					'list': $("#lists").val(),
					'cant':$("#cant").val(),
					'cant_group': $("#group").prop("checked") ? $("#cant_group").val() : null,
					'message': $("#message").val(),
					'fav': $("#fav").prop("checked"),
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
                        alert(res.msg);
                        $("#add-list").attr("disabled", true);
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
                             'speedIn': 500,
                             'speedOut': 300,
                             'autoDimensions': true,
                             'centerOnScroll': true,
                             'href' : '#contentdiv'
                          });
                    }
				},
				error: function(res){
					console.log("I'm sorry");
				}
			});
		}else{
			alert("Seleccione una lista");
		}
	});
});