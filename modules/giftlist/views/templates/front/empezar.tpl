{capture name=path}
<span class="bread">{l s='Lista de regalos' mod='giftlist'}</span>
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}
<h1>{l s='Lista de regalos' mod='giftlist'}</h1>
<div class=ax-img-cont">
    <img src="http://lorempixel.com/1110/253" width=1110" heigth="253"/>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</div>
<div class="row">
    <div class="col-md-6">
        <h3>{l s='Qué es lista de regalos matisses' mod='giftlist'}</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>
    <div class="col-md-6">
        <h3>{l s='Crear lista de regalos' mod='giftlist'}</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <a href="{$create_link}" class="btn btn-default btn-red">{l s='Empezar' mod='giftlist'}</a>
    </div>
</div
><div class="row">
    <div class="col-md-6">
        <h3>{l s='Buscar' mod='giftlist'}</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        <form id="ax-buscar" action="{$search_link}" method="post">
			<div class="row ax-form-lista-deseos">
                <label for="name">{l s='Nombre' mod='giftlist'}</label>
				<input type="text" class="form-control" name="name" id="name" required/>
                <label for="lastname">{l s='Apellido' mod='giftlist'}</label>
				<input type="text" class="form-control" name="lastname" id="lastname" required/>
                <label for="code">{l s='Código' mod='giftlist'}</label>
                <input type="text" class="form-control code" name="code" id="code" required/>
				<button class="btn btn-default button btn-red">{l s='Buscar' mod='giftlist'}</button>
			</div>
			</form>
    </div>
    <div class="col-md-6">
        <h3>{l s='Administrar' mod='giftlist'}</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <a href="{$gift_link}" class="btn btn-default btn-red">{l s='Ingresar' mod='giftlist'}</a>
    </div>
</div>