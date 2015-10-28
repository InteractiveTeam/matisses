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

class TestimonialsWithAvatarsAjaxModuleFrontController extends ModuleFrontControllerCore
{
	public function initContent()
	{
		$settings = Tools::jsonDecode(Configuration::get('TWA_SETTINGS_CONTROLLER'), true);
		$action = Tools::getValue('ajaxAction');
		$ret = array();
		switch ($action)
		{
			case 'addPost':
				$id = '';
				$date_add = date('Y-m-d G:i:s');
				$ip = Tools::getRemoteAddr();
				$this->module->processPost($id, $date_add, $ip, 'front', $settings['displayType']);
			break;
			case 'loadMore':
				$this->module->ajaxLoadMore($settings['num'], $settings['orderby'], $settings['displayType'], 'front');
			break;
			case 'loadDynamicTestimonials':
				$hook_name = Tools::getValue('hook');
				$html = $this->module->displayNativeHook(Tools::strtoupper($hook_name));
				$ret = array (
					'errors' => array(),
					'html' => $html,
					'hook' => Tools::strtoupper($hook_name)
				);
			break;
		}
		die(Tools::jsonEncode($ret));
	}
}