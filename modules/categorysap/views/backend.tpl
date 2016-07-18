<form id="form1" name="form1" method="post" class="form-inline" action="">
    <div class="panel">
        <div class="panel-heading">
            <h3>
               <i class="icon-cogs"></i>
               {$displayName}
            </h3>
        </div>
        <div class="form-wrapper">
            <div class="form-group">
                <div class="col-lg-10">
                    <h2 class="text-uppercase">{l s='Asociar Categorías'}</h2>
                    {foreach from=$allCategories item=category}
                    <div class="col-lg-12">
                        <label for="ctg{$category.id_category}">
                            {l s='Categoría #'}{$category.id_category}&nbsp;<strong>{$category.name}</strong> | {l s='Código SAP:'}&nbsp;
                        </label>
                        <input id="txtCtg{$category.id_category}" name="txtCtg{$category.id_category}" type="text">
                    </div>
                    {/foreach}
                </div>
                <div class="col-lg-12">
                    <input  name="updateCodes" class="button" type="submit" value="{l s='Save'}" />
                </div>
            </div>
        </div>
    </div>
</form>