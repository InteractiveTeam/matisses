{* Owner User *} 
{capture name=path}
<a href="{$link->getModuleLink('giftlist','empezar')}">{l s='giftlist' mod='giftlist'}</a><i class="fa fa-angle-right"></i><a href="{$all_link}">{l s='Administrar listas' mod='giftlist'}</a><i class="fa fa-angle-right"></i>{$list_desc['name']}
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
	<div class="ax-general-info">
        <div class="ax-header-info">
            <h2>{l s='Información general' mod='giftlist'}</h2>
        </div>
        <div class="ax-content-info">
            <table> 
                <thead>
                    <tr>
                        <th>{l s='Código' mod='giftlist'}</th>
                        <th>{l s='Días para el evento' mod='giftlist'}</th>
                        <th>{l s='Tus regalos' mod='giftlist'}</th>
                        <th>{l s='Regalos restantes' mod='giftlist'}</th>
                        <th>{l s='Registrante' mod='giftlist'}</th>
                        <th>{l s='Tipo de evento' mod='giftlist'}</th> 
                        <th>{l s='Fecha' mod='giftlist'}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{$list_desc['code']}</td>
                        <td>{$days}</td>
                        <td>{$numberProducts.products}</td>
                        <td>{$numberProducts.products_bought}</td>
                        <td>
                            <p>{$creator}</p>
                        </td>
                        <td>{$event_type}</td>
                        <td>{date("d-m-Y",strtotime($list_desc['event_date']))}</td>    
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div id="ax-img-container">
        <img class="ax-cover-img" src="{$list_desc['image']}" width="920" height="300">
        <img class="ax-profile-img" width="300" src="{$list_desc['profile_img']}">
        <div class="ax-prof-buttons">
            <input type="file" id="ax-prof-up" />
            <a href="javascript:void(0);" id="ax-prof-delete">{l s='Eliminar imagen' mod='giftlist'}</a>
        </div>
        <div class="ax-cover-buttons">
            <input type="file" id="ax-cover-up" />
            <a href="javascript:void(0);" id="ax-cover-delete">{l s='Eliminar imagen' mod='giftlist'}</a>
        </div>
    </div>

    <div class="ax-message">
        <h2>{l s='Mensaje de bienvenida' mod='giftlist'}</h2>
        <p id="ax-message-content">{$list_desc['message']}</p>
        <a href="javascript:void(0);" id="ax-edit">{l s='Editar mensaje' mod='giftlist'}</a>
        <a href="javascript:void(0);" id="ax-delete">{l s='Eliminar mensaje' mod='giftlist'}</a>
    </div>
    
    <div clas="ax-address">
        <h2>{l s='Direcciones' mod='giftlist'}</h2>
        <a href="javascript:void(0);">{l s='Editar direcciones' mod='giftlist'}</a>
        <div class="row">
            <div class="col-md-6">
            {l s='Antes del evento' mod='giftlist'}
            {if $list_desc['address_before'] == "creator"}
               <p>{$address->address} {$address->town}, {$address->country}</p>
            {else}
                <p>{$address_cocreator->address} {$address_cocreator->town}, {$address_cocreator->country}</p>
            {/if}
            </div>
            <div class="col-md-6">
            {l s='Despúes del evento' mod='giftlist'}
            {if $list_desc['address_after'] == "creator"}
               <p>{$address->address} {$address->town}, {$address->country}</p>
            {else}
                <p>{$address_cocreator->address} {$address_cocreator->town}, {$address_cocreator->country}</p>
            {/if}
            </div>
        </div>
    </div>
    
    <div class="ax-categories">
    <h3>{l s='Añadir productos' mod='giftlist'}</h3>
        <ul class="slider">
            {foreach item=cat from=$cats}
                {if $cat.id_parent == 3}
                {assign var="cat_img" value="/img/c/{$cat.id}-categories_home.jpg"}
                <li>
                    <a href="/{$cat.id_category}-{$cat.link_rewrite}">
                    {if file_exists($cat_img)} 
                        <img class="replace-2x" src="{$cat_img}" alt="" />
                    {else}
                        <img class="replace-2x" src="/img/c/nl-default-categories_home.jpg" alt="" />
                    {/if}
                    <p>{$cat.name}</p>
                    </a>
                </li>
                {/if}
            {/foreach}
        </ul>
    </div>
	
	<div class="products-associated" data-id="{$list_desc['id']}">
		<h2>{l s='Mi lista' mod='giftlist'}</h2>
        <a href="javascript::void(0);">{l s='Editar lista' mod='giftlist'}</a>
		<div class="row">
            <div class="product-card col-md-3" data-id="{$list_desc['id']}">
                <img src="http://lorempixel.com/282/262/">
                <span>{l s='Total bonos' mod='giftlist'} : {convertPrice price=$bond['total']}</span> <br>       
            </div>
		{foreach from=$products item=row}
		{$atribute_group = $row['options'][3]->value}
			<div class="product-card col-md-3" id="prod-{$row['id']}" data-id="{$row['id']}">
				<div class="img-container" style="background-image: url('http://{$row['image']}')">
				</div>
                <i class="fa fa-heart" aria-hidden="true" {if $row['favorite']}style="color: red;"{/if}></i>
				<p>{$row['name']}</p>
				{foreach from=$row['data'] item=att_group}
					{if $att_group['id_product_attribute'] == $atribute_group}
						<p>{$att_group['group_name']} : {$att_group['attribute_name']}</p>
					{/if}
				{/foreach}
                {convertPrice price=$row['price']}
                {*<p>{l s='Cantidad:'} {$row['group']->wanted}</p>
				<button class="delete-product" data-toggle="tooltip" data-placement="bottom" title="Quitar producto">Quitar producto</button>*}
			</div>
		{/foreach}
		</div>
	</div>
</div>

<a href="{$share_list}" data-id="{$row['id']}" data-toggle="tooltip" data-placement="bottom" title="{l s='Compartir lista' mod='giftlist'}" class="share-list btn btn-default btn-sm">{l s='Compartir' mod='giftlist'} <span class="icon-mail-forward"></span></a>

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


