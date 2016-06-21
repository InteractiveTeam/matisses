{capture name=path}{l s='Administrar listas' mod='giftlist'}{/capture}
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
		<div class="col-md-12">
			<h1>{l s='Administrar listas' mod='giftlist'}</h1>
		</div>
	</div>
	{foreach from=$all_lists item=row}
	<div class="row list-item-container" data-id="{$row['id']}" id="list-{$row['id']}">
		<div class="header-item col-lg-12">
            <h2>{$row['name']}</h2>
        </div>
        <div class="info-item col-lg-12">
            <table>
                <thead>
                    <tr>
                        <th>{l s='Creador' mod='giftlist'}</th>
                        <th>{l s='Cocreador' mod='giftlist'}</th>
                        <th>{l s='Tipo de evento' mod='giftlist'}</th>
                        <th>{l s='Código' mod='giftlist'}</th>
                        <th>{l s='Fecha' mod='giftlist'}</th>
                        <th>{l s='Días para tu evento' mod='giftlist'}</th>
                        <th>{l s='Tus regalos' mod='giftlist'}</th>
                        <th>{l s='Regalos restantes' mod='giftlist'}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{$row['creator_name']}</td>
                        <td>{$row['cocreator_name']}</td>
                        <td>{$row['event']}</td>
                        <td>{$row['code']}</td>
                        <td>{date("d/m/Y", strtotime($row['event_date']))}</td>
                        <td>{$row['days']}</td>
                        <td>{$row['products']}</td>
                        <td>{$row['products'] - $row['products_bought']}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="footer-item col-lg-12">
            <form id="action-{$row['id']}" class="actions" action="{$request_uri}" role="form" method="post">
                <button name="delete-list" data-toggle="tooltip" data-placement="bottom" title="{l s='Borrar lista' mod='giftlist'}" value="{$row['id']}" class="delete-list btn btn-default btn-sm">{l s='Borrar lista' mod='giftlist'} <span class="icon-eraser"></span></button>
                
                <a href="{$description_link }/{$row['url']}" data-id="{$row['id']}" data-toggle="tooltip" data-placement="bottom" title="{l s='Ver lista' mod='giftlist'}" class="btn-edit btn btn-default btn-sm">{l s='Ver lista' mod='giftlist'} <span class="icon-pencil"></span></a>
            </form>
                {*<a href="{$share_list}" data-id="{$row['id']}" data-toggle="tooltip" data-placement="bottom" title="Compartir" class="share-list btn btn-default btn-sm">Compartir <span class="icon-mail-forward"></span></a>*}
            </div>
        </div>
	</div>
	{/foreach}
    <div class="col-md-2">
        <a class="btn btn-success" href="{$admin_link}" data-toggle="tooltip" data-placement="bottom" title="{l s='Crear lista' mod='giftlist'}">{l s='Crear lista' mod='giftlist'}</a>
    </div>
</div>