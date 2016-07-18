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
                    <h1>{l s='Asociar Categorías'}</h1>
                    {foreach from=$allCategories item=category}
                    <div class="col-lg-12">
                        <div class="col-lg-3">
                            <label for="ctg{$category.id_category}">
                                {l s='Categoría #'}&nbsp;{$category.id_category}<br><strong>{$category.name}</strong>
                            </label>
                        </div>
                        <div class="col-lg-9">
                            <div class="form-group">
                                <label for="txtCtg{$category.id_category}">
                                    {l s='Código SAP:'}&nbsp;
                                </label>
                                <input id="txtCtg{$category.id_category}" name="txtCtg{$category.id_category}" type="text">
                            </div>
                        </div>
                        <hr>
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