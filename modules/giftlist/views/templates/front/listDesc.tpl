{* Not Logged User AND searched list *}
<h1>{$list_desc['name']}</h1>

<div class="ax-avatar-content">
    <div id="ax-cover-container">
        <div class="cont-img">
            <div class="ax-cover-img" width="180" style="background-image: url('{if !empty($list_desc['image'])}{$list_desc['image']}{else}{$modules_dir}/giftlist/views/img/banner.jpg{/if}')"></div>
        </div>
    </div>
    <div id="ax-prof-container">
        <div class="cont-img">
            <div class="ax-profile-img" width="180" style="background-image: url('{if !empty($list_desc['profile_img'])}{$list_desc['profile_img']}{else}{$modules_dir}/giftlist/views/img/avatar.png{/if}')"></div>
        </div>
    </div>
</div>

<p class="ax-text-description-lista">{$list_desc['message']}</p>

<div class="ax-general-info ax-cont-admin-listas-regalos user">
    <div class="ax-cont-list desc">
        <div class="ax-item">
            <div class="part">{if !$cocreator}{l s='Creador' mod='giftlist'}{else}{l s='Creadores' mod='giftlist'}{/if}<span>{$creator}</span>{if $cocreator}<span>{$cocreator}</span>{/if}</div>
            <div class="part">{l s='Código' mod='giftlist'}<span>{$list_desc['code']}</span></div><div class="part">{l s='Evento' mod='giftlist'}<span>{$event_type}</span></div>
            <div class="part">{l s='Días para el evento' mod='giftlist'}<span class="ax-day">{$days}</span></div>
            <div class="part">{l s='Fecha' mod='giftlist'}<span>{date("d/m/Y",strtotime($list_desc['event_date']))}</span></div>
        </div>
    </div>
</div>

<div class="products-associated" data-id="{$list_desc['id']}">
	    <div class="text-left">
        <div class="ax-text-result-list ax-result-inline">
         <h2>{l s='Mi lista' mod='giftlist'}</h2>
        </div>
        <a href="javascript:void(0);" class="ax-print"><i class="fa fa-print"></i>{l s='Imprimir lista' mod='giftlist'}</a>
        </div>
        <div id="ax-products">
           <div class="jplist-panel">						
                <div 
                class="jplist-pagination" 
                data-control-type="pagination" 
                data-control-name="paging" 
                data-control-action="paging">
                </div>
                <select
                    class="jplist-select" 
                    data-control-type="items-per-page-select" 
                    data-control-name="paging" 
                    data-control-action="paging">

                    <option data-number="4"> 4 </option>
                    <option data-number="8" data-default="true" selected> 8 </option>
                    <option data-number="12"> 12 </option>
                    <option data-number="all"> Todos </option>
                </select>
            </div>
            <div class="row ax-prod-cont">
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
                                    <p class="total_qty" data-cant="{$row['cant']}">{l s='Cantidad:'} {$row['cant']}</p>
                                </div>
                                <button data-toggle="tooltip" data-placement="bottom" title="{l s='Descubre más' mod='giftlist'}" class="ax-more btn btn-default btn-lista-regalos hidden">{l s='Descubre más' mod='giftlist'}</button>
                                <button data-toggle="tooltip" data-placement="bottom" title="{l s='Añadir al carrito' mod='giftlist'}" class="add-to-cart btn btn-default btn-lista-regalos">{l s='Añadir al carrito' mod='giftlist'}</button>
                            </div>
                    </div>
                {/foreach}
                <div class="product-card ax-bond-card col-md-3" data-id="{$list_desc['id']}">
                    <img src="{$modules_dir}/giftlist/views/img/details-lista.png">
                    <a href="{$bond_form}" id="add_bond">{l s='Regala una GIFT CARD' mod='giftlist'}</a>      
                </div>
            </div>
            <div class="jplist-panel">						
                <div 
                class="jplist-pagination" 
                data-control-type="pagination" 
                data-control-name="paging" 
                data-control-action="paging">
                </div>
                <select
                    class="jplist-select" 
                    data-control-type="items-per-page-select" 
                    data-control-name="paging" 
                    data-control-action="paging">

                    <option data-number="4"> 4 </option>
                    <option data-number="8" data-default="true" selected> 8 </option>
                    <option data-number="12"> 12 </option>
                    <option data-number="all"> Todos </option>
                </select>
            </div>
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

<div id="productDiv" style="display: none;">
</div>