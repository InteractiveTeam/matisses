<?php
/**
 * Modulo para el procesamiento de pagos a traves de PlacetoPay.
 * @author    Enrique Garcia M. <ingenieria@egm.co>
 * @copyright (c) 2012-2013 EGM Ingenieria sin fronteras S.A.S.
 * @since     Miercoles, Abril 4, 2012
 * @version   $Id: sonda.php,v 1.0.2 2013-03-13 08:47:54 ingenieria Exp $
 */

// carga la configuracion de prestashop, 

include(realpath(dirname(__FILE__).'/../../config/config.inc.php'));
include(realpath(dirname(__FILE__).'/placetopay.php'));

// instancia el objeto link en el contexto si no viene inicializado
if (empty(Context::getContext()->link))
	Context::getContext()->link = new Link();

// instancia el componente de PlacetoPay y redirige al cliente a la plataforma
$placetopay = new PlacetoPay();
$placetopay->sonda(5);

$ddf = fopen('test.log','a');
fwrite($ddf,date('Y-m-d H:i:s')."\n");
fclose($ddf);