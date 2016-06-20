<!-- Block  giftlist -->
<li class="my-giftlist row alpha omega">
	<div class="header-account">
		<a href="{$gift_link}" title="{l s='Mis Lista de regalos'}">
			<h2>{l s='Mis Lista de regalos'}</h2>
		</a>
	</div>
	<div class="content-account row">
		<div class="col-md-2">
			<img src="{$module_dir}uploads/not-found.jpg" />
		</div>
		<div class="col-md-6">
			<h3>Buscar lista</h3>
			<p>Busca una lista de regalos existente</p>
			<form action="{$search_link}" method="post">
			<div class="row">
				<div class="col-md-3">
					<input type="text" class="form-control" name="name" placeholder="Nombre"/>
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control" name="lastname" placeholder="Apellido"/>
				</div>
				<div class="col-md-1">
					ó
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control" name="code" placeholder="Código"/>
				</div>
				<button class="btn btn-default button">Buscar</button>
			</div>
			</form>
		</div>
		<div class="col-md-4">
		
			<h3>Administrar lista</h3>
			<a href="{$gift_link}" class="btn btn-default btn-red">Ingresar</a>
		</div>
	</div>
</li>

<!-- /Block giftlist -->