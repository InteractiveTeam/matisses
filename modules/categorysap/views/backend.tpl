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
            <div class="form-group">
                <div class="col-lg-12">
                    <h2 class="text-uppercase">{l s='Asociar Categorías'}</h2>
                    <div class="col-lg-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>{l s='Código SAP'}</th>
                            </tr> 
                        </thead>
                        <tbody>
                        {foreach from=$allCategories item=category}
                            <tr>
                                <td>
                                    {l s='Categoría N°'}{$category.id_category}
                                </td>
                                <td>
                                    <div class="form-group">
                                        <label for="txtCtg{$category.id_category}">
                                            {l s='Código SAP'}&nbsp;<strong style="text-transform: uppercase; color: #d7162f;">{$category.name}</strong>&nbsp;
                                        </label>
                                        <input id="txtCtg{$category.id_category}" name="txtCtg{$category.id_category}" type="text">
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