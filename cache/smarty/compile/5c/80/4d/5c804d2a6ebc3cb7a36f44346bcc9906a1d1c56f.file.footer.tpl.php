<?php /* Smarty version Smarty-3.1.19, created on 2015-10-19 20:01:33
         compiled from "/var/www/www.matisses.co/www/themes/matisses/footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:76205180756241291350772-83164209%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5c804d2a6ebc3cb7a36f44346bcc9906a1d1c56f' => 
    array (
      0 => '/var/www/www.matisses.co/www/themes/matisses/footer.tpl',
      1 => 1445302866,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '76205180756241291350772-83164209',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5624129138b469_06700761',
  'variables' => 
  array (
    'content_only' => 0,
    'right_column_size' => 0,
    'HOOK_RIGHT_COLUMN' => 0,
    'HOOK_FOOTER' => 0,
    'link' => 0,
    'base_url' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5624129138b469_06700761')) {function content_5624129138b469_06700761($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include '/var/www/www.matisses.co/www/tools/smarty/plugins/modifier.date_format.php';
?>
<?php if (!isset($_smarty_tpl->tpl_vars['content_only']->value)||!$_smarty_tpl->tpl_vars['content_only']->value) {?>
					</div><!-- #center_column -->
					<?php if (isset($_smarty_tpl->tpl_vars['right_column_size']->value)&&!empty($_smarty_tpl->tpl_vars['right_column_size']->value)) {?>
						<div id="right_column" class="col-xs-12 col-sm-<?php echo intval($_smarty_tpl->tpl_vars['right_column_size']->value);?>
 column"><?php echo $_smarty_tpl->tpl_vars['HOOK_RIGHT_COLUMN']->value;?>
</div>
					<?php }?>
					</div><!-- .row -->
				</div><!-- #columns -->
			</div><!-- .columns-container -->
			<?php if (isset($_smarty_tpl->tpl_vars['HOOK_FOOTER']->value)) {?>
				<!-- Footer -->
                <footer id="footer" class="clearfix">
						<div class="footer_line_two col-xs-12">
							<div class="container">
								<div class="col-md-5">
                                	<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>'displayMatNewsletter'),$_smarty_tpl);?>

                                </div>
                                <div class="col-md-7">
                                	<div class="row">
                                        <div id="menu-footer1" class="menu-footer col-md-4">
                                            <ul>
                                                <li><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getCMSLink(6);?>
"><?php echo smartyTranslate(array('s'=>'Matisses'),$_smarty_tpl);?>
</a></li>
                                                <li><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getPageLink('stores');?>
"><?php echo smartyTranslate(array('s'=>'Tiendas'),$_smarty_tpl);?>
</a></li>
                                                <li><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getCMSLink(7);?>
"><?php echo smartyTranslate(array('s'=>'Trabaja con nosotros'),$_smarty_tpl);?>
</a></li>
                                            </ul>
                                        </div> 
                                        <div id="menu-footer2" class="menu-footer col-md-4">
                                            <ul>
                                                <li><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getPageLink('sitemap');?>
"><?php echo smartyTranslate(array('s'=>'Mapa del sitio'),$_smarty_tpl);?>
</a></li>
                                                <li><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getPageLink('contact');?>
"><?php echo smartyTranslate(array('s'=>'Contactanos'),$_smarty_tpl);?>
</a></li>
                                                <li><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getCMSLink(8);?>
"><?php echo smartyTranslate(array('s'=>'Financiacion'),$_smarty_tpl);?>
</a></li>
                                            </ul>
                                        </div> 
                                        <div id="menu-footer3" class="menu-footer col-md-4">
                                            <ul>
                                                <li><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getCMSLink(9);?>
"><?php echo smartyTranslate(array('s'=>'Metodos de envio'),$_smarty_tpl);?>
</a></li>
                                                <li><a href=""><?php echo smartyTranslate(array('s'=>'Garantias'),$_smarty_tpl);?>
</a></li>
                                                <li><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getCMSLink(10);?>
"><?php echo smartyTranslate(array('s'=>'Preguntas Frecuentes'),$_smarty_tpl);?>
</a></li>
                                            </ul>
                                        </div> 
                                    </div> 
                                    <div class="row">
                                    	<div class="footer-share col-md-12">
                                        
                                        	<div id="fb-root"></div>
												<script>(function(d, s, id) 
												{
                                                  var js, fjs = d.getElementsByTagName(s)[0];
                                                  if (d.getElementById(id)) return;
                                                  js = d.createElement(s); js.id = id;
                                                  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5&appId=91447363386";
                                                  fjs.parentNode.insertBefore(js, fjs);
                                                }(document, 'script', 'facebook-jssdk'));</script>
                                        
                                        
                                        
                                        	<?php echo smartyTranslate(array('s'=>'Siguenos en facebook'),$_smarty_tpl);?>
 <div class="fb-like" data-href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>

                                        </div>
                                    </div>                             
                                </div>
							</div>
						</div>
                        <div class="copyright col-xs-12">
							<div class="container">
                            	<div class="row">
                                	<div class="logo-copyright col-md-2">
                                    	<img src="" class="img-responsive" />
                                    </div>
                                    <div class="menu-copyright col-md-10">
                                    	<ul>
                                        	<li><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getCMSLink(11);?>
"><?php echo smartyTranslate(array('s'=>'Términos y condiciones'),$_smarty_tpl);?>
</a></li>
                                            <li><a href="$link->getCMSLink(12)"><?php echo smartyTranslate(array('s'=>'Política de manejo de datos'),$_smarty_tpl);?>
</a></li>
                                            <li><a href="$link->getCMSLink(13)"><?php echo smartyTranslate(array('s'=>'Política de privacidad'),$_smarty_tpl);?>
</a></li>
                                            <li id="copyright"> <a class="copyright" href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
" title="<?php echo smartyTranslate(array('s'=>'Matisses'),$_smarty_tpl);?>
">© <?php echo smartyTranslate(array('s'=>'All right reserved'),$_smarty_tpl);?>
 <?php echo smartyTranslate(array('s'=>'Matisses'),$_smarty_tpl);?>
 <?php echo smarty_modifier_date_format(time(),"%Y");?>
</a></li>
                                        </ul>
                                    </div>
                                </div>
							</div>
						</div>
                </footer>
                
                
                <?php if (false) {?>
					<footer id="footer" class="clearfix">
                    	
						<div class="footer_line_one col-xs-12">
							<div class="container">
								<div class="row">
									<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"FooterTop"),$_smarty_tpl);?>

								</div>
							</div>
						</div>
						<div class="footer_line_two col-xs-12">
							<div class="container">
								<div class="row">
									<?php echo $_smarty_tpl->tpl_vars['HOOK_FOOTER']->value;?>

								</div>
							</div>
						</div>
						<div class="copyright col-xs-12">
							<div class="container">
								<a class="" href="http://www.prestapro.ru" title="<?php echo smartyTranslate(array('s'=>'Prestapro'),$_smarty_tpl);?>
">© <?php echo smarty_modifier_date_format(time(),"%Y");?>
 <?php echo smartyTranslate(array('s'=>'Created By'),$_smarty_tpl);?>
 <span><?php echo smartyTranslate(array('s'=>'Prestapro.'),$_smarty_tpl);?>
</span> <?php echo smartyTranslate(array('s'=>'All right reserved'),$_smarty_tpl);?>
</a>
							</div>
							<div id="back-top">
								<a href="#">
									<i class="font-up-open-big"></i>
								</a>
							</div>
						</div>
                        
					</footer><?php }?>
					<!-- #footer -->
			<?php }?>
		</div><!-- #page -->
<?php }?>
<?php echo $_smarty_tpl->getSubTemplate (((string)$_smarty_tpl->tpl_vars['tpl_dir']->value)."./global.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

	</body>
</html><?php }} ?>
