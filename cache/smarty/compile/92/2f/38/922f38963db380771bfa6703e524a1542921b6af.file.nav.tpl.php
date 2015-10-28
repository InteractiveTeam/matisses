<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 17:40:22
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/blockuserinfo/nav.tpl" */ ?>
<?php /*%%SmartyHeaderCode:18002733756241bf3738b60-22341298%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '922f38963db380771bfa6703e524a1542921b6af' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/blockuserinfo/nav.tpl',
      1 => 1445207925,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18002733756241bf3738b60-22341298',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241bf37968c9_99101849',
  'variables' => 
  array (
    'is_logged' => 0,
    'link' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241bf37968c9_99101849')) {function content_56241bf37968c9_99101849($_smarty_tpl) {?><!-- Block user information module nav  -->
<div class="header_user_info">
	<div id="drop_content_user">

		<?php if ($_smarty_tpl->tpl_vars['is_logged']->value) {?>
            <a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink('my-account',true), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'View my customer account','mod'=>'blockuserinfo'),$_smarty_tpl);?>
" class="account" rel="nofollow">
                <span><?php echo smartyTranslate(array('s'=>'My account','mod'=>'blockuserinfo'),$_smarty_tpl);?>
</span>
            </a>
		<?php } else { ?>
			<a class="login" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink('my-account',true), ENT_QUOTES, 'UTF-8', true);?>
" rel="nofollow" title="<?php echo smartyTranslate(array('s'=>'Log in to your customer account','mod'=>'blockuserinfo'),$_smarty_tpl);?>
">
				<span><?php echo smartyTranslate(array('s'=>'Login','mod'=>'blockuserinfo'),$_smarty_tpl);?>
</span>
			</a>
		<?php }?>
        <div class="user-profile">
        
        </div>
	</div>
</div>
<!-- /Block user information module nav -->
<?php }} ?>
