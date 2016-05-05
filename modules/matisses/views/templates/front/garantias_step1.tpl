{capture name=path}
		<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Authentication'}">{l s='Mi Cuenta'}</a>
		<i class="fa fa-angle-right"></i>{l s='Garantias'}
{/capture}
<div class="container">
	<div class="warranty grid_12 alpha omega">
		<h1 class="page-heading">{l s='Garantías' mod='matisses'}</h1>
		{include file="$tpl_dir./errors.tpl"}
		<h2 class="page-subheading">{l s='Información general' mod='matisses'}</h2>
			<div class="content-warranty grid_12">
				<div class="grid_5 left-w">
					<img src="{$config.confgaran_imagen}" class="img-responsive" />
				</div>
			    <div class="grid_7 right-w">
					<p>{$config.confgaran_terminos} </p>
					<a class="grid_12 alpha omega view-more" href="#">{l s='Ver más' mod='matisses'}</a>
					<form class="grid_12 alpha omega" method="post" action="" name="form1" id="step1">
						<input type="hidden" value="submitStep1" name="submitStep1" />
						<input type="checkbox" checked="checked" name="accept" id="accept" value="1">
						<p>{l s='He leido y acepto los terminos mensionados anteriormente' mod='matisses'}</p>
					</form>
					<button type="submit" name="submitStep1" id="submitStep1" value="1" class="btn btn-default btn-red right"> {l s='Continuar' mod='matisses'}</button>

			    </div>
				<div class="footer_links grid_12">
					<a class="btn btn-default btn-red" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">
						<i class="fa fa-chevron-left"></i>
						{l s='Volver a mi cuenta' mod='matisses'}
					</a>
				</div>
			</div>
</div>
