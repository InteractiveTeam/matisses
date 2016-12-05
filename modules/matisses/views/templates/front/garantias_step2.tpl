
{capture name=path}
		<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Authentication'}">{l s='Mi Cuenta'}</a>
		<i class="fa fa-angle-right"></i>{l s='Garantias'}
{/capture}
<script>
	var nrodanos = '{$rnrodanos}'
</script>
<form id="form1" name="form1" enctype="multipart/form-data" method="post" action="">
<input type="hidden" name="id_garantia"  value="{$garantia.id_garantia}" />
<div class="supply-warranty grid_12">
	<div class="container" id="step2">
  		<h1 class="page-heading">{l s='Garantías' mod='matisses'}</h1>
  		{include file="$tpl_dir./errors.tpl"}
 		<h2 class="page-subheading"> {l s='Suministro de informacion' mod='matisses'}</h2>

 		<div class="grid_4">
        <label>{l s='Seleccione el tipo de daño'}</label>
        <span>{l s='Máximo %s daños' sprintf=[$nrodanos]}</span>
        {if !empty($materials)}
        {foreach from=$materials item=row}
            <div>
                <a class="btn btn-default button btn-red material" data-id="{$row.id_value}" href="javascript:void(0)">
                    {$row.material}
                </a>
			</div>
            <div class="container-toggle danos{$row.id_value}" style="display:none">
			     <div class="scroll-left scroll-pane">
                    <ul id="tipo-dano" class="damage">
                        {foreach from=$row.damages item=dano}
                        <li id="{$dano.id_tipo}"  data-id="{$dano.acodigo}" data-value="{$row.material}-{$dano.aname}">{$dano.aname}</li>
                        {/foreach}
                    </ul>
                </div>
            </div>
			
            {/foreach}
            
            <div class="form-group">
                <label for="asunto">{l s='Tipo de dano Reportado:'}</label>  <a href="javascript:void(0)" onclick="$('#tipo').val('')">{l s='Borrar'}</a>
                <input type="text" name="tipo" id="tipo" readonly="readonly" class="form-control" value="{$_POST['tipo']}" />
                <input type="hidden" name"id-tipo" id="id-tipo" />
            </div>  
        {/if}
		</div> 
		<div class="grid_8">

				<div class="form-group grid_12 alpha omega">
					<label for="asunto">{l s='Asunto:'}</label>
					<input type="text" name="asunto" id="asunto" value="{$asunto}" class="form-control" />
				</div>
				<div class="form-group grid_12 alpha omega">
					<div class="grid_12 alpha omega">
						<label class="" for="resumen">{l s='Resumen (Detalle del daño)'}</label>
					</div>
					<div class="grid_12 alpha omega">
						<textarea class="grid_12 alpha omega form-control" name="resumen" cols="25" id="resumen" >{$resumen}</textarea>

                        <div class="captions grid_12 alpha omega">
                            <ul id="image-holder" class="slider">
                                {foreach from=$garantia.imgs item=$img key=kimg}
                                 <li><img src="{$link->getImageLink($garantia.imgs[$kimg],'img/garantias')}" class="img-responsive" /></li>
                                {/foreach}
                            </ul>
                        </div>
				        {if ($garantia.imgs|count)>0}
                            <script>
                        	$('#step2 .slider').bxSlider({
								  pagerCustom: '#step2 .captions'
							});
                        	</script>
                        {/if}



					</div>
					<div class="grid_12 alpha omega">
						<div class="grid_12 alpha omega right">
							<label for="imagen" class="btn btn-default button btn-red">{l s='Cargar Imagen'}</label>
							<button type="submit" name="submitStep2" id="submitStep2" class="btn btn-default button btn-red right"> {l s='Continuar' mod='matisses'}</button>
						</div>
					</div>
				</div>


		</div>

		<div class="footer_links grid_12">
			<div class="grid_2 omega alpha">
				<a class="btn btn-default button btn-red" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">
					<i class="fa fa-chevron-left"></i>
					{l s='Volver a mi cuenta' mod='matisses'}
				</a>
			</div>
		</div>

</div>
</div>
</form>
