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

class Dinterval extends Module {
	public function __construct()
	{
		$this->name = 'dinterval';
		$this->tab = 'front_office_features';
		$this->version = '1.0.0';
		$this->author = 'prestapro.ru';
		$this->need_instance = '0';
		parent::__construct();
		$this->displayName = $this->l('DInterval');
		$this->description = $this->l('DInterval');
	}
	public function install()
	{
		/*Configuration::updateValue('DI_BEGIN', '0000-00-00 00:00:00');*/
		Configuration::updateValue('DI_END', '0000-00-00 00:00:00');
		if (!parent::install()
			|| !$this->registerHook('displayMaintenance') || !$this->registerHook('header'))
			return false;
		return true;
	}
	public function uninstall()
	{
		/*Configuration::deleteByName('DI_BEGIN');*/
		Configuration::deleteByName('DI_END');
		if (!parent::uninstall())
			return false;
		return true;
	}
	public function getContent()
	{
		if (Tools::isSubmit('saveSetting'))
		{
			/*if (Tools::getValue('DI_BEGIN'))
				Configuration::updateValue('DI_BEGIN', Tools::getValue('DI_BEGIN'));*/
			if (Tools::getValue('DI_END'))
				Configuration::updateValue('DI_END', Tools::getValue('DI_END'));
			Tools::redirectAdmin('index.php?controller=AdminModules&token='.Tools::getValue('token')
				.'&configure='.$this->name.'&tab_module=front_office_features&module_name='.$this->name);
		}

		$fields = array(
			array(
				'form' => array(
					'legend' => array(
						'title' => $this->l('Setting')
					),
					'input' => array(
						/*array(
							'label' => $this->l('Date begin'),
							'name' => 'DI_BEGIN',
							'type' => 'datetime'
						),*/
						array(
							'label' => $this->l('Date end'),
							'name' => 'DI_END',
							'type' => 'datetime'
						)
					),
					'submit' => array(
						'title' => $this->l('Save')
					)
				)
			)
		);
		$helper_form = new HelperForm();
		$helper_form->fields_value = array(
			/*'DI_BEGIN' => Configuration::get('DI_BEGIN'),*/
			'DI_END' => Configuration::get('DI_END')
		);
		$helper_form->submit_action = 'saveSetting';
		$helper_form->token = Tools::getValue('token');
		$helper_form->table = 'setting';
		return $helper_form->generateForm($fields);
	}
	public function hookDisplayMaintenance()
	{
		$this->context->smarty->assign(array(
			/*'date_begin' => Configuration::get('DI_BEGIN'),*/
			'date_end' => Configuration::get('DI_END')
		));
		return $this->display(__FILE__, 'home.tpl');
	}
}
