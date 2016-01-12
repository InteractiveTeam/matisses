
{if $catsObj}
    <script  type="text/javascript" >
        jQuery(function() {ldelim}
           jQuery( "#tabsNews" ).tabs();
        {rdelim});
    </script>


    <div id="news-home" class="newsHome grid_12 alpha omega cf">

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
        <!--Fin titulo sección-->

        <!--Inicio contenido articulos-->
        <div class="content-blog grid_12 alpha omega">
            <div class="title-destacado grid_1 alpha omega">
            </div>
            <!--Columna izquierdo-->
            <div class="newsLeft news-home grid_5 alpha omega" >
                <div class="img-article">
                    <a href="#"><img src="{$catsProductsObj[0][0]->img}" ></a>
                </div>
                <div class="info-article">
                    <div class="category">
                        <span>Categoria 1</span>
                    </div>
                    <div class="newsHomeTitle">
                        <h2>{$catsProductsObj[0][0]->title}</h2>
                    </div>
                    <div class="date-author cf">
                        <span class="newsHomeDate">{$catsProductsObj[0][0]->date}</span>
                        <p class="newsHomeAutor">{$catsProductsObj[0][0]->autor}</p>
                    </div>
                    <div class="newsHomeDescription">
                        <p>{$catsProductsObj[0][0]->new|truncate:250:'...'|escape:html:'UTF-8'}</p>
                    </div>
                </div>
            </div>
            <!--Fin columna izquierda-->

            <!--Columna derecha-->
            <div class="newsRight news-home grid_6 alpha omega">
                <div class="newsHomeContent grid_12 alpha omega first">
                    <div class="left-article grid_6 alpha">
                        <a href="#"><img src="{$catsProductsObj[0][1]->img}" ></a>
                    </div>
                    <div class="right-article grid_6 omega">
                        <div class="category">
                            <span>Categoria 2</span>
                        </div>
                        <div class="newsHomeTitle">
                            <h2>{$catsProductsObj[0][1]->title}</h2>
                        </div>
                        <div class="date-author cf">
                            <span class="newsHomeDate">{$catsProductsObj[0][1]->date}</span>
                            <p class="newsHomeAutor">{$catsProductsObj[0][1]->autor}</p>
                        </div>
                        <div class="newsHomeDescription">
                            <p>{$catsProductsObj[0][1]->new|truncate:140:'...'|escape:html:'UTF-8'}</p>
                        </div>
                    </div>
                </div>
                <div class="newsHomeContent grid_12 alpha omega second">
                    <div class="left-article grid_6 alpha">
                        <a href="#"><img src="{$catsProductsObj[0][2]->img}" ></a>
                    </div>
                    <div class="right-article grid_6 omega">
                        <div class="category">
                            <span>Categoria 3</span>
                        </div>
                        <div class="newsHomeTitle">
                            <h2>{$catsProductsObj[0][2]->title}</h2>
                        </div>
                        <div class="date-author cf">
                            <span class="newsHomeDate">{$catsProductsObj[0][2]->date}</span>
                            <p class="newsHomeAutor">{$catsProductsObj[0][2]->autor}</p>
                        </div>
                        <div class="newsHomeDescription">
                            <p>{$catsProductsObj[0][2]->new|truncate:140:'...'|escape:html:'UTF-8'}</p>
                        </div>
                    </div>
                </div>
            </div>
            <!--Columna derecha-->

        <!--Fin contenido articulos-->



{/if}
