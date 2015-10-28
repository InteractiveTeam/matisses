<?php
/**
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
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
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2015 PrestaShop SA
* @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*/

/**
* This file will be removed in 1.6
*/

if (!defined('_PS_VERSION_'))
	exit;

class TwitterWidget extends Module
{
	public function __construct()
	{
	$this->name = 'twitterwidget';
	$this->tab = 'front_office_features';
	$this->version = '1.0.0';
	$this->author = 'prestapro.ru';
	$this->bootstrap = true;
	$this->need_instance = 0;
	$this->ps_versions_compliancy = array('min' => '1.5', 'max' => '1.6');

	parent::__construct();

	$this->displayName = $this->l('Twitter widget');
	$this->description = $this->l('Description of my module.');
	$this->confirmUninstall = $this->l('Are you sure you want to uninstall?');

	if (!Configuration::get('TWITTERWIDGET'))
	$this->warning = $this->l('No name provided');
	}
	public function install()
	{
		if (Shop::isFeatureActive())
		Shop::setContext( Shop::CONTEXT_ALL );

		return parent::install() && $this->registerHook( 'displayHomeCustom' ) && $this->registerHook( 'displayHeader' ) &&
	Configuration::updateValue('TWITTLOGIN', 'prestashop') && Configuration::updateValue('NUMBEROFTWITTS', '2');
	}
	public function uninstall()
	{
	return ( parent::uninstall() && Configuration::deleteByName('TWITTLOGIN') && Configuration::deleteByName('NUMBEROFTWITTS'));
	}
	public function getContent()
	{
		$output = null;

	if (Tools::isSubmit('submit'.$this->name))
	{
		$twittlogin = Tools::getValue('TWITTLOGIN');
	$numberoftwitts = Tools::getValue('NUMBEROFTWITTS');
		if (!$twittlogin || empty($twittlogin) || !Validate::isGenericName($twittlogin) || !Validate::isUnsignedInt($numberoftwitts))
			$output .= $this->displayError( $this->l('Be shure that you typed a login and count of twitts is numeric') );
		else
		{
			Configuration::updateValue('TWITTLOGIN', $twittlogin);
	Configuration::updateValue('NUMBEROFTWITTS', $numberoftwitts);
			$output .= $this->displayConfirmation($this->l('Settings updated'));
		}
	}
	return $output.$this->displayForm();
	}
	public function displayForm()
	{
	// Get default Language
	$default_lang = (int)Configuration::get('PS_LANG_DEFAULT');
	// Init Fields form array
	$this->fields_form[0]['form'] = array(
	'legend' => array(
			'title' => $this->l('Settings'),
		),
		'input' => array(
			array(
				'type' => 'text',
				'label' => $this->l('Your login in twitter'),
				'name' => 'TWITTLOGIN',
				'size' => 20,
				'required' => true
			),
		array(
				'type' => 'text',
				'label' => $this->l('Count of twitts at your site pages'),
				'name' => 'NUMBEROFTWITTS',
				'size' => 20,
				'required' => true
			)
		),
			'submit' => array(
			'title' => $this->l('Save'),
			'class' => 'button'
		)
	);
	$helper = new HelperForm();
	// Module, token and currentIndex
	$helper->module = $this;
//	$this->fields_form = array();
	$helper->name_controller = $this->name;
	$helper->token = Tools::getAdminTokenLite('AdminModules');
	$helper->currentIndex = AdminController::$currentIndex.'&configure='.$this->name;
	// Language
	$helper->default_form_language = $default_lang;
	$helper->allow_employee_form_lang = $default_lang;
	// Title and toolbar
	$helper->title = $this->displayName;
	$helper->show_toolbar = true;// false -> remove toolbar
	$helper->toolbar_scroll = true;// yes - > Toolbar is always visible on the top of the screen.
	$helper->submit_action = 'submit'.$this->name;
	$helper->toolbar_btn = array(
		'save' =>
		array(
			'desc' => $this->l('Save'),
			'href' => AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
			'&token='.Tools::getAdminTokenLite('AdminModules'),
		),
		'back' => array(
			'href' => AdminController::$currentIndex.'&token='.Tools::getAdminTokenLite('AdminModules'),
			'desc' => $this->l('Back to list')
		)
	);
	// Load current value
	$helper->fields_value['TWITTLOGIN'] = Configuration::get('TWITTLOGIN');
	$helper->fields_value['NUMBEROFTWITTS'] = Configuration::get('NUMBEROFTWITTS');

	return $helper->generateForm($this->fields_form);

	}

	public function hookDisplayHeader()
	{
	$this->context->controller->addCSS($this->_path.'views/css/twitterwidget.css', 'all');
	$this->context->controller->addJS($this->_path.'views/js/script.js', 'all');
	}

	public function hookDisplayHomeCustom()
	{
	require_once('twitterapiexchange.php');
	$twittlogin = Configuration::get('TWITTLOGIN');
	$numberoftwitts = Configuration::get('NUMBEROFTWITTS');
	/** Set access tokens here - see: https://dev.twitter.com/apps/ **/
	$settings = array(
		'oauth_access_token' => '1637742356-mHs4yqvPc1HewHwBXbJjcfBu311VbikxbFS621H',
		'oauth_access_token_secret' => 'dFT1aP5UAhT83YXExEsLjPeC2O7ll3z8rqazQ29y2PaUW',
		'consumer_key' => 'gsePCYETWAGG6YTvbbXWqpVZL',
		'consumer_secret' => 'zUz3bJ8Tn0qnkNlEtj2hsqmAZNmfLWDDEiGmAUaUvSbrBShiY8'
	);
	$url = 'https://api.twitter.com/1.1/statuses/user_timeline.json';
	$getfield = '?screen_name='.$twittlogin.'&exclude_replies=true&count=3200&include_rts=true';
	$request_method = 'GET';
	if (!function_exists('curl_init'))
		return '';
	$twitter = new TwitterAPIExchange($settings);
	$response = $twitter->setGetfield($getfield)->buildOauth($url, $request_method)->performRequest();
	$response = (Tools::jsonDecode($response, true));
	if ($response && count($response))
		foreach ($response as &$res)
		{
		if (isset($res['created_at']))
		{
		$res['created_at'] = strtotime($res['created_at']);
		$res['created_at'] = date('d/m/y H:i:s', $res['created_at']);
		}
		}
	$this->context->smarty->assign(array('TWITTER_RESPONSE'=>$response,
	'TWITTLOGIN'=>$twittlogin,
	'NUMBOFTWITTS'=>$numberoftwitts
	));
	return $this->display(__FILE__, 'views/templates/hook/twitterwidget.tpl');
	}
}