{capture name=path}
<span class="bread">{l s='Lista de regalos' mod='giftlist'}</span>
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}
<h1>{l s='Lista de regalos' mod='giftlist'}</h1>
<div class="ax-img-cont">
    <img src="{$modules_dir}/giftlist/views/img/banner.jpg" width=1110" heigth="253"/>
    <p class="ax-text-description-lista">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="ax-text-result-list">
        <h3>{l s='Qué es lista de regalos matisses' mod='giftlist'}</h3>
        </div>
        <p class="ax-cont-tab">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>
    <div class="col-md-6">
        <div class="ax-text-result-list">
        <h3>{l s='Crear lista de regalos' mod='giftlist'}</h3>
        </div>
        <div class="ax-cont-tab">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <a href="{$create_link}" class="btn btn-default btn-lista-regalos">{l s='Empezar' mod='giftlist'}</a>
        </div>
    </div>
</div
><div class="row">
    <div class="col-md-6 ax-search-home">
       <div class="ax-text-result-list">
        <h3>{l s='Buscar' mod='giftlist'}</h3>
        </div>
        <div class="ax-cont-tab">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            <div class="row ax-form-lista-deseos">
            <form id="ax-buscar" action="{$search_link}" method="post">
                <div class="row ax-form-data-search">
                    <span><label for="name">Nombre</label><input type="text" class="form-control" name="name" id="name"/></span>
                    <span><label for="lastname">Apellido</label><input type="text" class="form-control" name="lastname" id="lastname"/></span>
                    <span><label for="code">Código</label><input type="text" class="form-control code" name="code" id="code"/></span>
                    <button class="btn btn-default button btn-lista-regalos">{l s='Buscar' mod='giftlist'}</button>
                </div>
            </form>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="ax-text-result-list">
        <h3>{l s='Administrar' mod='giftlist'}</h3>
        </div>
        <div class="ax-cont-tab">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            <a href="{$gift_link}" class="btn btn-default btn-lista-regalos">{l s='Ingresar' mod='giftlist'}</a>
        </div>
    </div>
</div>