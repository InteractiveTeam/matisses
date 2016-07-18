<form id="form1" name="form1" method="post" action="">
    <div class="panel">
        <div class="panel-heading">
            <h3>
               <i class="icon-cogs"></i>
               {$displayName}
            </h3>
        </div>
        <div class="form-wrapper">
            <div class="form-group">
                <div class="col-lg-12">
                   <div class="text-center">
                       <h3>{l s='Asociar Categorías'}</h3>
                   </div>
                    {foreach from=$allCategories item=category}
                    <div class="form-group">
                        <label for="ctg{$category.id_category}">
                            {l s='Categoría #'}&nbsp;{$category.id_category}:&nbsp;<strong>{$category.name}</strong>
                        </label>
                        <label for="txtCtg{$category.id_category}">
                            {l s='Código SAP:'}&nbsp;
                        </label>
                        <input id="txtCtg{$category.id_category}" name="txtCtg{$category.id_category}" type="text">
                    </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</form>