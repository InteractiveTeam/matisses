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
            <img class="ax-profile-img" width="180" src="{if !empty($list_desc['image'])}{$list_desc['profile_img']}{else}{$modules_dir}/giftlist/views/img/avatar.png{/if}">
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
		<div class="row">
            <div class="product-card ax-bond-card col-md-3" data-id="{$list_desc['id']}">
                <img src="{$modules_dir}/giftlist/views/img/details-lista.png">
                <a href="{$bond_form}" id="add_bond">{l s='Regala una GIFT CARD' mod='giftlist'}</a>      
            </div>
            {foreach from=$products item=row}
                {$atribute_group = $row['options'][3]->value}
                    <div class="product-card col-md-3" id="prod-{$row['id']}" data-id="{$row['id']}">
                        <div class="img-container" style="background-image: url('http://{$row['image']}')">
                        </div>
                        <div class="ax-info-list">
                        {if $row['favorite']}<i class="fa fa-heart  ax-favorite" aria-hidden="true"></i><span>{l s='Favorito' mod='giftlist'}</span>{/if}
                        <p class="ax-name-list">{$row['name']}</p>
                        <p class="ax-price-list">{convertPrice price=$row['price']}</p>
                        {foreach from=$row['data'] item=att_group}
                            {if $att_group['id_product_attribute'] == $atribute_group}
                                <p>{$att_group['group_name']}: {$att_group['attribute_name']}</p>
                            {/if}
                        {/foreach}
                    <p>{l s='Cantidad:'} {$row['group']->wanted}</p>
                    </div>
                    <a class="delete-product hidden" data-toggle="tooltip" data-placement="bottom" title="Quitar producto"><i class="fa fa-close"></i></a>
                </div>
            {/foreach}
		</div>
	</div>
</div>

{addJsDef min_amount=$list_desc['min_amount']}