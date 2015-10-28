<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 21:07:44
         compiled from "/var/www/www.matisses.co/www/themes/matisses/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:152191862456241289dc7359-31721885%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '48f5cdd755cbb565120b1cd676b1ed189069bd18' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/index.tpl',
      1 => 1445220460,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '152191862456241289dc7359-31721885',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241289df6d74_21511860',
  'variables' => 
  array (
    'page_name' => 0,
    'HOOK_HOME_TAB_CONTENT' => 0,
    'HOOK_HOME_TAB' => 0,
    'HOOK_HOME' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241289df6d74_21511860')) {function content_56241289df6d74_21511860($_smarty_tpl) {?>


<div id="index" class="container">
	<div id="slider" class="slider">
    	<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayMatSlider"),$_smarty_tpl);?>

    </div>
    <div id="viewed-products" class="viewed-products">
    	<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayMatShowesProducts"),$_smarty_tpl);?>

    </div>
    <div id="new-products" class="new-products">
    	<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayMatNewProducts"),$_smarty_tpl);?>

    </div>
    <div class="experiences">
    	<?php echo smartyTranslate(array('s'=>'Expereincias'),$_smarty_tpl);?>

    </div>
    <div class="blog">
    	<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayMatBlog"),$_smarty_tpl);?>

    </div>
</div>  


<?php if ($_smarty_tpl->tpl_vars['page_name']->value=='index'&&false) {?>
<div id="slider_row">
  <div id="top_column" class="center_column col-xs-12 col-sm-12"> 
    <!-- hook displayTopColumn --> 
     
    <!-- end hook displayTopColumn --> 
    <!-- hook displayEasyCarousel2 --> 
     
    <!-- end hook displayEasyCarousel2 --> 
    <!-- hook dislayCustomBanners2 --> 
     
    <!-- end hook dislayCustomBanners2 --> 
  </div>
</div>
<?php }?>


<?php if (false) {?>
<?php if (isset($_smarty_tpl->tpl_vars['HOOK_HOME_TAB_CONTENT']->value)&&trim($_smarty_tpl->tpl_vars['HOOK_HOME_TAB_CONTENT']->value)) {?>
	<div class="wrap_tabs_main">
		
		    	<h2 class="title_main_section"><span><?php echo smartyTranslate(array('s'=>'Featured products'),$_smarty_tpl);?>
</span></h2>
		    	<h3 class="undertitle_main">
		    		<?php echo smartyTranslate(array('s'=>'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '),$_smarty_tpl);?>

		    	</h3>
		<div class="tabs_main clearfix">
			<?php if (isset($_smarty_tpl->tpl_vars['HOOK_HOME_TAB']->value)&&trim($_smarty_tpl->tpl_vars['HOOK_HOME_TAB']->value)) {?>
			 
			        <ul id="home-page-tabs" class="tabs_carousel nav nav-tabs clearfix">
						<?php echo $_smarty_tpl->tpl_vars['HOOK_HOME_TAB']->value;?>

					</ul>
			<?php }?>
			<div class="tab-content clearfix">
				<?php echo $_smarty_tpl->tpl_vars['HOOK_HOME_TAB_CONTENT']->value;?>

			</div>
	    </div>
	</div>
<?php }?>
<?php if (isset($_smarty_tpl->tpl_vars['HOOK_HOME']->value)&&trim($_smarty_tpl->tpl_vars['HOOK_HOME']->value)) {?>
	<div class="clearfix">
		<?php echo $_smarty_tpl->tpl_vars['HOOK_HOME']->value;?>

	</div>
<?php }?>
	<!-- hook displayHomeCustom -->
	<div class="clearfix">
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>'displayHomeCustom'),$_smarty_tpl);?>

	</div>
<!-- end hook displayHomeCustom -->
		<!-- hook displayEasyCarousel1 -->
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>'displayEasyCarousel1'),$_smarty_tpl);?>

<!-- end hook displayEasyCarousel1 -->
<?php }?><?php }} ?>
