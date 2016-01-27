{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}
    <a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">
        {l s='My account'}
    </a>
    <span class="navigation-pipe">
        {$navigationPipe}
    </span>
    <span class="navigation_page">
        {l s='Your personal information'}
    </span>
{/capture}
<div class="box personal-data grid_12 alpha omega">
    <h1 class="page-heading">Ajustes de cuenta</h1>
    <h2 class="page-subheading"> {l s='Your personal information'} </h2>

    {include file="$tpl_dir./errors.tpl"}
    {if isset($confirmation) && $confirmation}
        <p class="alert alert-success">
            {l s='Your personal information has been successfully updated.'}
            {if isset($pwd_changed)}<br />{l s='Your password has been sent to your email:'} {$email}{/if}
        </p>
    {else}
        <p class="info-title">
            {l s='Please be sure to update your personal information if it has changed.'}
        </p>
        <p class="required">
            <sup>*</sup>{l s='Required field'}
        </p>
        <form action="{$link->getPageLink('identity', true)|escape:'html':'UTF-8'}" method="post" class="std">
            <fieldset>

                <div class="form-group grid_12">
                    <label>{l s='Social title'}</label>
                    
                    {foreach from=$genders key=k item=gender}
                        <div class="radio-inline">
                            <label for="id_gender{$gender->id}" class="top">
                            <input type="radio" name="id_gender" id="id_gender{$gender->id}" value="{$gender->id|intval}" {if isset($smarty.post.id_gender) && $smarty.post.id_gender == $gender->id}checked="checked"{/if} />
                            {$gender->name}</label>
                        </div>
                    {/foreach}
                </div>

                <div class="required form-group grid_6">
                    <label for="firstname" class="required">
                        {l s='First name'}
                    </label>
                    <input class="is_required validate form-control" data-validate="isName" type="text" id="firstname" name="firstname" value="{$smarty.post.firstname}" />
                </div>

                <div class="required form-group grid_6">
                    <label for="secondname" class="required">
                        {l s='Second name'}
                    </label>
                    <input class="is_required validate form-control" data-validate="isName" type="text" name="secondname" id="secondname" value="{$smarty.post.secondname}" />
                </div>

                <div class="required form-group grid_6">
                    <label for="lastname" class="required">
                        {l s='Last name'}
                    </label>
                    <input class="is_required validate form-control" data-validate="isName" type="text" name="lastname" id="lastname" value="{$smarty.post.lastname}" />
                </div>


                 <div class="required form-group grid_6">
                    <label for="surname" class="required">
                        {l s='Second Lastname'}
                    </label>
                    <input class="is_required validate form-control" data-validate="isName" type="text" name="surname" id="surname" value="{$smarty.post.surname}" />
                </div>

                 <div class="required form-group grid_6">
                    <label for="surname" class="required">
                        {l s='Cédula'}
                    </label>
                    <input class="is_required validate form-control" data-validate="isName" type="text" max="11" maxlength="11" name="charter" id="charter" value="{$smarty.post.charter}" />
                </div>


                <div class="required form-group grid_6">
                    <label for="email" class="required">
                        {l s='E-mail address'}
                    </label>
                    <input class="is_required validate form-control" data-validate="isEmail" type="email" name="email" id="email" value="{$smarty.post.email}" />
                </div>

                <div class="form-group">
                    <label>
                        {l s='Date of Birth'}
                    </label>
                    <div class="row">
                        <div class="col-xs-4">
                            <select name="days" id="days" class="form-control">
                                <option value="">-</option>
                                {foreach from=$days item=v}
                                    <option value="{$v}" {if ($sl_day == $v)}selected="selected"{/if}>{$v}&nbsp;&nbsp;</option>
                                {/foreach}
                            </select>

                        </div>
                        <div class="col-xs-4">
                            <select id="months" name="months" class="form-control">
                                <option value="">-</option>
                                {foreach from=$months key=k item=v}
                                    <option value="{$k}" {if ($sl_month == $k)}selected="selected"{/if}>{l s=$v}&nbsp;</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-xs-4">
                            <select id="years" name="years" class="form-control">
                                <option value="">-</option>
                                {foreach from=$years item=v}
                                    <option value="{$v}" {if ($sl_year == $v)}selected="selected"{/if}>{$v}&nbsp;&nbsp;</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                </div>
                <div class="required form-group grid_6">
                    <label for="old_passwd" class="required">
                        {l s='Current Password'}
                    </label>
                    <input class="is_required validate form-control" type="password" data-validate="isPasswd" name="old_passwd" id="old_passwd" />
                </div>
                <div class="password form-group grid_6">
                    <label for="passwd">
                        {l s='New Password'}
                    </label>
                    <input class="is_required validate form-control" type="password" data-validate="isPasswd" name="passwd" id="passwd" />
                </div>
                <div class="password form-group grid_6">
                    <label for="confirmation">
                        {l s='Confirmation'}
                    </label>
                    <input class="is_required validate form-control" type="password" data-validate="isPasswd" name="confirmation" id="confirmation" />
                </div>

                <div class="form-group required grid_6">
                    <!--
                    <div class="checkbox grid_12">
                        <input type="checkbox" name="newsletter" id="newsletter" value="1" {if isset($smarty.post.newsletter) AND $smarty.post.newsletter == 1} checked="checked"{/if} />
                        <label for="newsletter">{l s='Sign up for our newsletter!'}</label>
                    </div>
                    <div class="checkbox grid_12">
                        <input type="checkbox" name="optin" id="optin" value="1" {if isset($smarty.post.optin) AND $smarty.post.optin == 1} checked="checked"{/if} />
                        <label for="optin">{l s='Receive special offers from our partners!'}</label>
                    </div>
                    -->
                        <label for="medio">{l s='Medio por el cual desea ser contactado'}  <sup>*</sup></label>
                            <select id="medio" name="medio" class="form-control">
                                <option {if isset($smarty.post.medio) && $smarty.post.medio == "{l s='SMS'}"} selected {/if} value="{l s='SMS'}">{l s='SMS'}</option>
                                <option {if isset($smarty.post.medio) && $smarty.post.medio == "{l s='Email'}"} selected {/if} value="{l s='Email'}">{l s='Email'}</option>
                                <option {if isset($smarty.post.medio) && $smarty.post.medio == "{l s='Telefónico'}"} selected {/if} value="{l s='Telefónico'}">{l s='Telefónico'}</option>
                                <option {if isset($smarty.post.medio) && $smarty.post.medio == "{l s='Correo físico'}"} selected {/if} value="{l s='Correo físico'}">{l s='Correo físico'}</option>
                            </select>
                </div>
                {if $newsletter}
                    <div class="checkbox grid_12">
                        <label for="newsletter">
                            <input type="checkbox" id="newsletter" name="newsletter" value="1" {if isset($smarty.post.newsletter) && $smarty.post.newsletter == 1} checked="checked"{/if}/>
                            {l s='Sign up for our newsletter!'}
                        </label>
                    </div>
                    <div class="checkbox grid_12">
                        <label for="optin">
                            <input type="checkbox" name="optin" id="optin" value="1" {if isset($smarty.post.optin) && $smarty.post.optin == 1} checked="checked"{/if}/>
                            {l s='Receive special offers from our partners!'}
                        </label>
                    </div>
                {/if}
			{if $b2b_enable}
				<h2 class="page-subheading">
					{l s='Your company information'}
				</h2>
				<div class="form-group grid_12">
					<label for="">{l s='Company'}</label>
					<input type="text" class="form-control" id="company" name="company" value="{if isset($smarty.post.company)}{$smarty.post.company}{/if}" />
				</div>
				<div class="form-group grid_12">
					<label for="siret">{l s='SIRET'}</label>
					<input type="text" class="form-control" id="siret" name="siret" value="{if isset($smarty.post.siret)}{$smarty.post.siret}{/if}" />
				</div>
				<div class="form-group grid_12">
					<label for="ape">{l s='APE'}</label>
					<input type="text" class="form-control" id="ape" name="ape" value="{if isset($smarty.post.ape)}{$smarty.post.ape}{/if}" />
				</div>
				<div class="form-group grid_12">
					<label for="website">{l s='Website'}</label>
					<input type="text" class="form-control" id="website" name="website" value="{if isset($smarty.post.website)}{$smarty.post.website}{/if}" />
				</div>
			{/if}
            </fieldset>
        </form> <!-- .std -->
    {/if}
</div>

    <div class="grid_12 alpha omega">
        <p id="security_informations">
        {l s='[Insert customer data privacy clause here, if applicable]'}
        </p>
    </div>
    <div class="footer_links grid_12 alpha omega">
        <ul class="cf">
            <li>
                <button type="submit" name="submitIdentity" class="btn btn-default btn-red">
                    {l s='Save'}
                </button>
            </li>
        	<li>
                <a class="btn btn-default btn-red" href="{$link->getPageLink('my-account', true)}">
                    <i class="fa fa-chevron-left"></i>{l s='Back to your account'}
                </a>
            </li>
        </ul>
    </div>
