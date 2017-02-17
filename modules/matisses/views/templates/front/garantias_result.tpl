{capture name=path} <a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Authentication'}">{l s='Mi Cuenta'}</a> <i class="fa fa-angle-right"></i>{l s='Garantias'}
{/capture}
<script>
	var nrodanos = '{$rnrodanos}'
</script>
<form id="form1" name="form1" enctype="multipart/form-data" method="post" action="">
  <div class="container" id="resumen-garantia">
    <h1 class="page-heading">{l s='Garantias' mod='matisses'}</h1>
    {include file="$tpl_dir./errors.tpl"}
    <h2 class="page-subheading"> {l s='Resumen de la garantia' mod='matisses'}</h2>
    <div class="grid_6">
      <h3>{l s="TICKET DE LA GARANTIA"} {$garantia.id_garantia}</h3>
      <ul class="slider slider-result">
      {foreach from=$garantia.imgs item=$img key=kimg}
        <li><img src="{$link->getImageLink($garantia.imgs[$kimg],'img/garantias')}" /></li>
      {/foreach}
      </ul>
      <ul class="captions">
        {foreach from=$garantia.imgs item=$img key=kimg}
        	<li><a data-slide-index="{$kimg}" href=""><img src="{$link->getImageLink($garantia.imgs[$kimg],'img/garantias')}" class="img-responsive" /></a></li>
        {/foreach}
      </ul>
    </div>
    <div class="grid_6">
      <ul>
        <li><strong>{l s="Nombre:"}</strong> {$garantia.firstname} {$garantia.lastname} </li>
        <li><strong>{l s="Asunto:"}</strong>{$garantia.asunto}</li>
        <li><strong>{l s="Producto:"}</strong>{$garantia.name}</li>
        <li><strong>{l s="Referencia:"}</strong>{$garantia.reference}</li>
        <li><strong>{l s="Tipo de daño:"}</strong>{$garantia.tipo}</li>
        <li><strong>{l s="Descripcion del daño:"}</strong><br />
         {$garantia.description_dano}</li>
        {*<li><strong>{l s="Respuesta de matisses:"}</strong>
          <textarea readonly="readonly" class="form-control">
          </li>
        </textarea>*}
      </ul>
			<div class="linkGarantias">
				<a class="btn btn-default button btn-red" href="{$link->getModuleLink('matisses','garantias')}/step2/producto/{$garantia.id_order}-{$garantia.id_product}-{$garantia.id_product_attribute}"> {l s='Modificar' mod='matisses'}</a>
	      <a class="btn btn-default button btn-red" href="{$link->getModuleLink('matisses','garantias')}/estado"> {l s='Ir a mis garantías' mod='matisses'}</a>
			</div>
    </div>
  </div>
  <div class="footer_links cf grid_12">
    <div class="grid_2 omega alpha"> <a class="btn btn-default button btn-red" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}"><i class="fa fa-angle-left"></i> {l s='Volver a mi cuenta' mod='matisses'}</a> </div>
  </div>
  </div>
</form>
