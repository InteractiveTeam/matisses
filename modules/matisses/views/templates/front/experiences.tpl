<div class="container">

{if $experience->id}
<h1>{l s='Experiences' mod='experiencia'}</h1>
<div class="row">
    <div class="col-md-12" id="experience">
        <img src="{$link->getImageLink($experience->id_image,'img/experiences')}" class="img-responsive">
        {if $experience->products}
        
        	{foreach from=$experience->products item=pointer}
            	<div class="pointer {$pointer.market}" style="top:{$pointer.top}%;left:{$pointer.left}%">
                	<div class="pointer-detail">
                        <div class="pointer-detail-left">
                            <h3>{$pointer.name}</h3>
                            <p class="price">{convertPrice price=$pointer.price}</p>
                            <a class="btn btn_border ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$pointerid_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$accessory.id_product|intval}">
                                <span>{l s='Buy now'}</span>
                            </a>
                        </div>
                        <div class="pointer-detail-right">
                             <img src="{$link->getImageLink($pointer.link_rewrite, $pointer.id_image, 'medium_default')|escape:'html':'UTF-8'}" class="img-responsive">
                        </div>
                    </div>
                </div>
            {/foreach}
        
        {/if}
    </div>
</div>
<div class="row">
	<div class="col-md-6 experience-title"><h2>{$experience->name}</h2></div>
    <div class="col-md-6 social-networks">{hook h='DisplayExperiencias' experience=$experience}</div>
</div>
<div class="row">    
    <p class="col-md-12 experience-description">
    
    {$experience->description}
    
    </p>
</div>
<div class="row">
{if $experiences}
	<ul class="bxslider experiences-list">
    {foreach from=$experiences item=exp}
		<li class="col-md-4">
        	<a href="{$link->getModuleLink('matisses','experiences',['id_experience' => "{$exp.id_experience}",'link_rewrite'  => "{$exp.link_rewrite}"],false)}">
            <img src="{$link->getImageLink($exp.id_experience,'img/experiences')}" class="img-responsive"> 
        	<h3>{$exp.name}</h3>
        	</a>
        </li>
     {/foreach}   
    </ul>
{/if}    
</div>
{else}
	<p class="error">{l s='There are not experiences now' mod='matisses'}</p>
{/if}
</div>
