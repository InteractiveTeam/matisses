<div class="facebook-login grid_6 alpha">
	<div class="header-facebook">
		<div class="icon-facebook "></div>
		<div class="title-facebook">
			<h2>{l s='Conéctate con Facebook' mod='matisses'}</h2>
		</div>
	</div>
	<div class="content-facebook grid_12">
	    <p>
	    	{l s='Ingresa a nuestro portal de' mod='matisses'}<b> {l s='Matisses' mod='matisses'}</b>
	        {l s='desde tu cuenta de Facebook y prepárate a vivir una experiencia diferente transformando tus espacios.' mod='matisses'}
	    </p>
	</div>
	<div class="btn-facebook grid_12">
    	<a class="btn btn-default" id="link-create-fb-account" href="javascript:void(0)" onclick="fb_login()">
			<i class="fa fa-facebook"></i>
			{l s='Connect' mod='matisses'}
		</a>
	</div>
</div>
<script>
	var ajaxurl = window.location.origin+'{$module_dir}ajax.php';
</script>
