{if !$ajax}


<div class="blog-list">
    <div class="newsMenuCats">
        <h1>Blog</h1>

        <div class="breadcrumb newsBreadcrumb iconNewsList ">
            <a href="{$link->getPageLink('index')}" >{l s='Home' mod='news'}</a>
            <span class="navigation-pipe">&gt;</span>
            <span class="navigation_page">
                <a href="{$link->getModuleLink('news', 'news', [] ,false)}" >{l s='news' mod='news'}</a>
            </span>

            <a class="newsRss" href="{$link->getModuleLink('news', 'rss', ['rss_news'=>1] ,false)}" target="_blank"></a>
        </div>


        <form action="{$link->getModuleLink('news', 'news', [] ,false)}" method="post" class="fromNewsSearch" name="fromNewsSearch">
            <input type="text" name="search_news" value="{$search_news}" class="newsSearch"></input>
            <input type="submit" name="searchnewshidden" style="visibility: hidden"></input>
        </form>

      {if $catsObj}
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


     </div>
{else}
    <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
{/if}


<div id="news_block_list" class="cf" >
    {if $notFoundResults}
        {if $search_news}
        <p class="warning">{l s=' No results found for your search : ' mod='news'} "{$search_news}"</p>
        {else}
        <p class="warning">{l s='No news found' mod='news'} </p>
        {/if}
    {/if}
	{foreach from=$newsObj item='news' name=myLoop}


    <a onclick="document.location = '{$link->getModuleLink('news', 'new',
                                                            [
                                                                'id_news'  => "{$news->id_news}",
                                                                'cat_news' => "{if $cat}{$cat}{/if}",
                                                                'page_cat'     => "{$page}",
                                                                'rewrite'  => "{$news->rewrite}",
                                                                'cat_rewrite'  => "{$cat_rewrite}"
                                                             ]

                                                            ,false)}'"
        href="{$link->getModuleLink('news', 'new',
                                                            [
                                                                'id_news'  => "{$news->id_news}",
                                                                'cat_news' => "{if $cat}{$cat}{/if}",
                                                                'page_cat'     => "{$page}",
                                                                'rewrite'  => "{$news->rewrite}",
                                                                'cat_rewrite'  => "{$cat_rewrite}"
                                                             ]

                                                            ,false)}"
       alt="{$news->title|escape:html:'UTF-8'}" class="newsListItem">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                {if $news->img}
                <td width="190" valign="top">
                    <div class="newsListImgPadding">
                        <div class="newsListImg" style="background: url({$news->img}) center center no-repeat;"></div>
                    </div>
                </td>
                <td>
                    {else}
                <td>
                    {/if}
                   <div class="newsListTitle">
                        <h2>{$news->title|escape:html:'UTF-8'}</h2>
                    </div>
                    <div class="new-author">
                        <p>{if $news->autor}{$news->autor} {l s='on' mod='news'}{/if}</p>
                    </div>
                    <div class="news-date">
                        <span> {$news->date}</span>
                    </div>
                    <div class="newsListText">
                        <p>{$news->new|escape:html:'UTF-8'|truncate:220:'...'}</p>
                        <div class="button newsMoreBtn btn-red">
                            {l s='Leer más' mod='news'}
                        </div>
                    </div>
                </td>
        </table>
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
