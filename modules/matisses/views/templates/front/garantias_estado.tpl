<div class="container">
    <div class="warranty-history">
    <h1 class="page-heading">{l s='Garantias' mod='matisses'}</h1>
    {include file="$tpl_dir./errors.tpl"}
    <h2 class="page-subheading"> {l s='Histórico de garantias' mod='matisses'}</h2>

    <div class="table-responsive">
      <table class="table">
        <thead>
            <tr>
              <th scope="col">{l s='TICKET' mod='matisses'}</th>
              <th scope="col">{l s='FECHA' mod='matisses'}</th>
              <th scope="col">{l s='ESTADO' mod='matisses'}</th>
              <th scope="col">{l s='VER' mod='matisses'}</th>
            </tr>
        </thead>
        {foreach from=$garantias item=garantia}
        <tr>
          <td>{$garantia.id_garantia}</td>
          <td>{$garantia.fecha}</td>
          <td>{$garantia.status}</td>
          <td>
          <div class="options">
          	<a href="javascript:void(0)" id="showdetail" data-id="{$garantia.id_garantia}">{l s='Ver detalle'}</a>
          	<a href="javascript:void(0)" id="closedetail" data-id="{$garantia.id_garantia}">{l s='Cerrar detalle'}</a></td>
          </div>
        </tr>
        <tr>
        <tr>
          <td id="{$garantia.id_garantia}" class="details" colspan="4">
            <div class="grid_5">
              <h3>{l s="TICKET DE LA GARANTIA"} <span>#{$garantia.id_garantia}</span></h3>
              <ul class="slider">
              {foreach from=$garantia.imgs item=$img key=kimg}
                <li><img src="{$link->getImageLink($garantia.imgs[$kimg],'img/garantias')}" /></li>
              {/foreach}
              </ul>
              <ul class="captions cf">
                {foreach from=$garantia.imgs item=$img key=kimg}
                    <li><a data-slide-index="{$kimg}" href=""><img src="{$link->getImageLink($garantia.imgs[$kimg],'img/garantias')}" class="img-responsive" /></a></li>
                {/foreach}
              </ul>
            </div>
            <div class="grid_7">
              <ul class="attributes cf">
                <li><strong>{l s="Nombre:"}</strong> {$garantia.firstname} {$garantia.lastname} </li>
                <li><strong>{l s="Asunto:"}</strong> {$garantia.asunto} </li>
                <li><strong>{l s="Producto:"}</strong> {$garantia.name}</li>
                <li><strong>{l s="Referencia:"}</strong> {$garantia.reference}</li>
                <li><strong>{l s="Tipo de daño:"}</strong> {$garantia.tipo}</li>
                <li><strong>{l s="Descripcion del daño:"}</strong><br />
                 {$garantia.resumen}</li>
                <li><strong>{l s="Historial:"}</strong>
                  <table class="tbl-history">
                    {foreach from=$garantia.history item=history}
                    <tr>
                      <td width="105px"><span>{$history.fecha}</span></td>
                      <td>{$history.description}</td>
                    </tr>
                    {/foreach}
                  </table>
                </li>
              </ul>
                <div class="footer_links grid_12">
                  <a class="btn btn-default btn-red" href="{$link->getModuleLink('matisses','garantias')}/step2/producto/{$garantia.id_order}-{$garantia.id_product}-{$garantia.id_product_attribute}"> {l s='Modificar' mod='matisses'}</a>
                  <a class="btn btn-default btn-red" href="{$link->getModuleLink('matisses','garantias')}/nueva"> {l s='Ir a mis garantías' mod='matisses'}</a>
                  </div>
            </div>
            </td>
        </tr>
        {/foreach}
      </table>
    </div>

    <div class="footer_links grid_12 omega alpha">
        <a class="btn btn-default  btn-red" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}"> <i class="fa fa-chevron-left"></i>{l s='Volver a mi cuenta' mod='matisses'}</a>
    </div>
  </div>
</div>
