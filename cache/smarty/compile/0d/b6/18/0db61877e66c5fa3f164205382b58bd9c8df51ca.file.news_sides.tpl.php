<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 20:51:30
         compiled from "/var/www/www.matisses.co/www/modules/news/tpl/news_sides.tpl" */ ?>
<?php /*%%SmartyHeaderCode:185472966356244ca2e76166-70289285%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0db61877e66c5fa3f164205382b58bd9c8df51ca' => 
    array (
      0 => '/var/www/www.matisses.co/www/modules/news/tpl/news_sides.tpl',
      1 => 1445195717,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '185472966356244ca2e76166-70289285',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'link' => 0,
    'newsObj' => 0,
    'news' => 0,
    'catsObj' => 0,
    'cats' => 0,
    'newsSideMore' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56244ca2f198a0_59869813',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56244ca2f198a0_59869813')) {function content_56244ca2f198a0_59869813($_smarty_tpl) {?><!-- Block Viewed products -->
<div id="news_block_sides" class="block">
    <a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','news',array(),false);?>
">
        <h4><?php echo smartyTranslate(array('s'=>'News','mod'=>'news'),$_smarty_tpl);?>
</h4>
    </a>
    <div class="block_content">
        <div class="products clearfix">

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
            
            <a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','new',array('id_news'=>((string)$_smarty_tpl->tpl_vars['news']->value->id_news),'cat_news'=>'','page_cat'=>'','rewrite'=>((string)$_smarty_tpl->tpl_vars['news']->value->rewrite),'cat_rewrite'=>''),false);?>
" 
               alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['news']->value->title, ENT_QUOTES, 'UTF-8', true);?>
"
               <?php if ($_smarty_tpl->tpl_vars['news']->value->img) {?>
                    class="newsSideLinkZone newsSideLink" style="background: url(<?php echo $_smarty_tpl->tpl_vars['news']->value->img;?>
) center center no-repeat;"
               <?php } else { ?>
                    class="newsSideLinkNoImg"
               <?php }?> >
               <div class="newsSideTitleActive">
                    <?php echo htmlspecialchars($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['news']->value->title,50,'...'), ENT_QUOTES, 'UTF-8', true);?>

                </div>
            </a>
			<?php } ?>
             <?php if ($_smarty_tpl->tpl_vars['catsObj']->value) {?>
             <div class="news_block_sides">
                <ul class="bullet">
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
                    <li class="<?php if (!$_smarty_tpl->getVariable('smarty')->value['foreach']['myLoop']['last']) {?>first_item<?php } else { ?>last_item<?php }?>">
                        <a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','list',array('cat_news'=>((string)$_smarty_tpl->tpl_vars['cats']->value->id),'page_cat'=>0,'rewrite'=>((string)$_smarty_tpl->tpl_vars['cats']->value->rewrite)),false);?>
")}"
                            title="<?php echo htmlspecialchars($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['cats']->value->title,50,'...'), ENT_QUOTES, 'UTF-8', true);?>
">
                            <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['cats']->value->title, ENT_QUOTES, 'UTF-8', true);?>

                        </a>
                    </li>
                <?php } ?>
                </ul>
             </div>
            <?php }?>

            <?php if ($_smarty_tpl->tpl_vars['newsSideMore']->value) {?>
            <a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','news',array(),false);?>
" alt="<?php echo smartyTranslate(array('s'=>'More news','mod'=>'news'),$_smarty_tpl);?>
"
               class="newsSideMore">
                <?php echo smartyTranslate(array('s'=>'List all >>','mod'=>'news'),$_smarty_tpl);?>

            </a>
            <?php }?>
            
        </div>
    </div>
</div>
<?php }} ?>
