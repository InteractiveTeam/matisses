
{if $catsObj}
    <div id="news-home" class="newsHome grid_12 alpha omega cf">
		
        <div class="btn-title cf grid_12 alpha omega">
        	<h1>
            	<a href="{$link->getModuleLink('news', 'list',
                [
                'cat_news' => "{$cat_produto}",
                'page_cat' => 0,
                'rewrite'  => "blog"
                ]
                ,false)}" alt="{l s='More' mod='news'}">
                 {l s='Blog' mod='news'}
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
       {if false}
        <!--Inicio titulo sección-->
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
        {/if}
        <!--Fin titulo sección-->

        <!--Inicio contenido articulos-->
        <div class="content-blog grid_12 alpha omega">
            <div class="title-destacado grid_1 alpha omega">
            </div>
            <!--Columna izquierdo-->
            <div class="newsLeft news-home grid_5 alpha omega" >
                <div class="img-article">
                     <a href="{$link->getModuleLink('news', 'new',
                            [
                                'id_news'  => "{$catsProductsObj[0][0]->id_news}",
                                'cat_news' => "{$catsProductsObj[0][0]->id_cat}",
                                'page_cat'     => "{$page}",
                                'rewrite'  => "{$catsProductsObj[0][0]->rewrite}",
                                'cat_rewrite'  => "{$catsProductsObj[0][0]->cat_rewrite}"
                             ]
                             ,false)}"
                           alt="{$catsProductsObj[0][0]->title}" >
                    
                    
                    <img src="{$catsProductsObj[0][0]->img}" title="{$catsProductsObj[0][0]->title}" alt="{$catsProductsObj[0][0]->title}" ></a>
                </div>
                <div class="info-article">
                    <div class="category">
                        <a href="{$link->getModuleLink('news', 'new',
                            [
                                'id_news'  => "{$catsProductsObj[0][0]->id_news}",
                                'cat_news' => "{$catsProductsObj[0][0]->id_cat}",
                                'page_cat'     => "{$page}",
                                'rewrite'  => "{$catsProductsObj[0][0]->rewrite}",
                                'cat_rewrite'  => "{$catsProductsObj[0][0]->cat_rewrite}"
                             ]
                             ,false)}"
                           alt="{$catsProductsObj[0][0]->title}" >
                        <span>{$catsProductsObj[0][0]->cat_name}</span></a>
                    </div>
                    <div class="newsTitle">
                        <a href="{$link->getModuleLink('news', 'new',
                            [
                                'id_news'  => "{$catsProductsObj[0][0]->id_news}",
                                'cat_news' => "{$catsProductsObj[0][0]->id_cat}",
                                'page_cat'     => "{$page}",
                                'rewrite'  => "{$catsProductsObj[0][0]->rewrite}",
                                'cat_rewrite'  => "{$catsProductsObj[0][0]->cat_rewrite}"
                             ]
                             ,false)}"
                           alt="{$catsProductsObj[0][0]->title}" >
                        <h2>{$catsProductsObj[0][0]->title}</h2></a>
                    </div>
                    <div class="date-author cf">
                        <span class="newsDate">{$catsProductsObj[0][0]->date}</span> -
                        <p class="newsAutor">{$catsProductsObj[0][0]->autor}</p>
                    </div>
                    <div class="newsDescription">
                        <p>{$catsProductsObj[0][0]->new|truncate:250:'...'|escape:html:'UTF-8'}</p>
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
                                'id_news'  => "{$catsProductsObj[0][1]->id_news}",
                                'cat_news' => "{$catsProductsObj[0][1]->id_cat}",
                                'page_cat'     => "{$page}",
                                'rewrite'  => "{$catsProductsObj[0][1]->rewrite}",
                                'cat_rewrite'  => "{$catsProductsObj[0][1]->cat_rewrite}"
                             ]
                             ,false)}"
                           alt="{$catsProductsObj[0][1]->title}" >
                           <img src="{$catsProductsObj[0][1]->img}"  title="{$catsProductsObj[0][1]->title}" alt="{$catsProductsObj[0][1]->title}"  >
                           </a>
                    </div>
                    <div class="right-article grid_6 omega">
                        <div class="category">
                           <a href="{$link->getModuleLink('news', 'new',
                            [
                                'id_news'  => "{$catsProductsObj[0][1]->id_news}",
                                'cat_news' => "{$catsProductsObj[0][1]->id_cat}",
                                'page_cat'     => "{$page}",
                                'rewrite'  => "{$catsProductsObj[0][1]->rewrite}",
                                'cat_rewrite'  => "{$catsProductsObj[0][1]->cat_rewrite}"
                             ]
                             ,false)}"
                           alt="{$catsProductsObj[0][1]->title}" ><span>{$catsProductsObj[0][1]->cat_name}</span></a>
                        </div>
                        <div class="newsTitle">
                            <h2>{$catsProductsObj[0][1]->title}</h2>
                        </div>
                        <div class="date-author cf">
                            <span class="newsDate">{$catsProductsObj[0][1]->date}</span>
                            <p class="newsAutor">{$catsProductsObj[0][1]->autor}</p>
                        </div>
                        <div class="newsDescription">
                            <p>{$catsProductsObj[0][1]->new|truncate:140:'...'|escape:html:'UTF-8'}</p>
                        </div>
                    </div>
                </div>
                <div class="newsHomeContent grid_12 alpha omega second">
                    <div class="left-article grid_6 alpha">
                        <a href="{$link->getModuleLink('news', 'new',
                            [
                                'id_news'  => "{$catsProductsObj[0][2]->id_news}",
                                'cat_news' => "{$catsProductsObj[0][2]->id_cat}",
                                'page_cat'     => "{$page}",
                                'rewrite'  => "{$catsProductsObj[0][2]->rewrite}",
                                'cat_rewrite'  => "{$catsProductsObj[0][2]->cat_rewrite}"
                             ]
                             ,false)}"
                           alt="{$catsProductsObj[0][2]->title}" >
                           <img src="{$catsProductsObj[0][2]->img}" title="{$catsProductsObj[0][1]->title}" alt="{$catsProductsObj[0][1]->title}" ></a>
                    </div>
                    <div class="right-article grid_6 omega">
                        <div class="category">
                            <a href="{$link->getModuleLink('news', 'new',
                            [
                                'id_news'  => "{$catsProductsObj[0][2]->id_news}",
                                'cat_news' => "{$catsProductsObj[0][2]->id_cat}",
                                'page_cat'     => "{$page}",
                                'rewrite'  => "{$catsProductsObj[0][2]->rewrite}",
                                'cat_rewrite'  => "{$catsProductsObj[0][2]->cat_rewrite}"
                             ]
                             ,false)}"
                           alt="{$catsProductsObj[0][2]->title}" >
                           <span>{$catsProductsObj[0][2]->cat_name}</span></a>
                        </div>
                        <div class="newsTitle">
                            <h2>{$catsProductsObj[0][2]->title}</h2>
                        </div>
                        <div class="date-author cf">
                            <span class="newsDate">{$catsProductsObj[0][2]->date}</span>
                            <p class="newsAutor">{$catsProductsObj[0][2]->autor}</p>
                        </div>
                        <div class="newsDescription">
                            <p>{$catsProductsObj[0][2]->new|truncate:140:'...'|escape:html:'UTF-8'}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <!--Columna derecha-->

        <!--Fin contenido articulos-->



{/if}
