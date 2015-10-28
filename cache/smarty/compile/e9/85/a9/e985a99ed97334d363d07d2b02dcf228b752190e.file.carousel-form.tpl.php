<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 19:05:24
         compiled from "/var/www/www.matisses.co/www/modules/easycarousels/views/templates/admin/carousel-form.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1636973193562433c48f3827-60108533%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e985a99ed97334d363d07d2b02dcf228b752190e' => 
    array (
      0 => '/var/www/www.matisses.co/www/modules/easycarousels/views/templates/admin/carousel-form.tpl',
      1 => 1445107938,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1636973193562433c48f3827-60108533',
  'function' => 
  array (
    'switcher_option' => 
    array (
      'parameter' => 
      array (
        'label' => '',
        'tooltip' => '',
        'id' => '',
        'input_name' => '',
        'current_value' => '',
        'class' => '',
      ),
      'compiled' => '',
    ),
  ),
  'variables' => 
  array (
    'class' => 0,
    'tooltip' => 0,
    'label' => 0,
    'id' => 0,
    'input_name' => 0,
    'current_value' => 0,
    'carousel' => 0,
    'full' => 0,
    'type_names' => 0,
    'k' => 0,
    'type' => 0,
    'available_features' => 0,
    'feature' => 0,
    'available_manufacturers' => 0,
    'm' => 0,
    'available_suppliers' => 0,
    's' => 0,
    'sorted_image_types' => 0,
    'types' => 0,
    'type_name' => 0,
    'resource_type' => 0,
    'languages' => 0,
    'lang' => 0,
    'id_lang_current' => 0,
  ),
  'has_nocache_code' => 0,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_562433c4b3bae6_28439208',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_562433c4b3bae6_28439208')) {function content_562433c4b3bae6_28439208($_smarty_tpl) {?>

<?php if (!function_exists('smarty_template_function_switcher_option')) {
    function smarty_template_function_switcher_option($_smarty_tpl,$params) {
    $saved_tpl_vars = $_smarty_tpl->tpl_vars;
    foreach ($_smarty_tpl->smarty->template_functions['switcher_option']['parameter'] as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);};
    foreach ($params as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);}?>
	<div class="form-group <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['class']->value, ENT_QUOTES, 'UTF-8', true);?>
">
		<label class="control-label col-lg-6">
			<?php if ($_smarty_tpl->tpl_vars['tooltip']->value=='') {?>
				<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['label']->value, ENT_QUOTES, 'UTF-8', true);?>

			<?php } else { ?>
				<span class="label-tooltip" data-toggle="tooltip" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['tooltip']->value, ENT_QUOTES, 'UTF-8', true);?>
">
					<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['label']->value, ENT_QUOTES, 'UTF-8', true);?>

				</span>
			<?php }?>
		</label>
		<div class=" col-lg-6">
			<span class="switch prestashop-switch">
				<input type="radio" id="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['id']->value, ENT_QUOTES, 'UTF-8', true);?>
" name="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['input_name']->value, ENT_QUOTES, 'UTF-8', true);?>
" value="1" <?php if ($_smarty_tpl->tpl_vars['current_value']->value) {?> checked="checked"<?php }?> >
				<label for="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['id']->value, ENT_QUOTES, 'UTF-8', true);?>
">
					<?php echo smartyTranslate(array('s'=>'Yes','mod'=>'easycarousels'),$_smarty_tpl);?>

				</label>
				<input type="radio" id="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['id']->value, ENT_QUOTES, 'UTF-8', true);?>
_0" name="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['input_name']->value, ENT_QUOTES, 'UTF-8', true);?>
" value="0" <?php if (!$_smarty_tpl->tpl_vars['current_value']->value) {?>checked="checked"<?php }?> >
				<label for="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['id']->value, ENT_QUOTES, 'UTF-8', true);?>
_0">
					<?php echo smartyTranslate(array('s'=>'No','mod'=>'easycarousels'),$_smarty_tpl);?>

				</label>
				<a class="slide-button btn"></a>
			</span>
		</div>
	</div>
<?php $_smarty_tpl->tpl_vars = $saved_tpl_vars;
foreach (Smarty::$global_tpl_vars as $key => $value) if(!isset($_smarty_tpl->tpl_vars[$key])) $_smarty_tpl->tpl_vars[$key] = $value;}}?>


<div class="carousel_item clearfix" data-id="<?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['id_carousel']);?>
">
	<div class="carousel_header clearfix">
		<i class="dragger icon icon-arrows-v icon-2x"></i>
		<span class="carousel_name">
			<?php if (isset($_smarty_tpl->tpl_vars['carousel']->value['name'])) {?>
				<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['name'], ENT_QUOTES, 'UTF-8', true);?>

				<?php if ($_smarty_tpl->tpl_vars['carousel']->value['group_in_tabs']) {?>
					(<?php echo smartyTranslate(array('s'=>'in tabs','mod'=>'easycarousels'),$_smarty_tpl);?>
)
				<?php }?>
			<?php }?>
		</span>
		<span class="actions pull-right">
			<a class="activateCarousel list-action-enable action-<?php if ($_smarty_tpl->tpl_vars['carousel']->value['active']==1) {?>enabled<?php } else { ?>disabled<?php }?>" href="#" title="<?php echo smartyTranslate(array('s'=>'Activate/Deactivate','mod'=>'easycarousels'),$_smarty_tpl);?>
">
				<i class="icon-check"></i>
				<i class="icon-remove"></i>
			</a>
			<div class="actions btn-group pull-right">
				<button title="<?php echo smartyTranslate(array('s'=>'Edit','mod'=>'easycarousels'),$_smarty_tpl);?>
" class="editCarousel btn btn-default" data-id="<?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['id_carousel']);?>
" data-hook="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['hook_name'], ENT_QUOTES, 'UTF-8', true);?>
">
					<i class="icon-pencil"></i> <?php echo smartyTranslate(array('s'=>'Edit','mod'=>'easycarousels'),$_smarty_tpl);?>

				</button>
				<button title="<?php echo smartyTranslate(array('s'=>'Scroll Up','mod'=>'easycarousels'),$_smarty_tpl);?>
" class="scrollUp btn btn-default">
					<i class="icon icon-minus"></i> <?php echo smartyTranslate(array('s'=>'Scroll Up','mod'=>'easycarousels'),$_smarty_tpl);?>

				</button>
				<button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					<i class="icon-caret-down"></i>
				</button>
				<ul class="dropdown-menu">
					<li>
						<a class="deleteCarousel" href="#" onclick="event.preventDefault();">
							<i class="icon icon-trash"></i>
							<?php echo smartyTranslate(array('s'=>'Delete','mod'=>'easycarousels'),$_smarty_tpl);?>

						</a>
					</li>
				</ul>
			</div>
		</span>
	</div>
	<?php if ($_smarty_tpl->tpl_vars['full']->value) {?>
		<form method="post" action="" class="form-horizontal" style="display:none;">
			<div class="ajax_errors alert alert-danger" style="display:none;"></div>
			<div class="col-lg-4">
				<div class="form-group">
					<label class="control-label col-lg-6" for="carousel_type">
						<?php echo smartyTranslate(array('s'=>'Carousel type','mod'=>'easycarousels'),$_smarty_tpl);?>

					</label>
					<div class="col-lg-6">
						<select name="carousel_type" id="carousel_type">
							<?php  $_smarty_tpl->tpl_vars['type'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['type']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['type_names']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['type']->key => $_smarty_tpl->tpl_vars['type']->value) {
$_smarty_tpl->tpl_vars['type']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['type']->key;
?>
								<option value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['k']->value, ENT_QUOTES, 'UTF-8', true);?>
" <?php if ($_smarty_tpl->tpl_vars['carousel']->value['carousel_type']==$_smarty_tpl->tpl_vars['k']->value) {?>selected="selected<?php }?>">
									<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['type']->value, ENT_QUOTES, 'UTF-8', true);?>

								</option>
							<?php } ?>
						</select>
					</div>
				</div>
				<div class="form-group special_option samefeature" style="display:none;">
					<label class="control-label col-lg-6" for="id_feature">
						<?php echo smartyTranslate(array('s'=>'Feature to filter by','mod'=>'easycarousels'),$_smarty_tpl);?>

					</label>
					<div class="col-lg-6">
						<select name="general_settings[id_feature]" id="id_feature">
							<option value="0"> - </option>
							<?php  $_smarty_tpl->tpl_vars['feature'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['feature']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['available_features']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['feature']->key => $_smarty_tpl->tpl_vars['feature']->value) {
$_smarty_tpl->tpl_vars['feature']->_loop = true;
?>
								<option value="<?php echo intval($_smarty_tpl->tpl_vars['feature']->value['id_feature']);?>
"<?php if (isset($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['id_feature'])) {?> selected="selected<?php }?>"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['feature']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
</option>
							<?php } ?>
						</select>
					</div>
				</div>
				<div class="form-group special_option catproducts" style="display:none;">
					<label class="control-label col-lg-6" for="cat_ids">
						<span class="label-tooltip" data-toggle="tooltip" title="<?php echo smartyTranslate(array('s'=>'Enter category ids, separated by comma (1,2,3 ...)','mod'=>'easycarousels'),$_smarty_tpl);?>
">
							<?php echo smartyTranslate(array('s'=>'Category ids','mod'=>'easycarousels'),$_smarty_tpl);?>

						</span>
					</label>
					<div class="col-lg-6">
						<input type="text" name="general_settings[cat_ids]" id="cat_ids" value="<?php if (isset($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['cat_ids'])) {?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['cat_ids'], ENT_QUOTES, 'UTF-8', true);?>
<?php }?>">
					</div>
				</div>
				<div class="form-group special_option bymanufacturer" style="display:none;">
					<label class="control-label col-lg-6" for="id_m">
						<?php echo smartyTranslate(array('s'=>'Manufacturer','mod'=>'easycarousels'),$_smarty_tpl);?>

					</label>
					<div class="col-lg-6">
						<select name="general_settings[id_m]" id="id_m">
							<option value="0"> - </option>
							<?php  $_smarty_tpl->tpl_vars['m'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['m']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['available_manufacturers']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['m']->key => $_smarty_tpl->tpl_vars['m']->value) {
$_smarty_tpl->tpl_vars['m']->_loop = true;
?>
								<option value="<?php echo intval($_smarty_tpl->tpl_vars['m']->value['id_manufacturer']);?>
"<?php if (isset($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['id_m'])&&$_smarty_tpl->tpl_vars['carousel']->value['general_settings']['id_m']==$_smarty_tpl->tpl_vars['m']->value['id_manufacturer']) {?> selected="selected<?php }?>"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['m']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
</option>
							<?php } ?>
						</select>
					</div>
				</div>
				<div class="form-group special_option bysupplier" style="display:none;">
					<label class="control-label col-lg-6" for="id_s">
						<?php echo smartyTranslate(array('s'=>'Supplier','mod'=>'easycarousels'),$_smarty_tpl);?>

					</label>
					<div class="col-lg-6">
						<select name="general_settings[id_s]" id="id_s">
							<option value="0"> - </option>
							<?php  $_smarty_tpl->tpl_vars['s'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['s']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['available_suppliers']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['s']->key => $_smarty_tpl->tpl_vars['s']->value) {
$_smarty_tpl->tpl_vars['s']->_loop = true;
?>
								<option value="<?php echo intval($_smarty_tpl->tpl_vars['s']->value['id_supplier']);?>
"<?php if (isset($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['id_s'])&&$_smarty_tpl->tpl_vars['carousel']->value['general_settings']['id_s']==$_smarty_tpl->tpl_vars['s']->value['id_supplier']) {?> selected="selected<?php }?>"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['s']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
</option>
							<?php } ?>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-6" for="custom_class">
						<span class="label-tooltip" data-toggle="tooltip" title="<?php echo smartyTranslate(array('s'=>'Custom class that will be added to carousel container. Use \'block\' for carousels in columns','mod'=>'easycarousels'),$_smarty_tpl);?>
">
						<?php echo smartyTranslate(array('s'=>'Custom class','mod'=>'easycarousels'),$_smarty_tpl);?>

					</label>
					<div class="col-lg-6">
						<input type="text" name="general_settings[custom_class]" id="custom_class" value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['custom_class'], ENT_QUOTES, 'UTF-8', true);?>
">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-6" for="items_in_carousel">
						<?php echo smartyTranslate(array('s'=>'Total items in carousel','mod'=>'easycarousels'),$_smarty_tpl);?>

					</label>
					<div class="col-lg-6">
						<input type="text" name="general_settings[items_in_carousel]" id="items_in_carousel" value="<?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['items_in_carousel']);?>
">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-6" for="visible_cols">
						<span class="label-tooltip" data-toggle="tooltip" title="<?php echo smartyTranslate(array('s'=>'This value will be applied for screens larger than 1199px. For smaller screens, value will be adjusted basing on width','mod'=>'easycarousels'),$_smarty_tpl);?>
">
							<?php echo smartyTranslate(array('s'=>'Visible columns','mod'=>'easycarousels'),$_smarty_tpl);?>

						</span>
					</label>
					<div class="col-lg-6">
						<input type="text" name="owl_settings[i]" id="visible_cols" value="<?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['owl_settings']['i']);?>
">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-6" for="visible_rows">
						<?php echo smartyTranslate(array('s'=>'Visible rows','mod'=>'easycarousels'),$_smarty_tpl);?>

					</label>
					<div class="col-lg-6">
						<input type="text" name="general_settings[rows]" id="visible_rows" value="<?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['rows']);?>
">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-6" for="image_type">
						<?php echo smartyTranslate(array('s'=>'Image type','mod'=>'easycarousels'),$_smarty_tpl);?>

					</label>
					<div class="col-lg-6">
						<select name="general_settings[image_type]" id="image_type">
							<?php  $_smarty_tpl->tpl_vars['types'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['types']->_loop = false;
 $_smarty_tpl->tpl_vars['resource_type'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['sorted_image_types']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['types']->key => $_smarty_tpl->tpl_vars['types']->value) {
$_smarty_tpl->tpl_vars['types']->_loop = true;
 $_smarty_tpl->tpl_vars['resource_type']->value = $_smarty_tpl->tpl_vars['types']->key;
?>
								<?php  $_smarty_tpl->tpl_vars['type_name'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['type_name']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['types']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['type_name']->key => $_smarty_tpl->tpl_vars['type_name']->value) {
$_smarty_tpl->tpl_vars['type_name']->_loop = true;
?>
									<option value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['type_name']->value, ENT_QUOTES, 'UTF-8', true);?>
" class="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['resource_type']->value, ENT_QUOTES, 'UTF-8', true);?>
<?php if ($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['image_type']==$_smarty_tpl->tpl_vars['type_name']->value) {?> saved<?php }?>" <?php if ($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['image_type']==$_smarty_tpl->tpl_vars['type_name']->value) {?> selected="selected"<?php }?>>
										<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['type_name']->value, ENT_QUOTES, 'UTF-8', true);?>

									</option>
								<?php } ?>
							<?php } ?>
						</select>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="form-group">
					<label class="control-label col-lg-3" for="carousel_name">
						<?php echo smartyTranslate(array('s'=>'Displayed name','mod'=>'easycarousels'),$_smarty_tpl);?>

					</label>
					<div class="col-lg-8">
						<?php  $_smarty_tpl->tpl_vars['lang'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['lang']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['languages']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['lang']->key => $_smarty_tpl->tpl_vars['lang']->value) {
$_smarty_tpl->tpl_vars['lang']->_loop = true;
?>
							<input type="text" name="name_multilang[<?php echo intval($_smarty_tpl->tpl_vars['lang']->value['id_lang']);?>
]" class="multilang lang_<?php echo intval($_smarty_tpl->tpl_vars['lang']->value['id_lang']);?>
" <?php if (isset($_smarty_tpl->tpl_vars['carousel']->value['name_multilang'][$_smarty_tpl->tpl_vars['lang']->value['id_lang']])) {?>value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['name_multilang'][$_smarty_tpl->tpl_vars['lang']->value['id_lang']], ENT_QUOTES, 'UTF-8', true);?>
"<?php } else { ?>data-saved="false"<?php }?> style="<?php if ($_smarty_tpl->tpl_vars['lang']->value['id_lang']!=$_smarty_tpl->tpl_vars['id_lang_current']->value) {?>display:none;<?php }?>"
							/>
						<?php } ?>
					</div>
					<div class="col-lg-1 pull-right">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							<?php  $_smarty_tpl->tpl_vars['lang'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['lang']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['languages']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['lang']->key => $_smarty_tpl->tpl_vars['lang']->value) {
$_smarty_tpl->tpl_vars['lang']->_loop = true;
?>
								<span class="multilang lang_<?php echo intval($_smarty_tpl->tpl_vars['lang']->value['id_lang']);?>
" style="<?php if ($_smarty_tpl->tpl_vars['lang']->value['id_lang']!=$_smarty_tpl->tpl_vars['id_lang_current']->value) {?>display:none;<?php }?>"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['lang']->value['iso_code'], ENT_QUOTES, 'UTF-8', true);?>
</span>
							<?php } ?>
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<?php  $_smarty_tpl->tpl_vars['lang'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['lang']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['languages']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['lang']->key => $_smarty_tpl->tpl_vars['lang']->value) {
$_smarty_tpl->tpl_vars['lang']->_loop = true;
?>
							<li>
								<a href="#" class="lang_switcher" data-id-lang="<?php echo intval($_smarty_tpl->tpl_vars['lang']->value['id_lang']);?>
" onclick="event.preventDefault();">
									<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['lang']->value['name'], ENT_QUOTES, 'UTF-8', true);?>

								</a>
							</li>
							<?php } ?>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<?php ob_start();?><?php echo smartyTranslate(array('s'=>'Group in tabs?','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo smartyTranslate(array('s'=>'If set to YES, carousels will be grouped in tabs, if no, they will be simply displayed one after another','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['group_in_tabs']);?>
<?php $_tmp3=ob_get_clean();?><?php smarty_template_function_switcher_option($_smarty_tpl,array('label'=>$_tmp1,'tooltip'=>$_tmp2,'id'=>'group_in_tabs','input_name'=>'group_in_tabs','current_value'=>$_tmp3));?>

				<?php ob_start();?><?php echo smartyTranslate(array('s'=>'Display price?','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php $_tmp4=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['show_price']);?>
<?php $_tmp5=ob_get_clean();?><?php smarty_template_function_switcher_option($_smarty_tpl,array('label'=>$_tmp4,'tooltip'=>'','id'=>'show_price','input_name'=>'general_settings[show_price]','current_value'=>$_tmp5,'class'=>'product_option'));?>

				<?php ob_start();?><?php echo smartyTranslate(array('s'=>'Display add to cart?','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php $_tmp6=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['show_add_to_cart']);?>
<?php $_tmp7=ob_get_clean();?><?php smarty_template_function_switcher_option($_smarty_tpl,array('label'=>$_tmp6,'tooltip'=>'','id'=>'show_add_to_cart','input_name'=>'general_settings[show_add_to_cart]','current_value'=>$_tmp7,'class'=>'product_option'));?>

				<?php ob_start();?><?php echo smartyTranslate(array('s'=>'Display view more?','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php $_tmp8=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['show_view_more']);?>
<?php $_tmp9=ob_get_clean();?><?php smarty_template_function_switcher_option($_smarty_tpl,array('label'=>$_tmp8,'tooltip'=>'','id'=>'show_view_more','input_name'=>'general_settings[show_view_more]','current_value'=>$_tmp9,'class'=>'product_option'));?>

				<?php ob_start();?><?php echo smartyTranslate(array('s'=>'Display quick view?','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php $_tmp10=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['show_quick_view']);?>
<?php $_tmp11=ob_get_clean();?><?php smarty_template_function_switcher_option($_smarty_tpl,array('label'=>$_tmp10,'tooltip'=>'','id'=>'show_quick_view','input_name'=>'general_settings[show_quick_view]','current_value'=>$_tmp11,'class'=>'product_option'));?>

			</div>
			<div class="col-lg-4">
				<?php ob_start();?><?php echo smartyTranslate(array('s'=>'Display stock data?','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php $_tmp12=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['show_stock']);?>
<?php $_tmp13=ob_get_clean();?><?php smarty_template_function_switcher_option($_smarty_tpl,array('label'=>$_tmp12,'tooltip'=>'','id'=>'show_stock','input_name'=>'general_settings[show_stock]','current_value'=>$_tmp13,'class'=>'product_option'));?>

				<?php ob_start();?><?php echo smartyTranslate(array('s'=>'Display slickers?','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php $_tmp14=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['show_stickers']);?>
<?php $_tmp15=ob_get_clean();?><?php smarty_template_function_switcher_option($_smarty_tpl,array('label'=>$_tmp14,'tooltip'=>'','id'=>'show_stickers','input_name'=>'general_settings[show_stickers]','current_value'=>$_tmp15,'class'=>'product_option'));?>

				<?php ob_start();?><?php echo smartyTranslate(array('s'=>'Display pagination?','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php $_tmp16=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['owl_settings']['p']);?>
<?php $_tmp17=ob_get_clean();?><?php smarty_template_function_switcher_option($_smarty_tpl,array('label'=>$_tmp16,'tooltip'=>'','id'=>'show_pagination','input_name'=>'owl_settings[p]','current_value'=>$_tmp17));?>

				<?php ob_start();?><?php echo smartyTranslate(array('s'=>'Display navigation?','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php $_tmp18=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['owl_settings']['n']);?>
<?php $_tmp19=ob_get_clean();?><?php smarty_template_function_switcher_option($_smarty_tpl,array('label'=>$_tmp18,'tooltip'=>'','id'=>'show_navigation','input_name'=>'owl_settings[n]','current_value'=>$_tmp19));?>

				<?php ob_start();?><?php echo smartyTranslate(array('s'=>'Enable autoplay?','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php $_tmp20=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['carousel']->value['owl_settings']['a']);?>
<?php $_tmp21=ob_get_clean();?><?php smarty_template_function_switcher_option($_smarty_tpl,array('label'=>$_tmp20,'tooltip'=>'','id'=>'autoplay','input_name'=>'owl_settings[a]','current_value'=>$_tmp21));?>

			</div>
			<div class="p-footer">
				<button id="saveCarousel" class="btn btn-default">
					<i class="process-icon-save"></i>
					<?php echo smartyTranslate(array('s'=>'Save','mod'=>'easycarousels'),$_smarty_tpl);?>

				</button>
			</div>
		</form>
	<?php }?>
</div><?php }} ?>
