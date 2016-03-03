{capture name=path}
<a href="{$list_link}">{l s='giftlist' mod='giftlist'}</a><i class="fa fa-angle-right"></i>{if $edit}{$data['name']}{else}{l s='new' mod='giftlist'}{/if}
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}
   

<form id="frmSaveList" role="form" action="" method="post" enctype="multipart/form-data">
    {* General *}
    <div class="container">
        <div class="row">
            <h2 id="form-title">{if !$edit}{l s='Create List' mod='giftlist'}{else}{l s='Edit ist' mod='giftlist'}{/if}</h2>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="name">Nombre</label> 
                    <input type="text" class="form-control" value="{if $edit}{$data['name']}{/if}" name="name" id="name" placeholder="Nombre">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="event_type">Tipo de evento</label> <select
                        id="event_type" name="event_type" class="form-control">
                        <option value="0">--Seleccione--</option> 
                        {foreach from=$event_type item=event}
                        {if $edit}
                            {if $data['event_type'] == $event['id']}
                                <option value="{$event['id']}" selected>{$event['name']}</option>
                            {else}
                                <option value="{$event['id']}">{$event['name']}</option>
                            {/if}
                        {else}
                            <option value="{$event['id']}">{$event['name']}</option>
                        {/if}
                        {/foreach}
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="event_date">Fecha del evento</label> <input
                        type="text" name="event_date" class="form-control"
                        id="event_date" placeholder="Fecha del evento" value="{if $edit}{date("m/d/Y H:i",strtotime($data['event_date']))}{/if}">
                </div>
            </div>
            <div class="col-md-6">
                <div class="checkbox">
                    <label>Publico <input type="checkbox" {if $edit}{if $data['public']}checked{/if}{else}checked{/if} id="public" name="public">
                    </label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="guest_number">Numero de invitados</label> <input type="number" class="form-control" name="guest_number" id="guest_number"  value="{if $edit}{$data['guest_number']}{else}0{/if}" placeholder="Numero de invitados">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="guest_number">Imagen</label> <input type="file"
                        name="image" id="image">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="checkbox">
                    <label>Recibir bono <input type="checkbox" {if $edit}{if $data['recieve_bond']}checked{/if}{/if} id="recieve_bond"
                        name="recieve_bond">
                    </label>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="min_amount">Cantidad Minima</label> <input type="number" class="form-control" name="min_amount" value="{if $edit}{$data['min_amount']}{/if}" id="min_amount" placeholder="Cantidad Minima">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label for="message">Mensaje</label>
                <textarea placeholder="Mensaje" name="message" id="message">{if $edit}{$data['message']}{/if}</textarea>
            </div>
        </div>
        {* info creator *}
        <div class="row">
            {if $edit}{$info_creator = Tools::JsonDecode($data['info_creator'])}{/if}
            <h3>Informacion de Envio</h3>
            <p>Primera direccion</p>
            <div class="col-md-6">
                <div class="col-md-12">
                    <label for="country">Pais</label> <input type="text" id="country" class="form-control" value="Colombia" disabled />
                </div>
                <div class="col-md-12">
                    <label for="city">Ciudad</label> <input type="text" id="city" class="form-control" name="city" placeholder="Ciudad"  value="{if $edit}{$info_creator->city}{/if}" />
                </div>
                <div class="col-md-12">
                    <label for="town">Municipio</label> <input type="text" id="town"
                        class="form-control" name="town"  value="{if $edit}{$info_creator->town}{/if}" placeholder="Municipio" />
                </div>
                <div class="col-md-12">
                    <label for="address">Direccion</label> <input type="text" id="address" class="form-control" name="address"  value="{if $edit}{$info_creator->address}{/if}" placeholder="Direccion" />
                </div>
                <div class="col-md-12">
                    <label for="address_2">Segunda Direccion</label> <input type="text" id="address_2" class="form-control" name="address_2"  value="{if $edit}{$info_creator->address_2}{/if}" placeholder="Segunda Direccion" />
                </div>
                <div class="col-md-12">
                    <label for="tel">Telefono</label> <input type="text" id="tel" class="form-control" name="tel" placeholder="Telefono"  value="{if $edit}{$info_creator->tel}{/if}" />
                </div>
                <div class="col-md-12">
                    <label for="cel">Celular</label> <input type="text" id="cel"  class="form-control" name="cel" placeholder="Celular" value="{if $edit}{$info_creator->cel}{/if}" />
                </div>
            </div>
            {* co-creador *}
            <div class="col-md-6">
            {if empty($data['id_cocreator'])} 
                <div class="col-md-12">
                    <label for="email_cocreator">Co-Creador</label> <input type="email" id="email_cocreator"
                        class="form-control" name="email_cocreator" placeholder="Email" />
                </div>
                <div class="col-md-12">
                    <div class="checkbox">
                        <label>¿Puede editar?<input type="checkbox" id="can_edit"
                            name="can_edit">
                        </label>
                    </div>
                </div>
                {elseif $data['id_cocreator'] != $cookie->customer->id}
                <a href="#">Quitar co-creador</a>
                {/if}
                {if $edit}{if !empty($data['id_cocreator']) && $data['id_cocreator'] == $cookie->customer->id}
                {$info_cocreator = Tools::JsonDecode($data['info_cocreator'])}
                <div class="col-md-12">
                    <div class="col-md-12">
                        <label for="country">Pais</label> <input type="text" id="country" class="form-control" value="Colombia" disabled />
                    </div>
                    <div class="col-md-12">
                        <label for="city_co">Ciudad</label> <input type="text" id="city_co" class="form-control" name="city_co" placeholder="Ciudad" value="{if $edit}{$info_cocreator->city_co}{/if}" />
                    </div>
                    <div class="col-md-12">
                        <label for="town_co">Municipio</label> <input type="text" id="town_co" class="form-control" name="town_co" placeholder="Municipio" value="{if $edit}{$info_cocreator->town_co}{/if}" />
                    </div>
                    <div class="col-md-12">
                        <label for="address_co">Direccion</label> <input type="text" id="address_co" class="form-control" name="address_co" placeholder="Direccion" value="{if $edit}{$info_cocreator->address_co}{/if}" />
                    </div>
                    <div class="col-md-12">
                        <label for="address_co_2">Segunda Direccion</label> <input type="text" id="address_co_2" class="form-control" name="address_co_2" placeholder="Segunda Direccion" value="{if $edit}{$info_cocreator->address_co_2}{/if}" />
                    </div>
                    <div class="col-md-12">
                        <label for="tel_co">Telefono</label> <input type="text" id="tel_co" class="form-control" name="tel_co" placeholder="Telefono" value="{if $edit}{$info_cocreator->tel_co}{/if}"/>
                    </div>
                    <div class="col-md-12">
                        <label for="cel_co">Ceular</label> <input type="text" id="cel_co" class="form-control" name="cel_co" placeholder="Celular" value="{if $edit}{$info_cocreator->cel_co}{/if}"/>
                    </div>
                </div>
                {/if}{/if}
            </div>
        </div>
        <div class="col-md-12">
            <input id="btnSave" type="submit" name="saveList"
                class="btn btn-success pull-right" value="Guardar">
            <button id="btnCancel"
                class="popup-modal-dismiss btn btn-danger pull-left">Cancelar</button>
        </div>
        <input type="hidden" name="id_list" id="id_list" value="{if $edit}{$data['id']}{/if}">
    </div>
</form>
