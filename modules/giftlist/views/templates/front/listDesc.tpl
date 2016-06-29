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
		<h2>{l s='Mi lista' mod='giftlist'}</h2>
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