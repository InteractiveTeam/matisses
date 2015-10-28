<!-- Block Viewed products -->
<div id="news_block_sides" class="block">
    <a href="{$link->getModuleLink('news', 'news', [] ,false)}">
        <h4>{l s='News' mod='news'}</h4>
    </a>
    <div class="block_content">
        <div class="products clearfix">

			{foreach from=$newsObj item='news' name=myLoop}
            
            <a href="{$link->getModuleLink('news', 'new', 
                                                            [
                                                                'id_news'  => "{$news->id_news}",
                                                                'cat_news' => "",
                                                                'page_cat'     => "",
                                                                'rewrite'  => "{$news->rewrite}",
                                                                'cat_rewrite'  => ""
                                                             ]

                                                            ,false)}" 
               alt="{$news->title|escape:html:'UTF-8'}"
               {if $news->img}
                    class="newsSideLinkZone newsSideLink" style="background: url({$news->img}) center center no-repeat;"
               {else}
                    class="newsSideLinkNoImg"
               {/if} >
               <div class="newsSideTitleActive">
                    {$news->title|truncate:50:'...'|escape:html:'UTF-8'}
                </div>
            </a>
			{/foreach}
             {if $catsObj}
             <div class="news_block_sides">
                <ul class="bullet">
                {foreach from=$catsObj item='cats' name=myLoop}
                    <li class="{if !$smarty.foreach.myLoop.last}first_item{else}last_item{/if}">
                        <a href="{$link->getModuleLink('news', 'list', 
                                                            [
                                                                'cat_news' => "{$cats->id}",
                                                                'page_cat' => 0,
                                                                'rewrite'  => "{$cats->rewrite}"
                                                             ]

                                                            ,false)}")}"
                            title="{$cats->title|truncate:50:'...'|escape:html:'UTF-8'}">
                            {$cats->title|escape:html:'UTF-8'}
                        </a>
                    </li>
                {/foreach}
                </ul>
             </div>
            {/if}

            {if $newsSideMore}
            <a href="{$link->getModuleLink('news', 'news', [] ,false)}" alt="{l s='More news' mod='news'}"
               class="newsSideMore">
                {l s='List all >>' mod='news'}
            </a>
            {/if}
            
        </div>
    </div>
</div>
