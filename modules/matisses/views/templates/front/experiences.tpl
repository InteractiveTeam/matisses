<div class="container">

{if $experience->id}
<h1>{l s='Experiencias' mod='experiencia'}</h1>

    <div id="experience" class="experience-page grid_12" >
        <img src="{$link->getImageLink($experience->id_image,'img/experiences')}" class="img-responsive">
        {if $experience->products}

        	{foreach from=$experience->products item=pointer}
            	<div class="pointer {$pointer.market}-{$pointer.orientation}" style="top:{$pointer.top}%;left:{$pointer.left}%">
                	<div class="pointer-detail">
                        <div class="pointer-detail-left">
                            <h3>{$pointer.name}</h3>
                            <p class="price">{convertPrice price=$pointer.price}</p>
                            <a class="btn btn_border ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$pointer.id_product}&amp;id_product_attribute={$pointer.id_product_attribute}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$accessory.id_product|intval}">
                                <span>{l s='Comprar'}</span>
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

<div class="row">
	<div class="grid_6 experience-title"><h2>{$experience->name}</h2></div>
    <div class="grid_6 social-networks">{hook h='DisplayExperiencias' experience=$experience}</div>
</div>
<div class="row">
    <p class="grid_12 alpha omega experience-description">
    {$experience->description}
    </p>
</div>
<div class="row">
{if $experiences}
	<ul class="bxslider experiences-list">
    {foreach from=$experiences item=exp}
		<li class="grid_4">
        	{assign var=params value=['id_experiencia' => $exp.id_experience]}
        	<a href="{$link->getModuleLink('matisses','experiences',$params,true)}">
            <img src="{$link->getImageLink($exp.id_experience|cat:'-slider','img/experiences')}" class="img-responsive">
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
