{if !$ajax}
<!--
<pre>
{print_r($newsObj)}
</pre>
 -->
 
 <pre>{print_r($newsObj)}</pre>
 
<div class="blog-list">
    <div class="newsMenuCats">
        <h1>{l s='Blog' mod='news'}</h1>
        <!--Inicio contenido articulos-->
        <div class="content-destacados grid_12 alpha omega">
            <div class="title-destacado grid_1 alpha omega">
            </div>
            <!--Columna izquierdo-->
            <div class="newsLeft grid_5 alpha omega" >
                <div class="img-article">
                    <a href="#">
                        <img src="/modules/news/imgs/15-home-destacado.jpg" >
                    </a>
                </div>
                <div class="info-article">
                    <div class="category">
                        <a href="#"><span>Categoria 1</span></a>
                    </div>
                    <div class="newsTitle">
                        <h2>La iluminación perfecta para el hogar</h2>
                    </div>
                    <div class="date-author cf">
                        <span class="newsDate">{$catsProductsObj[0][1]->date}</span>
                        <p class="newsAutor">{$catsProductsObj[0][1]->autor}</p>
                    </div>
                    <div class="newsDescription">
                        <p>Uno de los elementos que con más fuerza se habla en la decoración de interiores, ya sea para ambientar casas o departamentos, son las lámparas, las cuales han pasado a ser más que iluminación, aportando valor visual y luminosidad en el hogar  ya...</p>
                    </div>
                </div>
            </div>
            <!--Fin columna izquierda-->

            <!--Columna derecha-->
            <div class="newsRight news-home grid_6 alpha omega">
                <div class="newsHomeContent grid_12 alpha omega first">
                    <div class="left-article grid_6 alpha">
                        <a href="#"><img src="/modules/news/imgs/14-home.jpg" ></a>
                    </div>
                    <div class="right-article grid_6 omega">
                        <div class="category">
                            <a href="#"><span>Categoria 2</span></a>
                        </div>
                        <div class="newsTitle">
                            <h2>El estilo oculto de las cocinas</h2>
                        </div>
                        <div class="date-author cf">
                            <span class="newsDate">{$catsProductsObj[0][0]->date}</span>
                            <p class="newsAutor">{$catsProductsObj[0][0]->autor}</p>
                        </div>
                        <div class="newsDescription">
                            <p>Desde siempre ha existido en nuestras cocinas una serie de elementos cuyos usos se han limitado solamente a lo funcional, en muchas...</p>
                        </div>
                    </div>
                </div>
                <div class="newsHomeContent grid_12 alpha omega second">
                    <div class="left-article grid_6 alpha">
                        <a href="#">
                            <img src="/modules/news/imgs/16-home.jpg" >
                        </a>
                    </div>
                    <div class="right-article grid_6 omega">
                        <div class="category">
                            <a href="#">
                                <span>Categoria 3</span>
                            </a>
                        </div>
                        <div class="newsTitle">
                            <h2>El menaje perfecto para la cocina ideal</h2>
                        </div>
                        <div class="date-author cf">
                            <span class="newsDate">{$catsProductsObj[0][0]->date}</span>
                            <p class="newsAutor">{$catsProductsObj[0][0]->autor}</p>
                        </div>
                        <div class="newsDescription">
                            <p>En 1928, el arquitecto suizo Le Corbusier detalla perfectamente el diseño de una silla ergonómica y en materiales industriales, la cual...</p>
                        </div>
                    </div>
                </div>
            </div>
            <!--Columna derecha-->
        </div>
        <!--Fin contenido articulos-->

        <!--Inicio listado últimos articulos-->
        <div class="latest-articles grid_12 alpha omega">

            <div class="left-news grid_9 alpha">
                <h3>{l s='Últimos artículos' mod='news'}</h3>
                {if $catsObj && false}
                           {assign var='menu_position' value=1}
                           {foreach from=$catsObj item='cats' name=myLoop}
                                  <div class="{if $smarty.foreach.myLoop.last}news_last_item{else}news_first_item{/if}">
                                      <a class="{if $cat==$cats->id} newsMenuHover_{$menu_position}_selected{/if} newsItemMenu newsMenuHover_{$menu_position}"
                                         href="{$link->getModuleLink('news', 'list',
                                              [
                                                  'cat_news' => "{$cats->id}",
                                                  'page_cat' => 0,
                                                  'rewrite'  => "{$cats->rewrite}"
                                               ]

                                              ,false)}"
                                          title="{$cats->title|truncate:50:'...'|escape:html:'UTF-8'}">
                                          {$cats->title|escape:html:'UTF-8'}
                                      </a>
                                  </div>
                                  {assign var='menu_position' value=$menu_position+1}
                           {/foreach}
                  {/if}

                  <div id="news_block_list" class="news_block_list cf" >
                      {if $notFoundResults}
                        {if $search_news}
                        <p class="warning">
                            {l s=' No results found for your search : ' mod='news'} "{$search_news}"</p>
                        {else}
                        <p class="warning">{l s='No news found' mod='news'} </p>
                        {/if}
                      {/if}

                      {foreach from=$newsObj item='news' name=myLoop}
                      <a href="{$link->getModuleLink('news', 'new',
                            [
                                'id_news'  => "{$news->id_news}",
                                'cat_news' => "{if $cat}{$cat}{/if}",
                                'page_cat'     => "{$page}",
                                'rewrite'  => "{$news->rewrite}",
                                'cat_rewrite'  => "{$cat_rewrite}"
                             ]
                             ,false)}"
                           alt="{$news->title|escape:html:'UTF-8'}" class="newsListItem">
                           <ul>
                               <li class="grid_12">
                                   {if $news->img}
                                   <div class="newsListImg grid_4 alpha">
                                       <img src="/img/img-blog-list.jpg" alt="">
                                       <!-- <div style="background: url({$news->img}) center center no-repeat;"></div> -->
                                   </div>
                                   {else}
                                   {/if}
                                    <div class="newsListContent right-article grid_8 alpha omega">
                                        <div class="category">
                                            <span>Categoria 1</span>
                                        </div>
                                        <div class="newsTitle">
                                            <h2>{$news->title|escape:html:'UTF-8'}</h2>
                                        </div>

                                        <div class="date-author cf">
                                            <span class="newsDate">Fecha</span>
                                            <p class="newsAutor">{if $news->autor}{$news->autor} {l s='on' mod='news'}{/if}</p>
                                        </div>
                                        <div class="newsListText">
                                            <p>{$news->new|escape:html:'UTF-8'|truncate:220:'...'}</p>
                                        </div>
                                    </div>
                               </li>
                           </ul>
                        </a>
                      {/foreach}

                  </div>
                  <div class="newsAjaxContent">
                      {if $pager}
                          {if $ajaxPager}
                        {if $showPagerAjax}
                            <a alt="{l s='Next News' mod='news'}" class="newsPager page_more"
                               href="{$link->getModuleLink('news', 'list',
                                                                            [
                                                                                'cat_news' => "{$cat}",
                                                                                'page_cat' => "{$page+1}",
                                                                                'rewrite'  => "{$cat_rewrite}",
                                                                                'search_news' => "{if $search_news}{$search_news}{$search_news}{/if}",
                                                                                'tag_news' => "{if $tag}{$tag}{/if}"
                                                                             ]

                                                                            ,false)}"
                               onclick="news_ajax('{$link->getModuleLink('news', 'list',
                                                                            [
                                                                                'cat_news' => "{$cat}",
                                                                                'page_cat' => "{$page+1}",
                                                                                'rewrite'  => "{$cat_rewrite}",
                                                                                'search_news' => "{if $search_news}{$search_news}{/if}",
                                                                                'tag_news' => "{if $tag}{$tag}{/if}",
                                                                                'ajaxnewslist' => '1'
                                                                             ]

                                                                            ,false)}');return false;" >
                                    {l s='Show more' mod='news'}
                            </a>
                        {/if}
                      {else}
                        <div class="newsPager newsPagination">
                            <ul class="newsPagination">
                                        {if $page != 0}
                                            {assign var='p_previous' value=$page-1}
                                <li id="newsPagination_previous">
                                    <a  href="{$link->getModuleLink('news', 'list',
                                                                            [
                                                                                'cat_news' => "{$cat}",
                                                                                'page_cat' => "{$p_previous}",
                                                                                'rewrite'  => "{$cat_rewrite}",
                                                                                'search_news' => "{if $search_news}{$search_news}{/if}",
                                                                                'tag_news' => "{if $tag}{$tag}{/if}"
                                                                             ]

                                                                            ,false)}">&laquo;&nbsp;{l s='Previous' mod='news'}</a></li>
                                        {/if}

                                        {section name=pagination start=$start loop=$stop+1 step=1}
                                            {if $page == $smarty.section.pagination.index-1}
                                <li class="current"><span>{$page+1|escape:'htmlall':'UTF-8'}</span></li>
                                            {else}
                                <li><a href="{$link->getModuleLink('news', 'list',
                                                                            [
                                                                                'cat_news' => "{$cat}",
                                                                                'page_cat' => "{$smarty.section.pagination.index-1}",
                                                                                'rewrite'  => "{$cat_rewrite}",
                                                                                'search_news' => "{if $search_news}{$search_news}{/if}",
                                                                                'tag_news' => "{if $tag}{$tag}{/if}"
                                                                             ]

                                                                            ,false)}">{$smarty.section.pagination.index|escape:'htmlall':'UTF-8'}</a></li>
                                            {/if}
                                        {/section}

                                        {if $pages > 0 AND $page != $pages}
                                            {assign var='p_next' value=$page+1}
                                <li id="newsPagination_next"><a href="{$link->getModuleLink('news', 'list',
                                                                            [
                                                                                'cat_news' => "{$cat}",
                                                                                'page_cat' => "{$p_next}",
                                                                                'rewrite'  => "{$cat_rewrite}",
                                                                                'search_news' => "{if $search_news}{$search_news}{/if}",
                                                                                'tag_news' => "{if $tag}{$tag}{/if}"
                                                                             ]

                                                                            ,false)}">{l s='Next' mod='news'}&nbsp;&raquo;</a></li>
                                        {/if}
                            </ul>
                            <form action="{$link->getPageLink('news')}" method="post" name="fromNewsSearch">
                                <input type="text" name="search_news" value="{$search_news}" class="newsSearch"></input>
                                <input type="submit" name="searchnewshidden" style="visibility: hidden"></input>
                            </form>
                        </div>
                      {/if}
                      {/if}
                      <div class="loadingAjax" style="display: none;"></div>
                  </div>
            </div>

            <div class="right-news grid_3 alpha omega">
                <div class="search-news grid_12 omega">
                    <form action="{$link->getModuleLink('news', 'news', [] ,false)}" method="post" class="fromNewsSearch" name="fromNewsSearch">
                        <input type="text" name="search_news" value="{$search_news}" class="newsSearch" placeholder="Buscar"></input>
                        <input type="submit" name="searchnewshidden"></input>
                    </form>
                </div>
                <div class="category-news grid_12 omega">
                    <h4>Categorías</h4>
                    <ul>
                        <li><a href="#">Mobiliario y accesorios</a></li>
                        <li><a href="#">Tendencias</a></li>
                        <li><a href="#">Espacios</a></li>
                        <li><a href="#">Lifestyle</a></li>
                        <li><a href="#">Decorar con tapetes</a></li>
                    </ul>
                </div>
                <div class="commented-popular grid_12 omega">
                    <div id="tabs-news" class="news-tabs">
                      <ul>
                        <li><a href="#tabs-1">Comentados</a></li>
                        <li><a href="#tabs-2">Populares</a></li>
                      </ul>
                      <div id="tabs-1">
                        <ul>
                            <li>
                                <div class="category">
                                    <span>Categoria 1</span>
                                </div>
                                <div class="newsTitle">
                                    <h2>La iluminación perfecta para los hogares</h2>
                                </div>
                            </li>
                            <li>
                                <div class="category">
                                    <span>Categoria 1</span>
                                </div>
                                <div class="newsTitle">
                                    <h2>La iluminación perfecta para los hogares</h2>
                                </div>
                            </li>
                            <li>
                                <div class="category">
                                    <span>Categoria 2</span>
                                </div>
                                <div class="newsTitle">
                                    <h2>La iluminación perfecta para los hogares</h2>
                                </div>
                            </li>
                        </ul>
                      </div>
                      <div id="tabs-2">
                        <ul>
                            <li>
                                <div class="category">
                                    <span>Categoria 1</span>
                                </div>
                                <div class="newsTitle">
                                    <h2>La iluminación perfecta para los hogares</h2>
                                </div>
                            </li>
                            <li>
                                <div class="category">
                                    <span>Categoria 1</span>
                                </div>
                                <div class="newsTitle">
                                    <h2>La iluminación perfecta para los hogares</h2>
                                </div>
                            </li>
                            <li>
                                <div class="category">
                                    <span>Categoria 1</span>
                                </div>
                                <div class="newsTitle">
                                    <h2>La iluminación perfecta para los hogares</h2>
                                </div>
                            </li>
                        </ul>
                      </div>
                    </div>
                </div>
            </div>
        </div>

        {else}
            <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
        {/if}

    </div>
</div>
