
<div id="experiences-points" class="bootstrap">
  <div class="row">
    <div class="col-md-12">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title">{l s='Productos de la experiencia' mod='matisses'}</h3>
        </div>
        <div class="panel-body">
          <div class="form-group">
          	<input type="hidden" name="poid" id="poid" value="{$poid}"> 
            <label class="control-label col-lg-3 required"> <span >{l s='Producto' mod='matisses'}</span> </label>
            <div class="col-lg-9 ">
              <input type="text" id="product" name="product" placeholder="{l s='sku or id product' mod='matisses'}">
            </div>
          </div>
          
		  <div class="form-group">
            <label class="control-label col-lg-3 required"> <span >{l s='Orientación' mod='matisses'}</span> </label>
            <div class="col-lg-9 ">
            	<table border="0" cellpadding="5" cellspacing="5">
                  <tr>
                    <td scope="col" width="70px">{l s='Izquierda' mod='matisses'}</td>
                    <td scope="col"> <input checked type="radio" name="orientation" value="left" onClick="$('#orientation').val('left')"></td>
                  </tr><tr>  
                    <td scope="col">{l s='Derecha' mod='matisses'}</td>
                    <td scope="col"><input type="radio" name="orientation" value="right" onClick="$('#orientation').val('right')"></td>
                  </tr>
                </table>
                <input type="hidden" id="orientation" value="left">
            </div>
          </div>          
          
          <div class="form-group">
            <label class="control-label col-lg-3 required"> <span >{l s='Etiqueta' mod='matisses'}</span> </label>
            <div class="col-lg-9 ">
            	<table border="0" cellpadding="5" cellspacing="5">
                  <tr>
                    <td scope="col" width="70px">{l s='Blanca' mod='matisses'}</td>
                    <td scope="col"> <input checked type="radio" name="Tag" value="white" onClick="$('#market').val('white')"></td>
                  </tr><tr>  
                    <td scope="col">{l s='Negra' mod='matisses'}</td>
                    <td scope="col"><input type="radio" name="Tag" value="black" onClick="$('#market').val('black')"></td>
                  </tr>
                </table>
                <input type="hidden" id="market" value="white">
            </div>
          </div>
          
          <div class="form-group">
            <label class="control-label col-lg-3 required"> <span >{l s='Coordinates' mod='matisses'}</span> </label>
            <div class="col-lg-9 ">
                <table border="0" cellpadding="5" cellspacing="5">
                  <tr>
                    <td scope="col" width="70px">{l s='Top' mod='matisses'}</td>
                    <td scope="col"><input type="text" id="coordinates-top" name="top" value="{$top}" readonly></td>
                    </tr><tr>  
                    <td scope="col">{l s='Left' mod='matisses'}</td>
                    <td scope="col"><input type="text" id="coordinates-left" value="{$left}" readonly></td>
                  </tr>
                </table>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-lg-3 required"> <span >{l s='Estado' mod='matisses'}</span> </label>
            <div class="col-lg-9 ">
                <table border="0" cellpadding="5" cellspacing="5">
                  <tr>
                    <td scope="col" width="70px">{l s='Activo' mod='matisses'}</td>
                    <td scope="col"><input checked type="radio" name="status" value="1" onClick="$('#status').val('1')"></td>
                    </tr><tr>  
                    <td scope="col">{l s='Inactivo' mod='matisses'}</td>
                    <td scope="col"><input type="radio" name="status" value="0" onClick="$('#status').val('0')"></td>
                  </tr>
                </table>
             <input type="hidden" id="status" value="1">   
            </div>
          </div> 
          
        <div class="btn-group btn-group-lg" style="float: right" role="group" aria-label="Large button group">
          <button type="button" class="btn btn-default" id="experience-productadd">{l s='Guardar producto' mod='matisses'}</button>
          <button type="button" class="btn btn-default">{l s='Cancel' mod='matisses'}</button>
        </div>
                   
          <!-- -->
        </div>
      </div>
    </div>
  </div>
</div>
