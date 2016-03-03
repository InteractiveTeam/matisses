<div id="saveInfo" class="white-popup-block">
	<form role="form" action="" method="post" id="info_cocreator" enctype="multipart/form-data">
		<div class="container" id="content-modal">
			<div class="container wrapper">
				<div class="col-md-12">
					<div class="row modal-header">
						<h2 id="form-title">Editar información de envio</h2>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label for="country">Pais</label> <input type="text"
								id="country" class="form-control" value="Colombia" disabled />
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label for="city_co">Ciudad</label> <input type="text" id="city_co"
								class="form-control" name="city_co" placeholder="Ciudad" required/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label for="town_co">Municipio</label> <input type="text" id="town_co"
								class="form-control" name="town_co" placeholder="Municipio" required/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label for="address_co">Direccion</label> <input type="text"
								id="address_co" class="form-control" name="address_co"
								placeholder="Direccion" required/>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-12">
							<label for="address_co_2">Direccion</label> <input type="text"
								id="address_co_2" class="form-control" name="address_co_2"
								placeholder="Direccion" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label for="tel_co">Telefono</label> <input type="text" id="tel_co"
								class="form-control" name="tel_co" placeholder="Telefono" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label for="cel_co">Celular</label> <input type="text" id="cel_co"
								class="form-control" name="cel_co" placeholder="Celular" />
						</div>
					</div>
					<div class="row modal-footer">
						<div class="col-md-12">
							<input id="btnSave" type="submit" name="saveInfo"
								class="btn btn-success pull-right" value="Guardar">
							<button id="btnCancel"
								class="popup-modal-dismiss btn btn-danger pull-left">Cancelar</button>
						</div>
						<input type="hidden" name="id_list" id="id_list" value="0">
					</div>
				</div>
			</div>
		</div>
	</form>
</div>