<?php /* Smarty version Smarty-3.1.19, created on 2015-10-19 18:48:22
         compiled from "/var/www/www.matisses.co/www/themes/matisses/store_infos.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1021474344562581463559a3-04017860%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e642f5b997ff0ebc45b07aa96dbeba2b28d8e819' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/store_infos.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1021474344562581463559a3-04017860',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'days_datas' => 0,
    'one_day' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5625814646d997_74538363',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5625814646d997_74538363')) {function content_5625814646d997_74538363($_smarty_tpl) {?>


	<?php  $_smarty_tpl->tpl_vars['one_day'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['one_day']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['days_datas']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['one_day']->key => $_smarty_tpl->tpl_vars['one_day']->value) {
$_smarty_tpl->tpl_vars['one_day']->_loop = true;
?>
	<p>
		<strong class="dark"><?php echo smartyTranslate(array('s'=>$_smarty_tpl->tpl_vars['one_day']->value['day']),$_smarty_tpl);?>
: </strong> &nbsp;<span><?php echo $_smarty_tpl->tpl_vars['one_day']->value['hours'];?>
</span>
	</p>
	<?php } ?>

<?php }} ?>
