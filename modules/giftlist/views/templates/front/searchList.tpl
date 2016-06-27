{capture name=path}
<a href="{$all_link}">{l s='giftlist' mod='giftlist'}</a> <span class="bread">{l s='search' mod='search'}</span>
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}

<h3>{l s='Resultado de la lista'}</h3>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
<form action="" method="post" name="searchList">
<div class="row">
    <div class="col-md-3">
        <input type="text" class="form-control" name="name" id="name" placeholder="Nombre"/>
    </div>
    <div class="col-md-3">
        <input type="text" class="form-control" name="lastname" id="lastname" placeholder="Apellido"/>
    </div>
    <div class="col-md-1">
        ó
    </div>
    <div class="col-md-3">
        <input type="text" class="form-control" name="code" id="code" placeholder="Código"/>
    </div>
    <button class="btn btn-default button" id="search" >Buscar</button>
</div>
</form>

<div class="jplist-panel panel-over">
		<div class="text-filter-box">
			<i class="icon-pencil jplist-icon"></i>
					   
			<!--[if lt IE 10]>
			<div class="jplist-label">Filter by Title:</div>
			<![endif]-->
			<input 
			data-path=".title-list" 
			type="text" 
			value="" 
			placeholder="Filtrar por nombre" 
			data-event-name="keyup"
			data-control-type="textbox" 
			data-control-name="title-filter" 
			data-control-action="filter"
			/>
		</div>	
	</div>


<div id="lists">
	<div class="list">
    {foreach from=$lists item=row}
        <div class="row list-item list-item-container" data-id="{$row['id']}" id="list-{$row['id']}">
            <table>
                <thead>
                    <tr>
                        <th>{l s='Creador' mod='giftlist'}</th>
                        <th>{l s='Cocreador' mod='giftlist'}</th>
                        <th>{l s='Código' mod='giftlist'}</th>
                        <th>{l s='Nombre del evento' mod='giftlist'}</th>
                        <th>{l s='Topo de evento' mod='giftlist'}</th>
                        <th>{l s='fecha' mod='giftlist'}</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{$row['creator']}</td>
                        <td>{$row['cocreator']}</td>
                        <td>{$row['code']}</td>
                        <td>{$row['name']}</td>
                        <td>{$row['event_type']}</td>
                        <td>{date("d/m/Y", strtotime($row['event_date']))}</td>
                        <td>
                            <a href="{$row['link']}">{l s='Ver lista' mod='giftlist'}</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
	{/foreach}
    </div>
        <!-- no results found -->
    <div class="jplist-no-results">
      <p>{l s='No results found' mod='No results found'}</p>
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
        data-type="Página {current} de {pages}" 
        data-control-type="pagination-info" 
        data-control-name="paging" 
        data-control-action="paging">
        </div>
        {/literal}
    </div>
</div>