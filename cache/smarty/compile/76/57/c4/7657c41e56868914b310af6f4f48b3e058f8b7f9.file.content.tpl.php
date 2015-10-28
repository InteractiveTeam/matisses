<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:30
         compiled from "/var/www/www.matisses.co/www/administracion/themes/default/template/content.tpl" */ ?>
<?php /*%%SmartyHeaderCode:8393960756241282ceb582-80396473%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7657c41e56868914b310af6f4f48b3e058f8b7f9' => 
    array (
      0 => '/var/www/www.matisses.co/www/administracion/themes/default/template/content.tpl',
      1 => 1425661760,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8393960756241282ceb582-80396473',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'content' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241282cf6456_42016831',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241282cf6456_42016831')) {function content_56241282cf6456_42016831($_smarty_tpl) {?>
<div id="ajax_confirmation" class="alert alert-success hide"></div>

<div id="ajaxBox" style="display:none"></div>


<div class="row">
	<div class="col-lg-12">
		<?php if (isset($_smarty_tpl->tpl_vars['content']->value)) {?>
			<?php echo $_smarty_tpl->tpl_vars['content']->value;?>

		<?php }?>
	</div>
</div><?php }} ?>
