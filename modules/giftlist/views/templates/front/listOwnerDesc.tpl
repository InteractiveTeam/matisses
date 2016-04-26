{* Owner User *} 
{capture name=path}
<a href="{$all_link}">{l s='giftlist' mod='giftlist'}</a><i class="fa fa-angle-right"></i>{$list_desc['name']}
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}
{*List info*}
<div class="container">
	{if isset($response)}
	<div class="alert {if $error == true} alert-danger{else} alert-success{/if}  alert-dismissible" role="alert">
		<button type="button" data-dismiss="alert" id="closeMsg" class="close" 
		aria-label="Close"><span aria-hidden="true">&times;</span></button>
		{$response}
	</div>
	{/if}
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	  <div class="panel panel-default">
	    <div class="panel-heading" role="tab" id="headingOne">
	      <h2 class="panel-title">
	        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	          {$list_desc['name']}
	        </a>
	      </h2>
	    </div>
	    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
	      <div class="panel-body">
	         <div class="container">
	         	<div class="row">
	         		<div class="col-md-3">
	         			<div id="list-img-container" 
						style="background-image: 
							{if !empty($list_desc['image'])} 
								url('{$list_desc['image']}'); 
							{else}
								 url('{$content_dir}giftlist/uploads/not-found.jpg')
							{/if}
							">
						</div>
	         		</div>
	         		<div class="col-md-3">
	         			{if $list_desc['public'] == 1}
							<span class="label label-success">Publico <span class="icon-unlock"></span></span>
						{else}
							<span class="label label-danger">Privado <span class="icon-lock"></span></span>
						{/if}
						<p>
							Dirección de envio:
							<span>{$address->address} - {$address->town}, {$address->city}</span>
						</p>
						<p>{$event_type['name']}</p>
	         		</div>
	         		<div class="col-md-3">
	         			<p>Mensaje: {$list_desc['message']}</p>
	         		</div>
	         		<div class="col-md-3">
	         			<p><b>Fecha:</b> {date("d/m/Y H:i", strtotime($list_desc['event_date']))}</p>
						<p><b>Cantidad de invitados:</b> {$list_desc['guest_number']}</p>
						<a class="btn btn-success" data-toggle="tooltip" data-placement="bottom" title="Editar" href="{$admin_link}">Editar <span class="icon-pencil"></span></a>
	         		</div>
	         	</div>
	         </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	{*Products asociated to the list*}
	
	<div class="products-associated" data-id="{$list_desc['id']}">
		<h2>Productos</h2>
		<div class="row">
		{foreach from=$products item=row }
		{$atribute_group = $row['options'][3]->value}
			<div class="product-card col-md-3" id="prod-{$row['id']}" data-id="{$row['id']}">
				<div class="img-container" style="background-image: url('http://{$row['image']}')">
				</div>
				<p>{$row['name']}</p>
				{foreach from=$row['data'] item=att_group}
					{if $att_group['id_product_attribute'] == $atribute_group}
						<p>{$att_group['group_name']} : {$att_group['attribute_name']}</p>
					{/if}
				{/foreach}
				{$row['price']}
				<button class="delete-product" data-toggle="tooltip" data-placement="bottom" title="Quitar producto">Quitar producto</button>
			</div>
		{/foreach}
		</div>
	</div>
</div>

{*Bonds asociated to the list*}
	
<div class="bonds-associated" data-id="{$list_desc['id']}">
    <h2>Bonos</h2>
    <div class="row">
        <img src="asdf" >
        <span>Total : ${$bond['total']}</span> <br>
        <span>Total de bonos Regalados: {$bond['total_qty']}        
	</div>
</div>

<div class="hidden">
{literal} 
<script class="hidden" type="text/javascript"> 
	var list_desc = {/literal}{json_encode($list_desc)}{literal} 
</script>
<script type="text/javascript" src="{/literal}{$modules_dir}{literal}giftlist/views/js/listOwner.js"></script>
{/literal}
</div>
{literal}
<script type="text/javascript">
	var  address_cocreator = {/literal}{$address_cocreator}{literal};
</script>
{/literal}


