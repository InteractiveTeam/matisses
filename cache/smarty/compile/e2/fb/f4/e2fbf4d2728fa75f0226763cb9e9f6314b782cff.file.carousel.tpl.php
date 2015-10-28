<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:47
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/easycarousels/views/templates/hook/carousel.tpl" */ ?>
<?php /*%%SmartyHeaderCode:134908637056241293dee7f2-41941849%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e2fbf4d2728fa75f0226763cb9e9f6314b782cff' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/easycarousels/views/templates/hook/carousel.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '134908637056241293dee7f2-41941849',
  'function' => 
  array (
    'displayManufacturerDetails' => 
    array (
      'parameter' => 
      array (
        'item' => '',
      ),
      'compiled' => '',
    ),
    'displaySupplierDetails' => 
    array (
      'parameter' => 
      array (
        'item' => '',
      ),
      'compiled' => '',
    ),
    'displayProductDetails' => 
    array (
      'parameter' => 
      array (
        'item' => '',
        'general_settings' => '',
      ),
      'compiled' => '',
    ),
    'generateCarousel' => 
    array (
      'parameter' => 
      array (
        'hook_name' => '',
        'carousel' => '',
        'in_tabs' => false,
      ),
      'compiled' => '',
    ),
  ),
  'variables' => 
  array (
    'item' => 0,
    'link' => 0,
    'general_settings' => 0,
    'homeSize' => 0,
    'PS_CATALOG_MODE' => 0,
    'PS_STOCK_MANAGEMENT' => 0,
    'restricted_country_mode' => 0,
    'currency' => 0,
    'priceDisplay' => 0,
    'add_prod_display' => 0,
    'static_token' => 0,
    'hook_name' => 0,
    'carousel' => 0,
    'in_tabs' => 0,
    'i' => 0,
    'carousels_in_tabs' => 0,
    'carousels_one_by_one' => 0,
  ),
  'has_nocache_code' => 0,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241294271210_71131679',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241294271210_71131679')) {function content_56241294271210_71131679($_smarty_tpl) {?>



<?php if (!function_exists('smarty_template_function_displayManufacturerDetails')) {
    function smarty_template_function_displayManufacturerDetails($_smarty_tpl,$params) {
    $saved_tpl_vars = $_smarty_tpl->tpl_vars;
    foreach ($_smarty_tpl->smarty->template_functions['displayManufacturerDetails']['parameter'] as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);};
    foreach ($params as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);}?>
	<a class="item-name" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getManufacturerLink($_smarty_tpl->tpl_vars['item']->value['id_manufacturer'],$_smarty_tpl->tpl_vars['item']->value['link_rewrite']), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'More about %s','sprintf'=>array($_smarty_tpl->tpl_vars['item']->value['name']),'mod'=>'easycarousels'),$_smarty_tpl);?>
">
		<img class="replace-2x img-responsive" src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['image_url'], ENT_QUOTES, 'UTF-8', true);?>
" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
"/>
		<h5><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
</h5>
	</a>
<?php $_smarty_tpl->tpl_vars = $saved_tpl_vars;
foreach (Smarty::$global_tpl_vars as $key => $value) if(!isset($_smarty_tpl->tpl_vars[$key])) $_smarty_tpl->tpl_vars[$key] = $value;}}?>


<?php if (!function_exists('smarty_template_function_displaySupplierDetails')) {
    function smarty_template_function_displaySupplierDetails($_smarty_tpl,$params) {
    $saved_tpl_vars = $_smarty_tpl->tpl_vars;
    foreach ($_smarty_tpl->smarty->template_functions['displaySupplierDetails']['parameter'] as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);};
    foreach ($params as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);}?>
	<a class="item-name" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getSupplierLink($_smarty_tpl->tpl_vars['item']->value['id_supplier'],$_smarty_tpl->tpl_vars['item']->value['link_rewrite']), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'More about %s','sprintf'=>array($_smarty_tpl->tpl_vars['item']->value['name']),'mod'=>'easycarousels'),$_smarty_tpl);?>
">
		<img class="replace-2x img-responsive" src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['image_url'], ENT_QUOTES, 'UTF-8', true);?>
" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
"/>
		<h5><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
</h5>
	</a>
<?php $_smarty_tpl->tpl_vars = $saved_tpl_vars;
foreach (Smarty::$global_tpl_vars as $key => $value) if(!isset($_smarty_tpl->tpl_vars[$key])) $_smarty_tpl->tpl_vars[$key] = $value;}}?>


<?php if (!function_exists('smarty_template_function_displayProductDetails')) {
    function smarty_template_function_displayProductDetails($_smarty_tpl,$params) {
    $saved_tpl_vars = $_smarty_tpl->tpl_vars;
    foreach ($_smarty_tpl->smarty->template_functions['displayProductDetails']['parameter'] as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);};
    foreach ($params as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);}?>
	<div class="product-container" itemscope itemtype="http://schema.org/Product">
	<div class="left-block">
		<div class="product-image-container">
			<div class="wrap_image_list">
				<a class="product_img_link"	href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['link'], ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
" itemprop="url">
					<img class="replace-2x img-responsive" src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getImageLink($_smarty_tpl->tpl_vars['item']->value['link_rewrite'],$_smarty_tpl->tpl_vars['item']->value['id_image'],$_smarty_tpl->tpl_vars['general_settings']->value['image_type']), ENT_QUOTES, 'UTF-8', true);?>
" alt="<?php if (!empty($_smarty_tpl->tpl_vars['item']->value['legend'])) {?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['legend'], ENT_QUOTES, 'UTF-8', true);?>
<?php } else { ?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
<?php }?>" title="<?php if (!empty($_smarty_tpl->tpl_vars['item']->value['legend'])) {?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['legend'], ENT_QUOTES, 'UTF-8', true);?>
<?php } else { ?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
<?php }?>" <?php if (isset($_smarty_tpl->tpl_vars['homeSize']->value)) {?> width="<?php echo $_smarty_tpl->tpl_vars['homeSize']->value['width'];?>
" height="<?php echo $_smarty_tpl->tpl_vars['homeSize']->value['height'];?>
"<?php }?> itemprop="image" />
				</a>
			</div>
			<?php if (($_smarty_tpl->tpl_vars['item']->value['allow_oosp']||$_smarty_tpl->tpl_vars['item']->value['quantity']>0)) {?>
				<?php if ($_smarty_tpl->tpl_vars['general_settings']->value['show_stickers']) {?>
					<div class="wrap_features">
						<?php if (isset($_smarty_tpl->tpl_vars['item']->value['new'])&&$_smarty_tpl->tpl_vars['item']->value['new']==1) {?>
							<a class="tag new" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['link'], ENT_QUOTES, 'UTF-8', true);?>
">
								<span class="new-label"><?php echo smartyTranslate(array('s'=>'New','mod'=>'easycarousels'),$_smarty_tpl);?>
</span>
							</a>
						<?php }?>
						<?php if (isset($_smarty_tpl->tpl_vars['item']->value['on_sale'])&&$_smarty_tpl->tpl_vars['item']->value['on_sale']&&isset($_smarty_tpl->tpl_vars['item']->value['show_price'])&&$_smarty_tpl->tpl_vars['item']->value['show_price']&&!$_smarty_tpl->tpl_vars['PS_CATALOG_MODE']->value) {?>
							<a class="tag sale" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['link'], ENT_QUOTES, 'UTF-8', true);?>
">
								<span class="sale-label"><?php echo smartyTranslate(array('s'=>'Sale!','mod'=>'easycarousels'),$_smarty_tpl);?>
</span>
							</a>
						<?php }?>
						<?php if ($_smarty_tpl->tpl_vars['item']->value['specific_prices']['reduction_type']=='percentage') {?>
						<span class="tag price-percent-reduction">-<?php echo htmlspecialchars(($_smarty_tpl->tpl_vars['item']->value['specific_prices']['reduction']*100), ENT_QUOTES, 'UTF-8', true);?>
%</span>
					<?php }?>
					</div>
				<?php }?>
			<?php }?>
			<?php if (($_smarty_tpl->tpl_vars['general_settings']->value['show_stock']&&!$_smarty_tpl->tpl_vars['PS_CATALOG_MODE']->value&&$_smarty_tpl->tpl_vars['PS_STOCK_MANAGEMENT']->value&&((isset($_smarty_tpl->tpl_vars['item']->value['show_price'])&&$_smarty_tpl->tpl_vars['item']->value['show_price'])||(isset($_smarty_tpl->tpl_vars['item']->value['available_for_order'])&&$_smarty_tpl->tpl_vars['item']->value['available_for_order'])))) {?>
			<?php if (isset($_smarty_tpl->tpl_vars['item']->value['available_for_order'])&&$_smarty_tpl->tpl_vars['item']->value['available_for_order']&&!isset($_smarty_tpl->tpl_vars['restricted_country_mode']->value)) {?>
				<span itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="availability">
					<?php if (($_smarty_tpl->tpl_vars['item']->value['allow_oosp']||$_smarty_tpl->tpl_vars['item']->value['quantity']>0)) {?>
						
					<?php } elseif ((isset($_smarty_tpl->tpl_vars['item']->value['quantity_all_versions'])&&$_smarty_tpl->tpl_vars['item']->value['quantity_all_versions']>0)) {?>
						<span class="tag out diff">
							<link itemprop="availability" href="http://schema.org/LimitedAvailability" /><?php echo smartyTranslate(array('s'=>'Available with different options','mod'=>'easycarousels'),$_smarty_tpl);?>

						</span>
					<?php } else { ?>
						<span class="tag out">
							<link itemprop="availability" href="http://schema.org/OutOfStock" /><?php echo smartyTranslate(array('s'=>'Out of stock','mod'=>'easycarousels'),$_smarty_tpl);?>

						</span>
					<?php }?>
				</span>
			<?php }?>
		<?php }?>
		</div>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayProductDeliveryTime",'product'=>$_smarty_tpl->tpl_vars['item']->value),$_smarty_tpl);?>

		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayProductPriceBlock",'product'=>$_smarty_tpl->tpl_vars['item']->value,'type'=>"weight"),$_smarty_tpl);?>

	</div>
	<div class="right-block">
		<div class="wrap_content_price">
			<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>'displayProductListReviews','product'=>$_smarty_tpl->tpl_vars['item']->value),$_smarty_tpl);?>

			<h5 class="product-name" itemprop="name">
				<?php if (isset($_smarty_tpl->tpl_vars['item']->value['pack_quantity'])&&$_smarty_tpl->tpl_vars['item']->value['pack_quantity']) {?><?php echo (intval($_smarty_tpl->tpl_vars['item']->value['pack_quantity'])).(' x ');?>
<?php }?>
				<a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['link'], ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
" itemprop="url" >
					<?php echo htmlspecialchars($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['item']->value['name'],45,'...'), ENT_QUOTES, 'UTF-8', true);?>

				</a>
			</h5>
			<?php if (($_smarty_tpl->tpl_vars['general_settings']->value['show_price']&&!$_smarty_tpl->tpl_vars['PS_CATALOG_MODE']->value&&((isset($_smarty_tpl->tpl_vars['item']->value['show_price'])&&$_smarty_tpl->tpl_vars['item']->value['show_price'])||(isset($_smarty_tpl->tpl_vars['item']->value['available_for_order'])&&$_smarty_tpl->tpl_vars['item']->value['available_for_order'])))) {?>
			<div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="content_price main">
				<?php if (isset($_smarty_tpl->tpl_vars['item']->value['show_price'])&&$_smarty_tpl->tpl_vars['item']->value['show_price']&&!isset($_smarty_tpl->tpl_vars['restricted_country_mode']->value)) {?>
					<meta itemprop="priceCurrency" content="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['currency']->value->iso_code, ENT_QUOTES, 'UTF-8', true);?>
" />
					<?php if (isset($_smarty_tpl->tpl_vars['item']->value['specific_prices'])&&$_smarty_tpl->tpl_vars['item']->value['specific_prices']&&isset($_smarty_tpl->tpl_vars['item']->value['specific_prices']['reduction'])&&$_smarty_tpl->tpl_vars['item']->value['specific_prices']['reduction']>0) {?>
						<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayProductPriceBlock",'product'=>$_smarty_tpl->tpl_vars['item']->value,'type'=>"old_price"),$_smarty_tpl);?>

						<span class="old-price product-price">
							<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['displayWtPrice'][0][0]->displayWtPrice(array('p'=>$_smarty_tpl->tpl_vars['item']->value['price_without_reduction']),$_smarty_tpl);?>

						</span>
						<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayProductPriceBlock",'id_product'=>$_smarty_tpl->tpl_vars['item']->value['id_product'],'type'=>"old_price"),$_smarty_tpl);?>

						<?php if ($_smarty_tpl->tpl_vars['item']->value['specific_prices']['reduction_type']=='percentage') {?>
							
						<?php }?>
					<?php }?>
					<span itemprop="price" class="price product-price">
						<?php if (!$_smarty_tpl->tpl_vars['priceDisplay']->value) {?><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['item']->value['price']),$_smarty_tpl);?>
<?php } else { ?><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['item']->value['price_tax_exc']),$_smarty_tpl);?>
<?php }?>
					</span>
					<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayProductPriceBlock",'product'=>$_smarty_tpl->tpl_vars['item']->value,'type'=>"price"),$_smarty_tpl);?>

					<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayProductPriceBlock",'product'=>$_smarty_tpl->tpl_vars['item']->value,'type'=>"unit_price"),$_smarty_tpl);?>

				<?php }?>
			</div>
			<?php }?>
		</div>
		<?php if (isset($_smarty_tpl->tpl_vars['item']->value['color_list'])) {?>
			
		<?php }?>
	</div>
			<div class="wrap_view wrap_visible_hover">
			<?php if ($_smarty_tpl->tpl_vars['general_settings']->value['show_view_more']) {?>
				<a itemprop="url" class="scale_hover_in lnk_view" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['link'], ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'View','mod'=>'easycarousels'),$_smarty_tpl);?>
">
					<i class="fa fa-search"></i>
					<span><?php if ((isset($_smarty_tpl->tpl_vars['item']->value['customization_required'])&&$_smarty_tpl->tpl_vars['item']->value['customization_required'])) {?><?php echo smartyTranslate(array('s'=>'Customize','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php } else { ?><?php echo smartyTranslate(array('s'=>'More','mod'=>'easycarousels'),$_smarty_tpl);?>
<?php }?></span>
				</a>
			<?php }?>
			<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>'displayProductListFunctionalButtons','product'=>$_smarty_tpl->tpl_vars['item']->value),$_smarty_tpl);?>

			<?php if ($_smarty_tpl->tpl_vars['general_settings']->value['show_quick_view']) {?>
				<a class="scale_hover_in quick-view" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['link'], ENT_QUOTES, 'UTF-8', true);?>
" rel="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['link'], ENT_QUOTES, 'UTF-8', true);?>
">
					<i class="font-eye"></i><span><?php echo smartyTranslate(array('s'=>'Quick view','mod'=>'easycarousels'),$_smarty_tpl);?>
</span>
				</a>
			<?php }?>
			<div class="button-container clearfix">
			<?php if ($_smarty_tpl->tpl_vars['general_settings']->value['show_add_to_cart']) {?>
				<?php if (($_smarty_tpl->tpl_vars['item']->value['id_product_attribute']==0||(isset($_smarty_tpl->tpl_vars['add_prod_display']->value)&&($_smarty_tpl->tpl_vars['add_prod_display']->value==1)))&&$_smarty_tpl->tpl_vars['item']->value['available_for_order']&&!isset($_smarty_tpl->tpl_vars['restricted_country_mode']->value)&&$_smarty_tpl->tpl_vars['item']->value['customizable']!=2&&!$_smarty_tpl->tpl_vars['PS_CATALOG_MODE']->value) {?>
					<?php if ((!isset($_smarty_tpl->tpl_vars['item']->value['customization_required'])||!$_smarty_tpl->tpl_vars['item']->value['customization_required'])&&($_smarty_tpl->tpl_vars['item']->value['allow_oosp']||$_smarty_tpl->tpl_vars['item']->value['quantity']>0)) {?>
						<?php $_smarty_tpl->_capture_stack[0][] = array('default', null, null); ob_start(); ?>add=1&amp;id_product=<?php echo intval($_smarty_tpl->tpl_vars['item']->value['id_product']);?>
<?php if (isset($_smarty_tpl->tpl_vars['static_token']->value)) {?>&amp;token=<?php echo $_smarty_tpl->tpl_vars['static_token']->value;?>
<?php }?><?php list($_capture_buffer, $_capture_assign, $_capture_append) = array_pop($_smarty_tpl->_capture_stack[0]);
if (!empty($_capture_buffer)) {
 if (isset($_capture_assign)) $_smarty_tpl->assign($_capture_assign, ob_get_contents());
 if (isset( $_capture_append)) $_smarty_tpl->append( $_capture_append, ob_get_contents());
 Smarty::$_smarty_vars['capture'][$_capture_buffer]=ob_get_clean();
} else $_smarty_tpl->capture_error();?>
						<a class="btn btn_border ajax_add_to_cart_button" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink('cart',true,null,Smarty::$_smarty_vars['capture']['default'],false), ENT_QUOTES, 'UTF-8', true);?>
" rel="nofollow" title="<?php echo smartyTranslate(array('s'=>'Add to cart','mod'=>'easycarousels'),$_smarty_tpl);?>
" data-id-product="<?php echo intval($_smarty_tpl->tpl_vars['item']->value['id_product']);?>
" data-minimal_quantity="<?php if (isset($_smarty_tpl->tpl_vars['item']->value['product_attribute_minimal_quantity'])&&$_smarty_tpl->tpl_vars['item']->value['product_attribute_minimal_quantity']>1) {?><?php echo intval($_smarty_tpl->tpl_vars['item']->value['product_attribute_minimal_quantity']);?>
<?php } else { ?><?php echo intval($_smarty_tpl->tpl_vars['item']->value['minimal_quantity']);?>
<?php }?>">
							<span><?php echo smartyTranslate(array('s'=>'Add to cart','mod'=>'easycarousels'),$_smarty_tpl);?>
</span>
						</a>
					<?php } else { ?>
						<span class="btn btn_border ajax_add_to_cart_button disabled">
							<span><?php echo smartyTranslate(array('s'=>'Add to cart','mod'=>'easycarousels'),$_smarty_tpl);?>
</span>
						</span>
					<?php }?>
				<?php }?>
			<?php }?>
		</div>
		<div class="share_product">
			<a data-target="https://plus.google.com/share?url=[<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['link'], ENT_QUOTES, 'UTF-8', true);?>
]" class="btn_google" target="_blank"><i class="fa fa-google-plus"></i></a>
			<a data-target="http://www.linkedin.com/shareArticle?mini=true&url=<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['link'], ENT_QUOTES, 'UTF-8', true);?>
&title=<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
&source=$base_dir}" class="btn_in" target="_blank"> <i class="fa fa-linkedin" ></i></a>
			<a data-target="http://twitter.com/home?status=<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
 + <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['link'], ENT_QUOTES, 'UTF-8', true);?>
" class="btn_twitter" target="_blank"><i class="fa fa-twitter"></i></a>
			<a data-target="http://www.facebook.com/sharer.php?u=<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['link'], ENT_QUOTES, 'UTF-8', true);?>

&t=<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['item']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
" class="btn_facebook" target="_blank"><i class="fa fa-facebook"></i></a>
		</div>
		</div>
	</div>
<?php $_smarty_tpl->tpl_vars = $saved_tpl_vars;
foreach (Smarty::$global_tpl_vars as $key => $value) if(!isset($_smarty_tpl->tpl_vars[$key])) $_smarty_tpl->tpl_vars[$key] = $value;}}?>


<?php if (!function_exists('smarty_template_function_generateCarousel')) {
    function smarty_template_function_generateCarousel($_smarty_tpl,$params) {
    $saved_tpl_vars = $_smarty_tpl->tpl_vars;
    foreach ($_smarty_tpl->smarty->template_functions['generateCarousel']['parameter'] as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);};
    foreach ($params as $key => $value) {$_smarty_tpl->tpl_vars[$key] = new Smarty_variable($value);}?>
	<div id="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true);?>
_<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['carousel_type'], ENT_QUOTES, 'UTF-8', true);?>
" class="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['general_settings']['custom_class'], ENT_QUOTES, 'UTF-8', true);?>
<?php if ($_smarty_tpl->tpl_vars['in_tabs']->value) {?> tab-pane<?php } else { ?> single_carousel <?php }?><?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['cit_details']['first']) {?> active<?php }?> <?php if (htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['carousel_type'], ENT_QUOTES, 'UTF-8', true)=='manufacturers'||htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['carousel_type'], ENT_QUOTES, 'UTF-8', true)=='suppliers'&&htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)!='displayFooterProduct') {?>container<?php }?> <?php if (htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['carousel_type'], ENT_QUOTES, 'UTF-8', true)!='manufacturers'&&htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['carousel_type'], ENT_QUOTES, 'UTF-8', true)!='suppliers') {?> product_carousel_block <?php }?> carousel_block <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['carousel_type'], ENT_QUOTES, 'UTF-8', true);?>
">
		<?php if (!$_smarty_tpl->tpl_vars['in_tabs']->value&&isset($_smarty_tpl->tpl_vars['carousel']->value['name'])) {?>
			<h2 class="title_main_section carousel_title"><span><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
</span></h2>
			<?php if (htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['carousel_type'], ENT_QUOTES, 'UTF-8', true)=='manufacturers') {?>
				<h3 class="undertitle_main"><span>
        		<?php echo smartyTranslate(array('s'=>'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.','mod'=>'easycarousels'),$_smarty_tpl);?>
</span></h3>
        	<?php } elseif (htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['carousel_type'], ENT_QUOTES, 'UTF-8', true)=='samecategory') {?>
				<h3 class="undertitle_main"><span>
        		<?php echo smartyTranslate(array('s'=>'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.','mod'=>'easycarousels'),$_smarty_tpl);?>
</span></h3>
        	<?php }?>
		<?php }?>
		<div class="easycarousel <?php if (!$_smarty_tpl->tpl_vars['in_tabs']->value&&isset($_smarty_tpl->tpl_vars['carousel']->value['name'])) {?>block_content<?php }?>" data-settings="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['owl_settings'], ENT_QUOTES, 'UTF-8', true);?>
">
			<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['carousel']->value['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value) {
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
				<div class="carousel_col">
					<?php  $_smarty_tpl->tpl_vars['i'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['i']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['item']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['i']->key => $_smarty_tpl->tpl_vars['i']->value) {
$_smarty_tpl->tpl_vars['i']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['i']->key;
?>
						<div class="c_item <?php if ($_smarty_tpl->tpl_vars['carousel']->value['carousel_type']=='manufacturers'||$_smarty_tpl->tpl_vars['carousel']->value['carousel_type']=='suppliers') {?>man-sup-item<?php }?>">
							<?php if ($_smarty_tpl->tpl_vars['carousel']->value['carousel_type']=='manufacturers') {?>
								<?php smarty_template_function_displayManufacturerDetails($_smarty_tpl,array('item'=>$_smarty_tpl->tpl_vars['i']->value));?>

							<?php } elseif ($_smarty_tpl->tpl_vars['carousel']->value['carousel_type']=='suppliers') {?>
								<?php smarty_template_function_displaySupplierDetails($_smarty_tpl,array('item'=>$_smarty_tpl->tpl_vars['i']->value));?>

							<?php } else { ?>
								<?php smarty_template_function_displayProductDetails($_smarty_tpl,array('item'=>$_smarty_tpl->tpl_vars['i']->value,'general_settings'=>$_smarty_tpl->tpl_vars['carousel']->value['general_settings']));?>

							<?php }?>
						</div>
					<?php } ?>
				</div>
			<?php } ?>
		</div>
	</div>
<?php $_smarty_tpl->tpl_vars = $saved_tpl_vars;
foreach (Smarty::$global_tpl_vars as $key => $value) if(!isset($_smarty_tpl->tpl_vars[$key])) $_smarty_tpl->tpl_vars[$key] = $value;}}?>


<!-- carousels grouped in tabs -->
<?php if (count($_smarty_tpl->tpl_vars['carousels_in_tabs']->value)>0) {?>
	<div class="easycarousels in_tabs clearfix">
		<?php if (htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)=='displayEasyCarousel2') {?>
			<h2 class="title_main_section"><span><?php echo smartyTranslate(array('s'=>'Featured products','mod'=>'easycarousels'),$_smarty_tpl);?>
</span></h2>
			<h3 class="undertitle_main">
			<?php echo smartyTranslate(array('s'=>'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','mod'=>'easycarousels'),$_smarty_tpl);?>
</h3>
		<?php }?>
		<ul id="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true);?>
_easycarousel_tabs" class="tabs_carousel nav nav-tabs easycarousel_tabs closed" data-tabs="tabs" role="tablist">
			<?php  $_smarty_tpl->tpl_vars['carousel'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['carousel']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['carousels_in_tabs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['carousel']->index=-1;
foreach ($_from as $_smarty_tpl->tpl_vars['carousel']->key => $_smarty_tpl->tpl_vars['carousel']->value) {
$_smarty_tpl->tpl_vars['carousel']->_loop = true;
 $_smarty_tpl->tpl_vars['carousel']->index++;
 $_smarty_tpl->tpl_vars['carousel']->first = $_smarty_tpl->tpl_vars['carousel']->index === 0;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['cit']['first'] = $_smarty_tpl->tpl_vars['carousel']->first;
?>
				<?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['cit']['first']) {?>
					<li class="responsive_tabs_selection title_block">
						<a href="" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
" onclick="event.preventDefault();">
							<span class="selection"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
</span>
							<i class="icon icon-angle-down x2"></i>
						</a>
					</li>
				<?php }?>
				<li class="<?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['cit']['first']) {?>first active<?php }?> carousel_title">
					<a data-toggle="tab" href="#<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true);?>
_<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['carousel_type'], ENT_QUOTES, 'UTF-8', true);?>
"><?php if (isset($_smarty_tpl->tpl_vars['carousel']->value['name'])) {?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
<?php }?></a>
				</li>
			<?php } ?>
		</ul>
		<div class="tab-content row">
		<?php  $_smarty_tpl->tpl_vars['carousel'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['carousel']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['carousels_in_tabs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['carousel']->index=-1;
foreach ($_from as $_smarty_tpl->tpl_vars['carousel']->key => $_smarty_tpl->tpl_vars['carousel']->value) {
$_smarty_tpl->tpl_vars['carousel']->_loop = true;
 $_smarty_tpl->tpl_vars['carousel']->index++;
 $_smarty_tpl->tpl_vars['carousel']->first = $_smarty_tpl->tpl_vars['carousel']->index === 0;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['cit_details']['first'] = $_smarty_tpl->tpl_vars['carousel']->first;
?>
			<?php smarty_template_function_generateCarousel($_smarty_tpl,array('hook_name'=>$_smarty_tpl->tpl_vars['hook_name']->value,'carousel'=>$_smarty_tpl->tpl_vars['carousel']->value,'in_tabs'=>true));?>

		<?php } ?>
		</div>
	</div>
<?php }?>

<!-- carousels out of tabs -->
<?php if (count($_smarty_tpl->tpl_vars['carousels_one_by_one']->value)>0) {?>
	<div class="easycarousels one_by_one clearfix row">
		<?php  $_smarty_tpl->tpl_vars['carousel'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['carousel']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['carousels_one_by_one']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['carousel']->key => $_smarty_tpl->tpl_vars['carousel']->value) {
$_smarty_tpl->tpl_vars['carousel']->_loop = true;
?>
			<?php smarty_template_function_generateCarousel($_smarty_tpl,array('hook_name'=>$_smarty_tpl->tpl_vars['hook_name']->value,'carousel'=>$_smarty_tpl->tpl_vars['carousel']->value));?>

		<?php } ?>
	</div>
<?php }?>
<?php }} ?>
