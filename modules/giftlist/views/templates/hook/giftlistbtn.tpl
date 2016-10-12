<!-- Block  giftlist -->
<li class="my-giftlist row alpha omega">
	<div class="header-account">
		<a href="{$gift_link}" title="{l s='Mis Listas de regalos' mod='giftlist'}">
			<h2>{l s='Mis Listas de regalos'}</h2>
		</a>
	</div>
	<div class="content-account row">
		<div class="col-md-2 ax-logo-lista-regalos">
			<img src="{$modules_dir}/giftlist/views/img/regalo.png" />
		</div>
		<div class="col-md-6 ax-logo-formularios-regalos">
			<h3>{l s='Buscar lista' mod='giftlist'}</h3>
			<p>{l s='Busca una lista de regalos existente' mod='giftlist'}</p>
			<form action="{$search_link}" method="post" id="ax-buscar">
			<div class="row ax-form-lista-deseos">
				<input type="text" id="name" class="form-control" name="name" placeholder="{l s='Nombre' mod='giftlist'}"/>
				<input type="text" id="lastname" class="form-control" name="lastname" placeholder="{l s='Apellido' mod='giftlist'}"/>
					<input type="text" id="code" class="form-control code" name="code" placeholder="{l s='Código' mod='giftlist'}"/>
				<button class="btn btn-default button btn-red">{l s='Buscar' mod='giftlist'}</button>
			</div>
			</form>
		</div>
		<div class="col-md-2">
			<h3>{l s='Crear' mod='giftlist'}</h3>
			<p class="text-option-list">{l s='Piensa en grande y crea la lista de regalos ...' mod='giftlist'}</p>
			<a href="{$create_link}" class="btn btn-default btn-red">Empezar</a>
		</div>
		<div class="col-md-2">
			<h3>{l s='Administrar lista' mod='giftlist'}</h3>
			<p class="text-option-list">{l s='Ver, editar o añadir una lista existente.' mod='giftlist'}</p>
			<a href="{$gift_link}" class="btn btn-default btn-red">{l s='Ingresar' mod='giftlist'}</a>
		</div>
	</div>
</li>

<!-- /Block giftlist -->