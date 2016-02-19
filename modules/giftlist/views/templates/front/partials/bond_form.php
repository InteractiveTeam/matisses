<form action="" method="post" id="bond_form">
  <h1>Comprar bono</h1>
  <div class="container">
    <div class="col-md-6">
        <div class="">
          <label for="mount">Valor</label>
          <input class="form-control" type="number" name="mount" id="mount" placeholder="Valor">
        </div>
    </div>
    <div class="col-md-6">
      <div class="checkbox">
        <label>Bono de lujo <input type="checkbox" id="luxury_bond" name="luxury_bond">
        </label>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="col-md-12">
      <label for="message">Mensaje</label>
      <textarea placeholder="Mensaje" name="message" id="message"></textarea>
    </div>
  </div>
  <div class="container">
    <div class="col-md-12">
      <input id="btnSave" type="submit" name="saveList"
        class="btn btn-success pull-right" value="Guardar">
      <button id="btnCancel"
        class="btn btn-danger pull-left">Cancelar</button>
    </div>
  </div>
</form>
