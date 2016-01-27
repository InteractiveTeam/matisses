{*
 *  @author    Enrique Garcia M. <ingenieria@egm.co>
 *  @copyright (c) 2012 EGM Ingenieria sin fronteras S.A.S.
 *  @version   1.0
*}
<h4><img src="https://www.placetopay.com/images/providers/placetopay_xh48.png" alt="Place to Pay" height="48" /></h4>
<div><b>{l s='This module allows you to accept payments by Place to Pay.' mod='placetopay'}</b><br />
	<br />{l s='You need to configure your Place to Pay account before using this module.' mod='placetopay'}<br />
	<form enctype="multipart/form-data" method="post" action="{$actionURL}">
		<fieldset>
			<legend><img src="../img/admin/cog.gif" alt="{l s='Company data' mod='placetopay'}" />{l s='Company data' mod='placetopay'}</legend>
			<label for="companydocument">{l s='Company ID' mod='placetopay'}</label>
			<div class="margin-form">
				<input type="text" id="companydocument" name="companydocument" value="{$companydocument}" width="120" />
			</div>
			<hr class="clear" />
			<label for="companyname">{l s='Company Name' mod='placetopay'}</label>
			<div class="margin-form">
				<input type="text" id="companyname" name="companyname" value="{$companyname}" width="120" />
			</div>
			<hr class="clear" />
			<label for="description">{l s='Payment description' mod='placetopay'}</label>
			<div class="margin-form">
				<input type="text" id="description" name="description" value="{$description}" width="120" />
			</div>
			<hr class="clear" />
		</fieldset>
		<fieldset>
			<legend><img src="../img/admin/cog.gif" alt="{l s='Configuration' mod='placetopay'}" />{l s='Configuration' mod='placetopay'}</legend>
			<label for="gpgpath">{l s='GPG Program path' mod='placetopay'}</label>
			<div class="margin-form">
				<input type="text" id="gpgpath" name="gpgpath" value="{$gpgpath}" width="60" />
			</div>
			<hr class="clear" />
			<label for="gpghomedir">{l s='GPG Home directory' mod='placetopay'}</label>
			<div class="margin-form">
				<input type="text" id="gpghomedir" name="gpghomedir" value="{$gpghomedir}" width="60" />
			</div>
			<hr class="clear" />
			<label for="gpgkeyid">{l s='GPG Merchant KeyID' mod='placetopay'}</label>
			<div class="margin-form">
				{html_options id="gpgkeyid" name="gpgkeyid" options=$keylist selected=$gpgkeyid}
			</div>
			<hr class="clear" />
			<label for="gpgpasswd">{l s='GPG KeyID Passphrase' mod='placetopay'}</label>
			<div class="margin-form">
				<input type="text" id="gpgpasswd" name="gpgpasswd" value="{$gpgpasswd}" width="20" />
			</div>
			<hr class="clear" />
			<label for="gpgrecipientkeyid">{l s='GPG PlacetoPay KeyID' mod='placetopay'}</label>
			<div class="margin-form">
				{html_options id="gpgrecipientkeyid" name="gpgrecipientkeyid" options=$keylist selected=$gpgrecipientkeyid}
			</div>
			<hr class="clear" />
			<label for="customersiteid">{l s='Merchant Site ID' mod='placetopay'}</label>
			<div class="margin-form">
				<input type="text" id="customersiteid" name="customersiteid" value="{$customersiteid}" width="30" />
			</div>
			<hr class="clear" />
			<label for="stockreinject">{l s='Reinject stock on declination?' mod='placetopay'}</label>
			<div class="margin-form">
				<select id="stockreinject" name="stockreinject">
					<option value="1" {if $stockreinject eq '1'}selected="selected"{/if}>{l s='Yes' mod='placetopay'}</option>
					<option value="0" {if $stockreinject ne '1'}selected="selected"{/if}>{l s='No' mod='placetopay'}</option>
				</select>
			</div>
			<hr class="clear" />
			<div class="margin-form">
				<input type="submit" value="{l s='Update configuration' mod='placetopay'}" name="submitPlacetoPayConfiguraton" class="button" />
			</div>
		</fieldset>
	</form>
	<div style="clear:both;">&nbsp;</div>
</div>