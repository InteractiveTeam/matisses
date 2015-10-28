<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:44
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/problockcontactinfos/views/templates/hook/problockcontactinfos.tpl" */ ?>
<?php /*%%SmartyHeaderCode:13100822556241290cecaf2-26667477%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1561935ecc82c3e8e79a41f5278a7f9948dc5e0c' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/problockcontactinfos/views/templates/hook/problockcontactinfos.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13100822556241290cecaf2-26667477',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'page_name' => 0,
    'problockcontactinfos_company' => 0,
    'problockcontactinfos_address' => 0,
    'problockcontactinfos_phone' => 0,
    'problockcontactinfos_phone_2' => 0,
    'problockcontactinfos_email' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241290d440b0_53966052',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241290d440b0_53966052')) {function content_56241290d440b0_53966052($_smarty_tpl) {?><?php if (!is_callable('smarty_function_mailto')) include '/var/www/www.matisses.co/www/tools/smarty/plugins/function.mailto.php';
?>

<!-- MODULE PROBlock contact infos -->
<div id="block_contact_infos" class="row">
	<?php if ($_smarty_tpl->tpl_vars['page_name']->value=='index') {?>
		<h2 class="title_main_section underline_border title_contacts_over white_clr"><span><?php echo smartyTranslate(array('s'=>'Contact us','mod'=>'problockcontactinfos'),$_smarty_tpl);?>
</span></h2>
		<?php if ($_smarty_tpl->tpl_vars['problockcontactinfos_company']->value!='') {?>
			<h3 class="title_contacts_over undertitle_main white_clr">
				<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['problockcontactinfos_company']->value, ENT_QUOTES, 'UTF-8', true);?>

			</h3>
		<?php }?>
		<p><?php echo smartyTranslate(array('s'=>'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed','mod'=>'problockcontactinfos'),$_smarty_tpl);?>
</p>
	<?php }?>
	<div class="content_contacts">
		<div class="container">
			<ul class="row">
				<?php if ($_smarty_tpl->tpl_vars['problockcontactinfos_address']->value!='') {?>
					<li class="address_item col-sm-4 col-xs-12">
						<span class="title_contact_item"><?php echo smartyTranslate(array('s'=>'Address:','mod'=>'problockcontactinfos'),$_smarty_tpl);?>
</span>
						<span class="content_item">
							<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['problockcontactinfos_address']->value, ENT_QUOTES, 'UTF-8', true);?>

						</span>
						<span class="big-cross"></span>
					</li>
				<?php }?>
				<?php if ($_smarty_tpl->tpl_vars['problockcontactinfos_phone']->value!=''||$_smarty_tpl->tpl_vars['problockcontactinfos_phone_2']->value!='') {?>
					<li class="phones_item col-sm-4 col-xs-12">
						<span class="title_contact_item"><?php echo smartyTranslate(array('s'=>'Phone:','mod'=>'problockcontactinfos'),$_smarty_tpl);?>
</span>
						<?php if ($_smarty_tpl->tpl_vars['problockcontactinfos_phone']->value!='') {?>
							<span class="content_item">
								<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['problockcontactinfos_phone']->value, ENT_QUOTES, 'UTF-8', true);?>

							</span>
						<?php }?>
						<?php if ($_smarty_tpl->tpl_vars['problockcontactinfos_phone_2']->value!='') {?>
							<span class="content_item">
								<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['problockcontactinfos_phone_2']->value, ENT_QUOTES, 'UTF-8', true);?>

							</span>
						<?php }?>
						<span class="big-cross"></span>
					</li>
				<?php }?>
				<?php if ($_smarty_tpl->tpl_vars['problockcontactinfos_email']->value!='') {?>
					<li class="email_item col-sm-4 col-xs-12">
						<span class="title_contact_item"><?php echo smartyTranslate(array('s'=>'E-mail:','mod'=>'problockcontactinfos'),$_smarty_tpl);?>
</span>
						 <span class="content_item">
						 	<?php echo smarty_function_mailto(array('address'=>htmlspecialchars($_smarty_tpl->tpl_vars['problockcontactinfos_email']->value, ENT_QUOTES, 'UTF-8', true),'encode'=>"hex"),$_smarty_tpl);?>

						 </span>
					</li>
				<?php }?>
			</ul>
		</div>
	</div>
</div>
<!-- /MODULE PROBlock contact infos -->
<?php }} ?>
