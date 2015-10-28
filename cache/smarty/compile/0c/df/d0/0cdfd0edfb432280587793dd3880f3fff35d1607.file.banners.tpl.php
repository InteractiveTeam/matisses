<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:37
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/custombanners/views/templates/hook/banners.tpl" */ ?>
<?php /*%%SmartyHeaderCode:17513627065624128985ce37-09939363%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0cdfd0edfb432280587793dd3880f3fff35d1607' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/custombanners/views/templates/hook/banners.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17513627065624128985ce37-09939363',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'banners' => 0,
    'hook_name' => 0,
    'carousel_settings' => 0,
    'banner' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5624128994bb56_85398624',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5624128994bb56_85398624')) {function content_5624128994bb56_85398624($_smarty_tpl) {?>
<?php if ($_smarty_tpl->tpl_vars['banners']->value) {?>
<div class="custombanners <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true);?>
" data-hook="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true);?>
">
	<div class="banners-in-carousel" style="display:none;">
		<div class="carousel" data-settings="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['carousel_settings']->value, ENT_QUOTES, 'UTF-8', true);?>
"></div>
	</div>
		<?php if (htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)=='displayHome') {?>
		<div class="container">
		<?php }?>
		<div class="banners-one-by-one">
		<?php  $_smarty_tpl->tpl_vars['banner'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['banner']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['banners']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['items']['iteration']=0;
foreach ($_from as $_smarty_tpl->tpl_vars['banner']->key => $_smarty_tpl->tpl_vars['banner']->value) {
$_smarty_tpl->tpl_vars['banner']->_loop = true;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['items']['iteration']++;
?>
			<div class="banner-item <?php if (isset($_smarty_tpl->tpl_vars['banner']->value['class'])) {?> <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['banner']->value['class'], ENT_QUOTES, 'UTF-8', true);?>
<?php }?> <?php if ($_smarty_tpl->tpl_vars['banner']->value['in_carousel']==1) {?>in_carousel<?php }?>
			banner_<?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['items']['iteration'];?>
" <?php if (htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)=='displayBanner'&&(isset($_smarty_tpl->tpl_vars['banner']->value['img'])&&$_smarty_tpl->tpl_vars['banner']->value['img'])) {?>style="background-image:url(<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['banner']->value['img'], ENT_QUOTES, 'UTF-8', true);?>
);"<?php }?>>
				<?php if (htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)=='displayTopColumn'||htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)=='displayCustomBanners3') {?>
					<div class="inner-banner-item <?php if (htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)=='displayCustomBanners3') {?>hover_scale<?php }?>">
				<?php }?>
				<?php if (htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)!='displayBanner') {?>
					<?php if (isset($_smarty_tpl->tpl_vars['banner']->value['img'])&&$_smarty_tpl->tpl_vars['banner']->value['img']) {?>
						<?php if (isset($_smarty_tpl->tpl_vars['banner']->value['link'])&&$_smarty_tpl->tpl_vars['banner']->value['link']) {?>
						<a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['banner']->value['link']['href'], ENT_QUOTES, 'UTF-8', true);?>
"<?php if (isset($_smarty_tpl->tpl_vars['banner']->value['link']['_blank'])) {?> target="_blank"<?php }?>>
						<?php }?>
							<img src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['banner']->value['img'], ENT_QUOTES, 'UTF-8', true);?>
"<?php if (isset($_smarty_tpl->tpl_vars['banner']->value['title'])) {?> title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['banner']->value['title'], ENT_QUOTES, 'UTF-8', true);?>
"<?php }?> class="banner-img">	
						<?php if (htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)!='displayTopColumn'&&htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)!='displayCustomBanners3') {?>			
							<?php if (isset($_smarty_tpl->tpl_vars['banner']->value['link'])&&$_smarty_tpl->tpl_vars['banner']->value['link']) {?>
								</a>
							<?php }?>
						<?php }?>
					<?php }?>
				<?php }?>
					<?php if (isset($_smarty_tpl->tpl_vars['banner']->value['html'])&&$_smarty_tpl->tpl_vars['banner']->value['html']) {?>					
						<div class="custom-html">
							<?php echo $_smarty_tpl->tpl_vars['banner']->value['html'];?>

						</div>
					<?php }?>
					<?php if (htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)=='displayTopColumn'||htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)=='displayCustomBanners3') {?>
						<?php if ($_smarty_tpl->tpl_vars['banner']->value['img']) {?>
							<?php if (isset($_smarty_tpl->tpl_vars['banner']->value['link'])&&$_smarty_tpl->tpl_vars['banner']->value['link']) {?>
								</a>
							<?php }?>
						<?php }?>
					<?php }?>
				<?php if (htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)=='displayTopColumn'||htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)=='displayCustomBanners3') {?>
					</div>
				<?php }?>
			</div>
		<?php } ?>
	</div>
	<?php if (htmlspecialchars($_smarty_tpl->tpl_vars['hook_name']->value, ENT_QUOTES, 'UTF-8', true)=='displayHome') {?>
	</div>
	<?php }?>
</div>
<?php }?><?php }} ?>
