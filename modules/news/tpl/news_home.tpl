
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
                     <div id="tabs-{$cats_position}">
                        <div class="newsLeft news-home grid_6 alpha" >
                          {assign var='cat_products_position' value=1}
                          {foreach from=$catsProducts item='catProduct' name=myLoop}
                              {assign var='cat_produto' value=$catProduct->id_cat}
                              {assign var='cat_rewrite' value=$catProduct->cat_rewrite}
                                {if $cat_products_position==2}
                        </div>
                        <div class="newsRight news-home grid_6 omega">
                            {/if}
                            <div class="newsHomeDate">
                                {$catProduct->date}
                            </div>
                            <div class="newsHomeContent">
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


                                    <div class="newsHomeTitle">
                                        <h2>{$catProduct->title|escape:html:'UTF-8'}</h2>
                                    </div>
                                    <div class="newsHomeAutor">
                                        <p>{l s='Autor:'} {$catProduct->autor}</p>
                                    </div>
                                     <div class="newsHomeImg">
                                        <img src="{$catProduct->img}" >
                                    </div>
                                </a>

                                    <div class="newsHomeDescription">
                                        <p>{$catProduct->new|truncate:250:'...'|escape:html:'UTF-8'}</p>
                                    </div>

                                    <a class="button" href="{$link->getModuleLink('news', 'new',
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
                                    </a>

                            </div>
                                    {assign var='cat_products_position' value=$cat_products_position+1}
                                  {/foreach}

                     </div>
                     {assign var='cats_position' value=$cats_position+1}
                {/foreach}

            </div>


    </div>
{/if}
