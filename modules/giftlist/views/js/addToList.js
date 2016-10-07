$(function(){
	$(".keep-buy").click(function(){
		$.fancybox.close();
	});

	$("#btn_gift_list").click(function(e){
		e.preventDefault();
		$("#cant").val($("#quantity_wanted").val());
	});
/*'afterLoad': function(){
            if(!$('html').hasClass('fancybox-margin')){
                $('html').addClass('fancybox-margin fancybox-lock');
            }
            console.log($('html').hasClass('fancybox-margin'));
        },
        'afterClose': function(){
            $('html').removeClass('fancybox-margin fancybox-lock');            
        },*/
	$("#btn_gift_list").fancybox({
		'autoSize'      :   false,
		'height'        :   340,
		'width'			:    600,
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600,
		'speedOut'		:	200,
		'overlayShow'	:	true,        
        afterClose      : function(){
            if(isApple()){ $('body').css({'position': ''}); }
        },
        afterShow       :   function(){
            if(isApple()){ $('body').css({'position': 'fixed'}); }
            var min_val = document.getElementById('cant');
            min_val.onkeydown = function(e) {
                if(!((e.keyCode > 95 && e.keyCode < 106)
                  || (e.keyCode > 47 && e.keyCode < 58) 
                  || e.keyCode == 8)) {
                    return false;
                }
            }; 
            var cant_group = document.getElementById('cant_group');
            cant_group.onkeydown = function(e) {
                if(!((e.keyCode > 95 && e.keyCode < 106)
                  || (e.keyCode > 47 && e.keyCode < 58) 
                  || e.keyCode == 8)) {
                    return false;
                }
            }; 
        }
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
                        $(".att").empty()
                        res.attributes.forEach(function(row){
                            $(".att").append("<p>"+row.value+"</p>");
                        });
                        $(".price").text(res.price);
                        $(".image-prod").css("backgroundImage","url("+res.image+")");
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
                        'content' : 'No se puedo añadir a la lista, inténtalo más tarde'
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