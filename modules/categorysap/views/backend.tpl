<form id="form1" name="form1" method="post" class="form-inline" action="">
    <div class="panel">
        <div class="panel-heading">
            <h3>
                &nbsp;
                <i class="icon-cogs"></i>
                {$displayName}
            </h3>
        </div>
        <div class="form-wrapper">
            <div class="col-lg-12">
                <h2 style="text-transform: uppercase;">{l s='Asociar Categorias'}</h2>
                    <div class="col-lg-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th><strong>#</strong></th>
                                <th><strong>{l s='Código SAP'}</strong></th>
                            </tr> 
                        </thead>
                        <tbody>
                        {foreach from=$allCategories item=category}
                            <tr>
                                <td>
                                    <strong>{l s='Categoría N°'}{$category.id_category}</strong>
                                </td>
                                <td>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="txtCtg{$category.id_category}">
                                                {l s='Código SAP'}&nbsp;<strong style="text-transform: uppercase; color: #d7162f;">{$category.name}</strong>&nbsp;
                                            </label>
                                            <input id="txtCtg{$category.id_category}" name="txtCtg{$category.id_category}" type="text">
                                        </div>
                                    </div>  
                                </td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>
            <div class="col-lg-12">
                <input  name="updateCodes" class="button" type="submit" value="{l s='Save'}" />
            </div>
        </div>
        </div>
    </div>
</form>