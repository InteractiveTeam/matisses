<div class="product_store_available grid_9 omega">
	<h2>{l s='Also available in' mod='matisses'}</h2>
    <select id="product_store_available" name="product_store_available">
     	<option>{l s='Nuestras tiendas' mod='matisses'}</option>
    	{foreach from=$stores item=store}
        <option value="{$store.id_store}">{$store.name}</option>
        {/foreach}
    </select>
    
    <i class="tooltipDetail fa fa-question-circle" title="Recuerda verificar el saldo comunicándote a nuestras tiendas"></i>
</div>
