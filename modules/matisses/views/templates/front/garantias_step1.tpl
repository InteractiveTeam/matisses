<div class="container">
  <h1 class="page-heading">{l s='Garantias' mod='matisses'}</h1>
  {include file="$tpl_dir./errors.tpl"}
  <ul class="myaccount-link-list">
    <li><a>{l s='Información general' mod='matisses'}</a></li>
  </ul>
  <div class="row">
    <div class="col-md-6"> <img src="{$config.confgaran_imagen}" class="img-responsive" /> </div>
    <div class="col-md-6">
      <p> {$config.confgaran_terminos} </p>
      <form method="post" action="" id="step1">
        <p>
          <input type="checkbox" checked="checked" name="accept" id="accept" value="1">
          {l s='He leido y acepto los terminos mensionados anteriormente' mod='matisses'}</p>
        <button type="submit" name="submitStep1" id="submitStep1" class="btn btn-default button btn-red right"> {l s='Continuar' mod='matisses'}</button>
      </form>
    </div>
  </div>
  <div class="footer_links cf grid_2">
    <div class="grid_2 omega alpha"> <a class="btn btn-default button btn-red" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}"> {l s='Volver a mi cuenta' mod='matisses'}</a> </div>
  </div>
</div>
