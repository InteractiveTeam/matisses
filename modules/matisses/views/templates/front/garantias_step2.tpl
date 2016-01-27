<form id="form1" name="form1" enctype="multipart/form-data" method="post" action="">
<div class="container">
  <h1 class="page-heading">{l s='Garantias' mod='matisses'}</h1>
  {include file="$tpl_dir./errors.tpl"}
 <h2> {l s='Suministro de informacion' mod='matisses'}</h2>
 
  <div class="row">
  
	<div class="grid_4">
   	  <h3>{l s='Seleccione el tipo de daño'}</h3>
        <p>{l s='Maximo %s daños' sprintf=[$nrodanos]}</p>
    	<ul id="tipo-dano">
        	{foreach from=$danos item=dano}
   		  <li id="{$dano.coddano}">{$dano.dano}</li>
            {/foreach}
        </ul> 
        
       
        <div class="form-group">
        <label for="asunto">{l s='Tipo de dano Reportado:'}</label>  <a href="#" onclick="$('#tipo').val('')">{l s='Borrar'}</a>
        <input type="text" name="tipo" id="tipo" class="form-control" value="{$tipo}" />
        
        </div>
        
    </div>
    <div class="grid_8">
    	<div class="form-group">
       	<label for="asunto">{l s='Asunto:'}</label>
        	<input type="text" name="asunto" id="asunto" value="{$asunto}" class="form-control" />
        </div>
        <div class="form-group">  
         <label for="resumen">{l s='Resumen (Detalle del daño)'}</label>
         <textarea name="resumen" cols="25" id="resumen" class="form-control">{$resumen}</textarea> 
        </div>  
        <input type="file" name="imagen" data-placeholder="{l s='Cargar imagen'}" class="hidden"/>
        <label for="imagen" class="btn btn-default button btn-red right">{l s='Cargar Imagen'}</label>  
        <button type="submit" name="submitStep1" id="submitStep1" class="btn btn-default button btn-red right"> {l s='Continuar' mod='matisses'}</button>
      
    </div>
  </div>
  <div class="footer_links cf grid_2">
    <div class="grid_2 omega alpha"> <a class="btn btn-default button btn-red" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}"> {l s='Volver a mi cuenta' mod='matisses'}</a> </div>
  </div>
</div>
</form>
