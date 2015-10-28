<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:37
         compiled from "/var/www/www.matisses.co/www/modules/news/tpl/news_home.tpl" */ ?>
<?php /*%%SmartyHeaderCode:198449889056241289a80e35-06673494%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f32a7e1bb64b9f8f7b24ae50ef37ea74de495270' => 
    array (
      0 => '/var/www/www.matisses.co/www/modules/news/tpl/news_home.tpl',
      1 => 1445195717,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '198449889056241289a80e35-06673494',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'catsObj' => 0,
    'link' => 0,
    'cats_position' => 0,
    'cats' => 0,
    'catsProductsObj' => 0,
    'catsProducts' => 0,
    'catProduct' => 0,
    'cat_products_position' => 0,
    'cat_rewrite' => 0,
    'cat_produto' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241289b51eb2_62047865',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241289b51eb2_62047865')) {function content_56241289b51eb2_62047865($_smarty_tpl) {?>
<?php if ($_smarty_tpl->tpl_vars['catsObj']->value) {?>
    <script  type="text/javascript" >
        jQuery(function() {
           jQuery( "#tabsNews" ).tabs();
        });
    </script>

    
    <div id="tabsNews" class="newsHome">
         <div class="newsHomeBarTitle">
             <a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','news',array(),false);?>
" ><?php echo smartyTranslate(array('s'=>'News','mod'=>'news'),$_smarty_tpl);?>
</a>
             <a class="newsRss newsRssHome " href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','rss',array('rss_news'=>1),false);?>
" target="_blank"></a>
        </div>
        <ul>
           <?php $_smarty_tpl->tpl_vars['cats_position'] = new Smarty_variable(1, null, 0);?>
                <?php  $_smarty_tpl->tpl_vars['cats'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['cats']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['catsObj']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['cats']->key => $_smarty_tpl->tpl_vars['cats']->value) {
$_smarty_tpl->tpl_vars['cats']->_loop = true;
?>
                    <li>
                            <a href="#tabs-<?php echo $_smarty_tpl->tpl_vars['cats_position']->value;?>
">
                                <?php echo htmlspecialchars($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['cats']->value->title,50,'...'), ENT_QUOTES, 'UTF-8', true);?>

                            </a>
                    </li>
                    <?php $_smarty_tpl->tpl_vars['cats_position'] = new Smarty_variable($_smarty_tpl->tpl_vars['cats_position']->value+1, null, 0);?>
                <?php } ?>
               
        </ul>

           <?php $_smarty_tpl->tpl_vars['cats_position'] = new Smarty_variable(1, null, 0);?>
           <?php  $_smarty_tpl->tpl_vars['catsProducts'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['catsProducts']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['catsProductsObj']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['catsProducts']->key => $_smarty_tpl->tpl_vars['catsProducts']->value) {
$_smarty_tpl->tpl_vars['catsProducts']->_loop = true;
?>
                <div id="tabs-<?php echo $_smarty_tpl->tpl_vars['cats_position']->value;?>
">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td valign="top" class="newsHomeSepLeft" >
                             <?php $_smarty_tpl->tpl_vars['cat_products_position'] = new Smarty_variable(1, null, 0);?>
                             <?php  $_smarty_tpl->tpl_vars['catProduct'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['catProduct']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['catsProducts']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['catProduct']->key => $_smarty_tpl->tpl_vars['catProduct']->value) {
$_smarty_tpl->tpl_vars['catProduct']->_loop = true;
?>

                                     <?php $_smarty_tpl->tpl_vars['cat_produto'] = new Smarty_variable($_smarty_tpl->tpl_vars['catProduct']->value->id_cat, null, 0);?>
                                     <?php $_smarty_tpl->tpl_vars['cat_rewrite'] = new Smarty_variable($_smarty_tpl->tpl_vars['catProduct']->value->cat_rewrite, null, 0);?>

                                     <?php if ($_smarty_tpl->tpl_vars['cat_products_position']->value==2) {?>
                                         </td><td width="50%"  valign="top" class="newsHomeSep">
                                     <?php }?>


                                     <a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','new',array('id_news'=>((string)$_smarty_tpl->tpl_vars['catProduct']->value->id_news),'cat_news'=>((string)$_smarty_tpl->tpl_vars['catProduct']->value->id_cat),'page_cat'=>0,'rewrite'=>((string)$_smarty_tpl->tpl_vars['catProduct']->value->rewrite),'cat_rewrite'=>((string)$_smarty_tpl->tpl_vars['cat_rewrite']->value)),false);?>
" 
                                        alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['catProduct']->value->title, ENT_QUOTES, 'UTF-8', true);?>
" class="newsHomeItem"  >
                                         <?php if ($_smarty_tpl->tpl_vars['cat_products_position']->value==1) {?>
                                          <div class="newsHomeImg">  <img src="<?php echo $_smarty_tpl->tpl_vars['catProduct']->value->img;?>
" ></div>
                                          <?php }?>
                                         <div class="newsHomeDate">
                                            <?php echo $_smarty_tpl->tpl_vars['catProduct']->value->date;?>

                                         </div>
                                         <div class="newsHomeTitle">
                                            <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['catProduct']->value->title, ENT_QUOTES, 'UTF-8', true);?>

                                         </div>
                                          <?php if ($_smarty_tpl->tpl_vars['cat_products_position']->value==1) {?>
                                             <div class="newsHomeDescription">
                                                <?php echo htmlspecialchars($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['catProduct']->value->new,250,'...'), ENT_QUOTES, 'UTF-8', true);?>

                                             </div>
										  <?php } else { ?>
											<div class="newsHomeDescription">
                                                <?php echo htmlspecialchars($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['catProduct']->value->new,100,'...'), ENT_QUOTES, 'UTF-8', true);?>

                                             </div>
                                          <?php }?>
                                     </a>

                                     
                                    <?php $_smarty_tpl->tpl_vars['cat_products_position'] = new Smarty_variable($_smarty_tpl->tpl_vars['cat_products_position']->value+1, null, 0);?>
                             <?php } ?>
                            </td>
                        </tr>
                    </table>
                    <?php if ($_smarty_tpl->tpl_vars['cat_products_position']->value>1) {?>
					<a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getModuleLink('news','list',array('cat_news'=>((string)$_smarty_tpl->tpl_vars['cat_produto']->value),'page_cat'=>0,'rewrite'=>((string)$_smarty_tpl->tpl_vars['cat_rewrite']->value)),false);?>
" alt="<?php echo smartyTranslate(array('s'=>'More','mod'=>'news'),$_smarty_tpl);?>
" class="newsHomeMore">
						<?php echo smartyTranslate(array('s'=>'See More','mod'=>'news'),$_smarty_tpl);?>

					</a>
                    <?php }?>
                </div>
                <?php $_smarty_tpl->tpl_vars['cats_position'] = new Smarty_variable($_smarty_tpl->tpl_vars['cats_position']->value+1, null, 0);?>
           <?php } ?>
    </div>
<?php }?><?php }} ?>
