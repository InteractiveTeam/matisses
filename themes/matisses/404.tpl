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
<style>
    
</style>
<div class="pagenotfound">
    <div class="contFound">
    	<h1><span>{l s='404.'}</span></h1>
        <!--<h2>{l s='Page not found'}</h2>-->
        <p>
            {l s='Parece que la página que estás buscando ha sido removida, ha cambiado de nombre o no está disponible temporalmente.'}
        </p>
    </div>
    <div class="optionDirection">
    <p>{l s='Intenta realizar tu búsqueda con otras palabras o ve a la '}<a href="{$base_dir}">{l s='página de inicio'}</a></p>    
        <form action="{$link->getPageLink('search')|escape:'html':'UTF-8'}" method="post" class="std form_404">
            <fieldset>
                <div>
                   <button type="submit" name="Submit" value="OK" class="btn btn_shears"><i class="fa fa-search"></i></button>
                    <input id="search_query" name="search_query" type="text" placeholder="Buscar..." class="form-control grey" />
                    
                </div>
            </fieldset>
        </form>
    </div>
</div>
<!--Bloque1 Visualizados-->
	    <div id="displayed-category" class="displayed-category">
			<div class="container">
				<div class="info-chaordic">
					<img src="../../themes/matisses/img/displayed-category.jpg" alt="productos visualizados">
					<div class="mask">
						<h1>Espacio para Chaordic</h1>
					</div>
				</div>
			</div>
	    </div>
		<!--Fin Bloque1 Visualizados-->
