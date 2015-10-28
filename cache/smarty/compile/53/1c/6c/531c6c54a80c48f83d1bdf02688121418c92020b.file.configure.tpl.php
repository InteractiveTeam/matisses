<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 19:05:24
         compiled from "/var/www/www.matisses.co/www/modules/easycarousels/views/templates/admin/configure.tpl" */ ?>
<?php /*%%SmartyHeaderCode:495419586562433c4858f60-51929329%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '531c6c54a80c48f83d1bdf02688121418c92020b' => 
    array (
      0 => '/var/www/www.matisses.co/www/modules/easycarousels/views/templates/admin/configure.tpl',
      1 => 1445107938,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '495419586562433c4858f60-51929329',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'multishop_warning' => 0,
    'load_owl' => 0,
    'hooks' => 0,
    'hk' => 0,
    'qty' => 0,
    'carousels' => 0,
    'carousel' => 0,
    'type_names' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_562433c48ec8c0_76677266',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_562433c48ec8c0_76677266')) {function content_562433c48ec8c0_76677266($_smarty_tpl) {?>

<?php if ($_smarty_tpl->tpl_vars['multishop_warning']->value) {?>
<div class="alert alert-warning">	
	<?php echo smartyTranslate(array('s'=>'NOTE: All modifications will be applied to more than one shop','mod'=>'easycarousels'),$_smarty_tpl);?>

	<i class="icon icon-times" data-dismiss="alert"></i>
</div>
<?php }?>
<div class="ajax_errors hidden alert alert-warning"></div>
<div class="bootstrap panel easycarousels general_settings clearfix">
	<h3><i class="icon icon-cogs"></i> <?php echo smartyTranslate(array('s'=>'General settings','mod'=>'easycarousels'),$_smarty_tpl);?>
</h3>
	<div class="col-lg-5">
		<label class="control-label" for="load_owl">
			<span class="label-tooltip" data-toggle="tooltip" title="<?php echo smartyTranslate(array('s'=>'If you already use owl carousel script on your site, you may turn this option OFF in order to avoid multiple loading or possible conflicts','mod'=>'easycarousels'),$_smarty_tpl);?>
">
				<?php echo smartyTranslate(array('s'=>'Load owl.carousel.js?','mod'=>'easycarousels'),$_smarty_tpl);?>

			</span> <input type="checkbox" name="load_owl" id="load_owl" <?php if ($_smarty_tpl->tpl_vars['load_owl']->value) {?>checked="checked"<?php }?>>
		</label>
	</div>
	<div class="importer col-lg-7 text-right">
		<form method="post" action="" enctype="multipart/form-data">
			<input type="hidden" name="action" value="exportCarousels">
			<button type="submit" class="export btn btn-default">
				<i class="icon icon-cloud-download icon-lg"></i>
				<?php echo smartyTranslate(array('s'=>'Export carousels','mod'=>'easycarousels'),$_smarty_tpl);?>

			</button>
		</form>				
		<button class="import btn btn-default">
			<i class="icon icon-cloud-upload icon-lg"></i>
			<?php echo smartyTranslate(array('s'=>'Import carousels','mod'=>'easycarousels'),$_smarty_tpl);?>
					
		</button>
		<form action="" method="post" enctype="multipart/form-data" style="display:none;">
			<input type="file" name="carousels_data_file" style="display:none;">
		</form>
	</div>
</div>
<div class="bootstrap panel easycarousels carousels clearfix">
	<h3><i class="icon icon-image"></i> <?php echo smartyTranslate(array('s'=>'Carousels','mod'=>'easycarousels'),$_smarty_tpl);?>
</h3>
	<form class="form-horizontal clearfix">
		<label class="control-label col-lg-1" for="hookSelector">
			<?php echo smartyTranslate(array('s'=>'Select hook','mod'=>'easycarousels'),$_smarty_tpl);?>

		</label>
		<div class="col-lg-3">
			<select class="hookSelector">
				<?php  $_smarty_tpl->tpl_vars['qty'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['qty']->_loop = false;
 $_smarty_tpl->tpl_vars['hk'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['hooks']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['qty']->key => $_smarty_tpl->tpl_vars['qty']->value) {
$_smarty_tpl->tpl_vars['qty']->_loop = true;
 $_smarty_tpl->tpl_vars['hk']->value = $_smarty_tpl->tpl_vars['qty']->key;
?>
					<option value="<?php echo $_smarty_tpl->tpl_vars['hk']->value;?>
"> <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['hk']->value, ENT_QUOTES, 'UTF-8', true);?>
 (<?php echo intval($_smarty_tpl->tpl_vars['qty']->value);?>
) </option>
				<?php } ?>
			</select>
		</div>
		<div class="col-lg-7 hook_settings">
			<i class="icon icon-wrench"></i>
			<?php echo smartyTranslate(array('s'=>'Hook settings','mod'=>'easycarousels'),$_smarty_tpl);?>
:
			<a href="#" class="callSettings" data-settings="exceptions"><?php echo smartyTranslate(array('s'=>'page exceptions','mod'=>'easycarousels'),$_smarty_tpl);?>
</a>
		</div>
	</form>
	<div id="settings_content" style="display:none;"></div>
	<?php  $_smarty_tpl->tpl_vars['qty'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['qty']->_loop = false;
 $_smarty_tpl->tpl_vars['hk'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['hooks']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['qty']->key => $_smarty_tpl->tpl_vars['qty']->value) {
$_smarty_tpl->tpl_vars['qty']->_loop = true;
 $_smarty_tpl->tpl_vars['hk']->value = $_smarty_tpl->tpl_vars['qty']->key;
?>
	<div id="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['hk']->value, ENT_QUOTES, 'UTF-8', true);?>
" class="hook_content <?php if ($_smarty_tpl->tpl_vars['hk']->value=='displayHome') {?>active<?php }?>">
		<?php if (substr($_smarty_tpl->tpl_vars['hk']->value,0,19)=='displayEasyCarousel') {?>
		<div class="alert alert-info">
			<?php echo smartyTranslate(array('s'=>'In order to display this hook, insert the following code to any tpl','mod'=>'easycarousels'),$_smarty_tpl);?>
: 
			{hook h='<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['hk']->value, ENT_QUOTES, 'UTF-8', true);?>
'}
		</div>
		<?php }?>
		<?php if ($_smarty_tpl->tpl_vars['hk']->value=='displayFooterProduct') {?>
		<div class="alert alert-info">
			<?php echo smartyTranslate(array('s'=>'This hook is used on product page, so you can create carousels for products with same features/categories here','mod'=>'easycarousels'),$_smarty_tpl);?>

		</div>
		<?php }?>
		<div class="carousel_list">				
			<?php if (isset($_smarty_tpl->tpl_vars['carousels']->value[$_smarty_tpl->tpl_vars['hk']->value])) {?>
				<?php  $_smarty_tpl->tpl_vars['carousel'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['carousel']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['carousels']->value[$_smarty_tpl->tpl_vars['hk']->value]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['carousel']->key => $_smarty_tpl->tpl_vars['carousel']->value) {
$_smarty_tpl->tpl_vars['carousel']->_loop = true;
?>
					<?php echo $_smarty_tpl->getSubTemplate ("./carousel-form.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('carousel'=>$_smarty_tpl->tpl_vars['carousel']->value,'type_names'=>$_smarty_tpl->tpl_vars['type_names']->value,'full'=>0), 0);?>

				<?php } ?>
			<?php }?>
		</div>
		<button type="button" class="addCarousel btn btn-default">
			<i class="icon icon-plus"></i> <?php echo smartyTranslate(array('s'=>'Add new carousel','mod'=>'easycarousels'),$_smarty_tpl);?>
			
		</button>	
	</div>
	<?php } ?>	
</div><?php }} ?>
