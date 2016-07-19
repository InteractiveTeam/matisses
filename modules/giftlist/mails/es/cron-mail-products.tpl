{if !emtpy($out)}
<p style="text-align:left;"><span style="font-size:16px;font-weight:normal;">Productos que no tienen unidades disponibles en inventario:</span></p>
{foreach from=$out item=c}
<tr>
<td>
<p>Imagen: <img src="{$c['image']}" heigth="200" width="200"></p>
<p>Nombre: {$c['name']}</p>
<p>Color: {$c['color']}</p>
<p>Precio: {$c['price']}</p>
<p>Und. Solicitadas: {$c['wanted']}</p>
<p>Und. Faltantes: {$c['missing']}</p>
</td>
</tr>
{/foreach}
{/if}
<p style="text-align:left;"><span style="font-size:16px;font-weight:normal;"> Productos que fueron comprados:</span></p>
{foreach from=$out item=c}
{if $c['bond'] == 1}
<tr>
<td>
<p>Imagen: <img src="{$c['image']}" heigth="200" width="200"></p>
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
<p>Imagen: <img src="{$c['image']}" heigth="200" width="200"></p>
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