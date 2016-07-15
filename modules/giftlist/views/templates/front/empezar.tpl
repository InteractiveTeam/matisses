{capture name=path}
<span class="bread">{l s='Lista de regalos' mod='giftlist'}</span>
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}
<h1>{l s='Lista de regalos' mod='giftlist'}</h1>
<div class="ax-img-cont">
   <div class="ax-imagen-introduction" style="background-image: url('{$modules_dir}/giftlist/views/img/banner.jpg')" width=1110" heigth="253"/></div>
    <p class="ax-text-description-lista">{l s='Bienvenido a la Lista de regalos Matisses, el espacio donde podrás crear fácilmente y con total libertad tus deseos para tu boda, cumpleaños, nuevo apartamento o lo que se te pueda ocurrir. Elige complementos para tu hogar, muebles, decorativos y todo lo que encuentres en nuestro completo catálogo de productos.' mod='giftlist'}</p>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="ax-text-result-list">
        <h3>{l s='Qué es lista de regalos matisses' mod='giftlist'}</h3>
        </div>
        <p class="ax-cont-tab">{l s='Lista de regalos Matisses te permite elegir entre todos los productos que tenemos en nuestro amplio catálogo de productos para compartirla con tus invitados, ellos podrán elegir de tu lista lo que quieren regalarte, pagar en línea y nosotros te lo entregamos en el lugar que elijas, también podrás activar las Gift Card, para comprar lo que más te guste.' mod='giftlist'}</p>
    </div>
    <div class="col-md-6">
        <div class="ax-text-result-list">
        <h3>{l s='Crear lista de regalos' mod='giftlist'}</h3>
        </div>
        <div class="ax-cont-tab">
        <p>{l s='Lo primero es completar tu información personal, puedes añadir a una persona que te ayude a crear tu lista ideal, puedes darle tu estilo personal cargando imágenes de perfil y portada e incluir una bienvenida a tu lista. Te guiaremos paso a paso.' mod='giftlist'}</p>
        <a href="{$create_link}" class="btn btn-default btn-lista-regalos">{l s='Empezar' mod='giftlist'}</a>
        </div>
    </div>
</div
><div class="row">
    <div class="col-md-6 ax-search-home">
       <div class="ax-text-result-list">
        <h3>{l s='Buscar' mod='giftlist'}</h3>
        </div>
        <div class="ax-cont-tab">
            <p>{l s='Encuentra una lista de regalos existente de tu amigo o familiar, puedes buscar por Nombre y Apellido del creador o co-creador de la lista, o también puedes encontrarlo con el código de la lista. Las listas privadas solamente pueden ser encontradas con el código.' mod='giftlist'}</p>
            <div class="row ax-form-lista-deseos">
            <form id="ax-buscar" action="{$search_link}" method="post">
                <div class="row ax-form-data-search">
                    <span><label for="name">Nombre</label><input type="text" class="form-control" name="name" id="name"/></span>
                    <span><label for="lastname">Apellido</label><input type="text" class="form-control" name="lastname" id="lastname"/></span>
                    <span><label for="code">Código</label><input type="text" class="form-control code" name="code" id="code"/></span>
                    <button class="btn btn-default button btn-lista-regalos">{l s='Buscar' mod='giftlist'}</button>
                </div>
            </form>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="ax-text-result-list">
        <h3>{l s='Administrar' mod='giftlist'}</h3>
        </div>
        <div class="ax-cont-tab">
            <p>{l s='Si ya creaste una o varias listas de regalos, o eres co-creador de una, puedes administrarlas aquí.' mod='giftlist'}</p>
            <a href="{$gift_link}" class="btn btn-default btn-lista-regalos">{l s='Ingresar' mod='giftlist'}</a>
        </div>
    </div>
</div>