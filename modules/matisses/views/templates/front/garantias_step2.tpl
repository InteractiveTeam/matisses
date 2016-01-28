{capture name=path}
		<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Authentication'}">{l s='Mi Cuenta'}</a>
		<span class="navigation-pipe">{$navigationPipe}</span>{l s='Garantias'}
{/capture}
<script>
	var nrodanos = '{$rnrodanos}'
</script>
<form id="form1" name="form1" enctype="multipart/form-data" method="post" action="">
<input type="hidden" name="id_garantia"  value="{$garantia.id_garantia}" />
<div class="container" id="step2">
  <h1 class="page-heading">{l s='Garantias' mod='matisses'}</h1>
  {include file="$tpl_dir./errors.tpl"}
 <h2> {l s='Suministro de informacion' mod='matisses'}</h2>
 
  <div class="row">
  
	<div class="grid_4">
   	  <h3>{l s='Seleccione el tipo de daño'}</h3>
        <p>{l s='Maximo %s daños' sprintf=[$nrodanos]}</p>
    	<ul id="tipo-dano">
        	{foreach from=$danos item=dano}
   		  <li id="{$dano.coddano}" data-value="{$dano.dano}">{$dano.dano}</li>
            {/foreach}
        </ul> 
        
       
        <div class="form-group">
        <label for="asunto">{l s='Tipo de dano Reportado:'}</label>  <a href="#" onclick="$('#tipo').val('')">{l s='Borrar'}</a>
        <input type="text" name="tipo" id="tipo" readonly="readonly" class="form-control" value="{$tipo}" />
        
        </div>
        
    </div>
    <div class="grid_8">
    	<div class="grid_6">
			<ul class="slider">
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
        
    	<div class="form-group">
       	<label for="asunto">{l s='Asunto:'}</label>
        	<input type="text" name="asunto" id="asunto" value="{$asunto}" class="form-control" />
        </div>
        <div class="form-group">  
         <label for="resumen">{l s='Resumen (Detalle del daño)'}</label>
         <textarea name="resumen" cols="25" id="resumen" class="form-control">{$resumen}</textarea> 
        </div>  
        <label for="imagen" class="btn btn-default button btn-red right">{l s='Cargar Imagen'}</label>  
        <button type="submit" name="submitStep2" id="submitStep2" class="btn btn-default button btn-red right"> {l s='Continuar' mod='matisses'}</button>
      </div>
    </div>
  </div>
  <div class="footer_links cf grid_2">
    <div class="grid_2 omega alpha"> <a class="btn btn-default button btn-red" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}"> {l s='Volver a mi cuenta' mod='matisses'}</a> </div>
  </div>
</div>
</form>
