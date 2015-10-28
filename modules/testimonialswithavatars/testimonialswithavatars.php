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

if (!defined('_PS_VERSION_'))
	exit;

class TestimonialsWithAvatars extends Module
{
	public $errors = array();

	public function __construct()
	{
		$this->name = 'testimonialswithavatars';
		$this->tab = 'front_office_features';
		$this->version = '2.0.0';
		$this->author = 'Amazzing';
		$this->need_instance = 0;
		$this->bootstrap = true;
		$this->module_key = 'ddeb59fa8a4bb313b2e676fb25ad5f58';

		parent::__construct();

		$this->displayName = $this->l('Testimonials with avatars');
		$this->description = $this->l('Testimonials with uploadable avatars and rating.');
		$this->confirmUninstall = $this->l('Are you sure you want to uninstall? This action will erase all reviews');

		$this->general_settings = Tools::jsonDecode(Configuration::get('TWA_GENERAL_SETTINGS'), true);

		if (isset($this->context->employee) && $this->context->employee->isLoggedBack() && Tools::isSubmit('ajaxAction'))
		{
			$action = Tools::getValue('ajaxAction');
			switch ($action)
			{
				case 'updatePost':
					$id = $this->getValueAndValidate('id_post', 'isInt');
					$date_add = $this->getValueAndValidate('date_add', 'isDate');
					$ip = $this->getPostIpById($id);
					$this->processPost($id, $date_add, $ip, 'admin', 1);
				break;
				case 'toggleActiveStatus':
					$this->toggleActiveStatus();
				break;
				case 'loadMore':
					$this->ajaxLoadMore();
				break;
				case 'deletePost':
					$this->deletePost();
				break;
				case 'updatePositions':
					$this->updatePositions();
				break;
			}
		}
	}

	public function install()
	{
		if (!parent::install()
			|| !$this->prepareDatabase()
			|| !$this->prepareDemoContent())
			return false;
		return true;
	}

	public function prepareDatabase()
	{
		$sql = array();
		$sql[] = 'DROP TABLE IF EXISTS '._DB_PREFIX_.'testimonialswithavatars';
		$sql[] = '
			CREATE TABLE '._DB_PREFIX_.'testimonialswithavatars (
			id_post int(10) unsigned NOT NULL AUTO_INCREMENT,
			id_shop int(10) NOT NULL,
			position int(10) NOT NULL,
			avatar varchar(128) DEFAULT \'0\',
			customer_name varchar(128) DEFAULT NULL,
			subject varchar(128) DEFAULT NULL,
			rating int(2) DEFAULT \'5\',
			content text,
			active tinyint(1) unsigned NOT NULL DEFAULT \'0\',
			visitor_ip varchar(128) NOT NULL,
			date_add datetime NOT NULL,
			PRIMARY KEY (id_post),
			KEY visitor_ip (visitor_ip),
			KEY avatar (avatar)
			) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;';
		if (!$this->runSql($sql))
			$this->context->controller->errors[] = $this->l('Database table was not installed properly');
		foreach ($this->getAvailableHooks() as $hook => $settings)
			if (!Configuration::updateValue('TWA_SETTINGS_'.Tools::strtoupper($hook), Tools::jsonEncode($settings)))
				$this->context->controller->errors[] = $this->l('Settings data was not saved properly');
			else if ($hook != 'controller' && !$this->registerHook($hook))
				$this->context->controller->errors[] = $this->l('Settings data was not saved properly');
		$other_hooks = array ('displayHeader', 'displayBackOfficeHeader', 'moduleRoutes');
		foreach ($other_hooks as $hook)
			if (!$this->registerHook($hook))
				$this->context->controller->errors[] = $this->l('Hooks were not asssigned properly');
		$general_settings_fields = $this->getGeneralSettingsFields();
		$general_settings = array();
		foreach ($general_settings_fields as $k => $field)
			$general_settings[$k] = $field['default'];
		if (!Configuration::updateValue('TWA_GENERAL_SETTINGS', Tools::jsonEncode($general_settings)))
			$this->context->controller->errors[] = $this->l('Settings data was not saved properly');
		if ($this->context->controller->errors)
			return false;
		return true;
	}

	public function prepareDemoContent()
	{
		$post_data = array(
			'1' => array('Smith Vazovsky', 'High for this', 'Typesetting, remainally unchanged.
			It wantly elease of Letraset sheets containing Lorem IpsuIpsum passages hing typeare incl'),
			'2' => array('Pat Libertson', 'Simply Amazing', 'With desktop dolor repellendus.
			Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae'),
			'3' => array('John Till', 'Like it very much!', 'ofessen tiadus sum, ally ucnd recently dktop publishtting, remainingdus
			Pntly with des[img]http://tinymce.cachefly.net/4/plugins/emoticons/img/smiley-cool.gif[/img]'),
			'4' => array('Pretty lady', 'Remainally unchanged', 'It wantly Leatrre includus sum sages,
			and more recently with desktop publre inclu ding Aldus sum passages, and more recently [u]with desktop puet[/u]'),
			'5' => array('Star Parov', 'So fantastic', 'Tell them who voluptatem sequi nesciunt.
			Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius'),
			'6' => array('Feri Vergi', 'What is see is what you get', 'ves or pursues or desires to obtain pain of itself
			but because occasionally circumstances occur in which toil and pain can procure him some great pleasure'),
		);
		$rows = array();
		$id_shop = $this->context->shop->id;
		$sorted_dates = array();
		foreach (array_keys($post_data) as $k)
			$sorted_dates[$k] = $this->getRandomDate();
		asort($sorted_dates);
		$position = 0;
		foreach ($sorted_dates as $k => $date)
		{
			$position++;
			$data = $post_data[$k];
			$rows[] = '(\'\', '.(int)$id_shop.', '.(int)$position.', \'a'.(int)$k.'\', \''.pSQL($data[0]).'\', \''.pSQL($data[1]).
			'\', 5, \''.pSQL($data[2]).'\', 1, \'11.11.111.111\', \''.pSQL($date).'\')';
			if (!Tools::copy($this->local_path.'views/img/avatars/defaults/a'.$k.'.jpg', $this->local_path.'views/img/avatars/a'.$k.'.jpg'))
				$this->context->controller->errors[] = $this->l('An error occured while preparing default images');
		}
		if (!Tools::copy($this->local_path.'views/img/avatars/defaults/0.jpg', $this->local_path.'views/img/avatars/0.jpg'))
			$this->context->controller->errors[] = $this->l('An error occured while preparing default images');
		if ($this->context->controller->errors)
			return false;
		$sql = array('
			INSERT INTO '._DB_PREFIX_.'testimonialswithavatars
			VALUES '.implode(', ', $rows).'
		');
		if (!$this->runSql($sql))
			return false;
		return true;
	}

	public function getRandomDate()
	{
		return date('Y-m-d G:i:s', strtotime('-'.mt_rand(0, 2592000).' seconds'));
	}

	public function getAvailableHooks($only_keys = false)
	{
		$hooks = array(
			'controller' => array(
				'num' => 10,
				'displayType' => 2,
				'orderby' => 2,
			),
			'displayHome' => array(
				'active' => 1,
				'num' => 5,
				'displayType' => 1,
				'orderby' => 1,
			),
			'displayLeftColumn' => array(),
			'displayRightColumn' => array(),
			'testimonials1' => array(),
			'testimonials2' => array(),
			'testimonials3' => array(),
		);
		if ($only_keys)
			foreach ($hooks as $k => &$h)
				$h = $k;
		return $hooks;
	}

	public function hookModuleRoutes()
	{
		$slug = $this->general_settings['slug'];
		$routes = array(
			'module-testimonialswithavatars-testimonials' => array(
				'controller' => 'testimonials',
				'rule' =>  $slug,
				'keywords' => array(),
				'params' => array(
					'fc' => 'module',
					'module' => $this->name,
				),
			)
		);
		return $routes;
	}

	public function uninstall()
	{
		$sql = array();
		$sql[] = 'DROP TABLE IF EXISTS '._DB_PREFIX_.'testimonialswithavatars';

		if (!$this->runSql($sql)
			|| !Configuration::deleteByName('TWA_GENERAL_SETTINGS')
			|| !$this->deleteAvatarFiles()
			|| !parent::uninstall())
			return false;

		foreach ($this->getAvailableHooks(true) as $hook)
			if (!Configuration::deleteByName('TWA_SETTINGS_'.Tools::strtoupper($hook)))
				return false;

		return true;
	}

	public function deleteAvatarFiles()
	{
		$imgs = glob($this->local_path.'views/img/avatars/*.jpg');
		foreach ($imgs as $img)
			if (file_exists($img))
				unlink($img);
		return true;
	}

	public function runSql($sql)
	{
		foreach ($sql as $s)
			if (!Db::getInstance()->execute($s))
				return false;
		return true;
	}

	public function hookDisplayBackOfficeHeader()
	{
		if (Tools::getValue('configure') != $this->name)
			return;
		$this->context->controller->addJquery();
		$this->context->controller->addJqueryUI('ui.sortable');
		$this->context->controller->addJQueryUI('ui.datetimepicker');
		$this->context->controller->addCSS($this->local_path.'views/css/back.css', 'all');
		$this->context->controller->addJS($this->local_path.'views/js/back.js');
		$this->context->controller->js_files[] = '//tinymce.cachefly.net/4/tinymce.min.js';
	}

	public function getGeneralSettingsFields()
	{
		$general_settings_fields = array(
			'slug' => array(
				'label' => $this->l('User frienly URL'),
				'tooltip' => $this->l('Used for testimonials page'),
				'default' => 'testimonials',
				'validate' => 'isLinkRewrite',
			),
			'notif_email' => array(
				'label' => $this->l('E-mail for notifications'),
				'tooltip' => $this->l('Leave it empty if you want to disable notifications'),
				'default' => Configuration::get('PS_SHOP_EMAIL'),
				'validate' => 'isEmail',
			),
			'rating_num' => array(
				'label' => $this->l('Number of rating sars'),
				'tooltip' => $this->l('Use 0 to disable rating'),
				'default' => 5,
				'validate' => 'isInt',
			),
			'rating_class' => array(
				'label' => $this->l('Rating symbol'),
				'options' => array(
					'star' => 'star',
					'heart' => 'heart',
					'circle' => 'circle',
					'smile' => 'smile',
					'beer' => 'beer',
					'lightbulb' => 'lightbulb',
					'thumbs-up' => 'thumbs-up',
					'trophy' => 'trophy',
				),
				'default' => 'star',
				'validate' => 'isLabel',
			),
			'max_chars' => array(
				'label' => $this->l('Max characters in review'),
				'default' => 1000,
				'validate' => 'isInt',
			),
			'ip_interval' => array(
				'label' => $this->l('Time interval between reviews'),
				'tooltip' => $this->l('Input value in seconds. For example if you want to allow customers publish second post after 24 hours, input this number: 86400'),
				'default' => 86400,
				'validate' => 'isInt',
			),
			'load_owl' => array(
				'label' => $this->l('Load owl.js?'),
				'tooltip' => $this->l('If you already use owl carousel script on your site, you may turn this option OFF in order to avoid multiple loading or possible conflicts'),
				'default' => 0,
				'switcher' => 1,
				'validate' => 'isInt',
			),
			'allow_html' => array(
				'label' => $this->l('Allow basic HTML in front-offce?'),
				'tooltip' => $this->l('bold, italic, underline and smileys'),
				'switcher' => 1,
				'default' => 1,
				'validate' => 'isInt',
			),
			'instant_publish' => array(
				'label' => $this->l('New posts published instantly?'),
				'tooltip' => $this->l('If set to YES, user posts will be published instantly, otherwise they will be published only after your approval'),
				'switcher' => 1,
				'default' => 1,
				'validate' => 'isInt',
			),
		);

		// assigning values
		foreach ($general_settings_fields as $k => &$field)
			if (!isset($this->general_settings[$k]))
				$field['value'] = $field['default'];
			else
				$field['value'] = $this->general_settings[$k];

		return $general_settings_fields;
	}

	public function getContent()
	{
		$html = '';
		if (Tools::isSubmit('submitHooksParams'))
			$html .= $this->submitHooksParams();
		if (Tools::isSubmit('submitSettingsParams'))
			$html .= $this->submitSettingsParams();
		$html .= $this->displayForm();
		return $html;
	}

	private function displayForm()
	{
		$available_params = array();
		// number of visible posts
		$available_params['num']['label'] = $this->l('Number of visible posts');
		// display type
		$available_params['displayType']['label'] = $this->l('Display type');
		$available_params['displayType']['options'] = array(
			'1' => $this->l('Carousel'),
			'2' => $this->l('Grid'),
			'3' => $this->l('Simple list'),
		);
		// order by
		$available_params['orderby']['label'] = $this->l('Order by');
		$available_params['orderby']['value'] = 'random';
		$available_params['orderby']['options'] = array(
			'1' => $this->l('Forced positions'),
			'2' => $this->l('Date added'),
			'3' => $this->l('Random'),
		);

		$general_settings_fields = $this->getGeneralSettingsFields();

		$saved_values = array();
		$saved_values['controller'] = Tools::jsonDecode(Configuration::get('TWA_SETTINGS'), true);
		foreach ($this->getAvailableHooks(true) as $hook)
		{
			$saved_values[$hook] = Tools::jsonDecode(Configuration::get('TWA_SETTINGS_'.Tools::strtoupper($hook)), true);
			//setting default values to '' if nothing is saved
			foreach (array_keys($available_params) as $param)
				if (!isset($saved_values[$hook][$param]))
					$saved_values[$hook][$param] = '';
		}

		$this->context->smarty->assign(array(
			'hooks' => $this->getAvailableHooks(true),
			'available_params' => $available_params,
			'saved_values' => $saved_values,
			'posts' => $this->getPosts(),
			'twa' => $this,
			'general_settings_fields' => $general_settings_fields,
			'general_settings' => $this->general_settings,
			'languages' => Language::getLanguages(false),
			'id_lang_current' => $this->context->language->id,
		));
		return $this->context->smarty->fetch($this->local_path.'views/templates/admin/configure.tpl');
	}

	private function submitHooksParams()
	{
		$num = Tools::getValue('num');
		$display_type = Tools::getValue('displayType');
		$orderby = Tools::getValue('orderby');
		$activate = Tools::getValue('activate');

		foreach ($this->getAvailableHooks(true) as $hook)
		{
			$params_to_save = array();
			$params_to_save['num'] = (int)$num[$hook];
			$params_to_save['displayType'] = (int)$display_type[$hook];
			$params_to_save['orderby'] = (int)$orderby[$hook];
			if (isset($activate[$hook]))
			{
				$params_to_save['active'] = (int)$activate[$hook];
				if ($activate[$hook] > 0)
					$this->registerHook($hook);
				else
					$this->unregisterHook($hook);
			}
			Configuration::updateValue('TWA_SETTINGS_'.Tools::strtoupper($hook), Tools::jsonEncode($params_to_save));
		}
		$html = '';
		$html .= $this->displayConfirmation($this->l('Saved'));
		return $html;
	}

	public function submitSettingsParams()
	{
		$required_settings = $this->getGeneralSettingsFields();
		$settings_to_save = Tools::getValue('general_settings');
		foreach ($required_settings as $k => $fields)
		{
			if (!isset($settings_to_save[$k]))
				$settings_to_save[$k] = $fields['default'];
			// only multilang values allowed as arrays
			if (!is_array($settings_to_save[$k]) && !Validate::$fields['validate']($settings_to_save[$k]))
				$this->errors[] = $fields['label'].': '.$this->l('Incorrect value');
			else if (is_array($settings_to_save[$k]))
				foreach ($settings_to_save[$k] as $id_lang => $setting)
					if (!Validate::$fields['validate']($setting))
					{
						$field_error = $fields['label'];
						if ((int)$id_lang > 0)
							$field_error .= ' ('.Language::getIsoById($id_lang).')';
						$field_error .= ': '.$this->l('Incorrect value');
						$this->errors[] = $field_error;
					}
		}
		$html = '';
		if ($this->errors)
			foreach ($this->errors as $e)
				$html .= $this->displayError($e);
		else
		{
			Configuration::updateValue('TWA_GENERAL_SETTINGS', Tools::jsonEncode($settings_to_save));
			$this->general_settings = $settings_to_save;
			$html .= $this->displayConfirmation($this->l('Saved'));
		}
		return $html;
	}

	public function getPosts($active = false, $start = 0, $limit = 10, $orderby = 1, $additional_q = '')
	{
		$orderby_q = ' ORDER BY position DESC';
		$limit_q = '';
		if ($orderby == 2)
			$orderby_q = ' ORDER BY date_add DESC';
		else if ($orderby == 3)
			$orderby_q = ' ORDER BY RAND()';
		if ($limit > 0)
			$limit_q = ' LIMIT '.(int)$start.', '.(int)$limit;
		$shop_ids = Shop::getContextListShopID();
		$all_posts = Db::getInstance()->executeS('
			SELECT *
			FROM '._DB_PREFIX_.'testimonialswithavatars
			WHERE 1 '.($active ? 'AND active = 1' : '').'
			AND id_shop IN ('.implode(', ', $shop_ids).')
			'.$additional_q.'
			'.$orderby_q.'
			'.$limit_q.'
		');
		return $all_posts;
	}

	public function hookDisplayHeader()
	{
		$this->context->controller->addCSS($this->_path.'views/css/front_simple.css', 'all');
		$this->context->controller->addJS($this->_path.'views/js/front_simple.js');
		$js_def = array('twa_ajax_path' => $this->context->link->getModuleLink($this->name, 'ajax'));
			Media::addJsDef($js_def);
		if ($this->general_settings['load_owl'])
		{
			$this->context->controller->addJS($this->_path.'views/js/owl/owl.carousel.min.js');
			$this->context->controller->addCSS($this->_path.'views/css/owl/owl.carousel.css', 'all');
			$this->context->controller->addCSS($this->_path.'views/css/owl/owl.theme.css', 'all');
		}
		if (Tools::getValue('controller') == 'testimonials')
		{
			$this->context->controller->addCSS($this->_path.'views/css/front.css', 'all');
			$this->context->controller->addJS($this->_path.'views/js/front.js');
			// included tinymce doesn't work in front, so we include external lib
			$this->context->controller->js_files[] = '//tinymce.cachefly.net/4/tinymce.min.js';
		}
	}

	public function displayNativeHook($hook_name_uppercase, $in_column = false)
	{
		$hook_settings = Tools::jsonDecode(Configuration::get('TWA_SETTINGS_'.$hook_name_uppercase), true);
		if (!isset($hook_settings['active']) || $hook_settings['active'] == 0)
			return;
		$posts = $this->getPosts(true, 0, $hook_settings['num'], $hook_settings['orderby']);
		$this->context->smarty->assign(array(
			'posts' => $posts,
			'displayType' => (int)$hook_settings['displayType'],
			'twa' => $this,
			'general_settings' => $this->general_settings,
			'in_column' => $in_column,
			'view_all_link' => $this->context->link->getModuleLink($this->name, 'testimonials'),
		));
		return $this->display($this->local_path, 'twa_hook.tpl');
	}

	public function hookDisplayHome()
	{
		return $this->displayNativeHook('DISPLAYHOME');
	}

	public function hookDisplayLeftColumn()
	{
		return $this->displayNativeHook('DISPLAYLEFTCOLUMN', true);
	}

	public function hookDisplayRightColumn()
	{
		return $this->displayNativeHook('DISPLAYRIGHTCOLUMN', true);
	}

	public function hookTestimonials1()
	{
		return $this->displayNativeHook('TESTIMONIALS1');
	}

	public function hookTestimonials2()
	{
		return $this->displayNativeHook('TESTIMONIALS2');
	}

	public function hookTestimonials3()
	{
		return $this->displayNativeHook('TESTIMONIALS3');
	}

	/*
	public function displayNativeHook($hook_settings, $tpl = 'twa_home.tpl')
	{
		if (!isset($hook_settings['active']) || $hook_settings['active'] == 0)
			return;
		$posts = $this->getPosts(true, 0, $hook_settings['num'], $hook_settings['orderby']);
		$smarty_array = array(
			'posts' => $posts,
			'displayType' => (int)$hook_settings['displayType'],
			'twa' => $this,
			'general_settings' => $this->general_settings,
		);
		if ($tpl == 'twa_home.tpl')
			$smarty_array['view_all_link'] = $this->context->link->getModuleLink($this->name, 'testimonials');
		$this->context->smarty->assign($smarty_array);
		return $this->display($this->local_path, $tpl);
	}

	public function hookDisplayHome()
	{
		$hook_settings = Tools::jsonDecode(Configuration::get('TWA_SETTINGS_DISPLAYHOME'), true);
		return $this->displayNativeHook($hook_settings, 'twa_home.tpl');
	}

	public function hookDisplayLeftColumn()
	{
		$hook_settings = Tools::jsonDecode(Configuration::get('TWA_SETTINGS_DISPLAYLEFTCOLUMN'), true);
		return $this->displayNativeHook($hook_settings, 'twa_column.tpl');
	}

	public function hookDisplayRightColumn()
	{
		$hook_settings = Tools::jsonDecode(Configuration::get('TWA_SETTINGS_DISPLAYRIGHTCOLUMN'), true);
		return $this->displayNativeHook($hook_settings, 'twa_column.tpl');
	}

	public function hookTestimonials1()
	{
		$hook_settings = Tools::jsonDecode(Configuration::get('TWA_SETTINGS_TESTIMONIALS1'), true);
		return $this->displayNativeHook($hook_settings, 'twa_column.tpl');
	}
	*/

	public function getAvatarPath($id_avatar)
	{
		$file_location = 'views/img/avatars/'.$id_avatar.'.jpg';
		if (file_exists($this->local_path.$file_location))
			$src = $this->_path.$file_location.'?'.filemtime($this->local_path.$file_location);
		else
			$src = $this->_path.'views/img/avatars/0.jpg';
		return $src;
	}

	public function getAvatarName()
	{
		if ($this->context->customer->id)
			$avatar_name = $this->context->customer->id;
		else
			$avatar_name = 'g_'.$this->context->customer->id_guest;

		return $avatar_name;
	}

	public function ajaxLoadMore($num = 10, $orderby = 1, $display_type = 1, $mode = 'admin')
	{
		$additional_q = '';
		if (is_array(Tools::getValue('ids_to_exclude')))
		{
			$exclude = array_map('intval', Tools::getValue('ids_to_exclude'));
			$additional_q = 'AND id_post NOT IN ('.implode(', ', $exclude).')';
		}
		$active = false;
		if ($mode == 'front')
			$active = true;
		$posts = $this->getPosts($active, 0, $num, $orderby, $additional_q);
		$this->context->smarty->assign(array(
			'displayType'  => (int)$display_type,
			'posts'	  => $posts,
			'twa'	 => $this,
			'general_settings' => $this->general_settings,
		));
		$post_list = $this->context->smarty->fetch($this->local_path.'views/templates/'.$mode.'/post-list.tpl');

		$ret = array();
		$ret['errors'] = array();
		$ret['posts'] = (!$posts) ? false : utf8_encode($post_list);
		die(Tools::jsonEncode($ret));
	}

	/*
	* @param mode 'front' or 'admin'
	*/
	public function processPost($id, $date_add, $ip, $mode, $display_type = 1)
	{
		$ret = array('errors' => array());

		if ($mode == 'front')
		{
			$_POST['active'] = $this->general_settings['instant_publish'];
			$_POST['avatar'] = $this->getAvatarName();
			// $_POST['avatar'] = 'g_'.rand(1, 500000);
		}

		$fields = array(
			'id_post' => $id,
			'id_shop' => Tools::getValue('id_shop', $this->context->shop->id),
			'position' => $this->getPostPosition($id),
			'avatar' => $this->getValueAndValidate('avatar', 'isLabel'),
			'customer_name' => $this->getValueAndValidate('customer_name', 'isName', true),
			'subject' => $this->getValueAndValidate('subject', 'isCleanHtml', true),
			'rating' => (int)Tools::getValue('rating'),
			'content' => $this->getValueAndValidate('content', 'isCleanHtml', true, $this->general_settings['max_chars']),
			'active' => (int)Tools::getValue('active'),
			'visitor_ip' => $ip,
			'date_add' => $date_add,
		);

		if ($mode == 'front')
			$this->ipCheck($fields['visitor_ip']);

		if ($this->errors)
			$this->throwError($this->errors);

		$this->saveAvatar($fields['avatar']);

		$values = array();
		$upd = array();
		$values_for_smarty = array();
		foreach ($fields as $k => $field)
		{
			$values[] = '\''.pSQL($field).'\'';
			$values_for_smarty[$k] = strip_tags($field);
			$upd[] = pSQL($k).' = VALUES('.pSQL($k).')';
		}

		$query = '
			INSERT INTO '._DB_PREFIX_.'testimonialswithavatars
			VALUES ('.implode(', ', $values).')
			ON DUPLICATE KEY UPDATE '.implode(', ', $upd).'
		';

		$db = Db::getInstance();
		if (!$db->execute($query))
			$this->throwError($this->l('Something went wrong'));

		// for autoincremented ids
		if ($id == '')
			$values_for_smarty['id_post'] = $db->Insert_ID();
		$this->updateNameInAllPosts($fields['avatar'], $fields['customer_name']);

		if ($id == '' && $this->general_settings['notif_email'] != '')
			$this->sendEmailNotification($this->general_settings['notif_email'], $values_for_smarty);

		$this->context->smarty->assign(array(
			'displayType'  => (int)$display_type,
			'posts'	  => array($values_for_smarty),
			'twa'	 => $this,
			'general_settings' => $this->general_settings,
		));

		$new_post = $this->context->smarty->fetch($this->local_path.'views/templates/'.$mode.'/post-list.tpl');

		$ret = array();
		$ret['errors'] = array();
		$ret['instant_publish'] = (bool)$this->general_settings['instant_publish'];
		$ret['new_post'] = utf8_encode($new_post);
		$ret['successText'] = $this->l('Saved');
		die(Tools::jsonEncode($ret));
	}

	public function getPostPosition($id_post)
	{
		if ((int)$id_post < 1)
		{
			$current_max_position = Db::getInstance()->getValue('
				SELECT MAX(position) FROM '._DB_PREFIX_.'testimonialswithavatars
			');
			$position = (int)$current_max_position + 1;
		}
		else
			$position = (int)Tools::getValue('post_position');
		return $position;
	}

	public function ipCheck($ip)
	{
		$date_limit = date('Y-m-d G:i:s', strtotime('-'.(int)$this->general_settings['ip_interval'].' seconds', time()));
		$latest_post_from_this_ip = Db::getInstance()->executeS('
			SELECT * FROM '._DB_PREFIX_.'testimonialswithavatars
			WHERE visitor_ip = \''.pSQL($ip).'\' AND date_add > \''.pSQL($date_limit).'\'
			AND id_shop = '.(int)$this->context->shop->id.'
		');
		if ($latest_post_from_this_ip)
			$this->throwError($this->l('You cannot publish posts so often'));
	}

	public function saveAvatar($avatar_name, $width = 115, $height = 115)
	{
		//if file is uploaded
		if (isset($_FILES['avatar_file']['tmp_name']) && !empty($_FILES['avatar_file']['tmp_name']))
		{
			$path = $this->local_path.'views/img/avatars/';
			$max_size = 2097152; // 2 mb

			// Check image validity
			if ($error = ImageManager::validateUpload($_FILES['avatar_file'], Tools::getMaxUploadSize($max_size)))
				$this->errors[] = $error;

			$tmp_name = tempnam($path, 'tmp');
			if (!$tmp_name)
				return false;

			if (!move_uploaded_file($_FILES['avatar_file']['tmp_name'], $tmp_name))
				return false;

			// Copy new image
			if (empty($this->errors) && !$this->imageResizeModified($tmp_name, $path.$avatar_name.'.jpg', $width, $height))
				$this->errors[] = Tools::displayError('An error occurred while uploading the image.');
			unlink($tmp_name);
			if ($this->errors)
				$this->throwError($this->errors);
		}
		return true;
	}

	public function updateNameInAllPosts($avatar, $customer_name)
	{
		$query = '
			UPDATE '._DB_PREFIX_.'testimonialswithavatars
			SET customer_name = \''.pSQL($customer_name).'\'
			WHERE avatar = \''.pSQL($avatar).'\'
		';
		return Db::getInstance()->execute($query);
	}

	public function getPostIpById($id_post)
	{
		$ip = Db::getInstance()->getValue('
			SELECT visitor_ip FROM '._DB_PREFIX_.'testimonialswithavatars
			WHERE id_post = '.(int)$id_post.'
		');
		return $ip;
	}

	public function toggleActiveStatus()
	{
		$id_post = Tools::getValue('id_post');
		$active = Tools::getValue('active');
		$shop_ids = Shop::getContextListShopID();
		$query = '
			UPDATE '._DB_PREFIX_.'testimonialswithavatars
			SET active = '.(int)$active.'
			WHERE id_post = '.(int)$id_post.'
			AND id_shop IN ('.implode(', ', $shop_ids).')
		';
		$db = Db::getInstance();
		$ret = array(
			'success' => $db->execute($query),
			'errors' => array(),
			'active' => (int)$active);
		die(Tools::jsonEncode($ret));
	}

	public function deletePost()
	{
		$id_post = Tools::getValue('id_post');
		$shop_ids = Shop::getContextListShopID();
		$query = '
			DELETE FROM '._DB_PREFIX_.'testimonialswithavatars
			WHERE id_post = '.(int)$id_post.'
			AND id_shop IN ('.implode(', ', $shop_ids).')
		';
		$ret = array(
			'errors' => array(),
			'deleted' => Db::getInstance()->execute($query),
		);
		die(Tools::jsonEncode($ret));
	}

	public function updatePositions()
	{
		$ordered_ids = Tools::getValue('ordered_ids');
		if (!$ordered_ids)
			$this->throwError($this->l('Ordering failed'));
		$update_rows = array();
		foreach ($ordered_ids as $id => $position)
		{
			if ($id < 1)
				continue;
			$update_rows[] = '('.(int)$id.', '.(int)$position.')';
		}
		$update_query = '
			INSERT INTO '._DB_PREFIX_.'testimonialswithavatars (id_post, position)
			VALUES '.implode(', ', $update_rows).'
			ON DUPLICATE KEY UPDATE
			position = VALUES(position)
		';
		if (!Db::getInstance()->execute($update_query))
			$this->throwError($this->l('Ordering failed'));
		$ret = array('errors' => array(), 'successText' => $this->l('Saved'));
		die(Tools::jsonEncode($ret));
	}

	public function sendEmailNotification($notif_email, $values_for_smarty)
	{
		include_once(_PS_SWIFT_DIR_.'Swift.php');
		include_once(_PS_SWIFT_DIR_.'Swift/Connection/NativeMail.php');
		$result = false;
		$swift = new Swift(new Swift_Connection_NativeMail());
		$subject = Configuration::get('PS_SHOP_NAME').': '.$this->l('New review submitted');
		$content = '';
		$email_values = array('customer_name', 'subject', 'content');
		foreach ($values_for_smarty as $k => $value)
			if (in_array($k, $email_values))
				$content .= $k.': '.$this->bbCodeToHTML($value).'<br />';
		$type = 'text/html';
		$message = new Swift_Message($subject, $content, $type);
		$to = $notif_email;
		$from = 'noreply@'.str_replace('www.', '', $_SERVER['HTTP_HOST']);
		if (!Validate::isEmail($from))
			$from = Configuration::get('PS_SHOP_EMAIL');
		if ($swift->send($message, $to, $from))
			$result = true;
		$swift->disconnect();
		return $result;
	}

	public function getValueAndValidate($val, $validate, $required = false, $max_chars = 256)
	{
		$value = Tools::getValue($val);
		if ($required && $value == '')
			$this->errors[$val] = $this->l('Please, fill in this field');
		else if (!Validate::$validate($value))
			$this->errors[$val] = $this->l('Incorrect value');
		else if (is_string($value) && Tools::strlen(pSQL($value)) > $max_chars)
			$this->errors[$val] = $this->l('Max characters limit exceeded');
		return $value;
	}

	public function throwError($errors)
	{
		if (!is_array($errors))
			$errors = array($errors);
		$ret = array(
			'errors' => $errors
		);
		die(Tools::jsonEncode($ret));
	}

	public function bbCodeToHTML($bbtext)
	{
		$bbtags = array(
			'[b]' => '<span class="b">', '[/b]' => '</span>',
			'[i]' => '<span class="i">', '[/i]' => '</span>',
			'[u]' => '<span class="u">', '[/u]' => '</span>',
			'[img]' => '<img src="', '[/img]' => '" alt=" " />',
		);
		$bbtext = html_entity_decode(str_ireplace(array_keys($bbtags), array_values($bbtags), $bbtext));
		return Tools::nl2br($bbtext);
	}

	/**
	 * Copy of ImageMagager::resize with slight modifications for resizing without white borders
	 */
	public function imageResizeModified($src_file, $dst_file, $dst_width = null, $dst_height = null, $file_type = 'jpg', $force_type = false)
	{
		if (PHP_VERSION_ID < 50300)
			clearstatcache();
		else
			clearstatcache(true, $src_file);

		if (!file_exists($src_file) || !filesize($src_file))
			$this->throwError($this->l('File doesn\'t exist'));

		list($src_width, $src_height, $type) = getimagesize($src_file);

		// If PS_IMAGE_QUALITY is activated, the generated image will be a PNG with .jpg as a file extension.
		// This allow for higher quality and for transparency. JPG source files will also benefit from a higher quality
		// because JPG reencoding by GD, even with max quality setting, degrades the image.
		if (Configuration::get('PS_IMAGE_QUALITY') == 'png_all'
			|| (Configuration::get('PS_IMAGE_QUALITY') == 'png' && $type == IMAGETYPE_PNG) && !$force_type)
			$file_type = 'png';

		if (!$src_width)
			$this->throwError($this->l('Image dimentions could not be defined'));
		if (!$dst_width)
			$dst_width = $src_width;
		if (!$dst_height)
			$dst_height = $src_height;

		$src_image = ImageManager::create($type, $src_file);

		$width_diff = $dst_width / $src_width;
		$height_diff = $dst_height / $src_height;

		if ($width_diff > 1 && $height_diff > 1)
		{
			$next_width = $src_width;
			$next_height = $src_height;
		}
		else
		{
			if ($width_diff < $height_diff)
			{
				$next_height = $dst_height;
				$next_width = round(($src_width * $next_height) / $src_height);
				// $dst_width = (int)(!Configuration::get('PS_IMAGE_GENERATION_METHOD') ? $dst_width : $next_width);
			}
			else
			{
				$next_width = $dst_width;
				$next_height = round($src_height * $dst_width / $src_width);
				// $dst_height = (int)(!Configuration::get('PS_IMAGE_GENERATION_METHOD') ? $dst_height : $next_height);
			}
		}

		if (!ImageManager::checkImageMemoryLimit($src_file))
			$this->throwError($this->l('Not enought memory to process image'));

		$dest_image = imagecreatetruecolor($dst_width, $dst_height);

		// If image is a PNG and the output is PNG, fill with transparency. Else fill with white background.
		if ($file_type == 'png' && $type == IMAGETYPE_PNG)
		{
			imagealphablending($dest_image, false);
			imagesavealpha($dest_image, true);
			$transparent = imagecolorallocatealpha($dest_image, 255, 255, 255, 127);
			imagefilledrectangle($dest_image, 0, 0, $dst_width, $dst_height, $transparent);
		}
		else
		{
			$white = imagecolorallocate($dest_image, 255, 255, 255);
			imagefilledrectangle ($dest_image, 0, 0, $dst_width, $dst_height, $white);
		}
		$w = ($dst_width - $next_width) / 2;
		$h = ($dst_height - $next_height) / 2;
		imagecopyresampled($dest_image, $src_image, (int)$w, (int)$h, 0, 0, $next_width, $next_height, $src_width, $src_height);
		return (ImageManager::write($file_type, $dest_image, $dst_file));
	}
}