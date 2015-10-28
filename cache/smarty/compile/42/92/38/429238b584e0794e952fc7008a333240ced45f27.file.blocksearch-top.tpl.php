<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:37
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/blocksearch/blocksearch-top.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1295428922562412899beea4-10343648%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '429238b584e0794e952fc7008a333240ced45f27' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/blocksearch/blocksearch-top.tpl',
      1 => 1445200505,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1295428922562412899beea4-10343648',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'link' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_562412899cb4d8_85452242',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_562412899cb4d8_85452242')) {function content_562412899cb4d8_85452242($_smarty_tpl) {?>
<!-- Block search module TOP -->

	<form id="searchbox" method="get" action="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink('search'), ENT_QUOTES, 'UTF-8', true);?>
" >
		<input type="hidden" name="controller" value="search" />
		<input type="hidden" name="orderby" value="position" />
		<input type="hidden" name="orderway" value="desc" />
		<input class="search_query" type="text" id="search_query_top" name="search_query"  placeholder="<?php echo smartyTranslate(array('s'=>'Search...','mod'=>'blocksearch'),$_smarty_tpl);?>
" />
	</form>

<!-- /Block search module TOP --><?php }} ?>
