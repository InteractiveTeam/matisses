<div class="row">
  <div class="container">
    <div id="tabs" class="product-tabs">
      <ul>
        <li id="tab-li-1"><a href="#tabs-1">{l s='Description' mod='matisses'}</a></li>
        <li id="tab-li-2"><a href="#tabs-2">{l s='Materials and care' mod='matisses'}</a></li>
        <li id="tab-li-3"><a href="#tabs-3">{l s='Reviews' mod='matisses'}</a></li>
      </ul>
      <div id="tabs-1">
        <p> {$product->description} </p>
      </div>
      <div id="tabs-2">
		{$product->cuidados}
      </div>
      <div id="tabs-3">
      	{hook h='displayProductComments' product=$product} 
      </div>
    </div>
  </div>
</div>
