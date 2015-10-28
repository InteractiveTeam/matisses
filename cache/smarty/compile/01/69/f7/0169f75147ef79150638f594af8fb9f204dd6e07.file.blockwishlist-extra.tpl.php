<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 17:54:21
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/blockwishlist/blockwishlist-extra.tpl" */ ?>
<?php /*%%SmartyHeaderCode:11902854235624231d714733-31866160%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0169f75147ef79150638f594af8fb9f204dd6e07' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/blockwishlist/blockwishlist-extra.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11902854235624231d714733-31866160',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'id_product' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5624231d7201d6_46881543',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5624231d7201d6_46881543')) {function content_5624231d7201d6_46881543($_smarty_tpl) {?>

<div class="elem_butt">
	<a id="wishlist_button" href="#" onclick="WishlistCart('wishlist_block_list', 'add', '<?php echo intval($_smarty_tpl->tpl_vars['id_product']->value);?>
', $('#idCombination').val(), document.getElementById('quantity_wanted').value); return false;" rel="nofollow"  title="<?php echo smartyTranslate(array('s'=>'Add to my wishlist','mod'=>'blockwishlist'),$_smarty_tpl);?>
">
		<span class="hidden-xxs"><?php echo smartyTranslate(array('s'=>'Add to wishlist','mod'=>'blockwishlist'),$_smarty_tpl);?>
</span>
	</a>
</div>

<?php }} ?>
