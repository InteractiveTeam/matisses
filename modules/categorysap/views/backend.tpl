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
                <div class="col-lg-8">
                    {foreach from=$allCategories item=category}
                    <div class="form-group">
                        <label for="txtCtg{$category.id_category}">
                            {$category.name}
                        </label>
                        <input id="txtCtg{$category.id_category}" type="text" value="{$category.id_category}">
                    </div>
                    {/foreach}
                </div>
                <div class="col-lg-4">
                    2
                </div>
            </div>
        </div>
    </div>
</form>