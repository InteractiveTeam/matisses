
<li class="my-guaranties grid_12 alpha omega">
  <div class="header-account">
      <h2>{l s='mis garantías' mod='matisses'}</h2>
  </div>
    <div class="content-account grid_12">
        <div class="grid_2 dates-account">
            <img src="{$module_dir}img/account-garantias.png"/>
        </div>
        <div class="grid_4 dates-account">
            <h3>{l s='Estado de garantías' mod='matisses'}</h3>
            <p>{l s='Entérate de todo el proceso del estado de garantías.' mod='matisses'}</p>
            <div class="footer-account">
                <a class="btn btn-default btn-red " href="{$link->getModuleLink('matisses','garantias')}/estado" title="Ingresar"> {l s='Ingresar' mod='matisses'}</a>
            </div>
        </div>
        <div class="grid_5 dates-account">
            <h3>{l s='Iniciar nueva garantía' mod='matisses'}</h3>
            <p>{l s='Cuéntanos que sucede con el producto que compraste.' mod='matisses'}</p>
            <div class="footer-account">
                <a class="btn btn-default btn-red" href="{$link->getModuleLink('matisses','garantias')}/nueva" title="Ingresar"> {l s='Ingresar' mod='matisses'}</a>
            </div>
        </div>
    </div>
</li>
