{if false}
<div class="breadcrumb newsBreadcrumb iconNewsList ">
    <a href="{$link->getPageLink('index.php',true)}" >{l s='Home' mod='news'}</a>
    <i class="fa fa-angle-right"></i>
    <span class="navigation_page">
        <a href="{$link->getModuleLink('news', 'list',
                                                            [
                                                                'cat_news' => "{$cat}",
                                                                'page_cat' => "{$page}",
                                                                'rewrite'  => "{$cat_rewrite}"
                                                             ]

                                                            ,false)}" >{l s='News' mod='news'}</a>
    </span>
    <i class="fa fa-angle-right"></i>
    <span class="navigation_page">{$title|escape:html:'UTF-8'|truncate:60:'...'}</span>

    <a class="newsRss" href="{$link->getModuleLink('news', 'rss', ['rss_news'=>1] ,false)}" target="_blank"></a>
</div>
{/if}

<div class="newContent grid_12 omega alpha">
    <div class="newContentInt grid_12">

        {if $imgsObj}
            <script type="text/javascript">
                $(function()  {ldelim}


				 $('#newSlideshow a').lightBox( {ldelim}
                        imageLoading:'{$url_to_module}/js/lightbox/images/loading.gif',		// (string) Path and the name of the loading icon
                        imageBtnPrev:'{$url_to_module}/js/lightbox/images/prev.png',			// (string) Path and the name of the prev button image
                        imageBtnNext:'{$url_to_module}/js/lightbox/images/next.png',			// (string) Path and the name of the next button image
                        imageBtnClose:'{$url_to_module}/js/lightbox/images/close.png',		// (string) Path and the name of the close btn
                        imageBlank:'{$url_to_module}/js/lightbox/images/lightbox-blank.gif',
                        txtImage:'{l s='Image' mod='news'}',
                        txtOf:'{l s='of' mod='news'}',
                        fixedNavigation: true
                    });

				{if count($imgsObj)>1}

					$('#newGallery a').lightBox( {ldelim}
                        imageLoading:'{$url_to_module}/js/lightbox/images/loading.gif',		// (string) Path and the name of the loading icon
                        imageBtnPrev:'{$url_to_module}/js/lightbox/images/prev.png',			// (string) Path and the name of the prev button image
                        imageBtnNext:'{$url_to_module}/js/lightbox/images/next.png',			// (string) Path and the name of the next button image
                        imageBtnClose:'{$url_to_module}/js/lightbox/images/close.png',		// (string) Path and the name of the close btn
                        imageBlank:'{$url_to_module}/js/lightbox/images/lightbox-blank.gif',
                        txtImage:'{l s='Image' mod='news'}',
                        txtOf:'{l s='of' mod='news'}',
                        fixedNavigation: true
                    });
					$('#newSlideshow').cycle( {ldelim}
						fx:     'fade',
						speed:  'fast',
						timeout: 5000,
						pagerEvent: 'mouseover',
						pauseOnPagerHover: true ,
						pager:  '#newGallery',
						pagerAnchorBuilder: function(idx, slide)  {ldelim}
							// return sel string for existing anchor
							return '#newGallery a:eq(' + (idx) + ')';
						}
                });

				{/if}
            });

            </script>
        <div class="newTitle"><h1>{$title}</h1></div>
        <div class="newImgsContent grid_12 alpha omega" >
            <div class="newSlideshow" id="newSlideshow" >

            	<a href="{$imgsObj[0]->img}" title="{$title|escape:html:'UTF-8'|truncate:220:'...'} -  {$date}">
                        <img src="{$imgsObj[0]->img_slider}"  alt="" width="{$news_slideshow_width}"  height="{$news_slideshow_height}"  />
                    </a>
            </div>

			{if count($imgsObj)>1 && false}
				<div class="newGallery" id="newGallery">
					{foreach from=$imgsObj item='img' name=myLoop}
						<a href="{$img->img}" title="{$title|escape:html:'UTF-8'|truncate:220:'...'} -  {$date}"><img src="{$img->img_thumbnail}"  alt="" width="70" height="30"  /></a>
					{/foreach}
				</div>

			{/if}
        </div>
        {/if}
        <div class="description-news grid_12 alpha omega">
            <div class="ax-news-category">
                {l s="categoria" mod="news"}: <span>{$category}</span>
                <div class="ax-cont-print"><a href="javascript:window.print()" class="newPrint"><i class="fa fa-print" aria-hidden="true"></i></a>Imprimir</div>
            </div>
            <div class="ax-container-blog grid_12">
                <div class="grid_9">
                 
                    <div class="newText"><p>{$new}</p></div>
                </div>
                <div class="grid_3">
                    <div class="ax-buscador-blog">
                        <input type="search" placeholder="Buscar"/>
                    </div>
                    <div class="category-filter">
                        <h4>{l s='Categorías' mod='news'}</h4>
                        <ul>
                        {if $catObj}
                            {foreach from=$catObj item='relCat' name=myLoop}
                            <li><a href="/blog/categoria/{$relCat->id}-{$relCat->rewrite}">{$relCat->title}</a></li>
                            {/foreach}
                        {/if}
                        </ul>
                    </div>
                    <div class="ax-articulos-relacionados-blog">
                    <h2>Artículos relacionados</h2>
                    <ul>
                    {if $relNewsObj}
                        <div class="relNewsContent" >
                        {foreach from=$relNewsObj item='rel' name=myLoop}
                                <li><a class="relNews" href="{$link->getModuleLink('news', 'new', 
                                                                    [
                                                                        'id_news'  => "{$rel->id}",
                                                                        'cat_news' => 0,
                                                                        'page_cat'     => 0,
                                                                        'rewrite'  => "{$rel->rewrite}",
                                                                        'cat_rewrite'  => ""
                                                                     ]

                                            ,false)}" title="{$rel->title|escape:html:'UTF-8'|truncate:70:'...'}"><h3>{$rel->title|escape:html:'UTF-8'}</h3></a>
                                            <p>{$rel->newText|escape:html:'UTF-8'|truncate:100:'...'}</p>
                                            </li>
                            {/foreach}
                        </div>
                    {/if}
                        </ul>
                    </div>
                </div>
            </div>
            <div class="ax-cont-autor grid_12">
                <div class="grid_6 ax-name-autor">
                    <p>Escrito por:</p>
                    <div class="new-author"><p>{if $autor}{$autor}{/if}</p></div>
                </div>
                <div class="grid_6 ax-details-autor">
                    <p>{l s="categoria" mod="news"}:<span> {$category}</span></p>
                    <div class="ax-date"><i class="fa fa-clock-o"></i><span>{$date}</span></div>
                </div>
            </div>
            
        </div>
        <div class="newContentTopRigthSocial grid_12 alpha omega">
            <!-- <div class="share shareFacebook">
            {if $socialButtons[0]=='1'}
                FACEBOOK BTN COUNT
                <iframe src="http://www.facebook.com/plugins/like.php?href={$link->getModuleLink('news', 'new',
                                                            [
                                                                'id_news'  => "{$id_news}",
                                                                'cat_news' => "{$cat}",
                                                                'page_cat'     => 0,
                                                                'rewrite'  => "{$rewrite}",
                                                                'cat_rewrite'  => ""
                                                             ]

                                                            ,false)}?&amp;layout=button_count&amp;show_faces=false&amp;action=like&amp;font=verdana&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:35px;" allowTransparency="true" class="iconShareFacebook"></iframe>
                FACEBOOK BTN COUNT 
            {/if}
            </div>-->
            
            <div class="container">
                <div class="info-chaordic">
                     <img src="../../themes/matisses/img/displayed-category.jpg" alt="productos visualizados">
                     <div class="mask">
                      <h1>Espacio para Chaordic</h1>
                     </div>
                </div>
           </div>
            </br></br></br>
            
            <div class="ax-shareContent">
               <div class="newTopActions">
                <!-- AddThis Button BEGIN -->
                <p class="text">{l s="Compartir" mod="news"}:</p>
                <p class="addthis_toolbox addthis_default_style ">
                    <a class="addthis_button_email" ></a>
                </p>
                <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4fd60a055ec70816"></script>
                <!-- AddThis Button END -->
                </div>
                <div id="share"></div>
                <p><a class='ayo-btn ayo-houzz' href='http://www.houzz.es/pro/matisses/matisses' target='_blank'><i class='fa fa-houzz'></i></a></p>
            </div>
            {if $socialButtonHtml}
            <div>
                {$socialButtonHtml}
            </div>
            {/if}

        </div>

        {if $tagsObj}
            <div class="newItemTags" >
                <span>{l s='TAGS ' mod='news'}</span>
                {foreach from=$tagsObj item='tag' name=myLoop}
                <a class="newItemTag" href="{$link->getModuleLink('news', 'news', ['tag_news'=>"{$tag->id}"] ,false)}" title="{$tag->tag|escape:html:'UTF-8'|truncate:100:'...'}">{$tag->tag|escape:html:'UTF-8'|truncate:100:'...'}</a>
                {/foreach}
            </div>
        {/if}
        <div class="newsSep"></div>


        {if $newsProductsObj}
         <div class="newsProductsContent">
           <div class="newsProductsTitle">{l s='Related Products' mod='news'}</div>
           {foreach from=$newsProductsObj item=newsProducts name=myLoop}

                <div class="ajax_block_product newsProductItem">
                    <div class="newsProductImg">
                        <a class="product_img_link" href="{$link->getProductLink($newsProducts->id_product, $newsProducts->link_rewrite, $newsProducts->category_rewrite)}"><img src="{$newsProducts->cover}" height="80" width="80" /></a>
                        <br>
                        {if $newsProducts->show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
                            <span class="price">
                                 {if !$newsProducts->with_tax}{convertPrice price=$newsProducts->price}{else}{convertPrice price=$newsProducts->price_tax}{/if}
                            </span>
                        {/if}
                    </div>
                    <div  class="newsProductInf">
                        <span class="newsProductTitle">{$newsProducts->name|truncate:27:'...'|escape:'htmlall':'UTF-8'}</span>
                        <span class="newsProductDescription">{$newsProducts->description_short|strip_tags|truncate:100:'...'}</span>

                        <a class="button" href="{$link->getProductLink($newsProducts->id_product, $newsProducts->link_rewrite, $newsProducts->category_rewrite)}" title="{l s='View' mod='news'}">{l s='View' mod='news'}</a>

                        {if $newsProducts->show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
                            {if ($newsProducts->id_product_attribute == 0 OR (isset($add_prod_display) AND ($add_prod_display == 1))) AND $newsProducts->available_for_order AND !isset($restricted_country_mode) AND $newsProducts->minimal_quantity == 1 AND $newsProducts->customizable != 2 AND !$PS_CATALOG_MODE}
                                {if ($newsProducts->quantity > 0 OR $newsProducts->allow_oosp)}
                                <a class="exclusive ajax_add_to_cart_button" rel="ajax_id_product_{$newsProducts->id_product}" href="{$link->getPageLink('cart.php',true,NULL,"qty=1&amp;id_product={$newsProducts->id_product}&amp;token={$static_token}&amp;add")}" title="{l s='Add to cart' mod='news'}">{l s='Add to cart' mod='news'}</a>
                                {else}
                                <span class="exclusive">{l s='Add to cart' mod='news'}</span>
                                {/if}
                           {/if}
                       {/if}
                </div>
             </div>

         {/foreach}
        </div>
        <div class="newsSep"></div>
        {/if}


        {if $fbComments}
            <div class="newComments">
                <div id="fb-root"></div>
                <script  type="text/javascript" >(function(d, s, id)  {ldelim}
                  var js, fjs = d.getElementsByTagName(s)[0];
                  if (d.getElementById(id)) return;
                  js = d.createElement(s); js.id = id;
                  js.src = "http://connect.facebook.net/{$fbCommentsLang}/all.js#xfbml=1";
                  fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));</script>
                <div class="fb-comments" data-href="{$link->getModuleLink('news', 'new',
                    [
                        'id_news'  => "{$id_news}",
                        'cat_news' => 0,
                        'page_cat'     => 0,
                        'rewrite'  => "{$rewrite}",
                        'cat_rewrite'  => ""
                     ]

                    ,false)}" data-num-posts="20" data-width="{$newsWidth-10}"></div>
            </div>
        {/if}

        {if ($prev_id_news||$next_id_news) && false }
            <div class="newPrevNext">
                {if $prev_id_news}
                    <a class="button" style="float: left"
                       href="{$link->getModuleLink('news', 'new',
                        [
                            'id_news'  => "{$prev_id_news}",
                            'cat_news' => "{$cat}",
                            'page_cat'     => 0,
                            'rewrite'  => "",
                            'cat_rewrite'  => ""
                         ]
                         ,false)}"
                       >{l s='< Previous' mod='news'}</a>
                {/if}
                {if $next_id_news}
                    <a class="button" style="float: right"
                       href="{$link->getModuleLink('news', 'new',
                        [
                            'id_news'  => "{$next_id_news}",
                            'cat_news' => "{$cat}",
                            'page_cat'     => 0,
                            'rewrite'  => "",
                            'cat_rewrite'  => ""
                         ]

                                                            ,false)}"
                       >{l s='Next >' mod='news'}</a>
                {/if}

            </div>
        {/if}

    </div>
{if $cookie->id_customer}
<div class="row">
	<div class="error" id="error-comment" style="display:none">
    	{l s='Ingresa un comentario' mod='news'}
    </div>
    <form id="form1" name="form1" method="post" action="">

        <div class="form-group">
			<label for="asunto">{l s='Comentario:' mod='news'}</label>
			<textarea class="form-control" max="200" maxlength="200" id="comment"></textarea> 
		</div>
        <div class="grid_4">
        	<button type="button" class="btn btn-default button btn-red right" id="addComment">{l s='Guardar'}</button>
        </div>
    </div>
	</form>

</div>

<div class="ax-pagination_article">
{if !empty($prev_id_news)}
   <div class="ax-more-article">
        <div class="ax-left-article-blog">
           <a class="prev btn btn-default btn-red" href="{$link->getModuleLink('news', 'new',
            [
                'id_news'  => "{$prev_id_news}",
                'cat_news' => "{if $cat}{$cat}{/if}",
                'page_cat'     => "{$page}",
                'rewrite'  => "{$prev_rewrite}",
                'cat_rewrite'  => "{$prev_cat_rewrite}"
             ]
             ,false)}"><i class="fa fa-angle-left"></i></a>
             <h4>{$prev_title}</h4>
        </div>
    </div>
{/if}

{if !empty($next_id_news)}
   <div class="ax-more-article">
        <div class="ax-right-article-blog">
           <h4>{$next_title}</h4>
            <a class="next btn btn-default btn-red" href="{$link->getModuleLink('news', 'new',
            [
                'id_news'  => "{$next_id_news}",
                'cat_news' => "{if $cat}{$cat}{/if}",
                'page_cat'     => "{$page}",
                'rewrite'  => "{$next_rewrite}",
                'cat_rewrite'  => "{$next_cat_rewrite}"
             ]
             ,false)}"><i class="fa fa-angle-right"></i></a>
        </div>
    </div>
{/if}
</div>

{if $comments}
<div class="comments">
	{$comments}
</div>
{/if}

{/if}
