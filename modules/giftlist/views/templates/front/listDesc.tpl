{* Not Logged User AND searched list *}
<h1>{$list_desc['name']}</h1>

<div class="ax-avatar-content">
    <div id="ax-cover-container">
        <div class="cont-img">
            <img class="ax-cover-img" src="{$list_desc['image']}" width="920" height="300">
        </div>
    </div>
    <div id="ax-prof-container">
        <div class="cont-img">
            <img class="ax-profile-img" width="180" src="{$list_desc['profile_img']}">
        </div>
    </div>
</div>

<p class="ax-text-description-lista">{$list_desc['message']}</p>

<div class="ax-general-info ax-cont-admin-listas-regalos">
    <div class="ax-cont-list">
        <div class="ax-item">
            <div class="part">{l s='Creadores' mod='giftlist'}<span>{$creator}</span><br><span>{$cocreator}</span></div>
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
		
        <a href="javascript::void(0);">{l s='Editar lista' mod='giftlist'}</a>
		<div class="row">
            <div class="product-card col-md-3" data-id="{$list_desc['id']}">
                <img src="{$modules_dir}/giftlist/views/img/details-lista.png">
                <span>{l s='Total bonos' mod='giftlist'}: {convertPrice price=$bond['total']}</span> <br>       
            </div>
            {foreach from=$products item=row}
                {$atribute_group = $row['options'][3]->value}
                    <div class="product-card col-md-3" id="prod-{$row['id']}" data-id="{$row['id']}">
                        <div class="img-container" style="background-image: url('http://{$row['image']}')">
                        </div>
                        <div class="ax-info-list">
                        <i class="fa fa-heart  {if $row['favorite']}ax-favorite{/if}" aria-hidden="true"></i>
                        <p class="ax-name-list">{$row['name']}</p>
                        <p class="ax-price-list">{convertPrice price=$row['price']}</p>
                        {foreach from=$row['data'] item=att_group}
                            {if $att_group['id_product_attribute'] == $atribute_group}
                                <p>{$att_group['group_name']}: {$att_group['attribute_name']}</p>
                            {/if}
                        {/foreach}}
                    </div>
                </div>
            {/foreach}
		</div>
	</div>
</div>