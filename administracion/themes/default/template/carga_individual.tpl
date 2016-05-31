<div class="bootstrap">
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
        var data = document.getElementById('txt_models').value;
        
        var http = new XMLHttpRequest(),
            url = "/modules/matisses/productos.php",
            params = "modelo="+data;
        
        http.open("POST", url, true);

        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        http.onreadystatechange = function() {
            if(http.readyState == 4 && http.status == 200) {
                console.log(http.responseText);
            }
        }
        http.send(params);
        
        return false;
    }
    
</script>