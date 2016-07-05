{capture name=path}<a href="{$link->getModuleLink('giftlist','empezar')}">{l s='Lista de regalos' mod='giftlist'}</a><i class="fa fa-angle-right"></i>{l s='Administrar listas' mod='giftlist'}{/capture}
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
	<div class="ax-cont-admin-listas-regalos">
	{foreach from=$all_lists item=row}
	<div class="row list-item-container" data-id="{$row['id']}" id="list-{$row['id']}">
		<div class="header-item ax-text-result-list tab-rp-listas-rega">
            <h2>{$row['name']}</h2>
        </div>
        <div class="ax-cont-list-rp">
            <div class="col-lg-12 ax-cont-list">
                <div class="ax-item">
                    <div class="part">{l s='Creador' mod='giftlist'}<span>{$row['creator_name']}</span></div>
                    <div class="part">{l s='Cocreador' mod='giftlist'}<span>{$row['cocreator_name']}</span></div>
                    <div class="part">{l s='Tipo de evento' mod='giftlist'}<span>{$row['event']}</span></div>
                    <div class="part">{l s='Código' mod='giftlist'}<span>{$row['code']}</span></div>
                    <div class="part">{l s='fecha' mod='giftlist'}<span>{date("d/m/Y", strtotime($row['event_date']))}</span></div>
                    <div class="part">{l s='Días para tu evento' mod='giftlist'}<span>{$row['days']}</span></div>
                    <div class="part">{l s='Tus regalos' mod='giftlist'}<span>{$row['products']}</span></div>
                    <div class="part">{l s='Regalos restantes' mod='giftlist'}<span>{$row['products'] - $row['products_bought']}</span></div>
                </div>
            </div>
            <div class="footer-item col-lg-12">
                <form id="action-{$row['id']}" class="actions" action="{$request_uri}" role="form" method="post">
                    <button name="delete-list" data-toggle="tooltip" data-placement="bottom" title="{l s='Borrar lista' mod='giftlist'}" value="{$row['id']}" class="delete-list btn btn-default btn-lista-regalos-sample">{l s='Borrar lista' mod='giftlist'} <span class="icon-eraser"></span></button>

                    <a href="{$description_link }/{$row['url']}" data-id="{$row['id']}" data-toggle="tooltip" data-placement="bottom" title="{l s='Ver lista' mod='giftlist'}" class="btn-edit btn btn-default btn-lista-regalos">{l s='Ver lista' mod='giftlist'} <span class="icon-pencil"></span></a>
                </form>
            </div>
        </div>
	</div>
	{/foreach}
   </div>
    <div class="ax-btn-creat-list">
        <a class="btn-success btn btn-default btn-lista-regalos" href="{$admin_link}" data-toggle="tooltip" data-placement="bottom" title="{l s='Crear lista' mod='giftlist'}">{l s='Crear lista' mod='giftlist'}</a>
    </div>
</div>