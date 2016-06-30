{capture name=path}
<a href="{$list_link}">{l s='Lista de regalos' mod='giftlist'}</a><i class="fa fa-angle-right"></i>{if $edit}{$data['name']}{else}{l s='Crear lista de regalos' mod='giftlist'}{/if}
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}
{if $error}
    <div class="alert alert-danger" role="alert">
        <span aria-hidden="true"></span>
        {$response}
    </div>
{/if}

<form id="frmSaveList" role="form" action="" method="post" enctype="multipart/form-data">
    <h1>{l s='Crear lista de regalos' mod='giftlist'}</h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
    <div>

      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
        <li data-id="1" id="step1" role="presentation" class="active"><a href="#step-1" aria-controls="Paso 1" role="tab" data-toggle="tab">{l s='Paso 1' mod='giftlist'}</a></li>
        <li data-id="2" id="step2" role="presentation"><a href="#" aria-controls="Paso 2" role="tab" data-toggle="tab">{l s='Paso 2' mod='giftlist'}</a></li>
        <li data-id="3" id="step3" role="presentation"><a href="#" aria-controls="Paso 3" role="tab" data-toggle="tab">{l s='Paso 3' mod='giftlist'}</a></li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        <div data-tab-id="1" role="tabpanel" class="tab-pane active" id="step-1">
            <div class="col-md-4">
                <h3>{l s='Información del evento' mod='giftlist'}</h3>
                <div class="col-md-12">
                    <label for="name">{l s='Nombre del evento' mod='giftlist'}<sup>*</sup></label> 
                    <input type="text" required class="form-control" value="{if $edit}{$data['name']}{/if}" name="name" id="name">
                </div>
                <div class="col-md-12">
                    <label for="event_type">{l s='Tipo de evento' mod='giftlist'}<sup>*</sup></label>
                    <select id="event_type" name="event_type" class="form-control">
                        <option value="0" selected="selected"></option> 
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
                <div class="col-md-12">
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
                    <label>{l s='Fecha del evento' mod='giftlist'}<sup>*</sup></label>
                    <div class="col-md-4">
                        <select id="months" name="months" class="form-control">
                            <option value="">{l s='Mes' mod='giftlist'}</option>
                            {foreach from=$months key=k item=month}
                                <option value="{$k}">{l s=$month}&nbsp;</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-md-4">
                        <select id="days" name="days" class="form-control">
                            <option value="">{l s='Día' mod='giftlist'}</option>
                            {foreach from=$days item=day}
                                <option value="{$day}" >{$day}&nbsp;&nbsp;</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-md-4">
                        <select id="years" name="years" class="form-control">
                            <option value="">{l s='Año' mod='giftlist'}</option>
                            {for $i=$year to $limit}
                                <option value="{$i}">{$i}&nbsp;&nbsp;</option>
                            {/for}
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <h3>{l s='Información personal' mod='giftlist'}</h3>
                <div class="row">
                    <div class="col-md-6">
                        <label for="firstname">{l s='Nombre' mod='giftlist'}<sup>*</sup></label> 
                        <input type="text" class="form-control" name="firstname" id="firstname">
                    </div>
                    <div class="col-md-6">
                        <label for="country">{l s='País' mod='giftlist'}<sup>*</sup></label>
                        <select id="country" name="country" class="form-control">
                            <option value="0">{l s='Seleccione una opción' mod='giftlist'}</option>
                            <option value="1">{l s='Colombía' mod='giftlist'}</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label for="lastname">{l s='Apellido' mod='giftlist'}<sup>*</sup></label> 
                        <input type="text" class="form-control" name="lastname" id="lastname">
                    </div>
                    <div class="col-md-6">
                        <label for="city">{l s='Ciudad' mod='giftlist'}<sup>*</sup></label>
                        <select id="city" name="city" class="form-control">
                            <option value="0">{l s='Seleccione una opción' mod='giftlist'}</option>
                            {foreach from=$countries item=c}
                                <option value="{$c.id_country}">{$c.name}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label for="telcity">{l s='Télefono' mod='giftlist'}<sup>*</sup></label> 
                        <input type="text" class="form-control" name="telcity" id="telcity">
                    </div>
                    <div class="col-md-6">
                        <div class="required town unvisible">
                            <label for="town">{l s='Estado/Departamento' mod='giftlist'}<sup>*</sup></label>
                            <select id="town" name="city" class="form-control">
                                <option value="">{l s='Seleccione una opción' mod='giftlist'}</option>
                            </select>
			            </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label for="address">{l s='Dirección 1' mod='giftlist'}<sup>*</sup></label> <input type="text" id="address" class="form-control" name="address" />
                    </div>
                    <div class="col-md-6">
                        <label for="address_2">{l s='Dirección 2' mod='giftlist'}</label> <input type="text" id="address_2" class="form-control" name="address_2" placeholder="{l s='Apto, oficina, interior, bodega...' mod='giftlist'}" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label for="email">{l s='Correo electrónico' mod='giftlist'}<sup>*</sup></label> <input type="email" id="email" class="form-control" name="email" />
                    </div>
                    <div class="col-md-6">
                        <label for="conf_email">{l s='Confirmar correo electrónico 2' mod='giftlist'}<sup>*</sup></label> <input type="email" id="conf_email" class="form-control" name="conf_email" />
                    </div>
                </div>
                <div class="row">
                    <a href="javascript:void(0);" class="ax-next btn btn-default btn-lista-regalos">{l s='Siguiente' mod='giftlist'}</a>
                </div>
            </div>
        </div>
        <div data-tab-id="2" role="tabpanel" class="tab-pane" id="step-2">
            <div class="row">
                <div class="col-md-6">
                    <label for="image-prof">{l s='Seleccione foto de perfil' mod='giftlist'}</label>
                    <input type="file" name="image-prof" id="image-prof">
                </div>
                <div class="col-md-6">
                    <label for="image-p">{l s='Seleccione foto de portada' mod='giftlist'}</label>
                    <input type="file" name="image-p" id="image-p">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label for="message">{l s='Mensaje' mod='giftlist'}</label>
                    <textarea name="message" class="form-control" id="message"></textarea>
                </div>
                <div class="col-md-6">
                    <label for="guest_number">{l s='Número de invitados' mod='giftlist'}</label>
                    <input type="number" class="form-control" name="guest_number" id="guest_number">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label for="dir_1">{l s='Dirección antes' mod='giftlist'}</label>
                    <input type="text" class="form-control" name="dir_1" id="dir_1">
                </div>
                <div class="col-md-6">
                    <label for="dir_2">{l s='Dirección despues' mod='giftlist'}</label>
                    <input type="text" class="form-control" name="dir_2" id="dir_2">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="checkbox">
					   <label>
                        {l s='Cocreador'}
                        <input type="checkbox" id="cocreator">
					   </label>
				    </div>
                </div>
                <div class="col-md-6 hidden">
                    <label for="email-co">{l s='Correo electronico' mod='giftlist'}</label>
                    <input type="email" class="form-control" name="email-co" id="email-co">
                </div>
                <div class="row">
                    <a href="javascript:void(0);" class="ax-next btn btn-default btn-lista-regalos">{l s='Siguiente' mod='giftlist'}</a>
                </div>
            </div>
        </div>
        <div data-tab-id="3" role="tabpanel" class="tab-pane" id="step-3">
            <div class="row">
                <div class="col-md-6">
                    <div class="checkbox">
					   <label>
                        {l s='Recibir bono'}
                        <input type="checkbox" id="recieve_bond">
					   </label>
				    </div>
                </div>
                <div class="col-md-6 hidden">
                    <label for="min_ammount">{l s='Monto mínimo' mod='giftlist'}</label>
                    <input type="number" class="form-control" name="min_ammount" id="min_ammount">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="radio-inline">
					   <label>
                        {l s='Tipo de lista' mod='giftlist'}
                        <input type="radio" id="list_type" name="list_type" value="1">{l s='Público' mod='giftlist'}
                        <input type="radio" id="list_type" name="list_type" value="0">{l s='Privado' mod='giftlist'}
					   </label>
				    </div>
                </div>
                <div class="col-md-6">
                    <label for="url">{l s='Url' mod='giftlist'}</label>
                    <input type="text" class="form-control" name="url" id="url">
                </div>
                <div class="row">
                    <a href="javascript:void(0);" class="ax-prev btn btn-default btn-lista-regalos">{l s='Atrás' mod='giftlist'}</a>
                </div>
            </div>
        </div>
      </div>
    </div>
</form>
{if isset($countries)}
	{addJsDef countries=$countries}
{/if}