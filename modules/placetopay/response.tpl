<pre style="display:none">{$transaction|print_r}</pre>
{if $status eq 'ok'}
	<h2>{l s='Completed payment' mod='placetopay'}</h2>
	<p>{l s='Estimado cliente, se aprobó el pago gracias por su compra.' mod='placetopay'}</p>
{elseif $status eq 'fail'}
	<h2 style="color:red">{l s='Failed payment' mod='placetopay'}</h2>
	<p>{l s='We\'re sorry. Your payment has not been completed. You can try again or choose another payment method.' mod='placetopay'}</p>
{elseif $status eq 'rejected'}
	<h2 style="color:red">{l s='Rejected payment' mod='placetopay'}</h2>
	<p>{l s='We\'re sorry. Your payment has not been completed. You can try again or choose another payment method.' mod='placetopay'}</p>
{elseif $status eq 'pending'}
	<h2>{l s='Pending payment' mod='placetopay'}</h2>
	<p>{l s='Estimado cliente, su pago está siendo validado en la pasarela de pago, una vez que este proceso se haya completado será informado de la operación.' mod='placetopay'}</p>
{/if}
<br/>
<table border="0" cellpadding="1">
<tr valign="top">
	<td>{l s='NIT' mod='placetopay'}</td>
	<td><b>{$companyDocument}</b></td>
</tr>
<tr valign="top">
	<td>{l s='Company Name' mod='placetopay'}</td>
	<td><b>{$companyName}</b></td>
</tr>
<tr valign="top">
	<td>{l s='Order No.' mod='placetopay'}</td>
	<td><b>{$objOrder->id}</b></td>
</tr>
{if $objOrder->id != $transaction['id_order']}
<tr valign="top">
	<td>{l s='Reference' mod='placetopay'}</td>
	<td><b>{$transaction['id_order']}</b></td>
</tr>
{/if}
<tr valign="top">
	<td>{l s='Payment description' mod='placetopay'}</td>
	<td><b>{$paymentDescription}</b></td>
</tr>
<tr valign="top">
	<td>{l s='Payer name' mod='placetopay'}</td>
	<td><b>{$payerName|default:""}</b></td>
</tr>
<tr valign="top">
	<td>{l s='Payer email' mod='placetopay'}</td>
	<td><b>{$payerEmail|default:""}</b></td>
</tr>
{if !empty($transaction['ipaddress'])}
<tr valign="top">
	<td>{l s='IP Address' mod='placetopay'}</td>
	<td><b>{$transaction['ipaddress']}</b></td>
</tr>
{/if}
<tr valign="top">
	<td>{l s='Transaction date' mod='placetopay'}</td>
	<td><b>{$transaction['date']}</b></td>
</tr>
{if $transaction['franchise'] eq "_PSE_"}
<tr valing="top">
    <td>{l s='status' mod='placetopay'}</td>
    <td>
        {if $status eq 'ok'}
            <p>{l s='Transacción aprobada' mod='placetopay'}</p>
        {elseif $status eq 'fail'}
            <p>{l s='Transacción fallida' mod='placetopay'}</p>
        {elseif $status eq 'rejected'}
            <p>{l s='Transacción rechazada' mod='placetopay'}</p>
        {elseif $status eq 'pending'}
            <p>{l s='Transacción pendiente' mod='placetopay'}</p>
        {/if}
    <td>
</tr>
<tr valign="top">
	<td>{l s='Motivo' mod='placetopay'}</td>
	<td><b>{$transaction['reason_description']}</b></td>
</tr>
{else}
<tr valign="top">
	<td>{l s='Status' mod='placetopay'}</td>
	<td><b>{$transaction['reason']} - {$transaction['reason_description']}</b></td>
</tr>
{/if}
<tr valign="top">
	<td>{l s='Total amount' mod='placetopay'}</td>
	<td><b>COP{displayPrice price=$transaction['amount']}</b></td>
</tr>
<tr valign="top">
	<td>{l s='Tax' mod='placetopay'}</td>
	<td><b>COP{displayPrice price=$transaction['tax']}</b></td>
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
</table>
<br/>
<p>{l s='If you have any question please contact us on our phone' mod='placetopay'} {$storePhone}
{l s='or using our email' mod='placetopay'} {mailto address=$storeEmail}</p>
<br/>
<p class="ax-printPago"><a href='javascript:window.print()' class="btnPrint btn btn-default btn-red"><!--<img src="{$placetopayImgUrl}b_print.png" alt="{l s='Print' mod='placetopay'}" width="32" height="32" border="0" />--><i class="fa fa-print"></i>{l s='Print' mod='placetopay'}</a></p>
<br/>