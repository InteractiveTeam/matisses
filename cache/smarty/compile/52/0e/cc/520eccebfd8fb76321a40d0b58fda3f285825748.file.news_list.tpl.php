<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 20:34:58
         compiled from "/var/www/www.matisses.co/www/modules/news/tpl/news_list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:87047200562448c26751c1-22339232%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '520eccebfd8fb76321a40d0b58fda3f285825748' => 
    array (
      0 => '/var/www/www.matisses.co/www/modules/news/tpl/news_list.tpl',
      1 => 1445195717,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '87047200562448c26751c1-22339232',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'ajax' => 0,
    'link' => 0,
    'search_news' => 0,
    'catsObj' => 0,
    'cat' => 0,
    'cats' => 0,
    'menu_position' => 0,
    'notFoundResults' => 0,
    'newsObj' => 0,
    'news' => 0,
    'page' => 0,
    'cat_rewrite' => 0,
    'pager' => 0,
    'ajaxPager' => 0,
    'showPagerAjax' => 0,
    'tag' => 0,
    'p_previous' => 0,
    'start' => 0,
    'stop' => 0,
    'pages' => 0,
    'p_next' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_562448c28aa685_52188521',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_562448c28aa685_52188521')) {function content_562448c28aa685_52188521($_smarty_tpl) {?><?php if (!$_smarty_tpl->tpl_vars['ajax']->value) {?>
    <div class="breadcrumb newsBreadcrumb iconNewsList ">
        <a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getPageLink('index');?>
" ><?php echo smartyTranslate(array('s'=>'Home','mod'=>'news'),$_smarty_tpl);?>
</a>
        <span class="navigation-pipe">&gt;</span>
        <span class="navigation_page">
            <a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','news',array(),false);?>
" ><?php echo smartyTranslate(array('s'=>'news','mod'=>'news'),$_smarty_tpl);?>
</a>
        </span>

        <a class="newsRss" href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','rss',array('rss_news'=>1),false);?>
" target="_blank"></a>
    </div>


    <div class="newsMenuCats">


        <form action="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','news',array(),false);?>
" method="post" class="fromNewsSearch" name="fromNewsSearch">
            <input type="text" name="search_news" value="<?php echo $_smarty_tpl->tpl_vars['search_news']->value;?>
" class="newsSearch"></input>
            <input type="submit" name="searchnewshidden" style="visibility: hidden"></input>
        </form>

      <?php if ($_smarty_tpl->tpl_vars['catsObj']->value) {?>
                 <?php $_smarty_tpl->tpl_vars['menu_position'] = new Smarty_variable(1, null, 0);?>
                 <?php  $_smarty_tpl->tpl_vars['cats'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['cats']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['catsObj']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['cats']->total= $_smarty_tpl->_count($_from);
 $_smarty_tpl->tpl_vars['cats']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['cats']->key => $_smarty_tpl->tpl_vars['cats']->value) {
$_smarty_tpl->tpl_vars['cats']->_loop = true;
 $_smarty_tpl->tpl_vars['cats']->iteration++;
 $_smarty_tpl->tpl_vars['cats']->last = $_smarty_tpl->tpl_vars['cats']->iteration === $_smarty_tpl->tpl_vars['cats']->total;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['myLoop']['last'] = $_smarty_tpl->tpl_vars['cats']->last;
?>
                        <div class="<?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['myLoop']['last']) {?>news_last_item<?php } else { ?>news_first_item<?php }?>"><a
                                class="<?php if ($_smarty_tpl->tpl_vars['cat']->value==$_smarty_tpl->tpl_vars['cats']->value->id) {?> newsMenuHover_<?php echo $_smarty_tpl->tpl_vars['menu_position']->value;?>
_selected<?php }?> newsItemMenu newsMenuHover_<?php echo $_smarty_tpl->tpl_vars['menu_position']->value;?>
"
                               href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','list',array('cat_news'=>((string)$_smarty_tpl->tpl_vars['cats']->value->id),'page_cat'=>0,'rewrite'=>((string)$_smarty_tpl->tpl_vars['cats']->value->rewrite)),false);?>
"
                                title="<?php echo htmlspecialchars($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['cats']->value->title,50,'...'), ENT_QUOTES, 'UTF-8', true);?>
">
                                <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['cats']->value->title, ENT_QUOTES, 'UTF-8', true);?>

                            </a></div>
                        <?php $_smarty_tpl->tpl_vars['menu_position'] = new Smarty_variable($_smarty_tpl->tpl_vars['menu_position']->value+1, null, 0);?>
                 <?php } ?>
        <?php }?>


     </div>
<?php } else { ?>
    <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
<?php }?>


<div id="news_block_list" >
    <?php if ($_smarty_tpl->tpl_vars['notFoundResults']->value) {?>
        <?php if ($_smarty_tpl->tpl_vars['search_news']->value) {?>
        <p class="warning"><?php echo smartyTranslate(array('s'=>' No results found for your search : ','mod'=>'news'),$_smarty_tpl);?>
 "<?php echo $_smarty_tpl->tpl_vars['search_news']->value;?>
"</p>
        <?php } else { ?>
        <p class="warning"><?php echo smartyTranslate(array('s'=>'No news found','mod'=>'news'),$_smarty_tpl);?>
 </p>
        <?php }?>
    <?php }?>
	<?php  $_smarty_tpl->tpl_vars['news'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['news']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['newsObj']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['news']->total= $_smarty_tpl->_count($_from);
 $_smarty_tpl->tpl_vars['news']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['news']->key => $_smarty_tpl->tpl_vars['news']->value) {
$_smarty_tpl->tpl_vars['news']->_loop = true;
 $_smarty_tpl->tpl_vars['news']->iteration++;
 $_smarty_tpl->tpl_vars['news']->last = $_smarty_tpl->tpl_vars['news']->iteration === $_smarty_tpl->tpl_vars['news']->total;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['myLoop']['last'] = $_smarty_tpl->tpl_vars['news']->last;
?>
        
        
    <a onclick="document.location = '<?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['cat']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['cat']->value;?><?php }?><?php $_tmp1=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','new',array('id_news'=>((string)$_smarty_tpl->tpl_vars['news']->value->id_news),'cat_news'=>$_tmp1,'page_cat'=>((string)$_smarty_tpl->tpl_vars['page']->value),'rewrite'=>((string)$_smarty_tpl->tpl_vars['news']->value->rewrite),'cat_rewrite'=>((string)$_smarty_tpl->tpl_vars['cat_rewrite']->value)),false);?>
'" 
        href="<?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['cat']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['cat']->value;?><?php }?><?php $_tmp2=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','new',array('id_news'=>((string)$_smarty_tpl->tpl_vars['news']->value->id_news),'cat_news'=>$_tmp2,'page_cat'=>((string)$_smarty_tpl->tpl_vars['page']->value),'rewrite'=>((string)$_smarty_tpl->tpl_vars['news']->value->rewrite),'cat_rewrite'=>((string)$_smarty_tpl->tpl_vars['cat_rewrite']->value)),false);?>
"
       alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['news']->value->title, ENT_QUOTES, 'UTF-8', true);?>
" class="newsListItem">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <?php if ($_smarty_tpl->tpl_vars['news']->value->img) {?>
                <td width="190" valign="top">
                    <div class="newsListImgPadding">
                        <div class="newsListImg" style="background: url(<?php echo $_smarty_tpl->tpl_vars['news']->value->img;?>
) center center no-repeat;"></div>
                    </div>
                </td>
                <td>
                    <?php } else { ?>
                <td>
                    <?php }?>
                   <div class="newsListTitle">
                        <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['news']->value->title, ENT_QUOTES, 'UTF-8', true);?>
<br>
                    </div>
                    <div class="newsListText">
                        <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate(htmlspecialchars($_smarty_tpl->tpl_vars['news']->value->new, ENT_QUOTES, 'UTF-8', true),220,'...');?>
<br>
                        <div class="newsMoreBtn"><?php echo smartyTranslate(array('s'=>'See more','mod'=>'news'),$_smarty_tpl);?>
</div>
                        <div class="newsInfBottom">
                            <div class="newAutorDate"><?php if ($_smarty_tpl->tpl_vars['news']->value->autor) {?><?php echo $_smarty_tpl->tpl_vars['news']->value->autor;?>
 <?php echo smartyTranslate(array('s'=>'on','mod'=>'news'),$_smarty_tpl);?>
<?php }?> <?php echo $_smarty_tpl->tpl_vars['news']->value->date;?>
</div>
                        </div>
                    </div>

                </td>
        </table>
    </a>
	<?php } ?>

</div>

<div class="newsAjaxContent">
<?php if ($_smarty_tpl->tpl_vars['pager']->value) {?>
	<?php if ($_smarty_tpl->tpl_vars['ajaxPager']->value) {?>
        <?php if ($_smarty_tpl->tpl_vars['showPagerAjax']->value) {?>
            <a alt="<?php echo smartyTranslate(array('s'=>'Next News','mod'=>'news'),$_smarty_tpl);?>
" class="newsPager page_more"
               href="<?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['search_news']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['search_news']->value;?><?php echo (string)$_smarty_tpl->tpl_vars['search_news']->value;?><?php }?><?php $_tmp3=ob_get_clean();?><?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['tag']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['tag']->value;?><?php }?><?php $_tmp4=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','list',array('cat_news'=>((string)$_smarty_tpl->tpl_vars['cat']->value),'page_cat'=>((string)($_smarty_tpl->tpl_vars['page']->value+1)),'rewrite'=>((string)$_smarty_tpl->tpl_vars['cat_rewrite']->value),'search_news'=>$_tmp3,'tag_news'=>$_tmp4),false);?>
"
               onclick="news_ajax('<?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['search_news']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['search_news']->value;?><?php }?><?php $_tmp5=ob_get_clean();?><?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['tag']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['tag']->value;?><?php }?><?php $_tmp6=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','list',array('cat_news'=>((string)$_smarty_tpl->tpl_vars['cat']->value),'page_cat'=>((string)($_smarty_tpl->tpl_vars['page']->value+1)),'rewrite'=>((string)$_smarty_tpl->tpl_vars['cat_rewrite']->value),'search_news'=>$_tmp5,'tag_news'=>$_tmp6,'ajaxnewslist'=>'1'),false);?>
');return false;" >
                    <?php echo smartyTranslate(array('s'=>'Show more','mod'=>'news'),$_smarty_tpl);?>

            </a>
        <?php }?>
	<?php } else { ?>
        <div class="newsPager newsPagination">
            <ul class="newsPagination">
                        <?php if ($_smarty_tpl->tpl_vars['page']->value!=0) {?>
                            <?php $_smarty_tpl->tpl_vars['p_previous'] = new Smarty_variable($_smarty_tpl->tpl_vars['page']->value-1, null, 0);?>
                <li id="newsPagination_previous">
                    <a  href="<?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['search_news']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['search_news']->value;?><?php }?><?php $_tmp7=ob_get_clean();?><?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['tag']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['tag']->value;?><?php }?><?php $_tmp8=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','list',array('cat_news'=>((string)$_smarty_tpl->tpl_vars['cat']->value),'page_cat'=>((string)$_smarty_tpl->tpl_vars['p_previous']->value),'rewrite'=>((string)$_smarty_tpl->tpl_vars['cat_rewrite']->value),'search_news'=>$_tmp7,'tag_news'=>$_tmp8),false);?>
">&laquo;&nbsp;<?php echo smartyTranslate(array('s'=>'Previous','mod'=>'news'),$_smarty_tpl);?>
</a></li>
                        <?php }?>

                        <?php if (isset($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination'])) unset($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['name'] = 'pagination';
$_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['start'] = (int) $_smarty_tpl->tpl_vars['start']->value;
$_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['loop'] = is_array($_loop=$_smarty_tpl->tpl_vars['stop']->value+1) ? count($_loop) : max(0, (int) $_loop); unset($_loop);
$_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['step'] = ((int) 1) == 0 ? 1 : (int) 1;
$_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['show'] = true;
$_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['max'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['loop'];
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['start'] < 0)
    $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['start'] = max($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['step'] > 0 ? 0 : -1, $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['loop'] + $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['start']);
else
    $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['start'] = min($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['start'], $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['step'] > 0 ? $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['loop'] : $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['loop']-1);
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['show']) {
    $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['total'] = min(ceil(($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['step'] > 0 ? $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['loop'] - $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['start'] : $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['start']+1)/abs($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['step'])), $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['max']);
    if ($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['total'] == 0)
        $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['show'] = false;
} else
    $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['total'] = 0;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['show']):

            for ($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['index'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['start'], $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['iteration'] = 1;
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['iteration'] <= $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['total'];
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['index'] += $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['step'], $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['iteration']++):
$_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['rownum'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['iteration'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['index_prev'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['index'] - $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['index_next'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['index'] + $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['first']      = ($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['iteration'] == 1);
$_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['last']       = ($_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['iteration'] == $_smarty_tpl->tpl_vars['smarty']->value['section']['pagination']['total']);
?>
                            <?php if ($_smarty_tpl->tpl_vars['page']->value==$_smarty_tpl->getVariable('smarty')->value['section']['pagination']['index']-1) {?>
                <li class="current"><span><?php echo $_smarty_tpl->tpl_vars['page']->value+mb_convert_encoding(htmlspecialchars(1, ENT_QUOTES, 'UTF-8', true), "HTML-ENTITIES", 'UTF-8');?>
</span></li>
                            <?php } else { ?>
                <li><a href="<?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['search_news']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['search_news']->value;?><?php }?><?php $_tmp9=ob_get_clean();?><?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['tag']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['tag']->value;?><?php }?><?php $_tmp10=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','list',array('cat_news'=>((string)$_smarty_tpl->tpl_vars['cat']->value),'page_cat'=>((string)($_smarty_tpl->getVariable('smarty')->value['section']['pagination']['index']-1)),'rewrite'=>((string)$_smarty_tpl->tpl_vars['cat_rewrite']->value),'search_news'=>$_tmp9,'tag_news'=>$_tmp10),false);?>
"><?php echo mb_convert_encoding(htmlspecialchars($_smarty_tpl->getVariable('smarty')->value['section']['pagination']['index'], ENT_QUOTES, 'UTF-8', true), "HTML-ENTITIES", 'UTF-8');?>
</a></li>
                            <?php }?>
                        <?php endfor; endif; ?>

                        <?php if ($_smarty_tpl->tpl_vars['pages']->value>0&&$_smarty_tpl->tpl_vars['page']->value!=$_smarty_tpl->tpl_vars['pages']->value) {?>
                            <?php $_smarty_tpl->tpl_vars['p_next'] = new Smarty_variable($_smarty_tpl->tpl_vars['page']->value+1, null, 0);?>
                <li id="newsPagination_next"><a href="<?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['search_news']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['search_news']->value;?><?php }?><?php $_tmp11=ob_get_clean();?><?php ob_start();?><?php if ($_smarty_tpl->tpl_vars['tag']->value) {?><?php echo (string)$_smarty_tpl->tpl_vars['tag']->value;?><?php }?><?php $_tmp12=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','list',array('cat_news'=>((string)$_smarty_tpl->tpl_vars['cat']->value),'page_cat'=>((string)$_smarty_tpl->tpl_vars['p_next']->value),'rewrite'=>((string)$_smarty_tpl->tpl_vars['cat_rewrite']->value),'search_news'=>$_tmp11,'tag_news'=>$_tmp12),false);?>
"><?php echo smartyTranslate(array('s'=>'Next','mod'=>'news'),$_smarty_tpl);?>
&nbsp;&raquo;</a></li>
                        <?php }?>
            </ul>
            <form action="<?php echo $_smarty_tpl->tpl_vars['link']->value->getPageLink('news');?>
" method="post" name="fromNewsSearch">
                <input type="text" name="search_news" value="<?php echo $_smarty_tpl->tpl_vars['search_news']->value;?>
" class="newsSearch"></input>
                <input type="submit" name="searchnewshidden" style="visibility: hidden"></input>
            </form>
        </div>
	<?php }?>
<?php }?>

    <div class="loadingAjax" style="display: none;"></div>
</div>
<?php }} ?>
