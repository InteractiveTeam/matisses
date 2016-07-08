{capture name=path}<a href="{$link->getmoduleLink('giftlist','empezar')}">{l s='giftlist' mod='giftlist'}</a><i class="fa fa-angle-right"></i><span class="bread">{l s='Resultado de la busqueda' mod='giftlist'}</span>
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}

<h1>{l s='Resultado de busqueda'}</h1>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
<form action="" method="post" name="searchList">
<div class="row ax-form-data-search">
    <span><label for="name">Nombre</label><input type="text" class="form-control" name="name" id="name"/></span>
    <span><label for="lastname">Apellido</label><input type="text" class="form-control" name="lastname" id="lastname"/></span>
    <span class="ax-optional-tex">o</span>
    <span><label for="code">Código</label><input type="text" class="form-control" name="code" id="code"/></span>
    <button class="btn btn-default button btn-lista-regalos" id="search" >Buscar</button>
</div>
</form>

<div class="ax-text-result-list ax-details-list">
    <p>{l s='Resultados para' mod='giftlist'} 
    {if empty(Tools::getValue('code'))}
        <span>{Tools::getValue('name')} {Tools::getValue('lastname')}</span>
    {else}
        <span>{Tools::getValue('code')}</span>
    {/if}
    </p>
</div>

<div id="lists" class="ax-cont-list">
    <div class="row list-item list-item-container" data-id="{$row['id']}" id="list-{$row['id']}">
        {foreach from=$lists item=row}
                <div class="ax-item">
                    <div class="part">{l s='Creador' mod='giftlist'}<span>{$row['creator']}</span></div>
                    <div class="part">{l s='Cocreador' mod='giftlist'}<span>{$row['cocreator']}</span></div>
                    <div class="part">{l s='Código' mod='giftlist'}<span>{$row['code']}</span></div>
                    <div class="part">{l s='Nombre del evento' mod='giftlist'}<span>{$row['name']}</span></div>
                    <div class="part">{l s='Tipo de evento' mod='giftlist'}<span>{$row['event_type']}</span></div>
                    <div class="part">{l s='Fecha' mod='giftlist'}<span>{date("d/m/Y", strtotime($row['event_date']))}</span></div>
                    <div class="part ax-read-more"><a href="{$row['link']}">{l s='Ver lista' mod='giftlist'}</a></div>
                </div>
        {/foreach}
    </div>
    
    <!-- no results found -->
<div class="jplist-no-results">
  <p>{l s='No se encontraron resultados' mod='giftlist'}</p>
</div>
<div class="jplist-panel">
    <div 
    class="jplist-pagination" 
    data-control-type="pagination" 
    data-control-name="paging" 
    data-control-action="paging"
    data-items-per-page="{$items_per_page}">
    </div>
    {literal}
    <div 
    class="jplist-label" 
    data-type="{current} de {pages}" 
    data-control-type="pagination-info" 
    data-control-name="paging" 
    data-control-action="paging">
    </div>
    {/literal}
</div>
</div>