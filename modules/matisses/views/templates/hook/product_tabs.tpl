<div class="row">
  <div class="container">
    <div id="tabs" class="product-tabs">
      <ul>
        <li><a href="#tabs-1">{l s='Description' mod='matisses'}</a></li>
        <li><a href="#tabs-2">{l s='Materials and care' mod='matisses'}</a></li>
        <li><a href="#tabs-3">{l s='Reviews' mod='matisses'}</a></li>
      </ul>
      <div id="tabs-1">
        <p> {$product->description_short} </p>
      </div>
      <div id="tabs-2">
        <p>
        <h1>ACERO 304 INOXIDABLE</h1>
        <p>No usar objetos, ni jabones abrasivos, utilizar mantillas suaves de algodón y varsol sin olor</p>
        <br>
        <h1>MADERA</h1>
        <p>La madera nunca deben ser mojados o sometidos a goteos o salpicaduras, puesto que el agua puede terminar por manchar su superficie. Otro aspecto muy importante a tomar en cuenta, es evitar la exposición a los rayos del sol, que puede cimbrar o arquear la madera, dañando sin remedio el modelo de su mueble. Para quitar el polvo de los muebles laqueados, puede hacerlo con un paño seco de microfibra sin frotar muy bruscamente la superficie; usted verá que es una manera muy efectiva de quitar el polvo</p>
        <br>
        <p>para una limpieza ordinaria usar un paño seco, solo si es necesario usar un paño  ligeramente húmedo sin aplicar presión sobre la piel.</p>
        <br>
        <h1>ESPUMA DE POLIURETANO</h1>
        <p>No usar objetos, ni jabones abrasivos, utilizar mantillas suaves de algodón y varsol sin olor</p>
        <br>
        <h1>POLIESTER</h1>
        <p>Lavar con agua tibia y jabón de coco, no utilizar productos abrasivos</p>
        </p>
      </div>
      <div id="tabs-3">
      	{hook h='displayProductComments' product=$product} 
      </div>
    </div>
  </div>
</div>
