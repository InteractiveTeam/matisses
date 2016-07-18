<a id="btn_gift_list" href="#frmAddGiftList" class="btn btn-success" style="display:none"> 
	{l s="Adicionar a la lista de regalos" mod="giftlist"} <span class="icon-plus"></span>
</a>

<div>
	<div id="frmAddGiftList">
		<h2 class="page-subheading">{l s='Añadir producto' mod='giftlist'}</h2>
            <div class="col-md-6">
                <div class="cont">
                    <div class="form-group">
                        <label for="lists"><span>{l s='Listas' mod='giftlist'}</span><select
                            id="lists" class="form-control">
                            <option value="0">{l s='Selecciona' mod='giftlist'}</option> 
                            {foreach from=$list item=row}
                            <option value="{$row['id']}">{$row['name']}</option> 
                            {/foreach}
                        </select>
                        </label>
                    </div>
                </div>
                <div class="cont">
                    <div class="form-group">
                        <label for="message"><span>{l s='Mensaje' mod='giftlist'}</span>
                           <p class="ax-text-descript">{l s='Personaliza el mensaje de agradecimiento que llegará a la persona que te haga este regalo.' mod='giftlist'}</p>
                            <textarea id="message"></textarea>
                        </label>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="cont">
                    <div class="form-group">
                        <label for="cant"><span>{l s='Cantidad' mod='giftlist'}</span>
                        <input type="number" id="cant" placeholder="Cantidad" min="1">
                        </label>
                    </div>
                </div>
                <div class="cont">
                    <p class="ax-text-descript">{l s='Puedes crear grupos de diferentes productos. Por ejemplo: Si quieres 12 unidades de algo en específico puedes agruparlo en 4 grupos de 3.' mod='giftlist'}</p>
                    <div class="checkbox">
                        <label>{l s='¿Agrupar?' mod='giftlist'}<input type="checkbox" id="group" name="group">
                        </label>
                    </div>
                </div>
                <div class="cont" style="display: none;" id="group-options">
                    <div class="form-group">
                        <label for="cant_group">{l s='Cantidad por grupo' mod='giftlist'}
                        <input type="number" id="cant_group" placeholder="Cantidad">
                        </label>
                    </div>
                </div>
                <div class="cont">
                    <div class="checkbox">
                        <label>{l s='¿favorito?' mod='giftlist'}<input type="checkbox" id="fav">
                        </label>
                    </div>
                </div>
                <div class="btn-list-regalos">
                    <button class="btn button btn btn-default btn-red" id="add-list">{l s='Añadir' mod='giftlist'}</button>
                </div>
            </div>
	</div>
</div>

<div id="contentdiv" class="finish" style="display: none;">
	<div class="container">
		<p class="response"></p>
		<div class="col-md-6">
			<div class="image-prod" style="height: 190px; margin-bottom: 20px"></div>
		</div>
		<div class="col-md-6">
			<p class="prod_name"></p>
			<div class="att"></div>
			<p class="price"></p>
		</div>
	</div>
	<div class="col-md-12">
		<a class="keep-buy btn button btn btn-default btn-red">Continuar comprando</a>
		<a href="javascript:void(0)" class="see-list btn btn-default btn-red pull-right">Ver listas de regalos</a>
	</div>
</div>
{literal}
<style>
	#btn_gift_list {
		margin: 7px 25%;
	}
    #frmAddGiftList {
        display:none;
    }
</style>


<script type="text/javascript">
var url_desc = {/literal}'{$desc_link}'{literal};
</script>
<script type="text/javascript" src="{/literal}{$modules_dir}{literal}giftlist/views/js/addToList.js"></script>
{/literal}