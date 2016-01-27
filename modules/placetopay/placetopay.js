$(document).ready(function(e) {	
	fancy = function(msm)
	{
		$html = '<div  style="padding:10%; text-align: center"><p class="msm">'+msm+'</p><img class="loader" src="/img/loader.gif"></div>';
		$.fancybox($html)
	}
	
	ProcesarPago = function(){
		fancy( "Por favor espere unos segundos, estamos procesando su orden");
		var msm = '';
		$.post( "/modules/matisses/createInvoice.php", function(data) {
				if(parseInt(data)==1)
				{
					$('.msm').fadeOut(400)
					setTimeout(function(){$('.msm').html('Redirigiendo a la pasarela').fadeIn(400)},400);
					$('.loader').fadeOut(400)
					window.location="/modules/placetopay/redirect.php";
				}else{

						$('.msm').fadeOut(400)
						setTimeout(function(){$('.msm').html(data).fadeIn(400)},400);
						$('.loader').fadeOut(400)
					 }

			})
			  .fail(function() {
				msm = "Lo sentimos! - se ha presentado un error al intentar generar el pago' /modules/wsmatisses/createInvoice.php";

				$('.msm').fadeOut(400)
				setTimeout(function(){$('.msm').html(msm).fadeIn(400)},400);
				$('.loader').fadeOut(400)
			});
	}

});