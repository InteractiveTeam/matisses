$(document).ready(function() {
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
				console.log(result);
				$("#prod-"+id_product).remove();
			}
		});
	});
});