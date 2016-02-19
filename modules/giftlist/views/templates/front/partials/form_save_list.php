<?php 
session_start();
?>

<div id="saveList" class="white-popup-block">
	<form id="frmSaveList" role="form" action="" method="post" enctype="multipart/form-data">
		<div class="container" id="content-modal">
			<div class="container wrapper">
				<div class="row modal-header">
					<h2 id="form-title">Crear Lista</h2>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="name">Nombre</label> <input type="text"
								class="form-control" name="name" id="name" placeholder="Nombre">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="event_type">Tipo de evento</label> <select
								id="event_type" name="event_type" class="form-control">
								<option value="0">--Seleccione--</option> 
								<?php foreach ($_SESSION['event'] as $row){?>
								<option value="<?php echo $row['id']?>"><?php echo $row['name']?></option>
								<?php }?>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="event_date">Fecha del evento</label> <input
								type="text" name="event_date" class="form-control"
								id="event_date" placeholder="Fecha del evento">
						</div>
					</div>
					<div class="col-md-6">
						<div class="checkbox">
							<label>Publico <input type="checkbox" id="public" name="public">
							</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="guest_number">Numero de invitados</label> <input
								type="number" class="form-control" name="guest_number"
								id="guest_number" placeholder="Numero de invitados">
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
							<label>Recibir bono <input type="checkbox" id="recieve_bond"
								name="recieve_bond">
							</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="max_amount">Cantidad Maxima</label> <input
								type="number" class="form-control" name="max_amount"
								id="max_amount" placeholder="Cantidad Maxima">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="message">Mensaje</label>
						<textarea placeholder="Mensaje" name="message" id="message"></textarea>
					</div>
				</div>
				<div class="row">
				<h3>Informacion de Envio</h3>
					<div class="col-md-6">		
						<div class="row">
							<div class="col-md-12">
								<label for="country">Pais</label> <input type="text"
									id="country" class="form-control" value="Colombia" disabled />
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<label for="city">Ciudad</label> <input type="text" id="city"
									class="form-control" name="city" placeholder="Ciudad" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<label for="town">Municipio</label> <input type="text" id="town"
									class="form-control" name="town" placeholder="Municipio" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<label for="address">Direccion</label> <input type="text"
									id="address" class="form-control" name="address"
									placeholder="Direccion" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<label for="tel">Telefono</label> <input type="text" id="tel"
									class="form-control" name="tel" placeholder="Telefono" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<label for="cel">Celular</label> <input type="text" id="cel"
									class="form-control" name="cel" placeholder="Celular" />
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
</div>
<?php 
unset($_SESSION['list']);
?>
