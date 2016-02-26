{* Not Logged User AND searched list *}
{capture name=path}
{$list_desc['name']}
{/capture}

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<h2>{$list_desc['name']}</h2>
			<p>{$list_desc['message']}</p>
			<p>Hora: {$list_desc['event_date']}</p>
			<p>{$event_type['name']}</p>
			<p>Creado por: {$creator['firstname']} {$creator['lastname']} {if !empty($cocreator)} y {$cocreator['firstname']} {$cocreator['lastname']} {/if}</p>
			{if $list_desc['recieve_bond']}
				<a href="{$bond_form}" class="btn btn-default" id="add_bond">Comprar bono</a>
			{/if}
		</div>
		<div class="col-md-6">
		<img src="{$list_desc['image']}" height="250" width="250" alt="Imagen" />
		</div>
	</div>
	{*Products asociated to the list*}

	<div class="products-associated" data-id="{$list_desc['id']}">
		<h2>Productos</h2>
		<div class="row">
		{foreach from=$products item=row }
		{$cant = Tools::jsonDecode($row['group'])}
		{$atribute_group = $row['options'][3]->value}
			<div class="product-card col-md-3" id="prod-{$row['id']}" data-id="{$row['id']}">
				<div class="img-container" style="background-image: url('http://{$row['image']}')">
				</div>
				<p>{$row['name']}</p>
				{foreach from=$row['data'] item=att_group}
					{if $att_group['id_product_attribute'] == $atribute_group}
						<p>{$att_group['group_name']} : {$att_group['attribute_name']}</p>
						<input type="hidden" class="prod-attr" value="{$att_group['id_product_attribute']}">
					{/if}
				{/foreach}
				{$row['price']}
				<div class="add_container">
					<label for="total_qty">Comprar</label>
					{if !empty($cant->cant)}
					    {if $cant->missing > $cant->cant_group}
					        <input type="number" name="total_qty" max="{$cant->tot_groups}" class="total_qty" value="{$cant->tot_groups}">
						    <label class="qty_group" data-value="{$cant->missing}">Cantidad por grupo {$cant->cant}</label>
                       {else}
                            <input type="number" name="total_qty" max="1" class="total_qty" value="1" disabled>
                            <label class="qty_group" data-value="{$cant->cant}">Cantidad por grupo {$cant->cant}</label>
                        {/if}
					{/if}
					<button class="add-to-cart">Add to car</button>
				</div>
			</div>
		{/foreach}
		</div>
	</div>
</div>

<div id="contentdiv" style="display: none;">
	<p id="message"></p>
	<div class="col-md-12">
		<a class="keep-buy btn btn-default pull-left">Continuar comprando</a>
		<a href="{$base_dir}pedido" class="see-list btn btn-default pull-right">Ir al carrito</a>
	</div>
</div>
