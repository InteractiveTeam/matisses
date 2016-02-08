{if !$ajax}
<!--
<pre>
{print_r($newsObj)}
</pre>
 -->


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
                    <a href="{$link->getModuleLink('news', 'new',
                            [
                                'id_news'  => "{$destacados[0]->id_news}",
                                'cat_news' => "{$destacados[0]->id_cat}",
                                'page_cat'     => "{$page}",
                                'rewrite'  => "{$destacados[0]->rewrite}",
                                'cat_rewrite'  => "{$destacados[0]->cat_rewrite}"
                             ]
                             ,false)}"
                           alt="{$destacados[0]->title}" >
                         <img src="{$destacados[0]->img}" title="{$destacados[0]->title}" alt="{$destacados[0]->title}" >
                    </a>
                </div>
                <div class="info-article">
                    <div class="category-news">
                        <a href="/{$destacados[0]->cat_link}"  title="{$destacados[0]->cat_name|truncate:50:'...'|escape:html:'UTF-8'}">
                        <span>{$destacados[0]->cat_name}</span></a>
                    </div>
                    <div class="newsTitle">
                        <h2>{$destacados[0]->title}</h2>
                    </div>
                    <div class="date-author cf">
                        <span class="newsDate">{$destacados[0]->date} -</span>
                        <p class="newsAutor">{$destacados[0]->autor}</p>
                    </div>
                    <div class="newsDescription">
                        <p>{$destacados[0]->new|truncate:200:'...'|escape:html:'UTF-8'}</p>
                    </div>
                </div>
            </div>
            <!--Fin columna izquierda-->

            <!--Columna derecha-->
            <div class="newsRight news-home grid_6 alpha omega">
                <div class="newsHomeContent grid_12 alpha omega first">
                    <div class="left-article grid_6 alpha">
                        <a href="{$link->getModuleLink('news', 'new',
                            [
                                'id_news'  => "{$destacados[1]->id_news}",
                                'cat_news' => "{$destacados[1]->id_cat}",
                                'page_cat'     => "{$page}",
                                'rewrite'  => "{$destacados[1]->rewrite}",
                                'cat_rewrite'  => "{$destacados[1]->cat_rewrite}"
                             ]
                             ,false)}"
                           alt="{$destacados[0]->title}" > <img src="{$destacados[1]->img}" title="{$destacados[1]->title}" alt="{$destacados[1]->title}" ></a>
                    </div>
                    <div class="right-article grid_6 omega">
                        <div class="category-news">
                            <a href="/{$destacados[1]->cat_link}"  title="{$destacados[1]->cat_name|truncate:50:'...'|escape:html:'UTF-8'}">
                            <span>{$destacados[1]->cat_name}</span></a>
                        </div>
                        <div class="newsTitle">
                            <h2>{$destacados[1]->title}</h2>
                        </div>
                        <div class="date-author cf">
                            <span class="newsDate">{$destacados[1]->date} -</span>
                            <p class="newsAutor">{$destacados[1]->autor}</p>
                        </div>
                        <div class="newsDescription">
                            <p>{$destacados[1]->new|truncate:140:'...'|escape:html:'UTF-8'}</p>
                        </div>
                    </div>
                </div>
                <div class="newsHomeContent grid_12 alpha omega second">
                    <div class="left-article grid_6 alpha">
                        <a href="{$link->getModuleLink('news', 'new',
                            [
                                'id_news'  => "{$destacados[1]->id_news}",
                                'cat_news' => "{$destacados[1]->id_cat}",
                                'page_cat'     => "{$page}",
                                'rewrite'  => "{$destacados[1]->rewrite}",
                                'cat_rewrite'  => "{$destacados[1]->cat_rewrite}"
                             ]
                             ,false)}"
                           alt="{$destacados[1]->title}" > <img src="{$destacados[2]->img}" title="{$destacados[2]->title}" alt="{$destacados[2]->title}" ></a>

                    </div>
                    <div class="right-article grid_6 omega">
                        <div class="category-news">
                            <a href="/{$destacados[2]->cat_link}"
                                          title="{$destacados[2]->cat_name|truncate:50:'...'|escape:html:'UTF-8'}">
                                <span>{$destacados[2]->cat_name}</span>
                            </a>
                        </div>
                        <div class="newsTitle">
                            <h2>{$destacados[2]->title}</h2>
                        </div>
                        <div class="date-author cf">
                            <span class="newsDate">{$destacados[2]->date} -</span>
                            <p class="newsAutor">{$destacados[2]->autor}</p>
                        </div>
                        <div class="newsDescription">
                            <p>{$destacados[2]->new|truncate:140:'...'|escape:html:'UTF-8'}</p>
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
                           <ul>
                               <li class="grid_12">
                                   {if $news->img}
                                   <div class="newsListImg grid_4 alpha">
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
                                       <img src="{$news->img}" alt="{$news->title|escape:html:'UTF-8'}" title="{$news->title|escape:html:'UTF-8'}">
                                     </a>
                                       <!-- <div style="background: url({$news->img}) center center no-repeat;"></div> -->
                                   </div>
                                   {else}
                                   {/if}
                                    <div class="newsListContent right-article grid_8 alpha omega">
                                        <div class="category-news">
                                            <span>{$news->cat_name}</span>
                                        </div>
                                        <div class="newsTitle">
                                            <h2>{$news->title|escape:html:'UTF-8'}</h2>
                                        </div>

                                        <div class="date-author cf">
                                            <span class="newsDate">{$news->date} -</span>
                                            <p class="newsAutor">{if $news->autor}{$news->autor}{/if}</p>
                                        </div>
                                        <div class="newsListText">
                                            <p>{$news->new|escape:html:'UTF-8'|truncate:220:'...'}</p>
                                        </div>
                                    </div>
                               </li>
                           </ul>
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
                        <div class="newsPager">
                            <ul class="newsPagination">
                                        {if $page != 1}
                                            {assign var='p_previous' value=$page-1}
                                <li id="newsPagination_previous">

                                    <a  href="/blog/page-{$page-1}">
                                        <i class="fa fa-angle-double-left"></i>
                                    </a>
                                </li>
                                        {/if}

                                        {section name=pagination start=$start loop=$stop+1 step=1}

                                {if $page == ($smarty.section.pagination.index)}
                                <li class="current">
                                    <span>{$page|escape:'htmlall':'UTF-8'}</span>
                                </li>

                                 {else}
                                <li>
                                {if (!$cat_rewrite)}
                                	<a href="/blog/page-{$smarty.section.pagination.index}" title="page-{$smarty.section.pagination.index}">
                                    {$smarty.section.pagination.index|escape:'htmlall':'UTF-8'}</a>
                                {else}

                                {/if}
                               </li>
                               {/if}
                                {/section}

                                        {if $pages > 0 AND $page-1 != $pages}
                                            {assign var='p_next' value=$page+1}
                                <li id="newsPagination_next">
                                    <a href="/blog/page-{$smarty.section.pagination.index-1}">
                                        <i class="fa fa-angle-double-right"></i>
                                    </a>
                                </li>
                                        {/if}
                            </ul>
                            
                        </div>
                      {/if}
                      {/if}
                      <div class="loadingAjax" style="display: none;"></div>
                  </div>
            </div>

            <div class="right-news grid_3 alpha omega">
                <div class="search-news grid_12 omega">
                    <form action="/blog" method="post" class="fromNewsSearch" name="fromNewsSearch">
                        <input type="text" name="search_news" value="{$search_news}" class="newsSearch" placeholder="Buscar"></input>
                        <input type="submit" name="searchnewshidden"></input>
                    </form>
                </div>
                <div class="category-filter grid_12 omega">
                    <h4>{l s='Categorías' mod='news'}</h4>

                    <ul>
                   {foreach from=$categorias item='cats' name=myLoop}
                        <li>
                        	<a href="{$base_url}{$cats.link}" title="{$cats.title|truncate:50:'...'|escape:html:'UTF-8'}">
                                 {$cats.title|escape:html:'UTF-8'}
                           	</a>
                        </li>
                    {/foreach}

                    </ul>
                </div>
                <div class="commented-popular grid_12 omega">
                    <div id="tabs-news" class="news-tabs">
                      <ul>
                        <li><a href="#tabs-1">Comentados</a></li>
                        <li><a href="#tabs-2">Populares</a></li>
                      </ul>
                      <div id="tabs-1" class="content-tabs">
                        <ul>
                        	{foreach from=$commentados item=articulo}
                            <li>
                                <div class="category-news">
                                    <span>{$articulo.category}</span>
                                </div>
                                <div class="newsTitle">
                                    <h2>{$articulo.title}</h2>
                                </div>
                            </li>
                            {/foreach}
                        </ul>
                      </div>
                      <div id="tabs-2" class="content-tabs">
                        <ul>
                        	{foreach from=$populares item=articulo}
                            <li>
                                <div class="category-news">
                                    <span>{$articulo.category}</span>
                                </div>
                                <div class="newsTitle">
                                    <h2>{$articulo.title}</h2>
                                </div>
                            </li>
                            {/foreach}

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
