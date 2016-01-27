<table border="0" cellpadding="1">
<tr valign="top">
	<td>{l s='Status' mod='placetopay'}</td>
	<td><b>{$transaction['reason']} - {$transaction['reason_description']}</b></td>
</tr>
{if !empty($transaction['franchise_name'])}
<tr valign="top">
	<td>{l s='Franchise' mod='placetopay'}</td>
	<td><b>{$transaction['franchise_name']}</b></td>
</tr>
{/if}
{if !empty($transaction['bank'])}
<tr valign="top">
	<td>{l s='Bank name' mod='placetopay'}</td>
	<td><b>{$transaction['bank']}</b></td>
</tr>
{/if}
{if !empty($transaction['authcode'])}
<tr valign="top">
	<td>{l s='Authorization' mod='placetopay'}</td>
	<td><b>{$transaction['authcode']}</b></td>
</tr>
{/if}
{if !empty($transaction['receipt'])}
<tr valign="top">
	<td>{l s='Receipt' mod='placetopay'}</td>
	<td><b>{$transaction['receipt']}</b></td>
</tr>
{/if}
{if !empty($transaction['ipaddress'])}
<tr valign="top">
	<td>{l s='IP Address' mod='placetopay'}</td>
	<td><b>{$transaction['ipaddress']}</b></td>
</tr>
{/if}
</table>