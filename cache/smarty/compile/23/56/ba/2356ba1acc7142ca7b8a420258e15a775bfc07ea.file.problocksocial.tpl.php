<?php /* Smarty version Smarty-3.1.19, created on 2015-10-18 16:43:45
         compiled from "/var/www/www.matisses.co/www/themes/matisses/modules/problocksocial/views/templates/hook/problocksocial.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1824594040562412913fb9f8-15108513%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2356ba1acc7142ca7b8a420258e15a775bfc07ea' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/modules/problocksocial/views/templates/hook/problocksocial.tpl',
      1 => 1445107937,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1824594040562412913fb9f8-15108513',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'twitter_url' => 0,
    'facebook_url' => 0,
    'vimeo_url' => 0,
    'google_plus_url' => 0,
    'youtube_url' => 0,
    'pinterest_url' => 0,
    'rss_url' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5624129144a394_26186061',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5624129144a394_26186061')) {function content_5624129144a394_26186061($_smarty_tpl) {?>
<!-- problocksocial -->
<section id="prosocial_block" class="col-lg-3 col-md-4 col-sm-5 col-xs-12">
	<h4 class="hidden-xs hidden-sm text_upper"><?php echo smartyTranslate(array('s'=>'Socialize','mod'=>'problocksocial'),$_smarty_tpl);?>
</h4>
	<ul>
		<?php if ($_smarty_tpl->tpl_vars['twitter_url']->value!='') {?>
			<li class="twitter">
				<a target="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['twitter_url']->value, ENT_QUOTES, 'UTF-8', true);?>
">
					<i class="fa fa-twitter"></i>
				</a>
			</li>
		<?php }?>
		<?php if ($_smarty_tpl->tpl_vars['facebook_url']->value!='') {?>
			<li class="facebook">
				<a target="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['facebook_url']->value, ENT_QUOTES, 'UTF-8', true);?>
">
					<i class="fa fa-facebook"></i>
				</a>
			</li>
		<?php }?>
		<?php if ($_smarty_tpl->tpl_vars['vimeo_url']->value!='') {?>
	        <li class="vimeo">
	        	<a target="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['vimeo_url']->value, ENT_QUOTES, 'UTF-8', true);?>
">
	        		<i class="font-vimeo"></i>
	        	</a>
	        </li>
        <?php }?>
        <?php if ($_smarty_tpl->tpl_vars['google_plus_url']->value!='') {?>
        	<li class="google-plus">
        		<a  target="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['google_plus_url']->value, ENT_QUOTES, 'UTF-8', true);?>
">
        			<i class="fa fa-google-plus"></i>
        		</a>
        	</li>
        <?php }?>
		<?php if ($_smarty_tpl->tpl_vars['youtube_url']->value!='') {?>
        	<li class="youtube">
        		<a target="_blank"  href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['youtube_url']->value, ENT_QUOTES, 'UTF-8', true);?>
">
        			<i class="fa fa-youtube"></i>
        		</a>
        	</li>
        <?php }?>
		<?php if ($_smarty_tpl->tpl_vars['pinterest_url']->value!='') {?>
        	<li class="pinterest">
        		<a target="_blank"  href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['pinterest_url']->value, ENT_QUOTES, 'UTF-8', true);?>
">
        			<i class="fa fa-pinterest"></i>
        		</a>
        	</li>
        <?php }?>
		<?php if ($_smarty_tpl->tpl_vars['rss_url']->value!='') {?>
			<li class="rss">
				<a target="_blank" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['rss_url']->value, ENT_QUOTES, 'UTF-8', true);?>
">
					<i class="fa fa-rss"></i>
				</a>
			</li>
		<?php }?>

	</ul>
</section>
<!-- problocksocial --><?php }} ?>
