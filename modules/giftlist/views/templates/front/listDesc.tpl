{* Not Logged User AND searched list *}
<h1>{$list_desc['name']}</h1>

<div class="ax-avatar-content">
    <div id="ax-cover-container">
        <div class="cont-img">
            <img class="ax-cover-img" src="{if !empty($list_desc['image'])}{$list_desc['image']}{else}{$modules_dir}/giftlist/views/img/banner.jpg{/if}" width="920" height="300">
        </div>
    </div>
    <div id="ax-prof-container">
        <div class="cont-img">
            <div class="ax-profile-img" width="180" style="background-image: url('{if !empty($list_desc['profile_img'])}{$list_desc['profile_img']}{else}{$modules_dir}/giftlist/views/img/avatar.png{/if}')"></div>
        </div>
    </div>
</div>

<p class="ax-text-description-lista">{$list_desc['message']}</p>

<div class="ax-general-info ax-cont-admin-listas-regalos">
    <div class="ax-cont-list desc">
        <div class="ax-item">
            <div class="part">{if !$cocreator}{l s='Creador' mod='giftlist'}{else}{l s='Creadores' mod='giftlist'}{/if}<span>{$creator}</span>{if $cocreator}<br><span>{$cocreator}</span>{/if}</div>
            <div class="part">{l s='Código' mod='giftlist'}<span>{$list_desc['code']}</span></div><div class="part">{l s='Evento' mod='giftlist'}<span>{$event_type}</span></div>
            <div class="part">{l s='Días para el evento' mod='giftlist'}<span class="ax-day">{$days}</span></div>
            <div class="part">{l s='Fecha' mod='giftlist'}<span>{date("d/m/Y",strtotime($list_desc['event_date']))}</span></div>
        </div>
    </div>
</div>

<div class="products-associated" data-id="{$list_desc['id']}">
	    <div class="ax-text-result-list ax-result-inline">
         <h2>{l s='Mi lista' mod='giftlist'}</h2>
        </div>
        <a href="javascript:void(0);" class="ax-print"><i class="fa fa-print"></i>{l s='Imprimir lista' mod='giftlist'}</a>
		<div class="row">
            <div class="product-card ax-bond-card col-md-3" data-id="{$list_desc['id']}">
                <img src="{$modules_dir}/giftlist/views/img/details-lista.png">
                <a href="{$bond_form}" id="add_bond">{l s='Regala una GIFT CARD' mod='giftlist'}</a>      
            </div>
            {foreach from=$products item=row}
                {$atribute_group = $row['options'][3]->value}
                    <div class="product-card col-md-3" id="prod-{$row['id']}" data-id="{$row['id']}">
                        <div class="ax-cont-hover">
                            <div class="img-container">
                                <img src="http://{$row['image']}" />
                            </div>
                            <div class="ax-info-list">
                                {if $row['favorite']}<i class="fa fa-heart  ax-favorite" aria-hidden="true"><span>{l s='Favorito' mod='giftlist'}</span></i>{/if}
                                <p class="ax-name-list">{$row['name']}</p>
                                <p class="ax-price-list">{convertPrice price=$row['price']}</p>
                                    {foreach from=$row['data'] item=att_group}
                                        {if $att_group['id_product_attribute'] == $atribute_group}
                                            <p>{$att_group['group_name']}: {$att_group['attribute_name']}</p>
                                            <input type="hidden" class="prod-attr" value="{$att_group['id_product_attribute']}">
                                        {/if}
                                    {/foreach}
                                <p>{l s='Cantidad:'} {$row['group']->wanted}</p>
                            </div>
                            <button data-toggle="tooltip" data-placement="bottom" title="{l s='Añadir al carrito' mod='giftlist'}" class="add-to-cart btn btn-default btn-lista-regalos">{l s='Añadir al carrito' mod='giftlist'}</button>
                        </div>
                    <div class="add_container">
                        {if !empty($row['group']->tot_groups)}
                            {if $row['group']->missing > $row['group']->tot_groups}
                               <label class="qty_group" data-value="{$row['group']->cant}">Cantidad por grupo {$row['group']->cant}</label>
                                <input type="number" data-value="{$row['group']->missing}" name="total_qty" max="{$row['group']->tot_groups}" class="total_qty" value="1">
                           {else}
                               <label class="qty_group" data-value="{$row['group']->cant}">Cantidad por grupo {$row['group']->rest}</label>
                                <input type="number" name="total_qty" max="1" class="total_qty" value="1" disabled>
                            {/if}
                        {/if}
                    </div>
                </div>
            {/foreach}
		</div>
	</div>
</div>

{addJsDef min_amount=$list_desc['min_amount']}

<div id="contentdiv" style="display: none;">
	<p id="message"></p>
	<div class="col-md-12">
		<a data-toggle="tooltip" data-placement="bottom" title="Continuar comprando" class="keep-buy btn btn-default pull-left">Continuar comprando</a>
		<a href="{$base_dir}pedido" data-toggle="tooltip" data-placement="bottom" title="Ir al carrito" class="see-list btn btn-default pull-right">Ir al carrito</a>
	</div>
</div>