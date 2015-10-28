<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
    <channel>
        <title><![CDATA[ {$shopName} {l s=' - News' mod='news'}]]></title>
		<link>{$link->getModuleLink('news', 'news', [] ,false)}</link>
		<mail>{$shopEmail}</mail>
		<generator>PrestaShop</generator>
		<language>{$lang}</language>
		<image>
			<title><![CDATA[{$shopName} {l s=' - News' mod='news'}]]></title>
			<url>{$shopUrl}img/logo.jpg</url>
			<link>{$link->getModuleLink('news', 'news', [] ,false)}</link>
		</image>

	{foreach from=$newsObj item='news' name=myLoop}
        <item>
            <title>
            <![CDATA[ {$news->title|escape:html:'UTF-8'} ]]>
            </title>
            <description>
            <![CDATA[
            {if $news->img}
            <img src='{$news->img}' title='{$news->title|escape:html:'UTF-8'|truncate:100:'...'}' alt='thumb' />
            {/if}
            <p>{$news->new|escape:html:'UTF-8'|truncate:220:'...'}</p>
            ]]>
            </description>
            <link>
            <![CDATA[
            {$link->getModuleLink('news', 'new', 
                                                            [
                                                                'id_news'  => "{$news->id_news}",
                                                                'cat_news' => "",
                                                                'page_cat'     => "",
                                                                'rewrite'  => "{$news->rewrite}",
                                                                'cat_rewrite'  => ""
                                                             ]

                                                            ,false)}
            ]]>
            </link>
        </item>
	{/foreach}
    </channel>
</rss>