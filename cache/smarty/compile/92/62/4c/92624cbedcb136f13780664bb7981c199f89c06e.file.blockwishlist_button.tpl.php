<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 17:53:24
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/blockwishlist/blockwishlist_button.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2079569930562422e49f2ba3-31893094%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '92624cbedcb136f13780664bb7981c199f89c06e' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/blockwishlist/blockwishlist_button.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2079569930562422e49f2ba3-31893094',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'product' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_562422e4a208f8_32373214',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_562422e4a208f8_32373214')) {function content_562422e4a208f8_32373214($_smarty_tpl) {?>

	<a class="addToWishlist wishlistProd_<?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product']);?>
" href="#"  onclick="WishlistCart('wishlist_block_list', 'add', '<?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product']);?>
', false, 1); return false;">
		<i class="fa fa-heart-o"></i><span><?php echo smartyTranslate(array('s'=>'To wishlist'),$_smarty_tpl);?>
</span>
	</a><?php }} ?>
