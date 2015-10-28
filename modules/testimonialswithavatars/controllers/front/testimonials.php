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

class TestimonialsWithAvatarsTestimonialsModuleFrontController extends ModuleFrontControllerCore
{
	public function init()
	{
		$this->display_column_left = false;
		$this->display_column_right = false;
		parent::init();
	}

	public function initContent()
	{
		parent::initContent();
		$this->context = Context::getContext();
		$this->display_column_left = false;
		$this->displayPosts();
	}

	public function displayPosts()
	{
		$settings = Tools::jsonDecode(Configuration::get('TWA_SETTINGS_CONTROLLER'), true);
		$posts = $this->module->getPosts(true, 0, $settings['num'] + 1, $settings['orderby']);
		$show_load_more = false;
		if (count($posts) == $settings['num'] + 1)
		{
			$show_load_more = true;
			array_pop($posts);
		}
		$avatar = $this->module->getAvatarName();
		$this->context->smarty->assign(array(
			'posts' => $posts,
			'displayType' => (int)$settings['displayType'],
			'customer_name' => trim($this->getAuthorName($avatar)),
			'avatar' => $avatar,
			'twa' => $this->module,
			'allow_html' => $this->module->general_settings['allow_html'],
			'show_load_more' => $show_load_more,
			'general_settings' => $this->module->general_settings,
		));
		$this->setTemplate('twa.tpl');
	}

	public function getAuthorName($avatar)
	{
		$name = Db::getInstance()->getValue('SELECT customer_name FROM '._DB_PREFIX_.$this->module->name.' WHERE avatar = \''.pSQL($avatar).'\'');
		return $name;
	}

}