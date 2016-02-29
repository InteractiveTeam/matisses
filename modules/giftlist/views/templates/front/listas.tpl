{capture name=path}{l s='giftlist' mod='giftlist'}{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}
<div class="container">
	{if isset($response)}
	<div class="alert {if $error == true} alert-danger{else} alert-success{/if}  alert-dismissible" role="alert">
		<button type="button" data-toggle="tooltip" data-placement="bottom" title="Cerrar" data-dismiss="alert" id="closeMsg" class="close" 
		aria-label="Close"><span aria-hidden="true">&times;</span></button>
		{$response}
	</div>
	{/if}
	<div class="row">
		<div class="col-md-10">
			<h1>Lista de regalos</h1>
		</div>
		<div class="col-md-2">
			<a class="btn btn-success" href="{$admin_link}" data-toggle="tooltip" data-placement="bottom" title="Crear">add</a>
		</div>
	</div>
	{foreach from=$all_lists item=row}
	<div class="row list-item-container" data-id="{$row['id']}" id="list-{$row['id']}">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
					<div id="list-img-container" 
					style="background-image: 
						{if !empty($row['image'])} 
							url('{$row['image']}'); 
						{else}
							 url('{$modules_dir}giftlist/uploads/not-found.jpg')
						{/if}
						">
					</div>
				</div>
				<div class="col-md-3 vCenter">
					<h4><b>{$row['name']}</b></h4>
					<p><b>Fecha:</b> {date("d/m/Y H:i", strtotime($row['event_date']))}</p>
					<p><b>Cantidad de invitados:</b> {$row['guest_number']}</p>
				</div>
				<div class="col-md-3 vCenter">
					{if $row['public'] == 1}
						<span class="label label-success">Publico <span class="icon-unlock"></span></span>
					{else}
						<span class="label label-danger">Privado <span class="icon-lock"></span></span>
					{/if}
					<p>{$row['message']}</p>
				</div>
				<div class="col-md-3 text-center">
					<form id="action-{$row['id']}" class="actions" action="{$request_uri}" role="form" method="post">
						<div class="row">
							<a href="{$description_link }/{$row['url']}" data-id="{$row['id']}" data-toggle="tooltip" data-placement="bottom" title="Editar" class="btn-edit btn btn-default btn-sm">Editar <span class="icon-pencil"></span></a>
						</div>
						<div class="row">
							<button name="delete-list" data-toggle="tooltip" data-placement="bottom" title="Eliminar" value="{$row['id']}" class="delete-list btn btn-default btn-sm">Eliminar <span class="icon-eraser"></span></button>
						</div>
					</form> 
					<div class="row">
						<a href="{$share_list}" data-id="{$row['id']}" data-toggle="tooltip" data-placement="bottom" title="Compartir" class="share-list btn btn-default btn-sm">Compartir <span class="icon-mail-forward"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	{/foreach}
</div>
<h2>Compartidas Conmigo</h2>
{foreach from=$shared_lists item=row}
	<div class="row list-item-container" data-id="{$row['id']}" id="list-{$row['id']}">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
					<div id="list-img-container" 
					style="background-image: 
						{if !empty($row['image'])} 
							url('{$row['image']}'); 
						{else}
							 url('{$modules_dir}giftlist/uploads/not-found.jpg')
						{/if}
						">
					</div>
				</div>
				<div class="col-md-3 vCenter">
					<h4><b>{$row['name']}</b></h4>
					<p><b>Fecha:</b> {date("d/m/Y H:i", strtotime($row['event_date']))}</p>
					<p><b>Cantidad de invitados:</b> {$row['guest_number']}</p>
				</div>
				<div class="col-md-3 vCenter">
					{if $row['public'] == 1}
						<span class="label label-success">Publico <span class="icon-unlock"></span></span>
					{else}
						<span class="label label-danger">Privado <span class="icon-lock"></span></span>
					{/if}
					<p>{$row['message']}</p>
				</div>
				<div class="col-md-3 text-center">
					<form id="action-{$row['id']}" class="actions" action="{$request_uri}" role="form" method="post">
						<div class="row">
							<a href="{$description_link }/{$row['url']}" data-id="{$row['id']}" data-toggle="tooltip" data-placement="bottom" title="Editar" class="btn-edit btn btn-default btn-sm">Editar <span class="icon-pencil"></span></a>
						</div>
						<div class="row">
							<button name="share-list" data-toggle="tooltip" data-placement="bottom" title="Compartir" class="btn btn-default btn-sm">Compartir <span class="icon-mail-forward"></span></button>
						</div>
					</form> 
				</div>
			</div>
		</div>
	</div>
{/foreach}