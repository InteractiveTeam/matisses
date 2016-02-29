{capture name=path}
<a href="{$list_link}">{l s='giftlist' mod='giftlist'}</a> <span class="bread">{$list_desc['name']}</span>
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}
   

<form id="frmSaveList" role="form" action="" method="post" enctype="multipart/form-data">
    <div class="container" id="content-modal">
        <div class="container wrapper">
            <div class="row modal-header">
                <h2 id="form-title">{if !$edit}Crear Lista{else}Editar lista{/if}</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name">Nombre</label> <input type="text"
                            class="form-control" value="{if $edit}{$data['name']}{/if}" name="name" id="name" placeholder="Nombre">
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
                            id="event_date" placeholder="Fecha del evento" value="{if $edit}{$data['event_date']}{/if}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="checkbox">
                        <label>Publico <input type="checkbox" {if $edit}{if $data['event_date']}checked{/if}{/if} id="public" name="public">
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="guest_number">Numero de invitados</label> <input type="number" class="form-control" name="guest_number" id="guest_number"  value="{if $edit}{$data['guest_number']}{/if}" placeholder="Numero de invitados">
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
                        <label>Recibir bono <input type="checkbox" {if $edit}{if $data['event_date']}checked{/if}{/if} id="recieve_bond"
                            name="recieve_bond">
                        </label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="max_amount">Cantidad Maxima</label> <input type="number" class="form-control" name="max_amount" value="{if $edit}{$data['max_amount']}{/if}" id="max_amount" placeholder="Cantidad Maxima">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label for="message">Mensaje</label>
                    <textarea placeholder="Mensaje" name="message" id="message">{if $edit}{$data['message']}{/if}</textarea>
                </div>
            </div>
            <div class="row">
            {if $edit}{$info_creator = Tools::JsonDecode($data['info_creator'])}{/if}
            <h3>Informacion de Envio</h3>
                <p>Primera direccion</p>
                <div class="col-md-6">		
                    <div class="row">
                        <div class="col-md-12">
                            <label for="country">Pais</label> <input type="text" id="country" class="form-control" value="Colombia" disabled />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="city">Ciudad</label> <input type="text" id="city" class="form-control" name="city" placeholder="Ciudad"  value="{if $edit}{$info_creator->city}{/if}" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="town">Municipio</label> <input type="text" id="town"
                                class="form-control" name="town"  value="{if $edit}{$info_creator->town}{/if}" placeholder="Municipio" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="address">Direccion</label> <input type="text" id="address" class="form-control" name="address"  value="{if $edit}{$info_creator->address}{/if}" placeholder="Direccion" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="tel">Telefono</label> <input type="text" id="tel" class="form-control" name="tel" placeholder="Telefono"  value="{if $edit}{$info_creator->tel}{/if}" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="cel">Celular</label> <input type="text" id="cel"  class="form-control" name="cel" placeholder="Celular"  value="{if $edit}{$info_creator->cel}{/if}" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="email_cocreator">Co-Creador</label> <input type="email" id="email_cocreator"
                                class="form-control" name="email_cocreator" placeholder="Email" />
                        </div>
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label>¿Puede editar?<input type="checkbox" id="can_edit"
                                    name="can_edit">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <p>Segunda direccion</p>
                <div class="col-md-6">		
                    <div class="row">
                        <div class="col-md-12">
                            <label for="country_2">Pais</label> <input type="text"
                                id="country_2" class="form-control" value="Colombia" disabled />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="city_2">Ciudad</label> <input type="text" id="city_2"
                                class="form-control" name="city_2" placeholder="Ciudad" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="town_2">Municipio</label> <input type="text" id="town_2"
                                class="form-control" name="town_2" placeholder="Municipio" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="address_2">Direccion</label> <input type="text"
                                id="address_2" class="form-control" name="address_2"
                                placeholder="Direccion" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="tel_2">Telefono</label> <input type="text" id="tel_2"
                                class="form-control" name="tel_2" placeholder="Telefono" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="cel_2">Celular</label> <input type="text" id="cel_2"
                                class="form-control" name="cel_2" placeholder="Celular" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row modal-footer">
                <div class="col-md-12">
                    <input id="btnSave" type="submit" name="saveList"
                        class="btn btn-success pull-right" value="Guardar">
                    <button id="btnCancel"
                        class="popup-modal-dismiss btn btn-danger pull-left">Cancelar</button>
                </div>
                <input type="hidden" name="id_list" id="id_list" value="0">
            </div>
        </div>
    </div>
</form>
