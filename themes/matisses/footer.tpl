{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if !isset($content_only) || !$content_only}
					</div><!-- #center_column -->
					{if isset($right_column_size) && !empty($right_column_size)}
						<div id="right_column" class="col-xs-12 col-sm-{$right_column_size|intval} column">{$HOOK_RIGHT_COLUMN}</div>
					{/if}
					</div><!-- .row -->
				</div><!-- #columns -->
			</div><!-- .columns-container -->
			{if isset($HOOK_FOOTER)}
				<!-- Footer -->
                <footer id="footer" class="clearfix">
						<div class="footer_line_two col-xs-12">
							<div class="container">
								<div class="col-md-5">
                                	{hook h='displayMatNewsletter'}
                                </div>
                                <div class="col-md-7">
                                	<div class="row">
                                        <div id="menu-footer1" class="menu-footer col-md-4">
                                            <ul>
                                                <li><a href="{$link->getCMSLink(6)}">{l s='Matisses'}</a></li>
                                                <li><a href="{$link->getPageLink('stores')}">{l s='Tiendas'}</a></li>
                                                <li><a href="{$link->getCMSLink(7)}">{l s='Trabaja con nosotros'}</a></li>
                                            </ul>
                                        </div> 
                                        <div id="menu-footer2" class="menu-footer col-md-4">
                                            <ul>
                                                <li><a href="{$link->getPageLink('sitemap')}">{l s='Mapa del sitio'}</a></li>
                                                <li><a href="{$link->getPageLink('contact')}">{l s='Contactanos'}</a></li>
                                                <li><a href="{$link->getCMSLink(8)}">{l s='Financiacion'}</a></li>
                                            </ul>
                                        </div> 
                                        <div id="menu-footer3" class="menu-footer col-md-4">
                                            <ul>
                                                <li><a href="{$link->getCMSLink(9)}">{l s='Metodos de envio'}</a></li>
                                                <li><a href="">{l s='Garantias'}</a></li>
                                                <li><a href="{$link->getCMSLink(10)}">{l s='Preguntas Frecuentes'}</a></li>
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
                                        
                                        
                                        
                                        	{l s='Siguenos en facebook'} <div class="fb-like" data-href="{$base_url}" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>

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
                                        	<li><a href="{$link->getCMSLink(11)}">{l s='Términos y condiciones'}</a></li>
                                            <li><a href="$link->getCMSLink(12)">{l s='Política de manejo de datos'}</a></li>
                                            <li><a href="$link->getCMSLink(13)">{l s='Política de privacidad'}</a></li>
                                            <li id="copyright"> <a class="copyright" href="{$base_url}" title="{l s='Matisses'}">© {l s='All right reserved'} {l s='Matisses'} {$smarty.now|date_format:"%Y"}</a></li>
                                        </ul>
                                    </div>
                                </div>
							</div>
						</div>
                </footer>
                
                
                {if false}
					<footer id="footer" class="clearfix">
                    	
						<div class="footer_line_one col-xs-12">
							<div class="container">
								<div class="row">
									{hook h="FooterTop"}
								</div>
							</div>
						</div>
						<div class="footer_line_two col-xs-12">
							<div class="container">
								<div class="row">
									{$HOOK_FOOTER}
								</div>
							</div>
						</div>
						<div class="copyright col-xs-12">
							<div class="container">
								<a class="" href="http://www.prestapro.ru" title="{l s='Prestapro'}">© {$smarty.now|date_format:"%Y"} {l s='Created By'} <span>{l s='Prestapro.'}</span> {l s='All right reserved'}</a>
							</div>
							<div id="back-top">
								<a href="#">
									<i class="font-up-open-big"></i>
								</a>
							</div>
						</div>
                        
					</footer>{/if}
					<!-- #footer -->
			{/if}
		</div><!-- #page -->
{/if}
{include file="$tpl_dir./global.tpl"}
	</body>
</html>