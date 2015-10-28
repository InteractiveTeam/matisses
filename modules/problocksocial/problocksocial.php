<?php
/**
* 2007-2015 PrestaShop
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2015 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_CAN_LOAD_FILES_'))
	exit;

class Problocksocial extends Module
{
	public function __construct()
	{
		$this->name = 'problocksocial';
		$this->tab = 'front_office_features';
		$this->version = '1.1.3';
		$this->author = 'prestapro.ru';

		$this->bootstrap = true;
		parent::__construct();

		$this->displayName = $this->l('PROSocial networking block');
		$this->description = $this->l('Allows you to add information about your brand\'s social networking accounts.');
		$this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
	}

	public function install()
	{
		return (parent::install()
			&& Configuration::updateValue('PROBLOCKSOCIAL_FACEBOOK', 'https://ru-ru.facebook.com/prestapro.ru')
			&& Configuration::updateValue('PROBLOCKSOCIAL_TWITTER', 'https://twitter.com/Prestapro')
			&& Configuration::updateValue('PROBLOCKSOCIAL_RSS', '')
			&& Configuration::updateValue('PROBLOCKSOCIAL_YOUTUBE', 'http://www.youtube.com/user/ThePrestaPro')
			&& Configuration::updateValue('PROBLOCKSOCIAL_GOOGLE_PLUS', 'https://plus.google.com/+AlexsandrPrestaProRu/posts')
			&& Configuration::updateValue('PROBLOCKSOCIAL_PINTEREST', '')
			&& Configuration::updateValue('PROBLOCKSOCIAL_VIMEO', 'https://vimeo.com/prestapro')
			&& $this->registerHook('displayHeader')
			&& $this->registerHook('FooterTop'));
	}

	public function uninstall()
	{
		//Delete configuration
		return (Configuration::deleteByName('PROBLOCKSOCIAL_FACEBOOK')
			&& Configuration::deleteByName('PROBLOCKSOCIAL_TWITTER')
			&& Configuration::deleteByName('PROBLOCKSOCIAL_RSS')
			&& Configuration::deleteByName('PROBLOCKSOCIAL_YOUTUBE')
			&& Configuration::deleteByName('PROBLOCKSOCIAL_GOOGLE_PLUS')
			&& Configuration::deleteByName('PROBLOCKSOCIAL_PINTEREST')
			&& Configuration::deleteByName('PROBLOCKSOCIAL_VIMEO')
			&& parent::uninstall());
	}

	public function getContent()
	{
		// If we try to update the settings
		$output = '';
		if (Tools::isSubmit('submitModule'))
		{
			Configuration::updateValue('PROBLOCKSOCIAL_FACEBOOK', Tools::getValue('problocksocial_facebook', ''));
			Configuration::updateValue('PROBLOCKSOCIAL_TWITTER', Tools::getValue('problocksocial_twitter', ''));
			Configuration::updateValue('PROBLOCKSOCIAL_RSS', Tools::getValue('problocksocial_rss', ''));
			Configuration::updateValue('PROBLOCKSOCIAL_YOUTUBE', Tools::getValue('problocksocial_youtube', ''));
			Configuration::updateValue('PROBLOCKSOCIAL_GOOGLE_PLUS', Tools::getValue('problocksocial_google_plus', ''));
			Configuration::updateValue('PROBLOCKSOCIAL_PINTEREST', Tools::getValue('problocksocial_pinterest', ''));
			Configuration::updateValue('PROBLOCKSOCIAL_VIMEO', Tools::getValue('problocksocial_vimeo', ''));
			$this->_clearCache('views/templates/hook/problocksocial.tpl');
			Tools::redirectAdmin($this->context->link->getAdminLink('AdminModules').'&configure='
			.$this->name.'&tab_module='.$this->tab.'&conf=4&module_name='.$this->name);
		}

		return $output.$this->renderForm();
	}

	public function hookDisplayHeader()
	{
		$this->context->controller->addCSS(($this->_path).'views/css/problocksocial.css', 'all');
	}

	public function hookFooterTop()
	{
		if (!$this->isCached('views/templates/hook/problocksocial.tpl', $this->getCacheId()))
			$this->smarty->assign(array(
				'facebook_url' => Configuration::get('PROBLOCKSOCIAL_FACEBOOK'),
				'twitter_url' => Configuration::get('PROBLOCKSOCIAL_TWITTER'),
				'rss_url' => Configuration::get('PROBLOCKSOCIAL_RSS'),
				'youtube_url' => Configuration::get('PROBLOCKSOCIAL_YOUTUBE'),
				'google_plus_url' => Configuration::get('PROBLOCKSOCIAL_GOOGLE_PLUS'),
				'pinterest_url' => Configuration::get('PROBLOCKSOCIAL_PINTEREST'),
				'vimeo_url' => Configuration::get('PROBLOCKSOCIAL_VIMEO'),
			));

		return $this->display(__FILE__, 'views/templates/hook/problocksocial.tpl', $this->getCacheId());
	}

	public function renderForm()
	{
		$fields_form = array(
			'form' => array(
				'legend' => array(
					'title' => $this->l('Settings'),
					'icon' => 'icon-cogs'
				),
				'input' => array(
					array(
						'type' => 'text',
						'label' => $this->l('Facebook URL'),
						'name' => 'problocksocial_facebook',
						'desc' => $this->l('Your Facebook fan page.'),
					),
					array(
						'type' => 'text',
						'label' => $this->l('Twitter URL'),
						'name' => 'problocksocial_twitter',
						'desc' => $this->l('Your official Twitter accounts.'),
					),
					array(
						'type' => 'text',
						'label' => $this->l('RSS URL'),
						'name' => 'problocksocial_rss',
						'desc' => $this->l('The RSS feed of your choice (your blog, your store, etc.).'),
					),
					array(
						'type' => 'text',
						'label' => $this->l('YouTube URL'),
						'name' => 'problocksocial_youtube',
						'desc' => $this->l('Your official YouTube account.'),
					),
					array(
						'type' => 'text',
						'label' => $this->l('Google Plus URL:'),
						'name' => 'problocksocial_google_plus',
						'desc' => $this->l('You official Google Plus page.'),
					),
					array(
						'type' => 'text',
						'label' => $this->l('Pinterest URL:'),
						'name' => 'problocksocial_pinterest',
						'desc' => $this->l('Your official Pinterest account.'),
					),
					array(
						'type' => 'text',
						'label' => $this->l('Vimeo URL:'),
						'name' => 'problocksocial_vimeo',
						'desc' => $this->l('Your official Vimeo account.'),
					),
				),
				'submit' => array(
					'title' => $this->l('Save'),
				)
			),
		);

		$helper = new HelperForm();
		$helper->show_toolbar = false;
		$helper->table = $this->table;
		$lang = new Language((int)Configuration::get('PS_LANG_DEFAULT'));
		$helper->default_form_language = $lang->id;
		$helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') ? Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') : 0;
		$helper->identifier = $this->identifier;
		$helper->submit_action = 'submitModule';
		$helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false).'&configure='
		.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
		$helper->token = Tools::getAdminTokenLite('AdminModules');
		$helper->tpl_vars = array(
			'fields_value' => $this->getConfigFieldsValues(),
			'languages' => $this->context->controller->getLanguages(),
			'id_language' => $this->context->language->id
		);

		return $helper->generateForm(array($fields_form));
	}

	public function getConfigFieldsValues()
	{
		return array(
			'problocksocial_facebook' => Tools::getValue('problocksocial_facebook', Configuration::get('PROBLOCKSOCIAL_FACEBOOK')),
			'problocksocial_twitter' => Tools::getValue('problocksocial_twitter', Configuration::get('PROBLOCKSOCIAL_TWITTER')),
			'problocksocial_rss' => Tools::getValue('problocksocial_rss', Configuration::get('PROBLOCKSOCIAL_RSS')),
			'problocksocial_youtube' => Tools::getValue('problocksocial_youtube', Configuration::get('PROBLOCKSOCIAL_YOUTUBE')),
			'problocksocial_google_plus' => Tools::getValue('problocksocial_google_plus', Configuration::get('PROBLOCKSOCIAL_GOOGLE_PLUS')),
			'problocksocial_pinterest' => Tools::getValue('problocksocial_pinterest', Configuration::get('PROBLOCKSOCIAL_PINTEREST')),
			'problocksocial_vimeo' => Tools::getValue('problocksocial_vimeo', Configuration::get('PROBLOCKSOCIAL_VIMEO')),
		);
	}

}
