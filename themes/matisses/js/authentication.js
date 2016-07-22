/*
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
*/
var userToken = {};

$(document).ready(function(){
    
    validateToken();
    
	$(document).on('submit', '#create-account_form', function(e){
		e.preventDefault();
        validateEmailSap($('#email_create').val());
		//submitFunction();
	});
	$('.is_customer_param').hide();

});

function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
    vars[key] = value;
    });
    return vars;
}

function removeParam(key, sourceURL) {
    var rtn = sourceURL.split("?")[0],
        param,
        params_arr = [],
        queryString = (sourceURL.indexOf("?") !== -1) ? sourceURL.split("?")[1] : "";
    if (queryString !== "") {
        params_arr = queryString.split("&");
        for (var i = params_arr.length - 1; i >= 0; i -= 1) {
            param = params_arr[i].split("=")[0];
            if (param === key) {
                params_arr.splice(i, 1);
            }
        }
        rtn = rtn + "?" + params_arr.join("&");
    }
    return rtn;
}

function validateToken() {
    var token = getUrlVars()["skey"];
    
    if(token) {
        
        $.ajax({
            type: 'POST',
            url: baseUri+'modules/registerwithsap/validatetoken.php',
            cache: false,
            async: true,
            dataType : "json",
            data: 
            {
                token: token
            },
            success: function(data)
            {
                if (data.token.exits) {
                    userToken = data.token.user;
                    submitFunction(data.token.user.email);
                } else {
                    $('#create_account_error').html('<ol><li>La clave ha expirado.</li></ol>').show();
                }
            },
            error: function(data)
            {
                console.log(data);
            }
        });
    }
}

function validateEmailSap(email) {
    
    $('#create_account_error').html('').hide();	
    $('#successNotification').empty();
    
    $.ajax({
		type: 'POST',
		url: baseUri+'modules/registerwithsap/validatewithsap.php',
		async: true,
		cache: false,
		dataType : "json",
		data: 
		{
			email: email
		},
		success: function(jsonData)
		{
			if (jsonData.trueProcess.response) {
                $('#successNotification').html('<div class="alert alert-success"><li>Hemos enviado un link de verificación a tu correo</li></div></br>').show();   
            } 
            else if (jsonData.failSend.response) {
                console.log('Error al enviar el correo'+jsonData);
                submitFunction(email);
            }
            else if (jsonData.errorToken.response) {
                console.log('Error al generar la clave'+jsonData);
                submitFunction(email);
            }
            else if (jsonData.notExistSap.response) {
                submitFunction(email);
            }
            else if (jsonData.emailFalse.response) {
                $('#create_account_error').html('<ol><li>El correo no es válido</li></ol>').show();
            } else {
                console.log('Error general'+jsonData);
                submitFunction(email);
            }
		},
		error: function(data)
		{
			console.log(data);
            submitFunction(email);
		}
	});
}

function submitFunction(email)
{
	$('#create_account_error').html('').hide();	

	$.ajax({
		type: 'POST',
		url: baseUri,
        async: true,
		cache: false,
		dataType : "json",
		data: 
		{
			controller: 'authentication',
			SubmitCreate: 1,
			ajax: true,
			email_create: email,
			back: $('input[name=back]').val(),
			token: token
		},
		success: function(jsonData)
		{
			if (jsonData.hasError) 
			{
				var errors = '';
				for(error in jsonData.errors)
					//IE6 bug fix
					if(error != 'indexOf')
						errors += '<li>' + jsonData.errors[error] + '</li>';
				$('#create_account_error').html('<ol>' + errors + '</ol>').show();
			}
			else
			{
				// adding a div to display a transition
				$('#center_column').html('<div id="noSlide">' + $('#center_column').html() + '</div>');
				$('#noSlide').fadeOut('slow', function()
				{
					$('#noSlide').html(jsonData.page);                    
					$(this).fadeIn('slow', function()
					{
						if (typeof bindUniform !=='undefined')
							bindUniform();
						if (typeof bindStateInputAndUpdate !=='undefined')
							bindStateInputAndUpdate();
						document.location = '#account-creation';
					});
                    
                    if (userToken) {
                        setTimeout(function(){
                            if (userToken.gender) { 
                                $('#noSlide .radio-inline').find('#uniform-id_gender'+userToken.gender+' span').addClass('checked');
                            }
                            if (userToken.names) { 
                                $('#noSlide #customer_firstname').val(userToken.names.split(' ')[0]); 
                                $('#noSlide #customer_secondname').val(userToken.names.split(' ')[1]);
                            }
                            if (userToken.id) { 
                                $('#noSlide #customer_charter').val(userToken.id.split('CL')[0]);
                            }
                            if (userToken.lastName1) { 
                                $('#noSlide #customer_lastname').val(userToken.lastName1);
                            }
                            if (userToken.lastName2) { 
                                $('#noSlide #customer_surname').val(userToken.lastName2);
                            }
                            if (userToken.email) { 
                                $('#noSlide #email').val(userToken.email);
                            }
                            
                            if (userToken.birthDate) {
                                var birthdate = userToken.birthDate.split('-');
                                var months = {01 : 'Enero', 02: 'Febrero',  03: 'Marzo',
                                              04: 'Abril',  05: 'Mayo',     06: 'Junio', 
                                              07: 'Julio',  08: 'Agosto',   09: 'Septiembre', 
                                              10: 'Octubre',11: 'Noviembre',12: 'Diciembre'};
                                
                                $('#days option[value='+birthdate[2]+']').attr('selected','selected');
                                $("#days").trigger("chosen:updated");

                                $('#months option[value='+parseInt(birthdate[1])+']').attr('selected','selected');
                                $("#months").trigger("chosen:updated");

                                $('#years option[value='+birthdate[0]+']').attr('selected','selected');
                                $("#years").trigger("chosen:updated");                                
                            }
                            
                        }, 800);
                    }
				});
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown)
		{
			error = "TECHNICAL ERROR: unable to load form.\n\nDetails:\nError thrown: " + XMLHttpRequest + "\n" + 'Text status: ' + textStatus;
			if (!!$.prototype.fancybox)
			{
			    $.fancybox.open([
		        {
		            type: 'inline',
		            autoScale: true,
		            minHeight: 30,
		            content: "<p class='fancybox-error'>" + error + '</p>'
		        }],
				{
			        padding: 0
			    });
			}
			else
			    alert(error);
		}
	});
}