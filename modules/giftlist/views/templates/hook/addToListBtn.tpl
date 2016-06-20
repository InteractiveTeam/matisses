<a id="btn_gift_list" href="#frmAddGiftList" class="btn btn-success hidden">
	{l s="add to gift list" mod="add to gift list"} <span class="icon-plus"></span>
</a>

<div>
	<div id="frmAddGiftList">
		<h2>Añadir producto</h2>
		<div class="container">
			<div class="col-md-6">
				<div class="form-group">
					<label for="lists">Listas</label> <select
						id="lists" >
						<option value="0">--Seleccione--</option> 
						{foreach from=$list item=row}
						<option value="{$row['id']}">{$row['name']}</option> 
						{/foreach}
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<div class="checkbox">
					<label>¿Agrupar?<input type="checkbox" id="group">
					</label>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="col-md-6">
				<div class="form-group">
					<label for="cant">Cantidad
					<input type="number" id="cant" placeholder="Cantidad">
					</label>
				</div>
			</div>
			<div class="col-md-6" style="display: none;" id="group-options">
				<div class="form-group">
					<label for="cant_group">Cantidad por grupo
					<input type="number" id="cant_group" placeholder="Cantidad">
					</label>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="col-md-6">
				<div class="form-group">
					<label for="message">Mensaje</label>
					<textarea id="message"></textarea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="checkbox">
					<label>¿favorito?<input type="checkbox" id="fav">
					</label>
				</div>
			</div>
		</div>
		<div class="container">
			<button class="btn btn-success pull-right" id="add-list">Añadir</button>
		</div>
	</div>
</div>

<div id="contentdiv" style="display: none;">
	<div class="container">
		<p class="response"></p>
		<div class="col-md-6">
			<div class="image-prod" style="height: 233px;"></div>
		</div>
		<div class="col-md-6">
			<p class="prod_name"></p>
			<div class="att"></div>
			<p class="price"></p>
		</div>
	</div>
	<div class="col-md-12">
		<a class="keep-buy btn btn-default pull-left">Continuar comprando</a>
		<a href="javascript:void(0)" class="see-list btn btn-default pull-right">Ver listas de regalos</a>
	</div>
</div>

<style>
	#btn_gift_list {
		margin: 7px 25%;
	}
</style>

{literal}
<script type="text/javascript">
var url_desc = {/literal}'{$desc_link}'{literal};
</script>
<script type="text/javascript" src="{/literal}{$modules_dir}{literal}giftlist/views/js/addToList.js"></script>
{/literal}