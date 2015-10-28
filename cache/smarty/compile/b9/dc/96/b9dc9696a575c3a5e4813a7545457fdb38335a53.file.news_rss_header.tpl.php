<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:37
         compiled from "/var/www/www.matisses.co/www/modules/news/tpl/news_rss_header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:16942710825624128982a0a1-10316992%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b9dc9696a575c3a5e4813a7545457fdb38335a53' => 
    array (
      0 => '/var/www/www.matisses.co/www/modules/news/tpl/news_rss_header.tpl',
      1 => 1445195717,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16942710825624128982a0a1-10316992',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'meta_title_rss' => 0,
    'feedUrl' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241289843c82_67049497',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241289843c82_67049497')) {function content_56241289843c82_67049497($_smarty_tpl) {?>
<link rel="alternate" type="application/rss+xml" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['meta_title_rss']->value, ENT_QUOTES, 'UTF-8', true);?>
" href="<?php echo $_smarty_tpl->tpl_vars['feedUrl']->value;?>
" /><?php }} ?>
