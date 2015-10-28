<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:45:06
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/blocksocial/blocksocial-mat.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2136933654562412e255e9e2-75633232%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '217576ed68a85f27d8dd71df1f342196ef44188d' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/blocksocial/blocksocial-mat.tpl',
      1 => 1445204557,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2136933654562412e255e9e2-75633232',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'facebook_url' => 0,
    'twitter_url' => 0,
    'rss_url' => 0,
    'youtube_url' => 0,
    'google_plus_url' => 0,
    'pinterest_url' => 0,
    'vimeo_url' => 0,
    'instagram_url' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_562412e25f3e23_09258506',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_562412e25f3e23_09258506')) {function content_562412e25f3e23_09258506($_smarty_tpl) {?>


<ul id="social_block">
    <?php if ($_smarty_tpl->tpl_vars['facebook_url']->value!='') {?><li class="facebook"><a class="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['facebook_url']->value, ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'Facebook','mod'=>'blocksocial'),$_smarty_tpl);?>
"><span>F</span></a></li><?php }?>
    <?php if ($_smarty_tpl->tpl_vars['twitter_url']->value!='') {?><li class="twitter"><a class="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['twitter_url']->value, ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'Twitter','mod'=>'blocksocial'),$_smarty_tpl);?>
"><span>T</span></a></li><?php }?>
    <?php if ($_smarty_tpl->tpl_vars['rss_url']->value!='') {?><li class="rss"><a class="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['rss_url']->value, ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'RSS','mod'=>'blocksocial'),$_smarty_tpl);?>
"><span>R</span></a></li><?php }?>
    <?php if ($_smarty_tpl->tpl_vars['youtube_url']->value!='') {?><li class="youtube"><a class="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['youtube_url']->value, ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'YouTube','mod'=>'blocksocial'),$_smarty_tpl);?>
"><span>Y</span></a></li><?php }?>
    <?php if ($_smarty_tpl->tpl_vars['google_plus_url']->value!='') {?><li class="google_plus"><a class="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['google_plus_url']->value, ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'Google+','mod'=>'blocksocial'),$_smarty_tpl);?>
"><span>G</span></a></li><?php }?>
    <?php if ($_smarty_tpl->tpl_vars['pinterest_url']->value!='') {?><li class="pinterest"><a class="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['pinterest_url']->value, ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'Pinterest','mod'=>'blocksocial'),$_smarty_tpl);?>
">P</a></li><?php }?>
    <?php if ($_smarty_tpl->tpl_vars['vimeo_url']->value!='') {?><li class="vimeo"><a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['vimeo_url']->value, ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'Vimeo','mod'=>'blocksocial'),$_smarty_tpl);?>
">V</a></li><?php }?>
    <?php if ($_smarty_tpl->tpl_vars['instagram_url']->value!='') {?><li class="instagram"><a class="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['instagram_url']->value, ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'Instagram','mod'=>'blocksocial'),$_smarty_tpl);?>
">I</a></li><?php }?>
</ul>

 <?php }} ?>
