{capture name=path}
		<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Authentication'}">{l s='Mi Cuenta'}</a>
		<span class="navigation-pipe">{$navigationPipe}</span>{l s='Garantias'}
{/capture}
<div class="container">
  <h1 class="page-heading">{l s='Garantias' mod='matisses'}</h1>
  {include file="$tpl_dir./errors.tpl"}
  <ul class="myaccount-link-list">
    <li><a>{l s='Información general' mod='matisses'}</a></li>
  </ul>
  <div class="row">
    <div class="col-md-6"> 
    
    <img src="{$config.confgaran_imagen}" class="img-responsive" />
    
     </div>
    <div class="col-md-6">
      <p> {$config.confgaran_terminos} </p>
      <form method="post" action="" name="form1" id="step1">
        <p>
        <input type="hidden" value="submitStep1" name="submitStep1" />
          <input type="checkbox" checked="checked" name="accept" id="accept" value="1">
          {l s='He leido y acepto los terminos mensionados anteriormente' mod='matisses'}</p>
        	<button type="submit" name="submitStep1" id="submitStep1" value="1" class="btn btn-default button btn-red right"> {l s='Continuar' mod='matisses'}</button>
      </form>
    </div>
  </div>
  <div class="footer_links cf grid_2">
    <div class="grid_2 omega alpha"> <a class="btn btn-default button btn-red" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}"> {l s='Volver a mi cuenta' mod='matisses'}</a> </div>
  </div>
</div>
