{if !empty($products)}
<p style="text-align:left;"><span style="font-size:16px;font-weight:normal;">Productos que no tienen unidades disponibles en inventario:</span></p>
<table>
{foreach from=$products item=c}
<tr>
<td>
<p>Imagen: <img src="{$c['image']}" width="200" /></p>
<p>Nombre: {$c['name']}</p>
<p>Color: {$c['color']}</p>
<p>Precio: {$c['price']}</p>
<p>Und. Solicitadas: {$c['wanted']}</p>
<p>Und. Faltantes: {$c['missing']}</p>
</td>
</tr>
{/foreach}
</table>
{/if}
<table>
{foreach from=$data item=c}
<p style="text-align:left;"><span style="font-size:16px;font-weight:normal;"> Productos que fueron comprados:</span></p>
{if $c['bond'] == 1}
<tr>
<td>
<p>Imagen: <img src="{$c['image']}" width="200" /></p>
<p>Nombre: {$c['name']}</p>
<p>Precio: {$c['price']}</p>
<p>Comprador: {$c['buyer']}</p>
<p>Nombre: {$c['buyer']}</p>
<p>Und. Compradas: {$c['bought']}</p>
</td>
</tr>
{else}
<tr>
<td>
<p>Imagen: <img src="{$c['image']}" width="200" /></p>
<p>Nombre: {$c['name']}</p>
<p>Color: {$c['color']}</p>
<p>Precio: {$c['price']}</p>
<p>Comprador: {$c['buyer']}</p>
<p>Nombre: {$c['buyer']}</p>
<p>Und. Compradas: {$c['bought']}</p>
<p>Und. Solicitadas: {$c['wanted']}</p>
<p>Und. Faltantes: {$c['missing']}</p>
</td>
</tr>
{/if}
{/foreach}
</table>