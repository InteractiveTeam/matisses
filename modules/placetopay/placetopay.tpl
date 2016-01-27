{*
 *  @author    Enrique Garcia M. <ingenieria@egm.co>
 *  @copyright (c) 2012 EGM Ingenieria sin fronteras S.A.S.
 *  @version   1.0
*}

<!--{$base_dir_ssl}modules/placetopay/redirect.php-->

{literal}
<script>
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

</script>
{/literal}



<p class="payment_module">
	{if $hasPending}
		<img src="https://www.placetopay.com/images/providers/placetopay_xh48.png" alt="{l s='Pay with Place to Pay' mod='placetopay'}" />
		<b>{l s='Pay with Place to Pay' mod='placetopay'}</b> {l s='(credit cards and debits account)' mod='placetopay'}
		<br/>
		<p><b>&gt;&gt; {l s='Warning' mod='placetopay'}</b></p>
		<p>{l s='At this time your order' mod='placetopay'} <b>#{$lastOrder}</b>
		{l s='presents a checkout transaction which is pending to receive confirmation from your bank, please wait a few minutes and check back later to see if your payment was successfully confirmed.' mod='placetopay'}<br/>
		</p>
		<p>
		{l s='For more information on the current state of your operation can contact our customer service line in' mod='placetopay'}
		<b>{$storePhone}</b> {l s='or send your questions to' mod='placetopay'} <b>{$storeEmail}</b> {l s='and ask for the status of the transaction:' mod='placetopay'} <b>{$lastAuthorization|default:"N/D"}</b>.
		</p>
	{else}
		<div id="contentPlaceToPay" class="cf">
            <div class="datosPlaceToPay cf">
                <img src="https://www.placetopay.com/images/providers/placetopay_xh48.png" alt="{l s='Pay with Place to Pay' mod='placetopay'}" />
                <b>{l s='Pay with Place to Pay' mod='placetopay'}</b> {l s='(credit cards and debits account)' mod='placetopay'}<br/>
                {l s='Place to Pay secure web site will be displayed when you select this payment method.' mod='placetopay'}<br/>
            </div>
            
			
            <div class="btnPagar cart_navigation" >
                <a href="javascript:ProcesarPago()" onclick="" class="placetopay button-exclusive btn btn-default" title="{l s='Pay with Place to Pay' mod='placetopay'}">{l s='Realizar Pago'}</a>
              <!-- <a href="{$base_dir_ssl}modules/placetopay/redirect.php" class="placetopay" title="{l s='Pay with Place to Pay' mod='placetopay'}">{l s='Realizar Pago'}</a>-->
            </div>
        </div>
	{/if}
</p>


