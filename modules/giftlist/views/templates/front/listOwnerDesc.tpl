{* Owner User *} 
{capture name=path}
<a href="{$link->getModuleLink('giftlist','empezar')}">{l s='giftlist' mod='giftlist'}</a><i class="fa fa-angle-right"></i><a href="{$all_link}">{l s='Administrar listas' mod='giftlist'}</a><i class="fa fa-angle-right"></i>{$list_desc['name']}
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}
{*List info*}
<div class="container">
    <h1>{$list_desc['name']}</h1>
	{if isset($response)}
	<div class="alert {if $error == true} alert-danger{else} alert-success{/if}  alert-dismissible" role="alert">
		<button type="button" data-dismiss="alert" id="closeMsg" class="close" 
		aria-label="Close"><span aria-hidden="true">&times;</span></button>
		{$response}
	</div>
	{/if}
	<div class="ax-general-info ax-cont-admin-listas-regalos">
        <div class="ax-header-info ax-text-result-list">
            <h2>{l s='Información general' mod='giftlist'}</h2>
        </div>
        <div class="ax-cont-list">
            <div class="ax-item">
                <div class="part">{l s='Código' mod='giftlist'}<span>{$list_desc['code']}</span></div>
                <div class="part">{l s='Días para el evento' mod='giftlist'}<span class="ax-day">{$days}</span></div>
                <div class="part">{l s='Tus regalos' mod='giftlist'}<span>{$numberProducts.products}</span></div>
                <div class="part">{l s='Regalos restantes' mod='giftlist'}<span>{$numberProducts.products_bought}</span></div>
                <div class="part">{l s='Registrante' mod='giftlist'}<span class="ax-creator-name">{$creator}</span></div>
                <div class="part">{l s='Tipo de evento' mod='giftlist'}<span class="ax-event-type">{$event_type}</span></div>
                <div class="part">{l s='Fecha' mod='giftlist'}<span class="ax-event-date">{date("d/m/Y",strtotime($list_desc['event_date']))}</span></div>
                <div class="part"><span><a href="#info-div" class="ax-edit-info ax-edit">{l s='Editar información' mod='giftlist'}</a></span></div>
            </div>
        </div>
    </div>
    
    <div class="ax-avatar-content">
        <div id="ax-cover-container">
            <div class="cont-img">
                <div class="ax-cover-img" width="180" style="background-image: url('{if !empty($list_desc['image'])}{$list_desc['image']}{else}
                {$modules_dir}/giftlist/views/img/banner.jpg{/if}')"></div>
            </div>
            <div class="ax-cover-buttons">
                <a href="javascript:void(0);" id="ax-img">{l s='Seleccionar imagen' mod='giftlist'}</a>
                <input type="file" id="ax-cover-up" class="hidden"/>
                <a href="javascript:void(0);" id="ax-cover-delete">{l s='Eliminar imagen' mod='giftlist'}</a>
            </div>
        </div>
        <div id="ax-prof-container">
            <div class="cont-img">
                <div class="ax-profile-img" width="180" style="background-image: url('{if !empty($list_desc['profile_img'])}{$list_desc['profile_img']}{else}{$modules_dir}/giftlist/views/img/avatar.png{/if}')"></div>
            </div>
            <div class="ax-prof-buttons">
                <a href="javascript:void(0);" id="ax-img-prof">{l s='Seleccionar imagen' mod='giftlist'}</a>
                <input type="file" id="ax-prof-up" class="hidden"/>
                <a href="javascript:void(0);" id="ax-prof-delete">{l s='Eliminar imagen' mod='giftlist'}</a>
            </div>
        </div>
    </div>

    <div class="ax-message">
        <div class="ax-text-result-list ax-result-inline">
            <h2>{l s='Mensaje de bienvenida' mod='giftlist'}</h2>
        </div>
        <p id="ax-message-content" class="ax-message-content">{$list_desc['message']}</p>
            <div id="ax-message-content" class="ax-message-content">
                <a href="javascript:void(0);" id="ax-edit" class="ax-edit">{l s='Editar mensaje' mod='giftlist'}</a>
                <a href="javascript:void(0);" id="ax-delete" class="ax-delete">{l s='Eliminar mensaje' mod='giftlist'}</a>
            </div>
    </div>

    <div class="ax-address">
        <div class="ax-text-result-list ax-result-inline">
            <h2>{l s='Direcciones' mod='giftlist'}</h2>
        </div>
        <a href="#address-div" class="ax-edit-address">{l s='Editar direcciones' mod='giftlist'}</a>
        <div class="row">
            <div class="col-md-4">
            <p class="ax-title">{l s='Antes del evento' mod='giftlist'}</p>
               <p class="ax_address_bef">{$list_desc['address_before']} {$address->town} {$address->city}, {$address->country}</p>
            </div>
            <div class="col-md-4">
            <p class="ax-title">{l s='Despúes del evento' mod='giftlist'}</p>
            <p class="ax_address_af">{$list_desc['address_after']} {$address->town} {$address->city}, {$address->country}</p>
            </div>
        </div>
    </div>
    
    <div class="ax-categories">
        <div class="ax-text-result-list ax-result-inline">
        <h2>{l s='Añadir productos' mod='giftlist'}</h2>
        </div>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <div class="owl-carousel">
            {foreach item=cat from=$cats}
                {if $cat.id_parent == 3}
                {assign var="cat_img" value="/img/c/{$cat.id_category}-medium_default.jpg"}
                <div class="item">
                    {assign var="first" value=0}
                    <a href="/{$cat.id_category}-{$cat.link_rewrite}">
                        <img class="replace-2x" src="{$cat_img}" alt="" />
                        <p>{$cat.name}</p>
                    </a>
                </div>
                {/if}
            {/foreach}
            </div>
        </div>
    </div>
	
	<div class="products-associated" data-id="{$list_desc['id']}">
	    <div class="text-left">
            <div class="ax-text-result-list ax-result-inline">
                <h2>{l s='Mi lista' mod='giftlist'}</h2>
            </div>
            <a href="javascript:void(0);" class="ax-list-edit">{l s='Editar lista' mod='giftlist'}</a>
            <a href="javascript:void(0);" class="ax-finish-edit hidden">{l s='Terminar edición' mod='giftlist'}</a>
        </div>
		
        
        <div id="ax-products">
            <div class="jplist-panel">
               <div class="sortPagiBar">
               <label for="nb_item"> <span>Mostrar</span> </label>
               <select
                    class="jplist-select" 
                    data-control-type="items-per-page-select" 
                    data-control-name="paging" 
                    data-control-action="paging">

                    <option data-number="4"> 4 </option>
                    <option data-number="8" data-default="true" selected> 8 </option>
                    <option data-number="12"> 12 </option>
                    <option data-number="all"> Todos </option>
                </select>	
                </div>					
                <div 
                class="jplist-pagination" 
                data-control-type="pagination" 
                data-control-name="paging" 
                data-control-action="paging">
                </div>
            </div>
            <div class="row ax-prod-cont">
                {foreach from=$products item=row}
                    {$atribute_group = $row['options'][3]->value}
                        <div class="product-card col-md-3" id="prod-{$row['id']}" data-id="{$row['id']}">
                            <div class="img-container">
                                <img src="{$row['image']}">
                            </div>
                            <div class="ax-info-list">
                            <i class="fa fa-heart  {if $row['favorite']}ax-favorite{/if}" aria-hidden="true"></i>
                            <p class="ax-name-list">{$row['name']}</p>
                            <p class="ax-price-list">{convertPrice price=$row['price']}</p>
                            {foreach from=$row['data'] item=att_group}
                                {if $att_group['id_product_attribute'] == $atribute_group}
                                    <p>{$att_group['group_name']}: {$att_group['attribute_name']}</p>
                                {/if}
                            {/foreach}
                            <p>{l s='Cantidad:'} {$row['cant']}</p>
                        </div>
                        <a class="delete-product hidden" data-toggle="tooltip" data-placement="bottom" title="Quitar producto"><i class="fa fa-close"></i></a>
                    </div>
                {/foreach}
                {if $list_desc['recieve_bond']}
                <div class="product-card ax-bond-card col-md-3" data-id="{$list_desc['id']}">
                    <img src="{$modules_dir}/giftlist/views/img/details-lista.png">
                    <span class="ax-bond-value">{l s='Total bonos' mod='giftlist'}: {convertPrice price=$bond['total']}</span> <br>       
                </div>
                {/if}
            </div>
            <div class="jplist-panel">
               <div class="sortPagiBar">
               <label for="nb_item"> <span>Mostrar</span> </label>
               <select
                    class="jplist-select" 
                    data-control-type="items-per-page-select" 
                    data-control-name="paging" 
                    data-control-action="paging">

                    <option data-number="4"> 4 </option>
                    <option data-number="8" data-default="true" selected> 8 </option>
                    <option data-number="12"> 12 </option>
                    <option data-number="all"> Todos </option>
                </select>	
                </div>					
                <div 
                class="jplist-pagination" 
                data-control-type="pagination" 
                data-control-name="paging" 
                data-control-action="paging">
                </div>
            </div>
		</div>
	</div>
</div>

<div id="address-div" style="display:none">
    <form method="post" id="address-form">
        <h3>{l s='Información personal' mod='giftlist'}</h3> 
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <label for="firstname">{l s='Nombre' mod='giftlist'}<sup>*</sup></label> 
                    <input type="text" class="form-control" name="firstname" id="firstname" value="{$list_desc['firstname']}">
                </div>
                <div class="row">
                    <label for="lastname">{l s='Apellido' mod='giftlist'}<sup>*</sup></label> 
                    <input type="text" class="form-control" name="lastname" id="lastname" value="{$list_desc['lastname']}">
                </div>
                <div class="row">
                    <label for="tel">{l s='Teléfono' mod='giftlist'}<sup>*</sup></label> 
                    <input type="text" class="form-control" value="{$address->tel}" name="tel" id="tel">
                </div>
                <div class="row">
                    <label for="country">{l s='País' mod='giftlist'}<sup>*</sup></label>
                    <select id="country" name="country" class="form-control ax-select">
                        <option value="1">{l s='COLOMBIA' mod='giftlist'}</option>
                    </select>
                </div>
                <div class="row">
                    <label for="town">{l s='Estado/Departamento' mod='giftlist'}<sup>*</sup></label>
                    <select id="city" name="city" class="form-control ax-select">
                        <option value="0">{l s='Selecciona una opción' mod='giftlist'}</option>
                        {foreach from=$countries item=c}
                            <option value="{$c.id_country}" {if strtoupper($address->city) == $c.name } selected {/if}>{$c.name}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            
            <div class="col-md-6">
              <div class="row">
                    <div class="required town unvisible">
                        <label for="city">{l s='Ciudad' mod='giftlist'}<sup>*</sup></label>
                        <select id="town" name="town" class="form-control ax-select">
                            <option value="0">{l s='Selecciona una opción' mod='giftlist'}</option>
                        </select>
                    </div>
                </div>
              <div class="row">
                    <label for="address">{l s='Dirección 1' mod='giftlist'}<sup>*</sup></label> <input type="text" id="address" class="form-control" name="address" value="{$address->address}" />
                </div>
                <div class="row">
                    <label for="address_2">{l s='Dirección 2' mod='giftlist'}</label> <input type="text" id="address_2" class="form-control" name="address_2" value="{$address->address_2}" placeholder="{l s='Apto, oficina, interior, bodega...' mod='giftlist'}" />
                </div>
                <div class="row">
                    <label for="dir_before">{l s='Dirección de envío antes del evento' mod='giftlist'}<sup>*</sup></label>
                    <input type="text" class="form-control" value="{$list_desc['address_before']}" name="dir_before" id="dir_before">
                </div>
                <div class="row">
                    <label for="dir_after">{l s='Dirección de envío después del evento' mod='giftlist'}<sup>*</sup></label>
                    <input type="text" class="form-control" value="{$list_desc['address_after']}" name="dir_after" id="dir_after">
                </div>
            </div>
        </div>
 
        <div class="row btn-form-address">
            <a href="javascript:void(0);" class="ax-cancel btn btn-default btn-lista-regalos">{l s='Cancelar' mod='giftlist'}</a>
            <a href="javascript:void(0);" class="ax-save btn btn-default btn-lista-regalos">{l s='Guardar' mod='giftlist'}</a>
        </div>
    </form>
</div>

<div id="info-div" style="display:none">
    <h3>{l s='Información de la lista' mod='giftlist'}</h3> 
    <form method="post" id="info-form">
        <div class="row">
            <div class="col-md-6">
                <label for="firstname">{l s='Nombre' mod='giftlist'}<sup>*</sup></label> 
                <input type="text" class="form-control" name="firstname" id="firstname" value="{$list_desc['firstname']}">
            </div>
            <div class="col-md-6">
                <label for="lastname">{l s='Apellido' mod='giftlist'}<sup>*</sup></label> 
                <input type="text" class="form-control" name="lastname" id="lastname" value="{$list_desc['lastname']}">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="email_co">{l s='Cocreador' mod='giftlist'}</label> 
                <input type="text" class="form-control" name="email_co" id="email_co" value="{$email_co}">
            </div>
            <div class="col-md-6">
                    <label for="event_type">{l s='Tipo de evento' mod='giftlist'}<sup>*</sup></label>
                    <select id="event_type" name="event_type" class="form-control ax-select" data-placeholder=" ">
                        <option value="0" selected="selected"></option> 
                        {foreach from=$events item=event}
                            {if $list_desc['event_type'] == $event['id']}
                                <option value="{$event['id']}" selected>{$event['name']}</option>
                            {else}
                                <option value="{$event['id']}">{$event['name']}</option>
                            {/if}
                        {/foreach}
                    </select>
                </div>
        </div>
        <div class="row">
            {*
                {l s='January' mod='giftlist'}
                {l s='February' mod='giftlist'}
                {l s='March' mod='giftlist'}
                {l s='April' mod='giftlist'}
                {l s='May' mod='giftlist'}
                {l s='June' mod='giftlist'}
                {l s='July' mod='giftlist'}
                {l s='August' mod='giftlist'}
                {l s='September' mod='giftlist'}
                {l s='October' mod='giftlist'}
                {l s='November' mod='giftlist'}
                {l s='December' mod='giftlist'}
            *}
            <div class="col-md-12">
                <label>{l s='Fecha del evento' mod='giftlist'}<sup>*</sup></label>
            </div>
            <div class="col-md-4 ax-date-event">
                <select id="months" name="months" class="form-control ax-select">
                    <option value="0">{l s='Mes' mod='giftlist'}</option>
                    {foreach from=$months key=k item=month}
                        <option value="{$k}" {if $k == $ev_date[1]}selected{/if}>{l s=$month mod='giftlist'}&nbsp;</option>
                    {/foreach}
                </select>
            </div>
            <div class="col-md-4 ax-date-event">
                <select id="days" name="days" class="form-control ax-select">
                    <option value="0">{l s='Día' mod='giftlist'}</option>
                    {foreach from=$days_d item=day}
                        <option value="{$day}" {if $day == $ev_date[2]}selected{/if}>{$day}&nbsp;&nbsp;</option>
                    {/foreach}
                </select>
            </div>
            <div class="col-md-4 ax-date-event">
                <select id="years" name="years" class="form-control ax-select">
                    <option value="0">{l s='Año' mod='giftlist'}</option>
                    {for $i=$year to $limit}
                        
                        <option value="{$i}" {if $i == $ev_date[0]}selected{/if}>{$i}&nbsp;&nbsp;</option>
                    {/for}
                </select>
            </div>
        </div>
        <div class="row btn-form-info">
           <div class="col-md-12">
                <a href="javascript:void(0);" class="ax-cancel btn btn-default btn-lista-regalos">{l s='Cancelar' mod='giftlist'}</a>
                <a href="javascript:void(0);" class="ax-save-info btn btn-default btn-lista-regalos">{l s='Guardar' mod='giftlist'}</a>
            </div>
        </div>
    </form>
</div>

<a href="{$share_list}" data-id="{$row['id']}" data-toggle="tooltip" data-placement="bottom" title="{l s='Compartir lista' mod='giftlist'}" class="share-list btn btn-default btn-lista-regalos">{l s='Compartir lista' mod='giftlist'} <span class="icon-mail-forward"></span></a>
{if isset($countries)}
	{addJsDef countries=$countries}
    {addJsDef sel_town=strtoupper($address->town)}
    {addJsDef min_amount=$list_desc['min_amount']}
{/if}
<div class="hidden">
{literal} 
<script class="hidden" type="text/javascript"> 
	var list_desc = {/literal}{json_encode($list_desc)}{literal} 
</script>
{/literal}
</div>
<div style="display:none" id="contentdiv">
    <p class="fancybox-error" id="message"></p>
</div>

