
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
<div class="newsMenuCats">

        <form action="{$link->getModuleLink('news', 'news', [] ,false)}" method="post" class="fromNewsSearch" name="fromNewsSearch">
            <input type="text" name="search_news" value="{$search_news}" class="newsSearch"></input>
            <input type="submit" name="searchnewshidden" style="visibility: hidden"></input>
        </form>

       {if $catsObj}
                 {assign var='menu_position' value=1}
                 {foreach from=$catsObj item='cats' name=myLoop}
                        <div class="{if $smarty.foreach.myLoop.last}news_last_item{else}news_first_item{/if}">
                            <h1>
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
                            </h1>
                        </div>
                        {assign var='menu_position' value=$menu_position+1}
                 {/foreach}
        {/if}

     </div>
<div class="newContent">

    <div class="newContentInt">
        <div class="newTopActions">

                <a href="javascript:void(0)" onclick="moreText();" class="newTextMore"></a>
                <a href="javascript:void(0)" onclick="normalText()"  class="newTextNormal"></a>
                <a href="javascript:void(0)" onclick="lessText()" class="newTextLess"></a>
                <a href="javascript:window.print()" class="newPrint"></a>

        </div>
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
						pagerAnchorBuilder: function(idx, slide) {ldelim}
							// return sel string for existing anchor
							return '#newGallery a:eq(' + (idx) + ')';
						}
                });

				{/if}
            });

            </script>
            <div class="newImgsContent" >
                <div class="newSlideshow" >
                    <div class="newSlideshowCenter" >
                        <div id="newSlideshow" >
                            {foreach from=$imgsObj item='img' name=myLoop}
                                  <a href="{$img->img}" title="{$title|escape:html:'UTF-8'|truncate:220:'...'} -  {$date}"><img
								src="{$img->img_slider}"  alt="" width="{$news_slideshow_width}"  height="{$news_slideshow_height}"  /></a>
                            {/foreach}
                        </div>
                    </div>
                </div>

				{if count($imgsObj)>1}
					<div class="newGallery" id="newGallery">
						{foreach from=$imgsObj item='img' name=myLoop}
							<a href="{$img->img}" title="{$title|escape:html:'UTF-8'|truncate:220:'...'} -  {$date}"><img src="{$img->img_thumbnail}"  alt="" width="70" height="30"  /></a>
						{/foreach}
					</div>

				{/if}
            </div>

        {/if}
        <div class="newTitle">{$title}</div><br>
        <div class="newAutorDate">{if $autor}{$autor} {l s='on' mod='news'}{/if} {$date}</div><br>
        <div class="newText">
            {$new}
        </div>




         <div class="newContentSocial">
             <!-- AddThis Button BEGIN -->
                <div>
                    <div class="addthis_toolbox addthis_default_style ">
                        <a class="addthis_button_email" ></a>
                    </div>
                    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4fd60a055ec70816"></script>
                </div>
                <!-- AddThis Button END -->

            {if $socialButtons[0]=='1'}

                <div>
                    <!-- FACEBOOK BTN COUNT -->
                    <iframe src="http://www.facebook.com/plugins/like.php?href={$link->getModuleLink('news', 'new',
                                                            [
                                                                'id_news'  => "{$id_news}",
                                                                'cat_news' => "{$cat}",
                                                                'page_cat'     => 0,
                                                                'rewrite'  => "{$rewrite}",
                                                                'cat_rewrite'  => ""
                                                             ]

                                                            ,false)}?&amp;layout=button_count&amp;show_faces=false&amp;width=350&amp;action=like&amp;font=verdana&amp;colorscheme=light&amp;height=25" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:350px; height:25px;" allowTransparency="true"></iframe>
                    <!-- FACEBOOK BTN COUNT -->

                </div>
            {/if}

            {if $socialButtons[1]=='1'}
            <!-- TWITTER BTN COUNT -->
            <div>
                <a href="https://twitter.com/share" class="twitter-share-button" data-url="{$link->getModuleLink('news', 'new',
                                                            [
                                                                'id_news'  => "{$id_news}",
                                                                'cat_news' => "{$cat}",
                                                                'page_cat'     => 0,
                                                                'rewrite'  => "{$rewrite}",
                                                                'cat_rewrite'  => ""
                                                             ]

                                                            ,false)}">Tweet</a>
                <script>!function(d,s,id) {ldelim}
    var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id))
         {ldelim} js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
            </div>
            <!-- TWITTER BTN COUNT -->
            {/if}

            {if $socialButtons[2]=='1'}
            <!-- Google + BTN COUNT -->
            <!-- Place this tag where you want the +1 button to render -->
            <div><g:plusone size="medium" href="{$link->getModuleLink('news', 'new',
                                                            [
                                                                'id_news'  => "{$id_news}",
                                                                'cat_news' => "{$cat}",
                                                                'page_cat'     => 0,
                                                                'rewrite'  => "{$rewrite}",
                                                                'cat_rewrite'  => ""
                                                             ]

                                                            ,false)}"></g:plusone></div>

            <!-- Place this render call where appropriate -->
            <script type="text/javascript">
              (function()  {ldelim}
                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                po.src = 'https://apis.google.com/js/plusone.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
              })();
            </script>
            <!-- Google + BTN COUNT -->
            {/if}

            {if $socialButtons[3]=='1'}
            <!-- linkedin BTN COUNT -->
            <div>
                <script src="http//platform.linkedin.com/in.js" type="text/javascript"></script>
                <script type="IN/Share" data-url="{$link->getModuleLink('news', 'new',
                                                            [
                                                                'id_news'  => "{$id_news}",
                                                                'cat_news' => "{$cat}",
                                                                'page_cat'     => 0,
                                                                'rewrite'  => "{$rewrite}",
                                                                'cat_rewrite'  => ""
                                                             ]

                                                            ,false)}" data-counter="right"></script>
            </div>
            <!-- linkedin BTN COUNT -->
            {/if}

            {if $socialButtons[4]=='1'}
            <!-- pinterest BTN COUNT -->
            <div>
                <a href="http://pinterest.com/pin/create/button/?url={$link->getModuleLink('news', 'new',
                                                            [
                                                                'id_news'  => "{$id_news}",
                                                                'cat_news' => "{$cat}",
                                                                'page_cat'     => 0,
                                                                'rewrite'  => "{$rewrite}",
                                                                'cat_rewrite'  => ""
                                                             ]

                                                            ,false)}" class="pin-it-button" count-layout="horizontal"><img border="0" src="//assets.pinterest.com/images/PinExt.png" title="Pin It" /></a>
                <script type="text/javascript" src="//assets.pinterest.com/js/pinit.js"></script>
            </div>
            <!-- pinterest BTN COUNT -->
            {/if}

            {if $socialButtons[5]=='1'}
            <!-- reddit BTN COUNT -->
            <div><a href="http://www.reddit.com/submit" onclick="window.location = 'http://www.reddit.com/submit?url=' + encodeURIComponent(window.location); return false"> <img src="http://www.reddit.com/static/spreddit7.gif" alt="submit to reddit" border="0" /> </a></div>
            <!-- reddit BTN COUNT -->
            {/if}

            {if $socialButtons[6]=='1'}
            <!-- stumbleupon BTN COUNT -->
            <div><!-- Place this tag where you want the su badge to render -->
                <su:badge layout="2" location="{$link->getModuleLink('news', 'new',
                                                            [
                                                                'id_news'  => "{$id_news}",
                                                                'cat_news' => "{$cat}",
                                                                'page_cat'     => 0,
                                                                'rewrite'  => "{$rewrite}",
                                                                'cat_rewrite'  => ""
                                                             ]

                                                            ,false)}"></su:badge>

                <!-- Place this snippet wherever appropriate -->
                <script type="text/javascript">
                  (function()  {ldelim}
                    var li = document.createElement('script'); li.type = 'text/javascript'; li.async = true;
                    li.src = 'https://platform.stumbleupon.com/1/widgets.js';
                    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(li, s);
                  })();
                </script></div>
            <!-- stumbleupon BTN COUNT -->
            {/if}

            {if $socialButtonHtml}
            <div>
                {$socialButtonHtml}
            </div>
            {/if}

        </div>

            <div class="newsSep"></div>

         {if $tagsObj}
            <div class="newItemTags" >
                <span>{l s='TAGS ' mod='news'}</span>
                {foreach from=$tagsObj item='tag' name=myLoop}
                    <a class="newItemTag" href="{$link->getModuleLink('news', 'news', ['tag_news'=>"{$tag->id}"] ,false)}" title="{$tag->tag|escape:html:'UTF-8'|truncate:100:'...'}">{$tag->tag|escape:html:'UTF-8'|truncate:100:'...'}</a>
                {/foreach}
            </div>
            <div class="newsSep"></div>
        {/if}

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


        {if $relNewsObj}
            <div class="relNewsContent" >
                <div class="relNewsTitle">{l s='Related' mod='news'}</div>
                {foreach from=$relNewsObj item='rel' name=myLoop}
                    <a class="relNews" href="{$link->getModuleLink('news', 'new',
                                                            [
                                                                'id_news'  => "{$rel->id}",
                                                                'cat_news' => 0,
                                                                'page_cat'     => 0,
                                                                'rewrite'  => "{$rel->rewrite}",
                                                                'cat_rewrite'  => ""
                                                             ]

                                                            ,false)}" title="{$rel->title|escape:html:'UTF-8'|truncate:70:'...'}"><span>{$rel->date}</span>  {$rel->title|escape:html:'UTF-8'}</a>
                {/foreach}
            </div>
        {/if}


        {if $fbComments}
            <div class="newComments">
                <div id="fb-root"></div>
                <script>(function(d, s, id)  {ldelim}
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

        {if ($prev_id_news||$next_id_news) && false}
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




</div>
