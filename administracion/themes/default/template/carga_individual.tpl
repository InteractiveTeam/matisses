<div class="bootstrap">
   <div class="alert">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <span></span>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">{l s='Carga individual' mod='matisses'}</h3>
                </div>
                <div class="panel-body">
                    <form method="post">
                        <div class="form-group">                    
                            <label class="control-label col-lg-3 required"> <span >{l s='Modelo' mod='matisses'}</span> </label>
                            <div class="col-lg-9 ">
                               <textarea id="txt_models" name="modelo" placeholder="{l s='Modelo' mod='matisses'}"></textarea>
                            </div>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Enviar" onclick="return updateProduct();"> 
                    </form>                
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function updateProduct(){
        var data = document.getElementById('txt_models');
        
        var http = new XMLHttpRequest(),
            url = "/modules/matisses/productos.php",
            params = "modelo="+data.value;
        
        http.open("POST", url, true);

        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        http.onreadystatechange = function() {
            if(http.readyState == 4 && http.status == 200) {
                var str = http.responseText;
                var el = document.querySelectorAll(".alert span");
                data.value = '';                
                if(str.match(/NO MODELS/g)){
                    el[0].innerText = 'Algunas de los modelos no existe.';
                    el[0].parentNode.className += " alert-danger";
                }else if(str.match(/PRODUCTOS A CARGAR = 0/g)){                    
                    el[0].innerText = 'Algunas de las referencias no se actualizaron.';
                    el[0].parentNode.className += " alert-danger";
                } else{
                    el[0].innerText = 'Actualización exitosa';
                    el[0].parentNode.className += " alert-success";
                }
            }
        }
        
        http.send(params);
        
        return false;
    }
    
</script>