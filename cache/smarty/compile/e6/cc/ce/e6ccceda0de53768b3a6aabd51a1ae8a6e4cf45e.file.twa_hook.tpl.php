<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:37
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/testimonialswithavatars/views/templates/hook/twa_hook.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1961543067562412899d3d42-35816469%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e6ccceda0de53768b3a6aabd51a1ae8a6e4cf45e' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/testimonialswithavatars/views/templates/hook/twa_hook.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1961543067562412899d3d42-35816469',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'in_column' => 0,
    'displayType' => 0,
    'link' => 0,
    'posts' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241289a26688_89059088',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241289a26688_89059088')) {function content_56241289a26688_89059088($_smarty_tpl) {?>

<div class="twa_container both-style <?php if ($_smarty_tpl->tpl_vars['in_column']->value) {?> block <?php } else { ?> row none-column <?php if ($_smarty_tpl->tpl_vars['displayType']->value==1) {?> home-carousel-reviews <?php } else { ?> no-carousel-reviews<?php }?><?php }?>">
	<?php if ($_smarty_tpl->tpl_vars['in_column']->value) {?>
	<?php } else { ?>
	<div class="container">
	<?php }?>
	<h2 class="<?php if ($_smarty_tpl->tpl_vars['in_column']->value) {?>title_block <?php } else { ?>title_main_section white_clr<?php }?>">
		<a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getModuleLink('testimonialswithavatars','testimonials'), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'View all','mod'=>'testimonialswithavatars'),$_smarty_tpl);?>
">
		<span>
		<?php echo smartyTranslate(array('s'=>'Testimonials','mod'=>'testimonialswithavatars'),$_smarty_tpl);?>

		</span>
		</a>
	</h2>
	<div class="twa_posts<?php if ($_smarty_tpl->tpl_vars['displayType']->value==1) {?> carousel<?php } elseif ($_smarty_tpl->tpl_vars['displayType']->value==2&&!$_smarty_tpl->tpl_vars['in_column']->value) {?> grid<?php } else { ?> list<?php }?>">
		<?php echo $_smarty_tpl->getSubTemplate ("./../front/post-list.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('posts'=>$_smarty_tpl->tpl_vars['posts']->value,'displayType'=>$_smarty_tpl->tpl_vars['displayType']->value), 0);?>
	
	</div>
	<div class="button-wrap">
		<a class="view_all neat btn btn-default" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getModuleLink('testimonialswithavatars','testimonials'), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'View all','mod'=>'testimonialswithavatars'),$_smarty_tpl);?>
">
			<?php echo smartyTranslate(array('s'=>'View all','mod'=>'testimonialswithavatars'),$_smarty_tpl);?>

		</a>
	</div>
	<?php if ($_smarty_tpl->tpl_vars['in_column']->value) {?>
	<?php } else { ?>
	</div>
	<?php }?>
</div>
<?php }} ?>
