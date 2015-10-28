<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 17:22:42
         compiled from "/var/www/www.matisses.co/www/administracion/themes/default/template/controllers/modules/warning_module.tpl" */ ?>
<?php /*%%SmartyHeaderCode:90501789256241bb220a8b4-87466340%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'cef51fb8e4c69baea563b8c1d99dbe2f0fa139cc' => 
    array (
      0 => '/var/www/www.matisses.co/www/administracion/themes/default/template/controllers/modules/warning_module.tpl',
      1 => 1425661760,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '90501789256241bb220a8b4-87466340',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'module_link' => 0,
    'text' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241bb22158b9_79359257',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241bb22158b9_79359257')) {function content_56241bb22158b9_79359257($_smarty_tpl) {?>
<a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['module_link']->value, ENT_QUOTES, 'UTF-8', true);?>
"><?php echo $_smarty_tpl->tpl_vars['text']->value;?>
</a><?php }} ?>
