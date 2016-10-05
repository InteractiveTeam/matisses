<?php
/**
 * Modulo para el procesamiento de pagos a traves de PlacetoPay.
 * @author    Enrique Garcia M. <ingenieria@egm.co>
 * @copyright (c) 2012-2013 EGM Ingenieria sin fronteras S.A.S.
 * @since     Miercoles, Abril 4, 2012
 * @version   $Id: placetopay.php,v 1.0.7 2013-03-13 09:17:32 ingenieria Exp $
 */

// verifica que el modulo solo sea cargado dentro de una instancia de prestashop
if (!defined('_PS_VERSION_'))
	exit;

class PlacetoPay extends PaymentModule
{
	protected $gpgPath;
	protected $gpgHomeDir;
	protected $gpgKeyID;
	protected $gpgPassphrase;
	protected $gpgRecipientKeyID;
	protected $customerSiteID;

	/**
	 * Inicializa los datos del modulo y carga las variables de configuracion
	 */
	public function __construct()
	{
		$this->name = 'placetopay';
		$this->version = '1.0.5';
		$this->author = 'EGM Ingenieria sin fronteras S.A.S.';
		$this->tab = 'payments_gateways';

		// no se requiere una instancia de la clase cuando se muestra en modulos
		$this->need_instance = 0;

		// obtiene los datos de configuracion y los carga en la clase
		$config = Configuration::getMultiple(array(
			'PLACETOPAY_GPGPATH','PLACETOPAY_GPGHOMEDIR',
			'PLACETOPAY_KEYID','PLACETOPAY_PASSPHRASE',
			'PLACETOPAY_RECIPIENTKEYID','PLACETOPAY_CUSTOMERSITEID',
		));
		if (isset($config['PLACETOPAY_GPGPATH']))
			$this->gpgPath = $config['PLACETOPAY_GPGPATH'];
		if (isset($config['PLACETOPAY_GPGHOMEDIR']))
			$this->gpgHomeDir = $config['PLACETOPAY_GPGHOMEDIR'];
		if (isset($config['PLACETOPAY_KEYID']))
			$this->gpgKeyID = $config['PLACETOPAY_KEYID'];
		if (isset($config['PLACETOPAY_PASSPHRASE']))
			$this->gpgPassphrase = $config['PLACETOPAY_PASSPHRASE'];
		if (isset($config['PLACETOPAY_RECIPIENTKEYID']))
			$this->gpgRecipientKeyID = $config['PLACETOPAY_RECIPIENTKEYID'];
		if (isset($config['PLACETOPAY_CUSTOMERSITEID']))
			$this->customerSiteID = $config['PLACETOPAY_CUSTOMERSITEID'];

		// invoca el constructor de la clase padre
		parent::__construct();

		// carga la clase del conector
		require_once(dirname(__FILE__) . '/EGM/PlacetoPay.class.php');

		// establece los datos para la visualizacion del modulo
		$this->displayName = $this->l('Place to Pay');
		$this->description = $this->l('Accept payments by credit cards and debits account');
	}

	/**
	 * Muestra a PlacetoPay como uno de los medios de pagos disponibles en el checkout
	 *
	 * @param array $params
	 * @return string
	 */
	public function hookPayment($params)
	{
		global $smarty;
		//Controller::addJqueryPlugin('fancybox'); 
		Tools::addJs($this->_path.'/placetopay.js');
		
		// aborta si el medio no esta activo
		if (!$this->active)
			return;

		// si el medio no esta propiamente configurado aborta
		if (empty($this->gpgPath)
			|| empty($this->gpgHomeDir)
			|| empty($this->gpgKeyID)
			|| empty($this->gpgPassphrase)
			|| empty($this->gpgRecipientKeyID)
			|| empty($this->customerSiteID))
			return;

		// obtiene la última operación pendiente
		$pending = $this->getLastPendingTransaction($params['cart']->id_customer);
		if (!empty($pending))
			$smarty->assign(array(
				'hasPending' => true,
				'lastOrder' => $pending['id_order'],
				'lastAuthorization' => $pending['authcode'],
				'storePhone' => Configuration::get('PS_SHOP_PHONE'),
				'storeEmail' => Configuration::get('PS_SHOP_EMAIL')
			));
		else
			$smarty->assign('hasPending', false);

		// muestra la opción de medio de pago
		return $this->display(__FILE__, 'placetopay.tpl');
	}

	/**
	 * Bloque a visualizar cuando se retorna con el pago
	 * @array $params
	 * @return string
	 */
	public function hookPaymentReturn($params)
	{
		global $smarty;
		
#		echo "<pre>Post ";print_r($_POST); echo "</pre>";
#		echo "<pre>Get ";print_r($_POST); echo "</pre>";
	
		
		if ((!$this->active) || ($params['objOrder']->module != $this->name))
			return ;

		// provee a la plantilla de la informacion
		$transaction = $this->getTransactionInformation($params['objOrder']->id_cart);
		$cart = new Cart((int)$params['objOrder']->id_cart);
		$totalAmount = (float)($cart->getOrderTotal(true, Cart::BOTH));
		$taxAmount = $totalAmount - (float)($cart->getOrderTotal(false, Cart::BOTH));
		$transaction['tax'] = $taxAmount;

		$smarty->assign('transaction', $transaction);
		switch($transaction['status']) {
			case PlacetoPayConnector::P2P_APPROVED:
			case PlacetoPayConnector::P2P_DUPLICATE:
				$webservice 			= $transaction;
				$webservice['status'] 	= 'ok';  
				Hook::exec('actionPaymentProccess', $webservice);
				$smarty->assign('status', 'ok');
				break;
			case PlacetoPayConnector::P2P_ERROR:
				$webservice 			= $transaction;
				$webservice['status'] 	= 'fail';  
				Hook::exec('actionPaymentProccess', $webservice);
				$smarty->assign('status', 'fail');
				break;
			case PlacetoPayConnector::P2P_DECLINED:
				$webservice 			= $transaction;
				$webservice['status'] 	= 'rejected';  
				Hook::exec('actionPaymentProccess', $webservice);
				$smarty->assign('status', 'rejected');
				break;
			case PlacetoPayConnector::P2P_PENDING:
				$webservice 			= $transaction;
				$webservice['status'] 	= 'pending';  
				Hook::exec('actionPaymentProccess', $webservice);
				$smarty->assign('status', 'pending');
				break;
		}
		$smarty->assign($params);
		$smarty->assign('companyDocument', Configuration::get('PLACETOPAY_COMPANYDOCUMENT'));
		$smarty->assign('companyName', Configuration::get('PLACETOPAY_COMPANYNAME'));
		$smarty->assign('paymentDescription', sprintf(Configuration::get('PLACETOPAY_DESCRIPTION'), $transaction['id_order']));
		$smarty->assign('storePhone', Configuration::get('PS_SHOP_PHONE'));
		$smarty->assign('storeEmail', Configuration::get('PS_SHOP_EMAIL'));

		// obtiene los datos del cliente
		$customer = new Customer((int)($params['objOrder']->id_customer));
		if (Validate::isLoadedObject($customer)) {
			$smarty->assign('payerName', $customer->firstname . ' ' . $customer->lastname);
			$smarty->assign('payerEmail', $customer->email);
		}
		
		// asocia la ruta base donde encuentra las imagenes
		$smarty->assign('placetopayImgUrl', _MODULE_DIR_.$this->name.'/img/');

		return $this->display(__FILE__, 'response.tpl');
	}

	public function hookAdminOrder($params)
	{
		global $smarty;

		// provee a la plantilla de la informacion
		$transaction = $this->getTransactionInformation(null, $params['id_order']);
		$smarty->assign('transaction', $transaction);

		// genera el HTML
		$html = '<br />
			<fieldset style="width:400px;">
			<legend><img src="'._MODULE_DIR_.$this->name.'/logo.gif" alt="" />' . $this->l('Place to Pay') . '</legend>' .
			$this->display(__FILE__, 'detail.tpl') .
			'</fieldset>';
		return $html;
	}

	public function hookOrderDetailDisplayed($params)
	{
		global $smarty;

		// provee a la plantilla de la informacion
		$transaction = $this->getTransactionInformation($params['order']->id_cart);
		$smarty->assign('transaction', $transaction);

		// genera el HTML
		$html = '<ul style="height: 164.4px;" class="address item">
				<li class="address_title">' . $this->l('Place to Pay') . '</li>
				<li>' . $this->display(__FILE__, 'detail.tpl') . '</li>
			</ul>
			<br style="clear:both">';
		return $html;
	}

	/**
	 * Muestra un resumen del valor a pagar y espera la confirmación del usuario
	 * @return string
	 */
	public function displayPaymentResume(Cart $cart)
	{
		global $smarty;

		// aborta si no esta activo
		if (!$this->active) return;

		// obtiene la última operación pendiente
		$pending = $this->getLastPendingTransaction($cart->id_customer);
		if (!empty($pending))
			$smarty->assign(array(
				'hasPending' => true,
				'lastOrder' => $pending['id_order'],
				'lastAuthorization' => $pending['authcode'],
				'storePhone' => Configuration::get('PS_SHOP_PHONE'),
				'storeEmail' => Configuration::get('PS_SHOP_EMAIL')
			));
		else
			$smarty->assign('hasPending', false);

		// muestra la plantilla con el resumen del pago
		$smarty->assign(array(
			'nbProducts' => $cart->nbProducts(),
			'totalAmount' => $cart->getOrderTotal(true, Cart::BOTH),
		));
		return $this->display(__FILE__, 'payment.tpl');
	}

	/**
	 * Genera la trama que requiere PlacetoPay y redirige el flujo hacia la plataforma
	 *
	 * @param Cart $cart
	 */
	public function redirect(Cart $cart)
	{
		// obtiene algunos datos de la orden
		$customer = new Customer((int)($cart->id_customer));
		$currency = new Currency((int)($cart->id_currency));
		$invoiceAddress = new Address((int)($cart->id_address_invoice));
		$deliveryAddress = new Address((int)($cart->id_address_delivery));
		$language = new Language((int)($cart->id_lang));
		$totalAmount = (float)($cart->getOrderTotal(true, Cart::BOTH));
		$taxAmount = $totalAmount - (float)($cart->getOrderTotal(false, Cart::BOTH));

		// verifica que los objetos se hayan cargado
		if (!Validate::isLoadedObject($customer)
			|| !Validate::isLoadedObject($invoiceAddress)
			|| !Validate::isLoadedObject($deliveryAddress)
			|| !Validate::isLoadedObject($currency))
			die($this->l('Place to Pay error: (invalid address or customer)'));

		// recupera otra informacion relacionada con la orden
		$invoiceCountry = new Country((int)($invoiceAddress->id_country));
		$invoiceState = null;
		if ($invoiceAddress->id_state)
			$invoiceState = new State((int)($invoiceAddress->id_state));
		$deliveryCountry = new Country((int)($deliveryAddress->id_country));
		$deliveryState = null;
		if ($deliveryAddress->id_state)
			$deliveryState = new State((int)($deliveryAddress->id_state));

		// construye la URL de retorno para la tienda
		$returnURL = Configuration::get('PS_SHOP_DOMAIN_SSL');
		if (!$returnURL) $returnURL = Tools::getHttpHost();
		$returnURL = (Configuration::get('PS_SSL_ENABLED') ? 'https://' : 'http://')
			. $returnURL
			. __PS_BASE_URI__
			. 'modules/placetopay/process.php';

		// carga la clase de soporte de placetopay
		$p2p = new PlacetoPayConnector();
		$p2p->setGPGProgramPath($this->gpgPath);
		$p2p->setGPGHomeDirectory($this->gpgHomeDir);
		$p2p->setOverrideReturn($returnURL);
		$p2p->setLanguage($language->iso_code);
		$p2p->setCurrency($currency->iso_code);
		$p2p->setPayerInfo('CC', $customer->charter,
			utf8_decode($customer->firstname . ' ' . $customer->lastname),
			$customer->email,
			utf8_decode($invoiceAddress->address1 . "\n" . $invoiceAddress->address2),
			utf8_decode($invoiceAddress->city),
			(empty($invoiceState) ? null: $invoiceState->name),
			//$invoiceCountry->iso_code,
			'CO',
			$invoiceAddress->phone,
			$invoiceAddress->phone_mobile);

		$p2p->setBuyerInfo(null, null,
			utf8_decode($deliveryAddress->firstname . ' ' . $deliveryAddress->lastname),
			null,
			utf8_decode($deliveryAddress->address1 . "\n" . $deliveryAddress->address2),
			utf8_decode($deliveryAddress->city),
			(empty($deliveryState) ? null: utf8_decode($deliveryState->name)),
			//$deliveryCountry->iso_code,
			'CO',
			$deliveryAddress->phone,
			$deliveryAddress->phone_mobile);

		// genera la URL a la cual redirigir el pago
		$paymentURL = $p2p->getPaymentRedirect(
			$this->gpgKeyID,
			$this->gpgPassphrase,
			$this->gpgRecipientKeyID,
			$this->customerSiteID,
			$cart->id, $totalAmount, $taxAmount, 0);
			
		echo $paymentURL;	
		

		// genera la orden en prestashop, si no se generó la URL
		// crea la orden con el error, al menos para que quede asentada

		if (empty($paymentURL)) {
			$orderMessage = $p2p->getErrorMessage();
			$orderStatus = Configuration::get('PS_OS_ERROR');
			$status = PlacetoPayConnector::P2P_ERROR;
			$totalAmount = 0;
		} else {
			$orderMessage = null;
			$orderStatus = Configuration::get('PS_OS_PLACETOPAY');
			$status = PlacetoPayConnector::P2P_PENDING;
		}

	// genera la orden en prestashop
		$this->validateOrder($cart->id,
		$orderStatus,
		$totalAmount,
		$this->displayName,
		$orderMessage,
		null,
		null,
		false,
		$cart->secure_key);
		// inserta la transacción en la tabla de PlacetoPay
		$this->insertTransaction($cart->id, $cart->id_currency, $totalAmount, $status, $orderMessage);

		// genera la redirección al estado de la orden si no se pudo generar la URL
		if (empty($paymentURL)) {
			$order = new Order($this->currentOrder);
			$paymentURL = __PS_BASE_URI__.'order-confirmation.php'
				.'?id_cart='.$cart->id
				.'&id_module='.$this->id
				.'&id_order='.$this->currentOrder
				.'&key='.$order->secure_key;
		}
		
		Tools::redirectLink($paymentURL);

	}

	/**
	 * Procesa la respuesta de pago dada por la plataforma
	 * @param array $data
	 */
	public function process($data)
	{
		// valida que se provean los datos desde la plataforma
		// y que el identificador de sitio sea el configurado
		if (empty($data)
			|| empty($data['CustomerSiteID'])
			|| empty($data['PaymentResponse'])
			|| ($data['CustomerSiteID'] != $this->customerSiteID))
			return;

		// procesa la respuesta
		$p2p = new PlacetoPayConnector();
		$p2p->setGPGProgramPath($this->gpgPath);
		$p2p->setGPGHomeDirectory($this->gpgHomeDir);
		$rc = $p2p->getPaymentResponse(
			$this->gpgKeyID,
			$this->gpgPassphrase,
			$data['PaymentResponse']);

		// si la respuesta fue de error y el código es de GPG
		// informelo al log de eventos del PHP y aborte
		if (($rc == PlacetoPayConnector::P2P_ERROR)
			&& ($p2p->getErrorCode() == 'GPG')) {
			error_log($p2p->getErrorMessage(), 0);
			return;
		}

		// obtiene la orden basado en la referencia, si no se halla
		// la orden aborta
		$orderID = Order::getOrderByCartId((int)$p2p->getReference());
		if (!$orderID)
			die(Tools::displayError());
		$order = new Order($orderID);
		if (!Validate::isLoadedObject($order))
			die(Tools::displayError());

		// asienta la operacion
		$this->settleTransaction($rc, $order, $p2p);

		// redirige el flujo a la pagina de confirmación de orden
		Tools::redirectLink($paymentURL = __PS_BASE_URI__.'order-confirmation.php'
			.'?id_cart='.$p2p->getReference()
			.'&id_module='.$this->id
			.'&id_order='.$order->id
			.'&key='.$order->secure_key
		);
	}

	private function settleTransaction($rc, Order $order, PlacetoPayConnector $p2p)
	{
		// si ya habia sido aprobada no vuelva a reprocesar
		if ($order->getCurrentState() != (int)Configuration::get('PS_OS_PAYMENT')) {
			// procese la respuesta y dependiendo del tipo de respuesta
			switch($rc) {
				case PlacetoPayConnector::P2P_ERROR:
				case PlacetoPayConnector::P2P_DECLINED:
					if ($order->getCurrentState() == (int)Configuration::get('PS_OS_ERROR'))
						return;

					// genera un nuevo estado en la orden de declinación
					$history = new OrderHistory();
					$history->id_order = (int)($order->id);
					$history->changeIdOrderState(Configuration::get('PS_OS_ERROR'), $history->id_order);
					$history->addWithemail();
					$history->save();

					// obtiene los productos de la orden, los recorre y vuelve a recargar las cantidades
					// en el inventario
					if (Configuration::get('PLACETOPAY_STOCKREINJECT') == '1') {
						$products = $order->getProducts();
						foreach($products as $product) {
							$orderDetail = new OrderDetail((int)($product['id_order_detail']));
							Product::reinjectQuantities($orderDetail, $product['product_quantity']);
						}
					}
					break;
				case PlacetoPayConnector::P2P_DUPLICATE:
				case PlacetoPayConnector::P2P_APPROVED:
					// genera un nuevo estado en la orden de aprobación
					$history = new OrderHistory();
					$history->id_order = (int)($order->id);
					$history->changeIdOrderState(Configuration::get('PS_OS_PAYMENT'), $history->id_order);
					$history->addWithemail();
					$history->save();
					break;
				case PlacetoPayConnector::P2P_PENDING:
					break;
			}

			// actualiza la tabla de PlacetoPay con la información de la transacción
			$this->updateTransaction($rc, $p2p);
		}
	}

	/**
	 * Muestra la página de configuración del módulo
	 */
	public function getContent()
	{
		// asienta la configuración y genera cualquier salida
		$html = $this->savePlacetoPayConfiguration();

		// muestra el formulario para la configuración de PlacetoPay
		$html .= $this->displayPlacetoPayConfiguration();
		return $html;
	}

	/**
	 * Instala el módulo de placetopay, registra los procesos a los cuales
	 * se enlaza y crea la tabla donde se registra la información
	 *
	 * @return bool
	 */
	public function install()
	{
		// genera la tabla con datos adicionales de la operacion
		// permite acceder al modulo desde la factura
		// hace al modulo disponible en el proceso de pago
		// permite al modulo cambiar los contenidos del retorno
		if (!parent::install()
			|| !$this->createPlacetoPayTable()
			|| !$this->createPlacetoPayOrderState()
			|| !$this->registerHook('payment')
			|| !$this->registerHook('paymentReturn')
			|| !$this->registerHook('adminOrder')
			|| !$this->registerHook('orderDetailDisplayed'))
			return false;

		// supone algunas rutas
		$gnuProgramFile = strstr(PHP_OS, 'WIN') ?
			'C:\Program Files (x86)\GNU\GnuPG\gpg.exe':
			(file_exists('/usr/local/bin/gpg') ? '/usr/local/bin/gpg': '/usr/bin/gpg');
		$gnuHomeDir = _PS_ROOT_DIR_ . '/config/.gnupg';

		// define las variables requeridas por el módulo
		Configuration::updateValue('PLACETOPAY_COMPANYDOCUMENT', '');
		Configuration::updateValue('PLACETOPAY_COMPANYNAME', '');
		Configuration::updateValue('PLACETOPAY_DESCRIPTION', 'Pago en PlacetoPay - %s');
		Configuration::updateValue('PLACETOPAY_GPGPATH', $gnuProgramFile);
		Configuration::updateValue('PLACETOPAY_GPGHOMEDIR', $gnuHomeDir);
		Configuration::updateValue('PLACETOPAY_KEYID', '');
		Configuration::updateValue('PLACETOPAY_PASSPHRASE', '');
		Configuration::updateValue('PLACETOPAY_RECIPIENTKEYID', '');
		Configuration::updateValue('PLACETOPAY_CUSTOMERSITEID', '');
		Configuration::updateValue('PLACETOPAY_STOCKREINJECT', '1');

		// crea la carpeta donde guarda las llaves del keyring
		if (!is_dir($gnuHomeDir))
			mkdir($gnuHomeDir);

		return true;
	}

	/**
	 * Desinstala el modulo, eliminando las variables de configuracion
	 * generadas, NO se elimina la tabla con el historico y el nuevo estado creado
	 *
	 * @retun bool
	 */
	public function uninstall()
	{
		// elimina los parametros de configuracion generados por el modulo
		Configuration::deleteByName('PLACETOPAY_COMPANYDOCUMENT');
		Configuration::deleteByName('PLACETOPAY_COMPANYNAME');
		Configuration::deleteByName('PLACETOPAY_DESCRIPTION');
		Configuration::deleteByName('PLACETOPAY_GPGPATH');
		Configuration::deleteByName('PLACETOPAY_GPGHOMEDIR');
		Configuration::deleteByName('PLACETOPAY_KEYID');
		Configuration::deleteByName('PLACETOPAY_PASSPHRASE');
		Configuration::deleteByName('PLACETOPAY_RECIPIENTKEYID');
		Configuration::deleteByName('PLACETOPAY_CUSTOMERSITEID');
		Configuration::deleteByName('PLACETOPAY_STOCKREINJECT');

		return parent::uninstall();
	}

	/**
	 * Valida y almacena la información de configuración de PlacetoPay
	 */
	private function savePlacetoPayConfiguration()
	{
		if (!Tools::isSubmit('submitPlacetoPayConfiguraton')) return;

		$errors = array();

		// almacena los datos de la compañía
		Configuration::updateValue('PLACETOPAY_COMPANYDOCUMENT', Tools::getValue('companydocument'));
		Configuration::updateValue('PLACETOPAY_COMPANYNAME', Tools::getValue('companyname'));
		Configuration::updateValue('PLACETOPAY_DESCRIPTION', Tools::getValue('description'));

		// el comportamiento del inventario ante una transacción fallida o declinada
		Configuration::updateValue('PLACETOPAY_STOCKREINJECT', (Tools::getValue('stockreinject') == '1' ? '1': '0'));

		// valida si la ruta del GPG existe
		if ((Tools::getValue('gpgpath') == NULL) || !file_exists(Tools::getValue('gpgpath'))) {
			$errors[] = $this->l('GPG program path invalid.');
		} else
			Configuration::updateValue('PLACETOPAY_GPGPATH', Tools::getValue('gpgpath'));

		// verifica que la ruta de las llaves exista y sea escribible
		if ((Tools::getValue('gpghomedir') == NULL)
			|| !file_exists(Tools::getValue('gpghomedir'))
			|| !is_writable(Tools::getValue('gpghomedir'))) {
			$errors[] = $this->l('GPG Home directory is invalid or can not be writable.');
		} else
			Configuration::updateValue('PLACETOPAY_GPGHOMEDIR', Tools::getValue('gpghomedir'));

		// verifica que se hayan establecido los datos de llave
		if (Tools::getValue('gpgkeyid') == NULL)
			$errors[] = $this->l('Key ID must be set.');
		else
			Configuration::updateValue('PLACETOPAY_KEYID', Tools::getValue('gpgkeyid'));
		if (Tools::getValue('gpgpasswd') == NULL)
			$errors[] = $this->l('Key Passphrase must be set.');
		else
			Configuration::updateValue('PLACETOPAY_PASSPHRASE', Tools::getValue('gpgpasswd'));
		if (Tools::getValue('gpgrecipientkeyid') == NULL)
			$errors[] = $this->l('Recipient Key ID must be set.');
		else
			Configuration::updateValue('PLACETOPAY_RECIPIENTKEYID', Tools::getValue('gpgrecipientkeyid'));
		if ((Tools::getValue('customersiteid') == NULL)
			|| (!$this->isGUID(Tools::getValue('customersiteid'))))
			$errors[] = $this->l('Customer Site ID must be set.');
		else
			Configuration::updateValue('PLACETOPAY_CUSTOMERSITEID', Tools::getValue('customersiteid'));

		// genera el volcado de errores
		if (!empty($errors)) {
			$error_msg = '';
			foreach ($errors as $error)
				$error_msg .= $error . '<br />';
			return $this->displayError($error_msg);
		} else
			return $this->displayConfirmation($this->l('Place to Pay settings updated'));
	}

	/**
	 * Genera el formulario para la configuración de PlacetoPay
	 * @return string
	 */
	private function displayPlacetoPayConfiguration()
	{
		global $smarty;
		
		// genera la lista de llaves
		$keyList = array();
		$gpgHomeDir = Configuration::get('PLACETOPAY_GPGHOMEDIR');
		$gpgProgramPath = Configuration::get('PLACETOPAY_GPGPATH');
		if (!empty($gpgProgramPath)
			&& !empty($gpgHomeDir)
			&& file_exists($gpgProgramPath)
			&& is_dir($gpgHomeDir)) {
			// instancia la clase del GnuPG para obtener las llaves en el keyring
			$gpg = new egmGnuPG($gpgProgramPath, $gpgHomeDir);
			$keys = $gpg->ListKeys('public');
			if (!empty($keys)) {
				foreach($keys as $key)
					$keyList[$key['KeyID']] = $key['UserID'];
			}
		}
		$smarty->assign(array(
			'actionURL' => Tools::safeOutput($_SERVER['REQUEST_URI']),
			'keylist' => $keyList,
			'companydocument' => Configuration::get('PLACETOPAY_COMPANYDOCUMENT'),
			'companyname' => Configuration::get('PLACETOPAY_COMPANYNAME'),
			'description' => Configuration::get('PLACETOPAY_DESCRIPTION'),
			'stockreinject' => Configuration::get('PLACETOPAY_STOCKREINJECT'),
			'gpgpath' => $gpgProgramPath,
			'gpghomedir' => $gpgHomeDir,
			'gpgkeyid' => Configuration::get('PLACETOPAY_KEYID'),
			'gpgpasswd' => Configuration::get('PLACETOPAY_PASSPHRASE'),
			'gpgrecipientkeyid' => Configuration::get('PLACETOPAY_RECIPIENTKEYID'),
			'customersiteid' => Configuration::get('PLACETOPAY_CUSTOMERSITEID'),
		));
		return $this->display(__FILE__, 'setting.tpl');
	}

	/**
	 * Determina si el identificador pasado parece un guid
	 * @param string $guid
	 * @return bool
	 */
	private function isGUID($guid)
	{
		if (preg_match('/\{[0-9a-z]{8}(\-[0-9a-z]{4}){3}\-[0-9a-z]{12}\}/i', $guid))
			return true;
		else
			return false;
	}

	private function getTransactionInformation($cartID, $orderID = null)
	{
		$result = Db::getInstance()->ExecuteS('SELECT * FROM `'._DB_PREFIX_.'payment_placetopay`
			WHERE `id_order` = ' . (empty($cartID)
			? '(SELECT `id_cart` FROM `'._DB_PREFIX_.'orders` WHERE `id_order` = ' . $orderID . ')'
			: $cartID));
		if (!empty($result)) {
			$result = $result[0];
			if (empty($result['reason_description'])) {
				$result['reason_description'] = ($result['reason'] == '?-') ? $this->l('Processing transaction'): $this->l('No information');
			}
		}
		return $result;
	}

	private function insertTransaction($orderID, $currencyID, $amount, $status, $message)
	{
		$reason = ($status == PlacetoPayConnector::P2P_ERROR) ? '?C': '?-';
		Db::getInstance()->Execute('
			INSERT INTO `'._DB_PREFIX_.'payment_placetopay` (`id_order`, `id_currency`, `date`, `amount`, `status`, `reason`, `reason_description`, `conversion`, `ipaddress`)
			VALUES ('.$orderID.','.$currencyID.',\''.date('Y-m-d H:i:s').'\','.$amount.','.$status.',\''.$reason.'\',\''.pSQL($message).'\',1,\'' . pSQL($_SERVER['REMOTE_ADDR']) . '\')');
	}

	private function updateTransaction($status, PlacetoPayConnector $p2p)
	{
		Db::getInstance()->Execute('
			UPDATE `'._DB_PREFIX_.'payment_placetopay` SET
				`date` = \'' . pSQL(date('Y-m-d H:i:s' , ($p2p->getTransactionDate()) ? strtotime($p2p->getTransactionDate()): time())) . '\',
				`status` = ' . $status . ',
				`reason` = \'' . pSQL($p2p->getErrorCode()) . '\',
				`reason_description` = \'' . pSQL($p2p->getErrorMessage()) . '\',
				`franchise` = \'' . pSQL($p2p->getFranchise()) . '\',
				`franchise_name` = \'' . pSQL($p2p->getFranchiseName()) . '\',
				`bank` = \'' . pSQL($p2p->getBankName()) . '\',
				`credit_card` = \'' . $p2p->getCreditCardNumber() . '\',
				`authcode` = \'' . pSQL($p2p->getAuthorization()) . '\',
				`receipt` = \'' . pSQL($p2p->getReceipt()) . '\',
				`conversion` = ' . $p2p->getPlatformConversionFactor() . '
			WHERE `id_order` = ' . $p2p->getReference());
	}

	/**
	 * Obtiene la última transacción pendiente de pago utilizando el medio
	 * @return array
	 */
	private function getLastPendingTransaction($customerID)
	{
		$result = Db::getInstance()->ExecuteS('SELECT p.`id_order`, p.`authcode` FROM `'._DB_PREFIX_.'payment_placetopay` p
			INNER JOIN `'._DB_PREFIX_.'orders` o ON o.id_cart = p.id_order
			WHERE o.`id_customer` = ' . $customerID . ' AND p.`status` = ' . PlacetoPayConnector::P2P_PENDING . ' LIMIT 1');
		if (!empty($result))
			$result = $result[0];
		return $result;
	}

	/**
	 * Busca las transacciones que estan pendientes de ser resueltas
	 * @param int $minutes
	 */
	public function sonda($minutes = 10)
	{
		// busca las operaciones que estan pendientes de resolver
		// que tienen una antiguedad superior a n minutos
		$result = Db::getInstance()->ExecuteS('SELECT * FROM `'._DB_PREFIX_.'payment_placetopay`
			WHERE `date` < \'' . date('Y-m-d H:i:s', time() - $minutes * 60) . '\' AND `status` = ' . PlacetoPayConnector::P2P_PENDING);
		
		if(empty($result))
			echo "NO encontre pedidos aun<br>";	
			
		if (!empty($result)) {
			foreach($result as $row) {
				$currency = new Currency((int)$row['id_currency']);

				// busca la operación en PlacetoPay
				$p2p = new PlacetoPayConnector();
				$rc = $p2p->queryPayment($this->customerSiteID, $row['id_order'], $currency->iso_code, $row['amount']);
				if (($rc == PlacetoPayConnector::P2P_ERROR) && ($p2p->getErrorCode() == 'HTTP')) {
					// no se realiza ninguna actualizacion, debido a que hay un error
					// en el consumo del webservice
					$params['status'] 			= 'fail'; 
					$params['id_order']  		=  $row['id_order'];
					$params['receipt']   		=  $row['amount'];
					$params['franchise_name']	=  $row['franchise_name'];
					Hook::exec('actionPaymentProccess',$params);
					error_log($p2p->getErrorMessage(), 0);
				} else {
					$orderID = Order::getOrderByCartId((int)$row['id_order']);
					if ($orderID) {
						$order = new Order($orderID);
						if (Validate::isLoadedObject($order))
						{
							$params['status'] 			= ($rc == 2 || $rc = 0 ? 'fail' : 'ok'); 
							$params['id_order']  		=  $row['id_order'];
							$params['receipt']   		=  $row['amount'];
							$params['franchise_name']	=  $row['franchise_name'];						
							Hook::exec('actionPaymentProccess',$params);
							$this->settleTransaction($rc, $order, $p2p);
							
						}
					}
				}
			}
		}
	}

	/**
	 * Crea la tabla en la cual se almacena informacion adicional de la transaccion,
	 * es generada en el proceso de instalacion
	 * @return bool
	 */
	private function createPlacetoPayTable()
	{
		$db = Db::getInstance();
		$sql = "CREATE TABLE IF NOT EXISTS `"._DB_PREFIX_."payment_placetopay` (
				`id_payment` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
				`id_order` INT UNSIGNED NOT NULL,
				`id_currency` INT UNSIGNED NOT NULL,
				`date` DATETIME NULL,
				`amount` DECIMAL(10,2) NOT NULL,
				`status` TINYINT NOT NULL,
				`reason` VARCHAR(2) NULL,
				`reason_description` VARCHAR(255) NULL,
				`franchise` VARCHAR(5) NULL,
				`franchise_name` VARCHAR(128) NULL,
				`bank` VARCHAR(128) NULL,
				`authcode` VARCHAR(12) NULL,
				`receipt` VARCHAR(12) NULL,
				`conversion` DOUBLE,
				`ipaddress` VARCHAR(15) NULL,
				INDEX `id_orderIX` (`id_order`)
			) ENGINE = " . _MYSQL_ENGINE_;
		$db->Execute($sql);
		return true;
	}

	/**
	 * Crea un estado para las ordenes procesadas con PlacetoPay en espera de respuesta
	 * @return bool
	 */
	private function createPlacetoPayOrderState()
	{
		// genera un nuevo estado de la orden, el pendiente de autorizacion en PlacetoPay
		if (!Configuration::get('PS_OS_PLACETOPAY')) {
			$orderState = new OrderState();
			$orderState->name = array();
			foreach (Language::getLanguages() AS $language)
			{
				switch(strtolower($language['iso_code'])) {
					case 'en':
						$orderState->name[$language['id_lang']] = 'Awaiting ' . $this->displayName . ' payment confirmation';
						break;
					case 'es':
						$orderState->name[$language['id_lang']] = 'En espera de confirmación de pago por '.$this->displayName;
						break;
					case 'fr':
						$orderState->name[$language['id_lang']] = 'En attente du paiement par '.$this->displayName;
						break;
					default:
						$orderState->name[$language['id_lang']] = 'En espera de confirmación de pago por '.$this->displayName;
						break;
				}
			}
			$orderState->color = 'lightblue';
			$orderState->hidden = false;
			$orderState->logable = false;
			$orderState->invoice = false;
			$orderState->delivery = false;
			$orderState->send_email = false;
			$orderState->unremovable = true;
			if ($orderState->save()) {
				Configuration::updateValue('PS_OS_PLACETOPAY', $orderState->id);
				copy(_PS_MODULE_DIR_.$this->name.'/logo.gif', _PS_IMG_DIR_.'os/'.$orderState->id.'.gif');
			} else
				return false;
		}
		return true;
	}
}
