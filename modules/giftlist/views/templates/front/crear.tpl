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
    <p class="ax-text-pp-create">{l s='Este es el primer paso para crear tu lista de regalos. Completa tu información personal para que tus familiares y amigos sepan de quién es esta lista.' mod='giftlist'}</p>
    <div>

      <!-- Nav tabs -->
      <ul class="nav nav-tabs ax-text-result-list" role="tablist">
        <li data-id="1" id="step1" role="presentation" class="active"><a href="#step-1" aria-controls="Paso 1" role="tab" data-toggle="tab" class="ax-text-result-list">{l s='Paso 1' mod='giftlist'}</a></li>
        <li data-id="2" id="step2" role="presentation"><a href="#" aria-controls="Paso 2" role="tab" data-toggle="tab" class="ax-text-result-list">{l s='Paso 2' mod='giftlist'}</a></li>
        <li data-id="3" id="step3" role="presentation"><a href="#" aria-controls="Paso 3" role="tab" data-toggle="tab" class="ax-text-result-list">{l s='Paso 3' mod='giftlist'}</a></li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content row">
        <div data-tab-id="1" role="tabpanel" class="tab-pane active" id="step-1">
            <div class="col-md-4">
                <h3>{l s='Información del evento' mod='giftlist'}</h3>
                <div class="col-md-12">
                    <label for="name">{l s='Nombre del evento' mod='giftlist'}<sup>*</sup></label> 
                    <input type="text" required class="form-control" value="{if $edit}{$data['name']}{/if}" name="name" id="name">
                </div>
                <div class="col-md-12">
                    <label for="event_type">{l s='Tipo de evento' mod='giftlist'}<sup>*</sup></label>
                    <select id="event_type" name="event_type" class="form-control ax-select" data-placeholder=" ">
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
                    <div class="clearfix ax-cont-form-date-lista">
                        <div class="col-md-4 ax-date-event">
                            <select id="months" name="months" class="form-control ax-select">
                                <option value="0">{l s='Mes' mod='giftlist'}</option>
                                {foreach from=$months key=k item=month}
                                    <option value="{$k}">{l s=$month mod='giftlist'}&nbsp;</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-md-4 ax-date-event">
                            <select id="days" name="days" class="form-control ax-select">
                                <option value="0">{l s='Día' mod='giftlist'}</option>
                                {foreach from=$days item=day}
                                    <option value="{$day}" >{$day}&nbsp;&nbsp;</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-md-4 ax-date-event">
                            <select id="years" name="years" class="form-control ax-select">
                                <option value="0">{l s='Año' mod='giftlist'}</option>
                                {for $i=$year to $limit}
                                    <option value="{$i}">{$i}&nbsp;&nbsp;</option>
                                {/for}
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <h3>{l s='Información personal' mod='giftlist'}</h3>
                <div class="row">
                   <div class="col-md-6">
                        <div class="row">
                            <label for="firstname">{l s='Nombre' mod='giftlist'}<sup>*</sup></label> 
                            <input type="text" class="form-control" name="firstname" id="firstname" value="{$cookie->customer_firstname}">
                        </div>
                        <div class="row">
                            <label for="lastname">{l s='Apellido' mod='giftlist'}<sup>*</sup></label> 
                            <input type="text" class="form-control" name="lastname" id="lastname" value="{$cookie->customer_lastname}">
                        </div>
                        <div class="row">
                            <label for="tel">{l s='Teléfono' mod='giftlist'}<sup>*</sup></label> 
                            <input type="text" class="form-control" name="tel" id="tel">
                        </div>
                        <div class="row">
                            <label for="country">{l s='País' mod='giftlist'}<sup>*</sup></label>
                            <select id="country" name="country" class="form-control ax-select">
                                <option value="0">{l s='Selecciona una opción' mod='giftlist'}</option>
                                <option value="1">{l s='COLOMBIA' mod='giftlist'}</option>
                            </select>
                        </div>
                        <div class="row">
                            <label for="town">{l s='Estado/Departamento' mod='giftlist'}<sup>*</sup></label>
                            <select id="city" name="city" class="form-control ax-select">
                                <option value="0">{l s='Selecciona una opción' mod='giftlist'}</option>
                                {foreach from=$countries item=c}
                                    <option value="{$c.id_country}">{$c.name}</option>
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
                            <label for="address">{l s='Dirección 1' mod='giftlist'}<sup>*</sup></label> <input type="text" id="address" class="form-control" name="address" />
                        </div>
                        <div class="row">
                            <label for="address_2">{l s='Dirección 2' mod='giftlist'}</label> <input type="text" id="address_2" class="form-control" name="address_2" placeholder="{l s='Apto, oficina, interior, bodega...' mod='giftlist'}" />
                        </div>
                        <div class="row">
                            <label for="email">{l s='Correo electrónico' mod='giftlist'}<sup>*</sup></label> <input type="email" id="email" class="form-control" name="email" />
                        </div>
                        <div class="row">
                            <label for="conf_email">{l s='Confirmar correo electrónico' mod='giftlist'}<sup>*</sup></label> <input type="email" id="conf_email" class="form-control" name="conf_email" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <a href="javascript:void(0);" class="ax-next btn btn-default btn-lista-regalos">{l s='Siguiente' mod='giftlist'}</a>
                </div>
            </div>
        </div>
        <div data-tab-id="2" role="tabpanel" class="tab-pane" id="step-2">
            <div class="row">
                <div class="col-md-12">
                   <p>{l s='Personaliza tu lista de regalos, agrega una foto de perfil y una foto de portada. Procura que tengan buen tamaño, expresa tu gusto, estilo y creatividad. También puedes indicar.' mod='giftlist'}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <a href="javascript:void(0);" id="ax-img-prof"><i class="fa fa-file-image-o" aria-hidden="true"></i>{l s='Selecciona una foto de perfil' mod='giftlist'}</a>
                    <div class="hidden">
                        <input type="file" class="up-img" name="image-prof" id="image-prof">
                    </div>
                </div>
                <div class="col-md-6">
                    <a href="javascript:void(0);" id="ax-img"><i class="fa fa-file-image-o" aria-hidden="true"></i>{l s='Selecciona una foto de portada' mod='giftlist'}</a>
                    <div class="hidden">
                        <input type="file" class="up-img" name="image-p" id="image-p">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label for="dir_before">{l s='Dirección de envío antes del evento' mod='giftlist'}<sup>*</sup></label>
                    <input type="text" class="form-control" name="dir_before" id="dir_before">
                </div>
                <div class="col-md-6">
                    <label for="dir_after">{l s='Dirección de envío después del evento' mod='giftlist'}<sup>*</sup></label>
                    <input type="text" class="form-control" name="dir_after" id="dir_after">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label for="message">
                    {l s='Mensaje' mod='giftlist'}</label>
                    <p class="ax-text-descript">{l s='Este mensaje aparecerá como bienvenida a tu lista de regalos, cuéntales a tus amigos y familiares de qué se trata.' mod='giftlist'}</p>
                    
                    <textarea name="message" class="form-control" id="message"></textarea>
                </div>
                <div class="col-md-6">
                    <div class="checkbox">
                        <label>
                            {l s='Cocreador'}
                            <input type="checkbox" id="cocreator">
                        </label>
                        <div>
                            <p class="ax-text-descript">{l s='Invita a una persona para que te ayude a administrar tu lista. Puede ser tu prometido, tu mejor amiga, un familiar o cualquiera que sea tu mano derecha para esa fecha especial.' mod='giftlist'}</p>
                        </div>
                        <div class="col-md-12 hidden" id="cocreator-div">
                            <label for="email_co">{l s='Correo electrónico' mod='giftlist'}</label>
                            <input type="email" class="form-control" name="email_co" id="email_co">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label for="guest_number">{l s='Número de invitados' mod='giftlist'}<sup>*</sup></label>
                    <input type="number" class="form-control" name="guest_number" id="guest_number" min="1">
                </div>
                <div class="row">
                    <a href="javascript:void(0);" class="ax-next btn btn-default btn-lista-regalos">{l s='Siguiente' mod='giftlist'}</a>
                    <a href="javascript:void(0);" class="ax-prev btn btn-default btn-lista-regalos">{l s='Atrás' mod='giftlist'}</a>
                </div>
            </div>
        </div>
        <div data-tab-id="3" role="tabpanel" class="tab-pane" id="step-3">
            <div class="row">
                <div class="col-md-6">
                    <div class="checkbox">
					   <label>
                        <span>{l s='Recibir bono' mod='giftlist'}</span>
                        <input type="checkbox" id="recieve_bond" name="recieve_bond">
					   </label>
				    </div>
                </div>
                <div class="col-md-6 hidden" id="ammount_div">
                    <label for="min_ammount">{l s='Monto mínimo' mod='giftlist'}<sup>*</sup></label>
                    <input type="number" class="form-control" name="min_ammount" id="min_ammount" step="20000" min="0">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group gender-line">
                        <h3>{l s='Tipo de lista' mod='giftlist'}</h3>
                        <p class="ax-text-descript">{l s='Elige la privacidad de tu lista, al hacerla privada solamente podrán acceder mediante el código o el link directo.' mod='giftlist'}</p>
                        <div class="radio-inline">
                            <label for="list_type">
                                <input type="radio" id="list_type" name="list_type" value="1" checked="checked">
                                {l s='Público' mod='giftlist'}
                            </label>
                        </div>
                        <span class="ax-text-descript">{l s='Tu lista quedará pública, así podrá ser encontrada por el nombre del creador, co-creador y/o código.' mod='giftlist'}</span>
                        <div class="radio-inline">
                            <label for"list_type">
                                <input type="radio" id="list_type" name="list_type" value="0">
                                {l s='Privado' mod='giftlist'}
                            </label>
                        </div>
                        <span class="ax-text-descript hidden">{l s='Tu lista quedará privada y solo podrá ser encontrada por el código de la misma.' mod='giftlist'}</span>
				    </div>
                </div>
                <div class="col-md-6">
                    <label for="url">{l s='URL' mod='giftlist'}<sup>*</sup></label>
                    <input type="text" class="form-control" name="url" id="url">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="checkbox">
					   <label>
                        <span>{l s='Notificaciones en tiempo real' mod='giftlist'}</span>
                        <input name="real_not" type="checkbox" id="real_not">
					   </label>
				    </div>
                </div>
                <div class="col-md-6">
                    <div class="checkbox">
					   <label>
                        <span>{l s='Notificaciones en consolidado' mod='giftlist'}</span>
                        <input name="cons_not" type="checkbox" id="cons_not">
					   </label>
				    </div>
                </div>
            </div>
            <div class="row">
                <a href="javascript:void(0);" class="ax-save btn btn-default btn-lista-regalos">{l s='Guardar' mod='giftlist'}</a>
                <a href="javascript:void(0);" class="ax-prev btn btn-default btn-lista-regalos">{l s='Atrás' mod='giftlist'}</a>
            </div>
        </div>
      </div>
    </div>
</form>
{if isset($countries)}
	{addJsDef countries=$countries}
{/if}