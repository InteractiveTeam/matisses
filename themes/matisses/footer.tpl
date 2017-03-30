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
*  @author PrestaShop SA <contact@prestashop.com> *  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if !isset($content_only) || !$content_only}

</div><!--Fin center-column-->
</div>
</div><!--Bloque2 Parrilla Productos-->



{if isset($right_column_size) && !empty($right_column_size) && ($page_name != 'module-news-new')}

<div id="right_column" class="col-sm-{$right_column_size|intval} column">{$HOOK_RIGHT_COLUMN}</div>
{/if}
</div>
</div>
</div>
</div>

{if $page_name=='category'}

<!--Bloque1 Visualizados-->
    
<div id="displayed-category" class="displayed-category">
    <div class="container">
        <!-- Chaordic Top -->
        <div chaordic="top"></div>
    </div>
</div>
<!--Fin Bloque1 Visualizados-->

<div id="purchased-block" class="purchased-block">
    {if $category->level_depth < 5}
	<div class="container">
        <div chaordic="top"></div>
	</div>
	{/if}
</div>

<div id="popular" class="popular">
    <div class="container">
        <div chaordic="middle"></div>
    </div>
</div>

<div id="offers" class="offers-products">
	<div class="container">
        <div chaordic="bottom"></div>
	</div>
</div>
{/if}

{if isset($HOOK_FOOTER)}
<footer id="footer" class="footer grid_12 omega alpha cf">
  <div class="footer-up">
    <div class="container">
      <div class="left-fotter cont-footer grid_5 alpha"> {hook h='displayMatNewsletter'} </div>
      <div class="right-fotter cont-footer grid_7 omega">
        <div id="menu-footer" class="menu-footer cf">
          <ul class="column-1 column grid_4">
            <li><a href="{$link->getCMSLink(6)}">{l s='Matisses'}</a></li>
            <li><a href="{$link->getPageLink('stores')}">{l s='Tiendas'}</a></li>
            <li><a href="{$link->getCMSLink(7)}">{l s='Trabaja con nosotros'}</a></li>
          </ul>
          <ul class="column-2 column grid_4">
            <li><a href="{$link->getPageLink('sitemap')}">{l s='Mapa del sitio'}</a></li>
            <li><a  href="{$link->getPageLink('contact')}">{l s='Contáctanos'}</a></li>
            <li><a href="{$link->getCMSLink(8)}">{l s='Financiación'}</a></li>
          </ul>
          <ul class="column-3 column grid_4 omega">
            <li><a href="{$link->getCMSLink(9)}">{l s='Métodos de envio'}</a></li>
            <li><a href="{$link->getCMSLink(14)}">{l s='Garantías'}</a></li>
            <li><a href="{$link->getCMSLink(10)}">{l s='Preguntas Frecuentes'}</a></li>
          </ul>
        </div>
        <div class="footer-share">
          <div id="fb-root"></div>
			<script>(function(d, s, id) {
              var js, fjs = d.getElementsByTagName(s)[0];
              if (d.getElementById(id)) return;
              js = d.createElement(s); js.id = id;
              js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5&appId=91447363386";
              fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
          <div class="share cf">
            <p>{l s='Síguenos en nuestras redes sociales'}</p>
            <div class="fb-like" data-href="https://www.matisses.co/" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="footer-down cf">
    <div class="container">
      <div class="logo-copyright"> <img src="/themes/matisses/img/logo-footer.png" alt="matisses"> </div>
      <div class="menu-copyright">
        <ul>
          <li><a href="{$link->getCMSLink(11)}">{l s='Términos y condiciones'}</a></li>
          <li><a href="{$link->getCMSLink(12)}">{l s='Política de manejo de datos'}</a></li>
          <li><a href="{$link->getCMSLink(13)}">{l s='Política de privacidad'}</a></li>
          <li id="copyright"> <a class="copyright" href="{$link->getPageLink('index',true)}" title="{l s='Matisses'}">© {l s='Todos los derechos reservados'} {l s='Matisses'} {$smarty.now|date_format:"%Y"}</a></li>
        </ul>
      </div>
    </div>
  </div>
</footer>
{if false}
<footer id="footer" class="footer cf">
  <div class="footer_line_one">
    <div class="container"> {hook h="FooterTop"} </div>
  </div>
  <div class="footer_line_two">
    <div class="container"> {$HOOK_FOOTER} </div>
  </div>
  <div class="copyright">
    <div class="container"> <a class="" href="https://www.prestapro.ru" title="{l s='Prestapro'}">© {$smarty.now|date_format:"%Y"} {l s='Created By'} <span>{l s='Prestapro.'}</span> {l s='All right reserved'}</a> </div>
    <div id="back-top"> <a href="javascript:void(0)"> <i class="font-up-open-big"></i> </a> </div>
  </div>
</footer>
{/if}
			{/if}
  <script src="//www.livehelpnow.net/lhn/widgets/chatbutton/lhnchatbutton-current.min.js" type="text/javascript" id="lhnscript"></script>
</div>
<!-- #page -->
{/if}
{include file="$tpl_dir./global.tpl"}
</body></html>
