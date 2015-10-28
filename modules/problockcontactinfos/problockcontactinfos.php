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
class ProBlockContactInfos extends Module
{
	public function __construct()
	{
		$this->name = 'problockcontactinfos';
		$this->author = 'prestapro.ru';
		$this->tab = 'front_office_features';
		$this->version = '1.1.1';

		$this->bootstrap = true;
		parent::__construct();

		$this->displayName = $this->l('PRO Contact information block');
		$this->description = $this->l('This module will allow you to display your e-store\'s contact information in a customizable block.');
		$this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
	}
	public function install()
	{
		return (parent::install()
				&& Configuration::updateValue('PROBLOCKCONTACTINFOS_COMPANY', Configuration::get('PS_SHOP_NAME'))
				&& Configuration::updateValue('PROBLOCKCONTACTINFOS_ADDRESS', '') && Configuration::updateValue('PROBLOCKCONTACTINFOS_PHONE', '')
				&& Configuration::updateValue('PROBLOCKCONTACTINFOS_PHONE_2', '')
				&& Configuration::updateValue('PROBLOCKCONTACTINFOS_EMAIL', Configuration::get('PS_SHOP_EMAIL'))
				&& $this->registerHook('header') && $this->registerHook('displayHomeCustom'));
	}
	public function uninstall()
	{
		//Delete configuration
		return (Configuration::deleteByName('PROBLOCKCONTACTINFOS_COMPANY')
				&& Configuration::deleteByName('PROBLOCKCONTACTINFOS_ADDRESS') && Configuration::deleteByName('PROBLOCKCONTACTINFOS_PHONE')
				&& Configuration::deleteByName('PROBLOCKCONTACTINFOS_PHONE_2')
				&& Configuration::deleteByName('PROBLOCKCONTACTINFOS_EMAIL') && parent::uninstall());
	}
	public function getContent()
	{
		$html = '';
		// If we try to update the settings
		if (Tools::isSubmit('submitModule'))
		{
			Configuration::updateValue('PROBLOCKCONTACTINFOS_COMPANY', Tools::getValue('problockcontactinfos_company'));
			Configuration::updateValue('PROBLOCKCONTACTINFOS_ADDRESS', Tools::getValue('problockcontactinfos_address'));
			Configuration::updateValue('PROBLOCKCONTACTINFOS_PHONE', Tools::getValue('problockcontactinfos_phone'));
			Configuration::updateValue('PROBLOCKCONTACTINFOS_PHONE_2', Tools::getValue('problockcontactinfos_phone_2'));
			Configuration::updateValue('PROBLOCKCONTACTINFOS_EMAIL', Tools::getValue('problockcontactinfos_email'));
			$this->_clearCache('views/templates/hook/problockcontactinfos.tpl');
			$html .= $this->displayConfirmation($this->l('Configuration updated'));
		}

		$html .= $this->renderForm();
		return $html;
	}
	public function hookHeader()
	{
		$this->context->controller->addCSS(($this->_path).'views/css/problockcontactinfos.css', 'all');
	}
	public function hookdisplayHomeCustom()
	{
		if (!$this->isCached('views/templates/hook/problockcontactinfos.tpl', $this->getCacheId()))
			$this->smarty->assign(array(
				'problockcontactinfos_company' => Configuration::get('PROBLOCKCONTACTINFOS_COMPANY'),
				'problockcontactinfos_address' => Configuration::get('PROBLOCKCONTACTINFOS_ADDRESS'),
				'problockcontactinfos_phone' => Configuration::get('PROBLOCKCONTACTINFOS_PHONE'),
				'problockcontactinfos_phone_2' => Configuration::get('PROBLOCKCONTACTINFOS_PHONE_2'),
				'problockcontactinfos_email' => Configuration::get('PROBLOCKCONTACTINFOS_EMAIL')
			));
		return $this->display(__FILE__, 'views/templates/hook/problockcontactinfos.tpl', $this->getCacheId());
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
						'label' => $this->l('Company name'),
						'name' => 'problockcontactinfos_company',
					),
					array(
						'type' => 'textarea',
						'label' => $this->l('Address'),
						'name' => 'problockcontactinfos_address',
					),
					array(
						'type' => 'text',
						'label' => $this->l('Phone number 1'),
						'name' => 'problockcontactinfos_phone',
					),
					array(
						'type' => 'text',
						'label' => $this->l('Phone number 2'),
						'name' => 'problockcontactinfos_phone_2',
					),
					array(
						'type' => 'text',
						'label' => $this->l('Email'),
						'name' => 'problockcontactinfos_email',
					),
				),
				'submit' => array(
					'title' => $this->l('Save')
				)
			),
		);
		$helper = new HelperForm();
		$helper->show_toolbar = false;
		$helper->table = $this->table;
		$lang = new Language((int)Configuration::get('PS_LANG_DEFAULT'));
		$helper->default_form_language = $lang->id;
		$helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') ? Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') : 0;
		$this->fields_form = array();

		$helper->identifier = $this->identifier;
		$helper->submit_action = 'submitModule';
		$helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false).'&configure='.
		$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
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
			'problockcontactinfos_company' => Tools::getValue('problockcontactinfos_company', Configuration::get('PROBLOCKCONTACTINFOS_COMPANY')),
			'problockcontactinfos_address' => Tools::getValue('problockcontactinfos_address', Configuration::get('PROBLOCKCONTACTINFOS_ADDRESS')),
			'problockcontactinfos_phone' => Tools::getValue('problockcontactinfos_phone', Configuration::get('PROBLOCKCONTACTINFOS_PHONE')),
			'problockcontactinfos_phone_2' => Tools::getValue('problockcontactinfos_phone_2', Configuration::get('PROBLOCKCONTACTINFOS_PHONE_2')),
			'problockcontactinfos_email' => Tools::getValue('problockcontactinfos_email', Configuration::get('PROBLOCKCONTACTINFOS_EMAIL')),
		);
	}
}
