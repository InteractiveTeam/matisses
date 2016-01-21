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

{capture name=path}{l s='My account'}{/capture}

	<h1 class="page-heading">{l s='My account'}</h1>
	{if isset($account_created)}
	<p class="alert alert-success">
		{l s='Your account has been created.'}
	</p>
	{/if}


<div class="my-account-list">
	<ul class="cf">
		<li class="my-shopping grid_12 alpha omega">
			<div class="header-account">
				<h2>{l s='Mis compras'}</h2>
			</div>
			<div class="content-account grid_12">
				<div class="grid_2 img-account">
		            <img src="{$base_dir}img/mis-compras.png"/>
		        </div>
				<div class="grid_4 dates-account">
					<h3>{l s='Estado del pedido'}</h3>
					<p>{l s='Introduce tu número de pedido.'}</p>
					<div class="footer-account">
                    <form id="getPedido" method="get" action="{$link->getPageLink('history', true)|escape:'html':'UTF-8'}">
						<input type="text" name="pedidonro">
						<a class="btn btn-default btn-red" href="#" onclick="$('#getPedido').submit()" title="{l s='Buscar'}"> {l s='Buscar' mod='matisses'}</a>
                    </form>
					</div>
				</div>
				<div class="grid_3 dates-account">
					<h3>{l s='Historial de compras'}</h3>
					<p>{l s='Revisa que has comprado.'}</p>
					<div class="footer-account">
						<a class="btn btn-default btn-red" href="{$link->getPageLink('history', true)|escape:'html':'UTF-8'}" title="Buscar"> {l s='Ingresar' mod='matisses'}</a>
					</div>
				</div>
				<div class="grid_3 dates-account">
					<h3>{l s='Más acciones'}</h3>
					<p><a href="#">Contactar un asesor</a></p>
					<p><a href="{$link->getPageLink('store', true)|escape:'html':'UTF-8'}">{l s='Encuentra la tienda mas cercana'}</a></p>
				</div>
			</div>
		</li>

		<!-- Lista de regalos oculta temporalmente -->
		<!-- <li class="my-list-gift grid_12 alpha omega">
			<div class="header-account">

				<h2>{l s='Mi lista de regalos'}</h2>
			</div>
			<div class="content-account grid_12">
				<div class="grid_2">
		            <img src="{$base_dir}img/mi-lista-regalos.png"/>
		        </div>
				<div class="grid_4 dates-account">
					<h3>{l s='Buscar'}</h3>
					<p>{l s='Busca un alista de regalos existente'}</p>
					<div class="footer-account">
						<input type="text">
						<input type="text">
						<a class="btn btn-default btn-red" href="#" title="Buscar"> {l s='Buscar' mod='matisses'}</a>
						<a class="btn btn-default btn-red" href="#" title="Buscar"> {l s='Buscar' mod='matisses'}</a>
					</div>
				</div>
				<div class="grid_3 dates-account">
					<h3>{l s='Crear'}</h3>
					<p>{l s='Piensa en grande y cra la lista de regalos.'}</p>
					<div class="footer-account">
						<a class="btn btn-default btn-red" href="#" title="Buscar"> {l s='Buscar' mod='matisses'}</a>
					</div>
				</div>
				<div class="grid_3 dates-account">
					<h3>{l s='Administrar'}</h3>
					<p>{l s='Ver, editar o añadir una lista'}</p>
					<div class="footer-account">
						<a class="btn btn-default btn-red" href="#" title="Buscar"> {l s='Buscar' mod='matisses'}</a>
					</div>
				</div>
			</div>
		</li> -->
        {$HOOK_CUSTOMER_ACCOUNT}
	   	<li class="my-personal-information grid_12 alpha omega">
			<div class="header-account">

				  <h2>{l s='Ajustes de mi perfil'}</h2>

			</div>
			<div class="content-account grid_12">
				<div class="grid_2">
		            <img src="{$base_dir}img/ajustes-perfil.png"/>
		        </div>
				<div class="grid_5 dates-account">
					<h3>Ajustes de cuenta</h3>
					<p><a href="{$link->getPageLink('identity', true)|escape:'html':'UTF-8'}">{l s='Cambiar la configuración de cuenta'}</a></p>
					<p><a href="{$link->getPageLink('identity', true)|escape:'html':'UTF-8'}">{l s='E-mail, contraseña, nombre y teléfono móvil'}</a></p>
				</div>
				<div class="grid_5 dates-account">
					<h3>{l s='Libreta de direcciones'}</h3>
					<p><a href="{$link->getPageLink('addresses', true)|escape:'html':'UTF-8'}">{l s='Gestionar libreta de direcciones'}</a></p>
					<p><a href="{$link->getPageLink('address', true)|escape:'html':'UTF-8'}" title="{l s='Add my first address'}">{l s='Añadir nueva dirección'}</a></p>
				</div>
			</div>
		</li>

		<!-- {if $voucherAllowed}
		<li>
			<div class="header-account">
				<a href="{$link->getPageLink('discount', true)|escape:'html':'UTF-8'}" title="{l s='Vouchers'}">
					<h2>{l s='My vouchers'}</h2>
				</a>
			</div>
			<div class="content-account grid_12">
				<div class="grid_2">
		            <img src="{$module_dir}/img/account-garantias.png" class="img-responsive"/>
		        </div>
				<div class="grid_5">
					<h3>Titulo 1</h3>
					<p>Descripción 1</p>
				</div>
				<div class="grid_5">
					<h3>Titulo 2</h3>
					<p>Descripción 2</p>
				</div>
			</div>
		</li>
		{/if}-->


	   <!-- <li><a href="{$link->getPageLink('addresses', true)|escape:'html':'UTF-8'}" title="{l s='Addresses'}"><i class="fa fa-truck"></i><span>{l s='My addresses'}</span></a></li> -->

		<!-- {if $has_customer_an_address}
		<li>
			<a href="{$link->getPageLink('address', true)|escape:'html':'UTF-8'}" title="{l s='Add my first address'}"><span>{l s='Add my first address'}</span></a>
		</li>
		{/if} -->

		<!-- {if $returnAllowed}
		<li>
			<a href="{$link->getPageLink('order-follow', true)|escape:'html':'UTF-8'}" title="{l s='Merchandise returns'}">
			<span>{l s='My merchandise returns'}</span></a>
		</li>
		{/if} -->
		<!-- <li><a href="{$link->getPageLink('order-slip', true)|escape:'html':'UTF-8'}" title="{l s='Credit slips'}">
			<span>{l s='My credit slips'}</span></a>
		</li> -->
	</ul>

	{if $voucherAllowed || isset($HOOK_CUSTOMER_ACCOUNT) && $HOOK_CUSTOMER_ACCOUNT !=''}
	{/if}

</div>
