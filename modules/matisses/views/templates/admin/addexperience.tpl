<div class="row">
  <div class="col-lg-12">
    <form id="category_form" class="defaultForm form-horizontal AdminCategories" action="" method="post" enctype="multipart/form-data" novalidate="" _lpchecked="1">
      <div class="panel">
        <div class="panel-heading"> <i class="icon-tags"></i> {l s='Nueva Experiencia' mod='matisses'} </div>
        <div class="form-wrapper">
          <div class="form-group">
            <label class="control-label col-lg-3 required"> <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title=""> Nombre </span> </label>
            <div class="col-lg-9 ">
              <input type="text" id="name_1" name="name_1" class="copy2friendlyUrl" value="" onkeyup="if (isArrowKey(event)) return ;updateFriendlyURL();" required="required" style="cursor: auto; background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABHklEQVQ4EaVTO26DQBD1ohQWaS2lg9JybZ+AK7hNwx2oIoVf4UPQ0Lj1FdKktevIpel8AKNUkDcWMxpgSaIEaTVv3sx7uztiTdu2s/98DywOw3Dued4Who/M2aIx5lZV1aEsy0+qiwHELyi+Ytl0PQ69SxAxkWIA4RMRTdNsKE59juMcuZd6xIAFeZ6fGCdJ8kY4y7KAuTRNGd7jyEBXsdOPE3a0QGPsniOnnYMO67LgSQN9T41F2QGrQRRFCwyzoIF2qyBuKKbcOgPXdVeY9rMWgNsjf9ccYesJhk3f5dYT1HX9gR0LLQR30TnjkUEcx2uIuS4RnI+aj6sJR0AM8AaumPaM/rRehyWhXqbFAA9kh3/8/NvHxAYGAsZ/il8IalkCLBfNVAAAAABJRU5ErkJggg==&quot;); background-attachment: scroll; background-position: 100% 50%; background-repeat: no-repeat;">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-lg-3"> {l s='Activo' mod='matisses'} </label>
            <div class="col-lg-9 "> <span class="switch prestashop-switch fixed-width-lg">
              <input type="radio" name="active" id="active_on" value="1" checked="checked">
              <label for="active_on">Sí</label>
              <input type="radio" name="active" id="active_off" value="0">
              <label for="active_off">No</label>
              <a class="slide-button btn"></a> </span> </div>
          </div>
          
          <div class="form-group">
            <label class="control-label col-lg-3"> <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="													Subir logo de la categoría desde su computadora
												"> Imagen </span> </label>
            <div class="col-lg-9 ">
              <div class="form-group">
                <div class="col-sm-6">
                  <input id="image" type="file" name="image" class="hide">
                  <div class="dummyfile input-group"> <span class="input-group-addon"><i class="icon-file"></i></span>
                    <input id="image-name" type="text" name="filename" readonly="">
                    <span class="input-group-btn">
                    <button id="image-selectbutton" type="button" name="submitAddAttachments" class="btn btn-default"> <i class="icon-folder-open"></i> Añadir archivo </button>
                    </span> </div>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-lg-3"> <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="													Caracteres inválidos <>;=#{}
												"> Meta-título </span> </label>
            <div class="col-lg-9 ">
              <textarea name="meta_title_1" class=" textarea-autosize" style="overflow: hidden; word-wrap: break-word; resize: none; height: 44px;"></textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-lg-3"> <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="													Caracteres inválidos <>;=#{}
												"> Meta descripción </span> </label>
            <div class="col-lg-9 ">
              <textarea name="meta_description_1" class=" textarea-autosize" style="overflow: hidden; word-wrap: break-word; resize: none; height: 44px;"></textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-lg-3"> <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="													Para agregar &amp;quot;etiquetas&amp;quot;, haga clic en el campo, escriba algo y presione &amp;quot;Enter&amp;quot;&amp;nbsp;Caracteres inválidos <>;=#{}
												"> Meta palabras clave </span> </label>
            <div class="col-lg-9 ">
              <input type="text" id="meta_keywords_1" name="meta_keywords_1" class=" tagify" value="" onkeyup="if (isArrowKey(event)) return ;updateFriendlyURL();" style="display: none;">
              <div class="tagify-container">
                <input type="text" placeholder="Añadir etiqueta">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-lg-3 required"> <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="													Sólo está permitidos los caracteres alfanuméricos, los guiones medio (-) y bajo  (_).
												"> URL amigable </span> </label>
            <div class="col-lg-9 ">
              <input type="text" id="link_rewrite_1" name="link_rewrite_1" class="" value="" onkeyup="if (isArrowKey(event)) return ;updateFriendlyURL();" required="required">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-lg-3"> <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="													Marque todos los grupos de clientes que usted desea que tengan acceso a esta categoría.
												"> Acceso de grupo </span> </label>
            <div class="col-lg-9 ">
              <div class="row">
                <div class="col-lg-6">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th class="fixed-width-xs"> <span class="title_box">
                          <input type="checkbox" name="checkme" id="checkme" onclick="checkDelBoxes(this.form, 'groupBox[]', this.checked)">
                          </span> </th>
                        <th class="fixed-width-xs"><span class="title_box">ID</span></th>
                        <th> <span class="title_box"> Nombre del grupo </span> </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><input type="checkbox" name="groupBox[]" class="groupBox" id="groupBox_1" value="1" checked="checked"></td>
                        <td>1</td>
                        <td><label for="groupBox_1">Visitante</label></td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="groupBox[]" class="groupBox" id="groupBox_2" value="2" checked="checked"></td>
                        <td>2</td>
                        <td><label for="groupBox_2">Invitado</label></td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="groupBox[]" class="groupBox" id="groupBox_3" value="3" checked="checked"></td>
                        <td>3</td>
                        <td><label for="groupBox_3">Cliente</label></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="alert alert-info">
                <h4>En este momento tiene tres grupos por defecto.</h4>
                <p><b>Visitante</b> - Todas las personas sin una cuenta de cliente o visitantes anónimos.<br>
                  <b>Invitado</b> - Cliente que hizo un pedido con cuenta de invitado<br>
                  <b>Cliente</b> - Todas las personas que crearon una cuenta en esta tienda.</p>
              </div>
            </div>
          </div>
        </div>
        <!-- /.form-wrapper -->
        
        <div class="panel-footer">
          <button type="submit" value="1" id="category_form_submit_btn" name="submitAddcategoryAndBackToParent" class="btn btn-default pull-right"> <i class="process-icon-save"></i> Guardar </button>
          <a href="index.php?controller=AdminCategories&amp;token=1e7343fd6454887ac638390deb62c1cc" class="btn btn-default" onclick="window.history.back();"> <i class="process-icon-cancel"></i> Cancelar </a> </div>
      </div>
    </form>
  </div>
</div>
