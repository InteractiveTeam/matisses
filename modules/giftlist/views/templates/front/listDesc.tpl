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

<p class="ax-text-description-lista">{html_entity_decode($list_desc['message'])}</p>

<div class="ax-general-info ax-cont-admin-listas-regalos user">
    <div class="ax-cont-list desc">
        <div class="ax-item">
            <div class="part">{if !$cocreator}{l s='Creador' mod='giftlist'}{else}{l s='Creadores' mod='giftlist'}{/if}<span>{$creator}</span>{if $cocreator}<span>{$cocreator}</span>{/if}</div>
            <div class="part">{l s='Código' mod='giftlist'}<span>{$list_desc['code']}</span></div><div class="part">{l s='Evento' mod='giftlist'}<span>{$event_type}</span></div>
            <div class="part">{l s='Días para el evento' mod='giftlist'}<span class="ax-day">{if {$days} >= 0}{{$days}|replace:'+':''}{else}{l s='Finalizado' mod='giftlist'}{/if}</span></div>
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
          {if !empty($products)}
           <div class="jplist-panel cf">
              <div class="sortPagiBar">	
               <label for="nb_item"><span>Mostrar</span> </label>					
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
                <div 
                class="jplist-pagination" 
                data-control-type="pagination" 
                data-control-name="paging" 
                data-control-action="paging">
                </div>
            </div>
            {/if}
            <div class="row ax-prod-cont">
                {if !empty($products)}
                {foreach from=$products item=row}
                    {$atribute_group = $row['options'][3]->value}
                        <div class="product-card col-md-3" id="prod-{$row['id']}" data-lpd-id="{$row['id_lpd']}" data-attr-id="{$row['id_att']}" data-id="{$row['id']}">
                            <div class="ax-cont-hover">
                                <div class="img-container">
                                    <img src="{$row['image']}" />
                                </div>
                                <div class="ax-info-list">
                                    {if $row['favorite']}<i class="fa fa-heart  ax-favorite" aria-hidden="true"><span>{l s='Favorito' mod='giftlist'}</span></i>{/if}
                                    <p class="ax-name-list">{$row['name']}</p>
                                    <p class="ax-price-list">{convertPrice price=$row['price']}</p>
                                        {foreach from=$row['options'] item=att_group}
                                            <p>{$att_group['group_name']}: {$att_group['attribute_name']}</p>
                                            <input type="hidden" class="prod-attr" value="{$att_group['id_product_attribute']}">
                                        {/foreach}
                                    </p>
                                </div>
                                <button data-toggle="tooltip" data-placement="bottom" title="{l s='Descubre más' mod='giftlist'}" {if $row['group']}data-group="true"{/if} class="ax-more btn btn-default btn-lista-regalos">{l s='Descubre más' mod='giftlist'}</button>
                                <button data-toggle="tooltip" data-placement="bottom" title="{l s='Añadir al carrito' mod='giftlist'}" class="add-to-cart btn btn-default btn-lista-regalos">{l s='Añadir al carrito' mod='giftlist'}</button>
                            </div>
                            {if $row['group']}
                            <p class="total_qty ax-price-fija-user" data-cant="{$row['cant']}">{l s='Cantidad:'} {$row['cant']}
                            {else}
                            <p class="total_qty" data-max="{$row['missing']}" data-cant="0">{l s='Cantidad:'} 
                            <input type="text" min="1" value="{$row['missing']}" max="{$row['missing']}" name="qty_card" id="qty"/>
                            {/if}
                    </div>
                {/foreach}
                {else}
                <div class="product-card"><p class="ax-no-products"><i class="fa fa-minus-circle"></i>{l s='No hay productos en esta lista'}</p></div>
                {/if}
                {if $list_desc['recieve_bond']}
                <div class="product-card ax-bond-card col-md-3" data-id="{$list_desc['id']}">
                    <img src="{$modules_dir}/giftlist/views/img/details-lista.png">
                    <a href="{$bond_form}" id="add_bond">{l s='Regala una GIFT CARD' mod='giftlist'}</a>      
                </div>
                {/if}
            </div>
            {if !empty($products)}
            <div class="jplist-panel cf">
               <div class="sortPagiBar">
                <label for="nb_item"><span>Mostrar</span> </label>						
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
                <div 
                class="jplist-pagination" 
                data-control-type="pagination" 
                data-control-name="paging" 
                data-control-action="paging">
                </div>
            </div>
            {/if}
        </div>
	</div>
</div>

{addJsDef min_amount=$list_desc['min_amount']}

<div id="contentdivBono" style="display: none;">
	<p id="message"></p>
	<div class="row text-center">
		<a data-toggle="tooltip" data-placement="bottom" title="Continuar comprando" class="keep-buy btn btn-default btn-lista-regalos pull-left">Continuar comprando</a>
		<a href="{$base_dir}pedido" data-toggle="tooltip" data-placement="bottom" title="Ir al carrito" class="see-list btn btn-default btn-lista-regalos pull-right">Ir al carrito</a>
	</div>
</div>

<div id="productDiv" style="display: none;">
<div class="row">
    <div class="col-md-6">
        <img class="ax-det-img" width=300" height="300"/>
    </div>
    <div class="col-md-6">
    <h1 class="titleProduct ax-det-name"></h1>
    <p id="product_reference">
        <label>{l s='Referencia' mod='giflist'}: </label>
        <span class="editable ax-det-ref" itemprop="sku"></span>
    </p>
    <div class="ax-calificacion">
        <div class="ax-det-reviews"></div>
    </div>
    <div id="short_description_block">
	   <div id="short_description_content" class="rte align_justify ax-det-desc" itemprop="description"></div>
    </div>
    <p>{l s='Colores' mod='giftlist'}
    <ul id="color_to_pick_list" class="cf">
        <li class="selected">
            <a href="#" class="color_pick selected" title="">
        </a> 
        </li>
    </ul>
    <div class="price">
	<p class="our_price_display price product-price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
        <link itemprop="availability" href="http://schema.org/InStock"><span id="our_price_display" class="ax-det-price no-reduce" itemprop="price"></span>
        <meta itemprop="priceCurrency" content="COP">
    </p>
    <p class="ax-iva">{l s='IVA incluido' mod='giftlist'}</p>
    </div>
    <p>{l s='Solicitados' mod='giflist'}: <span class="ax-det-sol"></span></p>
    <p>{l s='Faltantes' mod='giflist'}: <span class="ax-det-falt"></span></p>
    <p class="cant_prod">{l s='Cantidad' mod='giftlist'}: <input type="number" class="ax-mod-qty" id="qty" name="qty" min="1" value="1"/></p>
    <button data-toggle="tooltip" data-id="0" data-att="0" title="{l s='Añadir al carrito' mod='giftlist'}" class="add-to-cart-modal btn btn-default btn-lista-regalos">{l s='Añadir al carrito' mod='giftlist'}</button>
    </div>
</div>
</div>