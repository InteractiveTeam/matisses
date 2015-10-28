<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 20:03:55
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/blocknewproducts/blocknewproducts_home.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7781488475624417b358524-62251145%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '419daf85ec1d53efa8dce1bfea74cd1678d3a579' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/blocknewproducts/blocknewproducts_home.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7781488475624417b358524-62251145',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'new_products' => 0,
    'link' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5624417b37d8e9_58088109',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5624417b37d8e9_58088109')) {function content_5624417b37d8e9_58088109($_smarty_tpl) {?>
<?php if (isset($_smarty_tpl->tpl_vars['new_products']->value)&&$_smarty_tpl->tpl_vars['new_products']->value) {?>
<div id="wrap_new" class="tab-pane">
	<div class="inner_products">
	<?php echo $_smarty_tpl->getSubTemplate (((string)$_smarty_tpl->tpl_vars['tpl_dir']->value)."./product-list.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('products'=>$_smarty_tpl->tpl_vars['new_products']->value,'class'=>'blocknewproducts','id'=>'blocknewproducts'), 0);?>

	</div>
		<div class="link_more">
                <a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink('new-products'), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'All new products','mod'=>'blocknewproducts'),$_smarty_tpl);?>
" class="btn btn-default button button-small"><span><?php echo smartyTranslate(array('s'=>'View more','mod'=>'blocknewproducts'),$_smarty_tpl);?>
</span></a>
       </div>
</div>
<?php } else { ?>
<div id="wrap_new" class="tab-pane">
<ul id="blocknewproducts" class="blocknewproducts">
	<li class="alert alert-info"><?php echo smartyTranslate(array('s'=>'No new products at this time.','mod'=>'blocknewproducts'),$_smarty_tpl);?>
</li>
</ul>
</div>
<?php }?>
<?php }} ?>
