<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:37
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/blockfacebooklike/views/templates/hook/blockfacebooklike.tpl" */ ?>
<?php /*%%SmartyHeaderCode:135385318156241289d1ba89-36101817%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '680a53a6a131f7cbd4125a4c5f1abb8976631c51' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/blockfacebooklike/views/templates/hook/blockfacebooklike.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '135385318156241289d1ba89-36101817',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'FB_title' => 0,
    'company_logo' => 0,
    'FB_data' => 0,
    'company_name' => 0,
    'FB_page_URL' => 0,
    'show_faces' => 0,
    'err' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241289d57d58_88491589',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241289d57d58_88491589')) {function content_56241289d57d58_88491589($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_escape')) include '/var/www/www.matisses.co/www/tools/smarty/plugins/modifier.escape.php';
?>

<div class="footer-block facebook-box col-sm-3 col-xs-12">
	<h4 class="title_block dropdown-cntrl"><?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['FB_title']->value, 'none');?>
</h4>
	<div class="dropdown-content toggle-footer">
		<div class="block_content">
			<div class="fb_info_top">
				<?php if ($_smarty_tpl->tpl_vars['company_logo']->value) {?>
				<img src="https://graph.facebook.com/<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['FB_data']->value['id'], 'none');?>
/picture" alt="<?php echo $_smarty_tpl->tpl_vars['FB_data']->value['name'];?>
" class="fb_avatar" />
				<?php }?>
				<div class="fb_info">
					<?php if ($_smarty_tpl->tpl_vars['company_name']->value) {?>
					<div><?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['FB_data']->value['name'], 'none');?>
</div>
					<?php }?>				
				</div>
			</div>
			<a href="<?php echo $_smarty_tpl->tpl_vars['FB_page_URL']->value;?>
" target="_blank" class="likeButton"><span><?php echo smartyTranslate(array('s'=>'Like','mod'=>'blockfacebooklike'),$_smarty_tpl);?>
</span></a>
			<div class="fb_fans"><?php echo smartyTranslate(array('s'=>'%s people like','sprintf'=>$_smarty_tpl->tpl_vars['FB_data']->value['likes'],'mod'=>'blockfacebooklike'),$_smarty_tpl);?>
 <a href="<?php echo $_smarty_tpl->tpl_vars['FB_page_URL']->value;?>
" target="_blank"><?php echo $_smarty_tpl->tpl_vars['FB_data']->value['name'];?>
</a>.</div>
			<?php if ($_smarty_tpl->tpl_vars['show_faces']->value) {?>
			<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['err']->value, 'none');?>

			<ul class="fb_followers">
				<?php echo $_smarty_tpl->getSubTemplate (((string)$_smarty_tpl->tpl_vars['modulePath']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

			</ul>
			<?php }?>
		</div>
	</div>
</div>
<?php }} ?>
