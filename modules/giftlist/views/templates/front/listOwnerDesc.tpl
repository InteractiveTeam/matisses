{* Owner User *} 
{capture name=path}
<a href="{$all_link}">{l s='giftlist' mod='giftlist'}</a><i class="fa fa-angle-right"></i>{$list_desc['name']}
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}
{*List info*}
<div class="container">
    <h1>{$list_desc['name']}</h1>
	{if isset($response)}
	<div class="alert {if $error == true} alert-danger{else} alert-success{/if}  alert-dismissible" role="alert">
		<button type="button" data-dismiss="alert" id="closeMsg" class="close" 
		aria-label="Close"><span aria-hidden="true">&times;</span></button>
		{$response}
	</div>
	{/if}
    <pre>
    </pre>
	<div class="ax-general-info">
        <div class="ax-header-info">
            <h2>{l s='Información general' mod='giftlist'}</h2>
        </div>
        <div class="ax-content-info">
            <table> 
                <thead>
                    <tr>
                        <th>{l s='Creadores' mod='giftlist'}</th> 
                        <th>{l s='Código' mod='giftlist'}</th> 
                        <th>{l s='Evento' mod='giftlist'}</th> 
                        <th>{l s='Días para el evento' mod='giftlist'}</th> 
                        <th>{l s='Fecha' mod='giftlist'}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <p>{$creator}</p>
                            <p>{$cocreator}</p>
                        </td>
                        <td>{$list_desc['code']}</td>
                        <td>{$event_type}</td>
                        <td>{$days}</td>
                        <td>{date("d-m-Y",strtotime($list_desc['event_date']))}</td>    
                    </tr>
                </tbody>
            </table>
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


