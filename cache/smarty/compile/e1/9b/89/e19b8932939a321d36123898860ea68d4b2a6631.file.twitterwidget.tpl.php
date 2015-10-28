<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:44
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/twitterwidget/views/templates/hook/twitterwidget.tpl" */ ?>
<?php /*%%SmartyHeaderCode:17420033756241290ca1e15-75828523%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e19b8932939a321d36123898860ea68d4b2a6631' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/twitterwidget/views/templates/hook/twitterwidget.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17420033756241290ca1e15-75828523',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'TWITTLOGIN' => 0,
    'TWITTER_RESPONSE' => 0,
    'NUMBOFTWITTS' => 0,
    't' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56241290ce3bd7_27258449',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56241290ce3bd7_27258449')) {function content_56241290ce3bd7_27258449($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_escape')) include '/var/www/www.matisses.co/www/tools/smarty/plugins/modifier.escape.php';
?> 

<div class=" twitter-box row">
	<div class="container">
		<h2 class="title_main_section">
			<span>
			<?php echo smartyTranslate(array('s'=>'Latest tweets','mod'=>'twitterwidget'),$_smarty_tpl);?>

		</span>
		</h2>
		<h3 class="undertitle_main">
			<?php echo smartyTranslate(array('s'=>'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','mod'=>'twitterwidget'),$_smarty_tpl);?>

		</h3>
		<div class="twits_cont">
		        <a class="twitter_bird" href="http://www.twitter.com/<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['TWITTLOGIN']->value, 'intval');?>
" target="_blank"><i class="fa fa-twitter"></i></a>
		         <div class="twitter_carousel">
					<?php  $_smarty_tpl->tpl_vars['t'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['t']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['TWITTER_RESPONSE']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['tweets']['iteration']=0;
foreach ($_from as $_smarty_tpl->tpl_vars['t']->key => $_smarty_tpl->tpl_vars['t']->value) {
$_smarty_tpl->tpl_vars['t']->_loop = true;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['tweets']['iteration']++;
?>
						<?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['tweets']['iteration']<=$_smarty_tpl->tpl_vars['NUMBOFTWITTS']->value) {?>
							<?php if (isset($_smarty_tpl->tpl_vars['t']->value['text'])) {?>
								<div class="item_twits"><p><?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['t']->value['text'], 'intval');?>
</p> 
									<span><?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['t']->value['created_at'], 'intval');?>
</span>
								</div>
							<?php } else { ?>
									<div class="item_twits">
										<p><?php echo smartyTranslate(array('s'=>'YOUR TWITTER LINE IS EMPTY!','mod'=>'twitterwidget'),$_smarty_tpl);?>
</p>
										<span><?php echo smartyTranslate(array('s'=>'Check your login in configuration','mod'=>'twitterwidget'),$_smarty_tpl);?>
!</span>
									</div>
							<?php }?>
						<?php }?>
					<?php } ?>
				</div>
				<a class="twitter_btn btn_border btn" href="http://www.twitter.com/<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['TWITTLOGIN']->value, 'intval');?>
" target="_blank"><i class="fa fa-twitter"></i>
					<?php echo smartyTranslate(array('s'=>'Follow us','mod'=>'twitterwidget'),$_smarty_tpl);?>

				</a>
				<div class="wrap_buttons">
			       <a id="prewTwittLink" href=""></a>
			        <a id="nextTwittLink" href=""></a>
		    	</div>
		</div>
	</div>
</div><?php }} ?>
