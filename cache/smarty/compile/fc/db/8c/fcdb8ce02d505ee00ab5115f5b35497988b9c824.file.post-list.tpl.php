<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:37
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/testimonialswithavatars/views/templates/front/post-list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:157941535456241289a2a452-58684729%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fcdb8ce02d505ee00ab5115f5b35497988b9c824' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/testimonialswithavatars/views/templates/front/post-list.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '157941535456241289a2a452-58684729',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'posts' => 0,
    'post' => 0,
    'twa' => 0,
    'general_settings' => 0,
    'r' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241289a783f7_40652898',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241289a783f7_40652898')) {function content_56241289a783f7_40652898($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/var/www/www.matisses.co/www/tools/smarty/plugins/modifier.date_format.php';
?>

<?php  $_smarty_tpl->tpl_vars['post'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['post']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['posts']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['post']->key => $_smarty_tpl->tpl_vars['post']->value) {
$_smarty_tpl->tpl_vars['post']->_loop = true;
?>	
<div class="post" data-idpost="<?php echo intval($_smarty_tpl->tpl_vars['post']->value['id_post']);?>
">	
	<div class="post_avatar text-center">
		<img src="<?php echo $_smarty_tpl->tpl_vars['twa']->value->getAvatarPath(htmlspecialchars($_smarty_tpl->tpl_vars['post']->value['avatar'], ENT_QUOTES, 'UTF-8', true));?>
" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['post']->value['customer_name'], ENT_QUOTES, 'UTF-8', true);?>
">
		<?php if ($_smarty_tpl->tpl_vars['general_settings']->value['rating_num']) {?>
			<span class="post_rating">
				<?php $_smarty_tpl->tpl_vars['r'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['r']->step = 1;$_smarty_tpl->tpl_vars['r']->total = (int) ceil(($_smarty_tpl->tpl_vars['r']->step > 0 ? $_smarty_tpl->tpl_vars['general_settings']->value['rating_num']+1 - (1) : 1-($_smarty_tpl->tpl_vars['general_settings']->value['rating_num'])+1)/abs($_smarty_tpl->tpl_vars['r']->step));
if ($_smarty_tpl->tpl_vars['r']->total > 0) {
for ($_smarty_tpl->tpl_vars['r']->value = 1, $_smarty_tpl->tpl_vars['r']->iteration = 1;$_smarty_tpl->tpl_vars['r']->iteration <= $_smarty_tpl->tpl_vars['r']->total;$_smarty_tpl->tpl_vars['r']->value += $_smarty_tpl->tpl_vars['r']->step, $_smarty_tpl->tpl_vars['r']->iteration++) {
$_smarty_tpl->tpl_vars['r']->first = $_smarty_tpl->tpl_vars['r']->iteration == 1;$_smarty_tpl->tpl_vars['r']->last = $_smarty_tpl->tpl_vars['r']->iteration == $_smarty_tpl->tpl_vars['r']->total;?>
					<i class="rating_star fa fa-<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['general_settings']->value['rating_class'], ENT_QUOTES, 'UTF-8', true);?>
<?php if ($_smarty_tpl->tpl_vars['post']->value['rating']>=$_smarty_tpl->tpl_vars['r']->value) {?> on<?php }?>"></i>
				<?php }} ?>
			</span>
		<?php }?>
	</div>
	<div class="content_wrapper">
		<div class="post_content">
			<h5>
				<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['post']->value['subject'], ENT_QUOTES, 'UTF-8', true);?>

			</h5>
			<?php echo $_smarty_tpl->tpl_vars['twa']->value->bbCodeToHTML(htmlspecialchars($_smarty_tpl->tpl_vars['post']->value['content'], ENT_QUOTES, 'UTF-8', true));?>
			
		</div>
		<div class="expand middle-line">
			 <i class="icon icon-angle-down"></i>			 
		</div>
		<div class="post_footer">
			<span class="customer_name b"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['post']->value['customer_name'], ENT_QUOTES, 'UTF-8', true);?>
</span>, <span class="date_add i"> <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['post']->value['date_add']);?>
</span>
		</div>
	</div>
</div>
<?php } ?><?php }} ?>
