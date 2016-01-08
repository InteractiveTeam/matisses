    <div class="experiences">
		<div class="container">
			<div class="btn-title cf">
				<h1><a href="{$link->getModuleLink('matisses','experiences')}">{l s='Experiencias' mod='matisses'}</a></h1>
				<div class="btn-view-products">

					<a href="{$link->getModuleLink('matisses','experiences')}" title="{l s='Ver todos los destacados' mod='matisses'}" class="btn btn-default button button-small">{l s='Ver todos' mod='matisses'}</a>
				</div>
			</div>
			<div class="slide-experiencias cf">
				<ul class="grid_12 alpha omega">
					<li class="experiences-slider">

                        {foreach from=$experiences item=experience}
						<div class="slide-left grid_4 ">
							<figure>
                           {assign var=params value=['id_experiencia' => $experience.id_experience]}
                           <div class="img-container">
        						<a href="{$link->getModuleLink('matisses','experiences',$params,true)}">
								    <img src="{$base_url}{$experience.image}" alt="">
                                </a>
                            </div>
								<figcaption class="cf">
									<h2>{$experience.name}</h2>
									<p>{$experience.description|strip_tags:'UTF-8'|truncate:200:'...'}</p>

								</figcaption>
							</figure>
						</div>
                        {/foreach}

					</li>
				</ul>
			</div>
		</div>
    </div>
