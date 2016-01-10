
{if $catsObj}
    <script  type="text/javascript" >
        jQuery(function() {ldelim}
           jQuery( "#tabsNews" ).tabs();
        {rdelim});
    </script>


    <div id="news-home" class="newsHome grid_12 alpha omega cf">
         <!-- <div class="newsHomeBarTitle">
             <a href="{$link->getModuleLink('news', 'news', [] ,false)}" >{l s='News' mod='news'}</a>
             <a class="newsRss newsRssHome " href="{$link->getModuleLink('news', 'rss', ['rss_news'=>1] ,false)}" target="_blank"></a>
        </div> -->
        <!--Inicio titulo sección-->
        {assign var='cats_position' value=1}
        <div class="btn-title cf grid_12 alpha omega">

            <h1>
                <a href="#tabs-{$cats_position}">
                 {$catsObj[0]->title|truncate:50:'...'|escape:html:'UTF-8'}
                </a>
            </h1>
            <a class="blog-view-all button" href="{$link->getModuleLink('news', 'list',
                [
                'cat_news' => "{$cat_produto}",
                'page_cat' => 0,
                'rewrite'  => "{$cat_rewrite}"
                ]
                ,false)}" alt="{l s='More' mod='news'}" class="newsHomeMore">
                {l s='Ver todos los artículos' mod='news'}
            </a>
        </div>
        <!--Fin titulo sección-->

        <!--Inicio contenido articulos-->
        <div class="content-blog grid_12 alpha omega">
            <div class="title-destacado grid_2 alpha omega">
            </div>
            <!--Columna izquierdo-->
            <div class="newsLeft news-home grid_5 alpha omega" >
                <div class="img-article">
                    <a href="{$link->getModuleLink('news', 'new',
                     [
                         'id_news'  => "{$catsProductsObj[0][0]->id_news}",
                         'cat_news' => "{$catsProductsObj[0][0]->id_cat}",
                         'page_cat'     => 0,
                         'rewrite'  => "{$catsProductsObj[0][0]->rewrite}",
                         'cat_rewrite'  => "{$catsProductsObj[0][0]->rewrite}"
                     ]
                     ,false)}"
                     alt="{$catsProducts->title|escape:html:'UTF-8'}" class="newsHomeItem"  >
                                             <img src="{$catsProductsObj[0][0]->img}" title="{$catsProductsObj[0][0]->title}" alt="{$catsProductsObj[0][0]->title}" ></a>
                </div>
                <div class="category">
                    <span>{$catsProductsObj[0][0]->cat_name}</span>
                </div>
                <div class="newsHomeTitle">
                    <h2>{$catsProductsObj[0][0]->title}</h2>
                </div>
                <div class="date-author cf">
                    <span class="newsHomeDate">{$catsProductsObj[0][0]->date}</span>
                    <p class="newsHomeAutor">{$catsProductsObj[0][0]->autor}</p>
                </div>
                <div class="newsHomeDescription">
                    <p>{$catsProductsObj[0][0]->new|truncate:150:'...'|escape:html:'UTF-8'}</p>
                </div>

            </div>
            <!--Fin columna izquierdo-->
			
            <!--Columna derecha-->
            <div class="newsRight news-home grid_5 alpha omega">
                {foreach from=$catsProductsObj[0] item='catsProducts' name=myLoop}
 				{$myLoop}
                <div class="newsHomeContent grid_12 alpha omega">
                {if $smarty.foreach.myLoop.first}
                {else}
                    <div class="left-article grid_6 alpha">
                        <a href="{$link->getModuleLink('news', 'new',
                                             [
                                                 'id_news'  => "{$catsProducts->id_news}",
                                                 'cat_news' => "{$catsProducts->id_cat}",
                                                 'page_cat'     => 0,
                                                 'rewrite'  => "{$catsProducts->rewrite}",
                                                 'cat_rewrite'  => "{$cat_rewrite}"
                                             ]
                                             ,false)}"
                                             alt="{$catsProducts->title|escape:html:'UTF-8'}" class="newsHomeItem"  >
                        
                        
                        <img src="{$catsProducts->img}" title="{$catsProducts->title}" alt="{$catsProducts->title}"></a>
                    </div>
                    <div class="right-article grid_6 omega">
                        <div class="category">
                            <span>{$catsProducts->cat_name}</span>
                        </div>
                        <div class="newsHomeTitle">
                            <h2>{$catsProducts->title|escape:html:'UTF-8'}</h2>
                        </div>
                        <div class="date-author cf">
                            <span class="newsHomeDate">{$catsProducts->date}</span>
                            <p class="newsHomeAutor">{$catsProducts->autor}</p>
                        </div>
                        <div class="newsHomeDescription">
                            <p>{$catsProducts->new|truncate:250:'...'|escape:html:'UTF-8'}</p>
                        </div>
                    </div>
                </div>
                {/if}
                {/foreach}
            </div>
            <!--Columna derecha-->

        <!--Fin contenido articulos-->


        <!--INICIO SECCION COMENTADA-->
        {if false}
               {assign var='cats_position' value=1}
                <div class="btn-title cf grid_12 alpha omega">
                {foreach from=$catsObj item='cats' name=myLoop}
                    <h1>
                        <a href="#tabs-{$cats_position}">
                            {$cats->title|truncate:50:'...'|escape:html:'UTF-8'}
                        </a>

                    </h1>
                    <a class="blog-view-all button" href="{$link->getModuleLink('news', 'list',
                             [
                                 'cat_news' => "{$cat_produto}",
                                 'page_cat' => 0,
                                 'rewrite'  => "{$cat_rewrite}"
                              ]

                             ,false)}" alt="{l s='More' mod='news'}" class="newsHomeMore">
     						{l s='Ver todos los artículos' mod='news'}
     					</a>

                    {assign var='cats_position' value=$cats_position+1}
                {/foreach}
                </div>

                <div class="content-blog grid_12 alpha omega">

                    {assign var='cats_position' value=1}
                    {foreach from=$catsProductsObj item='catsProducts' name=myLoop}
                        <div class="title-destacado grid_2 alpha omega">

                        </div>
                        {if $smarty.foreach.myLoop.first}
                            <div class="newsLeft news-home grid_5 alpha omega" >

                              {assign var='cat_products_position' value=1}
                              {foreach from=$catsProducts item='catProduct' name=myLoop}

                                  {assign var='cat_produto' value=$catProduct->id_cat}
                                  {assign var='cat_rewrite' value=$catProduct->cat_rewrite}
                                    {if $cat_products_position==2}
                            </div>
                         {else}
                         <div class="newsRight news-home grid_5 alpha omega">
                             {/if}

                             <div class="newsHomeContent grid_12 alpha omega">
                                     <div class="left-article grid_6 alpha">
                                         <a href="{$link->getModuleLink('news', 'new',
                                             [
                                                 'id_news'  => "{$catProduct->id_news}",
                                                 'cat_news' => "{$catProduct->id_cat}",
                                                 'page_cat'     => 0,
                                                 'rewrite'  => "{$catProduct->rewrite}",
                                                 'cat_rewrite'  => "{$cat_rewrite}"
                                             ]
                                             ,false)}"
                                             alt="{$catProduct->title|escape:html:'UTF-8'}" class="newsHomeItem"  >

                                             <div class="newsHomeImg">
                                                <img src="{$catProduct->img}" >
                                            </div>
                                         </a>
                                     </div>
                                     <div class="right-article grid_6 omega">
                                         <div class="newsHomeTitle">
                                             <h2>{$catProduct->title|escape:html:'UTF-8'}</h2>
                                         </div>
                                         <div class="date-author cf">
                                             <div class="newsHomeDate">
                                                 {$catProduct->date}
                                             </div>
                                             <div class="newsHomeAutor">
                                                 <p><!-- {l s='Autor:'}--> {$catProduct->autor}</p>
                                             </div>
                                         </div>
                                         <div class="newsHomeDescription">
                                             <p>{$catProduct->new|truncate:250:'...'|escape:html:'UTF-8'}</p>
                                         </div>
                                     </div>
                                     <!-- <a class="button" href="{$link->getModuleLink('news', 'new',
                                         [
                                             'id_news'  => "{$catProduct->id_news}",
                                             'cat_news' => "{$catProduct->id_cat}",
                                             'page_cat'     => 0,
                                             'rewrite'  => "{$catProduct->rewrite}",
                                             'cat_rewrite'  => "{$cat_rewrite}"
                                         ]
                                         ,false)}"
                                         alt="{$catProduct->title|escape:html:'UTF-8'}" class="newsHomeItem"  >
                                        {l s='Leer más' mod='news'}
                                     </a> -->

                             </div>


                                     {assign var='cat_products_position' value=$cat_products_position+1}
                                   {/foreach}

                      </div>
                       {/if}



                     {assign var='cats_position' value=$cats_position+1}
                {/foreach}

                {/if}


    </div>
{/if}
