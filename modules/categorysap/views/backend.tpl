<link rel="stylesheet" type="text/css" href="/modules/{$path}/css/backend.css"/>
<script type="text/javascript" src="/modules/{$path}/js/backend.js"></script>
<div class="toolbar-placeholder">
  <div class="toolbarBox toolbarHead" >
    <ul class="cc_button">
      <li> <a id="desc-module-new" class="toolbar_btn" href="#top_container" onclick="$('#Configuration').toggle(600)" title="{l s='Module Configuration'}"> <span class="process-icon-new-module"></span>
        <div>{l s='Module Configuration'}</div>
        </a> </li>
    </ul>
    <div class="pageTitle">
      <h3><span id="current_obj" style="font-weight: normal;"><img src="/modules/{$path}/logobig.png" width="32" height="32" /><span class="breadcrumb item-1">{$displayName}</span></span></h3>
    </div>
  </div>
</div>
<div class="toolbar-placeholder" id="Configuration">
  <div class="toolbarBox toolbarHead">
    <form id="form1" name="form1" method="post" action="">
    <table border="0">
      <tr>
        <td>{l s='Api key'} </td>
        <td>
            <select name="ApyKey" id="ApyKey" class="select">
                    <option>{l s='Choose the web service key'}</option>
                {foreach from=$ApyKey item=key}
                    <option {$key.selected} value="{$key.key}">{$key.key}</option>
                {/foreach}
          </select>
      </td>
      </tr>
       <tr>
        <td> {l s='Row number log'}</td>
        <td><input name="RowNumber" type="text" size="60" value="{$RowNumber}" /></td>
      </tr>
      <tr>
        <td> {l s='wsdl'}</td>
        <td><input name="url" type="text" size="60" value="{$UrlWs}" /></td>
      </tr>
     
      
	  <tr>
        <td> {l s='location'}</td>
        <td><input name="locationurl" type="text" size="60" value="{$locationurl}" /></td>
      </tr>
      <tr>
        <td> {l s='Time record (hours)'}</td>
        <td><input name="TimeRecord" type="text" size="60" value="{$TimeRecord}" /></td>
      </tr>
      <tr>
        <td> </td>
        <td> <input  name="updateCodes" class="button" type="submit" value="{l s='Save'}" /></td>
      </tr>
    </table>


     
    </form>
    <fieldset>
      <legend>{l s='Transaction log'}</legend>
      <table class="table" style="width:100%" cellpadding="0" cellspacing="0" >
          {if ($Log)}
              <tr>
                <th>{l s="date time"}</th>
                <th>{l s="object"}</th>
                <th>{l s="operation"}</th>
                <th>{l s="origen"}</th>
                <th>{l s="data"}</th>
                <th>{l s="response"}</th>
                <th>{l s="status"}</th>
                <th>{l s="error"}</th>
              </tr>
              {foreach from=$Log item=Logrow}
              <tr>
                <td>{$Logrow.register_date}</td>
                <td>{$Logrow.object}</td>
                <td>{$Logrow.operation}</td>
                <td>{$Logrow.origen}</td>
                <td align="center"><pre onclick="viewxml(this)" id="xml" style="font-size: 9px;max-height: 70px;overflow: auto; cursor:pointer" data-xml="{$Logrow.data}">{l s='Ver xml'}</pre></td>
                <td>{$Logrow.response}</td>
                <td>{if $Logrow.status} <img src="/modules/{$path}/no.png"/> {else} <img src="/modules/{$path}/yes.png"/> {/if}</td>
                <td>{$Logrow.error}</td>
              </tr>
              {/foreach}
          {else}
              <tr>
              <td>{l s='Not element in the list'}</td>
              </tr>
          {/if}
          
      </table>
    </fieldset>
  </div>
</div>
<script>
$(document).ready(function(){	
	viewxml = function (field)
	{
		$.fancybox('<textarea name="" cols="100" rows="50" style="border: none;">'+$(field).attr('data-xml')+'</textarea>');
	}
});
</script>