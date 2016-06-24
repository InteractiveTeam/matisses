{capture name=path}
<a href="{$all_link}">{l s='giftlist' mod='giftlist'}</a> <span class="bread">{l s='search' mod='search'}</span>
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}
{if !$lists}
<div class="col-md-12">
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
		<button class="btn btn-default button" data-toggle="tooltip" data-placement="bottom" title="Buscar" id="search" >Buscar</button>
	</div>
	</form>
    {if $parameters}
    <p>{l s='Resultados para'} {$parameter}</p>
	{/if}
	<div id="lists">
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
	<div class="list">
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
	
</div>
{else}
	<h3>Buscar lista</h3>
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

<div id="lists">
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
	<div class="list">	
	{foreach from=$lists item=row}
    <div class="row list-item list-item-container" data-id="{$row['id']}" id="list-{$row['id']}">
		a
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
{/if}