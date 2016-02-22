$(document).ready(function(e) {
    $('.color_to_pick_list li a').on('click',function(e){
		e.preventDefault();
		var data = {
			'id_product_attribute': $(this).attr('data-idproductattribute'),
			'id_product': $(this).attr('data-idproduct'),
			'id_attribute': $(this).attr('data-idattribute'),
		}
		var url = baseUri+'modules/matisses/colors.php';
		
		$.ajax({
		  type: "POST",
		  url: url,
		  data: data,
		  success: function(data){
			  data = JSON.parse(data);
			  $('#'+data.id_product+' .product_img_link img').attr('src',data.image);
			  
			  var href = $('#'+data.id_product+' .ajax_add_to_cart_button').attr('href')+'&id_product_attribute='+data.id_product_attribute;
			  $('#'+data.id_product+' .ajax_add_to_cart_button').attr('data-id-product-attribute',data.id_product_attribute).attr('href',href);
			  
		  }
		});
		
	})
});