<div class="ax-add-gift-card">
 <form action="" method="post" id="bond_form">
  <h3>Comprar bono</h3>
  <div class="container">
    <p class="ax-text-descript">Regala un bono con el valor que quieras, este bono solamente será redimible en las tiendas físicas. Selecciona la opción de Bono de Lujo para que incluyamos una caja especial de regalo.
<br><br>*La caja tiene un valor de $50.000 para bonos de menos de $1’000.000, por encima de este valor la caja especial de regalo es gratis.
</p>
    <div class="col-md-6">
        <div class="">
          <label for="mount">Valor</label>
          <input class="form-control" type="number" name="mount" id="mount" placeholder="Valor" step="20000">
        </div>
    </div>
    <div class="col-md-6">
      <div class="checkbox">
        <label>
            <input type="checkbox" id="luxury_bond" name="luxury_bond">
            <span>Bono de lujo</span>
        </label>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="col-md-12">
      <label for="message">Mensaje</label>
      <textarea placeholder="Mensaje" name="message" id="message"></textarea>
    </div>
    <div class="col-md-12">
     <br/>
      <input id="btnSave" type="submit" name="saveList"
        class="btn pull-right btn-default btn-lista-regalos" value="Guardar">
      <button id="btnCancel"
        class="btn pull-left btn-default btn-lista-regalos">Cancelar</button>
    </div>
  </div>
</form>
</div>
