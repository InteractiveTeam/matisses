<div class="container">

{if $experience->id}
<h1>{l s='Experiencias' mod='experiencia'}</h1>

    <div id="experience" class="experience-page grid_12 alpha omega" >
        <div class="block-img-exp grid_12 alpha omega">
            <img src="{$link->getImageLink($experience->id_image,'img/experiences')}" class="img-responsive">
            <div class="mask-exp"></div>
            {if $experience->products}
            	{foreach from=$experience->products item=pointer}
                	<div class="pointer {$pointer.market}-{$pointer.orientation}" style="top:{$pointer.top|strip}%;left:{$pointer.left|strip}%">
                    	<div class="pointer-detail grid_12 alpha omega">
                            <div class="pointer-detail-left grid_8">
                                <h4>{$pointer.name}</h4>
                                <p class="price">{convertPrice price=$pointer.price}</p>
                                {assign var="button_url" value="add=1&amp;id_product=`$pointer.id_product`&amp;id_product_attribute=`$pointer.id_product_attribute`"} 
                                
                                <a class="btn btn-default btn-red ajax_add_to_cart_button" href="{$link->getPageLink('cart',false, NULL, $button_url , false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$pointer.id_product|intval}">
                                    {l s='Comprar ahora'}
                                </a>
                            </div>
                            <div class="pointer-detail-right grid_4 alpha omega">
                                 <img src="{$link->getImageLink($pointer.link_rewrite, $pointer.id_image, 'medium_default')|escape:'html':'UTF-8'}" class="img-responsive">
                            </div>
                        </div>
                    </div>
                {/foreach}
            {/if}
        </div>

        <div class="block-cont-exp grid_12 alpha omega">
            <div class="grid_12 alpha omega exp-header">
            	<div class="grid_8 alpha experience-title"><h2>{$experience->name}</h2></div>
                <div class="grid_4 omega social-networks">{hook h='DisplayExperiencias' experience=$experience}</div>
            </div>
            <div class="grid_12 alpha omega exp-description">
                {$experience->description}
            </div>
            <div class="exp-slide grid_12 alpha omega">
            <h3>Más experiencias</h3>
            {if $experiences}
            	<ul class="cf bxslider experiences-list">
                {foreach from=$experiences item=exp}
            		<li class="grid_4 alpha omega {if $exp.id_experience == $current} current {/if}">
                    	
                    	{assign var=params value=['id_experiencia' => $exp.id_experience]}
                    	<a class="link-img" href="{$link->getModuleLink('matisses','experiences',$params,true)}">
                            <img src="{$link->getImageLink($exp.id_experience|cat:'-slider','img/experiences')}" class="img-responsive">
                        	<h5>{$exp.name}</h5>
                    	</a>
                    </li>
                 {/foreach}
                </ul>
            {/if}
            </div>
            <input type="hidden" value="" id="directionslider"/>
            {else}
            	<p class="error">{l s='There are not experiences now' mod='matisses'}</p>
            {/if}
        </div>
</div>
</div>
