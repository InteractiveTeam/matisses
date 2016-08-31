<?php
/**
 * Modulo para el procesamiento de pagos a traves de PlacetoPay.
 * @author    Enrique Garcia M. <ingenieria@egm.co>
 * @copyright (c) 2012 EGM Ingenieria sin fronteras S.A.S.
 * @since     Miercoles, Abril 4, 2012
 */

// carga la configuracion de prestashop, 
include(dirname(__FILE__).'/../../config/config.inc.php');
include(dirname(__FILE__).'/../../init.php');
include(dirname(__FILE__).'/placetopay.php');

// si se ha cerrado la sesion retorna a la pagina de autenticacion
if (!$cookie->isLogged())
	Tools::redirect('authentication.php?back=order.php');

// instancia el componente de PlacetoPay y redirige al cliente a la plataforma
$placetopay = new PlacetoPay();
$placetopay->redirect($cart);