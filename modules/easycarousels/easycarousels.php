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

class EasyCarousels extends Module
{
	public function __construct()
	{
		$this->name = 'easycarousels';
		$this->tab = 'front_office_features';
		$this->version = '1.1.0';
		$this->author = 'Amazzing';
		$this->need_instance = 0;
		$this->bootstrap = true;
		$this->module_key = 'b277f11ccef2f6ec16aaac88af76573e';

		parent::__construct();

		$this->displayName = $this->l('Easy carousels');
		$this->description = $this->l('Create your own carousels in just a few clicks');
	}

	public function getTypeNames()
	{
		$type_names = array(
			'newproducts' => $this->l('New'),
			'bestsellers' => $this->l('Best'),
			'featuredproducts' => $this->l('Popular'),
			'pricesdrop' => $this->l('On-sale'),
			'bymanufacturer' => $this->l('Products by manufacturer'),
			'bysupplier' => $this->l('Products by supplier'),
			'catproducts' => $this->l('Products from selected categories'),
			'samecategory' => $this->l('Related products'),
			'samefeature' => $this->l('Other products with same feature (on product page)'),
			'manufacturers' => $this->l('Our partners'),
			'suppliers' => $this->l('Suppliers'),
		);
		return $type_names;
	}

	public function getFrontHooks()
	{
		$shop_ids = Shop::getContextListShopID();
		$used_hooks_sql = DB::getInstance()->executeS('
			SELECT id_carousel, hook_name, id_shop FROM '._DB_PREFIX_.'easycarousels
			WHERE id_shop IN ('.implode(', ', $shop_ids).')
		');

		$used_hooks_qty = array();
		foreach ($used_hooks_sql as $h)
			if ($h['id_shop'] == $this->context->shop->id
				|| !isset($used_hooks_qty[$h['hook_name']])
				|| !isset($used_hooks_qty[$h['hook_name']][$h['id_carousel']]))
				$used_hooks_qty[$h['hook_name']][$h['id_carousel']] = 1;

		$available_hooks = array();
		$methods = get_class_methods(__CLASS__);
		$methods_to_exclude = array('hookDisplayHeader', 'hookDisplayBackOfficeHeader');
		foreach ($methods as $m)
			if (Tools::substr($m, 0, 11) === 'hookDisplay' && !in_array($m, $methods_to_exclude))
			{
				$hk = str_replace('hookDisplay', 'display', $m);
				$available_hooks[$hk] = isset($used_hooks_qty[$hk]) ? count($used_hooks_qty[$hk]) : 0;
			}
		arsort($available_hooks);
		return $available_hooks;
	}

	public function getDefaultGeneralSettings($hook_name)
	{
		$default_general_settings  = array (
			'custom_class' => $this->isColumnHook($hook_name) ? 'block' : '',
			'items_in_carousel' => $this->isColumnHook($hook_name) ? 10 : 15,
			'show_price' => 1,
			'show_add_to_cart' => 1,
			'show_view_more' => 1,
			'show_stickers' => 1,
			'show_quick_view' => 1,
			'show_stock' => 1,
			'rows' => 1,
			'image_type' => 0,
		);
		return $default_general_settings;
	}

	public function getDefaultOwlSettings($hook_name)
	{
		$default_owl_settings  = array (
			'i' => $this->isColumnHook($hook_name) ? 1 : 5,
			'p' => 0,
			'n' => 1,
			'a' => 0,
		);
		return $default_owl_settings;
	}

	public function isColumnHook($hook_name)
	{
			$column_hooks = array('displayLeftColumn', 'displayRightColumn');
			return in_array($hook_name, $column_hooks);
	}

	public function install()
	{
		if (Shop::isFeatureActive())
			Shop::setContext(Shop::CONTEXT_ALL);

		$installed = true;
		if (!$this->prepareDatabaseTables()
			|| !parent::install()
			|| !$this->registerHook('displayHeader')
			|| !$this->registerHook('displayBackofficeHeader')
			|| !Configuration::updateValue('EC_LOAD_OWL', 0))
			$installed = false;

		if ($installed)
			$this->prepareDemoContent();

		return $installed;
	}

	public function prepareDatabaseTables()
	{
		$db = Db::getInstance();
		$create_table_query = 'CREATE TABLE IF NOT EXISTS '._DB_PREFIX_.'easycarousels (
					id_carousel int(10) unsigned NOT NULL,
					id_shop int(10) unsigned NOT NULL,
					hook_name varchar(128) NOT NULL,
					group_in_tabs tinyint(1) NOT NULL DEFAULT 1,
					active tinyint(1) NOT NULL DEFAULT 1,
					position tinyint(1) NOT NULL,
					carousel_type varchar(128) NOT NULL,
					name_multilang text NOT NULL,
					general_settings text NOT NULL,
					owl_settings text NOT NULL,
					PRIMARY KEY (id_carousel, id_shop),
					KEY hook_name (hook_name),
					KEY active (active),
					KEY group_in_tabs (group_in_tabs)
				  ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;';

		$created = $db->execute($create_table_query);
		if (!$created)
			$this->context->controller->errors[] = $this->l('Database table was not installed properly');
		return $created;
	}

	public function prepareDemoContent()
	{
		$demo_file_path = $this->local_path.'democontent/carousels.txt';
		if (file_exists($demo_file_path))
			$this->importCarousels($demo_file_path);
	}

	public function uninstall()
	{
		$sql = array();

		$sql[] = 'DROP TABLE IF EXISTS '._DB_PREFIX_.'easycarousels';

		if (!$this->runSql($sql) ||	!parent::uninstall())
			return false;

		return true;
	}

	public function runSql($sql)
	{
		$db = Db::getInstance();
		foreach ($sql as $s)
			if (!$db->execute($s))
				return false;
		return true;
	}

	public function hookDisplayBackOfficeHeader()
	{
		if (Tools::getValue('configure') != $this->name)
			return;
		$this->context->controller->addJquery();
		$this->context->controller->addCSS($this->_path.'views/css/back.css', 'all');
		$this->context->controller->addJS($this->_path.'views/js/back.js');
		$this->context->controller->addJqueryUI('ui.sortable');
	}

	/**
	* easycarousels table has a composite KEY that cannot be autoincremented
	**/
	public function getNewCarouselId()
	{
		$max_id = Db::getInstance()->getValue('
			SELECT MAX(id_carousel) FROM '._DB_PREFIX_.'easycarousels'
		);
		return (int)$max_id + 1;
	}

	public function getNextPosition($hook_name)
	{
		$max_position = Db::getInstance()->getValue('
			SELECT MAX(position) FROM '._DB_PREFIX_.'easycarousels WHERE hook_name = \''.pSQL($hook_name).'\'
		');
		return (int)$max_position + 1;
	}

	public function getContent()
	{
		if (Tools::isSubmit('ajax') && Tools::isSubmit('action'))
		{
			$action_method = 'ajax'.Tools::getValue('action');
			$this->$action_method();
		}
		$html = '';
		if (Tools::getValue('action') == 'exportCarousels' && !Tools::getValue('carouselsImported'))
			$html .= $this->exportCarousels();
		if (Tools::getValue('action') == 'importCarousels' && !Tools::getValue('carouselsImported'))
			$html .= $this->importCarousels();
		$html .= $this->displayForm();
		return $html;
	}

	public function ajaxImportCarousels()
	{
		$ret = array(
			'errors' => array(),
			'import_status_html' => $this->importCarousels(),
			'updated_html' => Tools::getValue('carouselsImported') ? utf8_encode($this->displayForm()): false,
		);
		die(Tools::jsonEncode($ret));
	}

	public function importCarousels($file_path = false)
	{
		if (!$file_path)
		{
			if (!isset($_FILES['carousels_data_file']) || !is_uploaded_file($_FILES['carousels_data_file']['tmp_name']))
				return $this->displayError($this->l('File not uploaded'));
			$file_path = $_FILES['carousels_data_file']['tmp_name'];
		}

		$imported_data = Tools::jsonDecode(Tools::file_get_contents($file_path), true);
		$shop_ids = Shop::getShops(false, null, true);
		$languages = Language::getLanguages(false);
		$lang_iso_id = array();
		foreach ($languages as $lang)
			$lang_iso_id[$lang['iso_code']] = $lang['id_lang'];

		$tables_to_fill = array();
		$hooks_to_register = array();
		$exceptions_data = array();

		foreach ($shop_ids as $id_shop)
		{
			$carousels = array();
			if (isset($imported_data['easycarousels'][$id_shop]))
				$carousels = $imported_data['easycarousels'][$id_shop];
			else
				$carousels = $imported_data['easycarousels']['ID_SHOP_DEFAULT'];

			foreach ($carousels as $c)
			{
				$c['id_shop'] = $id_shop;
				$c['name_multilang'] = Tools::jsonDecode($c['name_multilang'], true);
				$name_upd = array();
				foreach ($lang_iso_id as $iso => $id_lang)
					$name_upd[$id_lang] = isset($c['name_multilang'][$iso]) ? $c['name_multilang'][$iso] : $c['name_multilang']['LANG_ISO_DEFAULT'];
				$c['name_multilang'] = Tools::jsonEncode($name_upd);
				$tables_to_fill['easycarousels'][] = $c;
				$hooks_to_register[$id_shop][$c['hook_name']] = 1;
			}

			// exceptions
			if ($imported_data['hook_module_exceptions'])
			{
				$exceptions = array();
				if (isset($imported_data['hook_module_exceptions'][$id_shop]))
					$exceptions = $imported_data['hook_module_exceptions'][$id_shop];
				else
					$exceptions = $imported_data['hook_module_exceptions']['ID_SHOP_DEFAULT'];

				// just prepare exceptions data on this step. It will be applied after other data is inserted to DB
				foreach ($exceptions as $hook_name => $ecx_list)
					$exceptions_data[$id_shop][Hook::getIdByName($hook_name)] = $ecx_list;
			}
		}

		$db = Db::getInstance();
		$sql = array();
		foreach ($tables_to_fill as $table_name => $rows_to_insert)
		{
			$test_row = current($rows_to_insert);
			$columns = $db->executeS('SHOW COLUMNS FROM '._DB_PREFIX_.pSQL($table_name));
			foreach ($columns as $col)
				if (!isset($test_row[$col['Field']]))
				{
					$err = $this->l('This file can not be used for import. Reason: Database tables don\'t match (%s).');
					return $this->throwError(sprintf($err, _DB_PREFIX_.$table_name));
				}
			$sql[] = 'TRUNCATE TABLE '._DB_PREFIX_.pSQL($table_name);
			$rows = array();
			$column_names = array();
			foreach ($rows_to_insert as $row)
			{
				if (!$column_names)
					$column_names = array_keys($row);
				foreach ($row as &$r)
					$r = pSQL($r);
				$rows[] = '(\''.implode('\', \'', $row).'\')';
			}
			if (!$rows || !$column_names)
				continue;
			$sql[] = '
				INSERT INTO '._DB_PREFIX_.pSQL($table_name).' ('.implode(', ', $column_names).')
				VALUES '.implode(', ', $rows).'
			';
		}
		if (!$sql)
			return $this->displayError($this->l('Nothing to import'));
		$imported = $this->runSql($sql);

		// hooks
		foreach ($hooks_to_register as $id_shop => $hook_list)
			foreach (array_keys($hook_list) as $hook_name)
				if (!$this->isRegisteredInHook($hook_name))
					$imported &= $this->registerHook($hook_name, array($id_shop));

		// exceptions
		foreach ($exceptions_data as $id_shop => $hook_exceptions)
			foreach ($hook_exceptions as $id_hook => $except)
			{
				$imported &= $this->unregisterExceptions($id_hook, array($id_shop));
				$imported &= $this->registerExceptions($id_hook, $except, array($id_shop));
			}

		$_POST['carouselsImported'] = $imported;
		if (!$imported)
			$ret = $this->displayError($this->l('An error occured while importing data'));
		else
			$ret = $this->displayConfirmation($this->l('Data was successfully  imported'));
		return $ret;
	}

	private function displayForm()
	{
		$this->context->smarty->assign(array(
			'hooks' => $this->getFrontHooks(),
			'type_names' => $this->getTypeNames(),
			'carousels' => $this->getAllCarousels(),
			'multishop_warning' => count(Shop::getContextListShopID()) > 1 ? true : false,
			'id_lang_current' => $this->context->language->id,
			'load_owl' => Configuration::get('EC_LOAD_OWL'),
		));

		return $this->display(__FILE__, 'views/templates/admin/configure.tpl');
	}

	public function exportCarousels()
	{
		$languages = Language::getLanguages(false);
		$lang_id_iso = array();
		foreach ($languages as $lang)
			$lang_id_iso[$lang['id_lang']] = $lang['iso_code'];
		$db = Db::getInstance();

		$id_shop_default = Configuration::get('PS_SHOP_DEFAULT');
		$id_lang_default = Configuration::get('PS_LANG_DEFAULT');
		$tables_to_export = array(
			'easycarousels',
			'hook_module_exceptions'
		);
		$export_data = array();
		foreach ($tables_to_export as $table_name)
		{
			$data_from_db = $db->executeS('SELECT * FROM '._DB_PREFIX_.pSQL($table_name));
			$ret = $data_from_db;
			switch ($table_name)
			{
				case 'easycarousels':
					$ret = array();
					foreach ($data_from_db as $d)
					{
						$id_shop = $d['id_shop'] == $id_shop_default ? 'ID_SHOP_DEFAULT' : $d['id_shop'];
						$name_multilang = Tools::jsonDecode($d['name_multilang']);
						$name_multilang_iso = array();
						foreach ($name_multilang as $id_lang => $name)
						{
							$lang_iso = $id_lang == $id_lang_default ? 'LANG_ISO_DEFAULT' : $lang_id_iso[$id_lang];
							$name_multilang_iso[$lang_iso] = $name;
						}
						$d['name_multilang'] = Tools::jsonEncode($name_multilang_iso);
						$ret[$id_shop][$d['id_carousel']] = $d;
					}
				break;
				case 'hook_module_exceptions':
					$data_from_db = $db->executeS('
						SELECT hme.*, h.name AS hook_name
						FROM '._DB_PREFIX_.'hook_module_exceptions hme
						LEFT JOIN '._DB_PREFIX_.'hook h ON h.id_hook = hme.id_hook
						WHERE id_module = '.(int)$this->id.'
					');
					$ret = array();
					foreach ($data_from_db as $d)
					{
						$id_shop = $d['id_shop'] == $id_shop_default ? 'ID_SHOP_DEFAULT' : $d['id_shop'];
						$ret[$id_shop][$d['hook_name']][] = $d['file_name'];
					}
				break;
			}
			$export_data[$table_name] = $ret;
		}
		$export_data = Tools::jsonEncode($export_data);
		$file_name = 'carousels-'.date('d-m-Y').'.txt';
		header('Content-disposition: attachment; filename='.$file_name);
		header('Content-type: text/plain');
		echo $export_data;
		exit();
	}

	public function hookDisplayHeader()
	{
		if (Configuration::get('EC_LOAD_OWL'))
		{
			$this->context->controller->addJS($this->_path.'views/js/owl/owl.carousel.min.js');
			$this->context->controller->addCSS($this->_path.'views/css/owl/owl.carousel.css', 'all');
			$this->context->controller->addCSS($this->_path.'views/css/owl/owl.theme.css', 'all');
		}
		$this->context->controller->addCSS($this->_path.'views/css/front.css', 'all');
		$this->context->controller->addJS($this->_path.'views/js/front.js');
	}

	public function ajaxGetCarouselsInHook()
	{
		// $time_start = microtime(true);
		$hook_name = Tools::getValue('hook_name');
		$id_product = Tools::getValue('id_product');
		$id_category = Tools::getValue('id_category');

		$carousels = $this->getAllCarousels('group_in_tabs', $hook_name, true, $id_product, $id_category);
		if (!isset ($carousels[0]))
			$carousels[0] = array();
		if (!isset ($carousels[1]))
			$carousels[1] = array();

		$this->context->smarty->assign(
			array(
				'carousels_one_by_one' => $carousels[0],
				'carousels_in_tabs' => $carousels[1],
				'link' => $this->context->link,
				'hook_name' => $hook_name,
			)
		);
		$carousels_html = $this->display(__FILE__, 'views/templates/hook/carousel.tpl');
		$ret = array(
			'carousels_html' => utf8_encode($carousels_html),
			// 'time_'.$hook_name => microtime(true) - $time_start,
		);
		die(Tools::jsonEncode($ret));
	}

	public function ajaxSetLoadOwl()
	{
		$active = Tools::getValue('load_owl');
		Configuration::updateValue('EC_LOAD_OWL', (int)$active);
		if (Configuration::get('EC_LOAD_OWL'))
			$response = $this->l('Owl loading is ON');
		else
			$response = $this->l('Owl loading is OFF');
		$ret = array ('responseText' => $response);
		die(Tools::jsonEncode($ret));
	}

	public function displayNativeHook($hook_name, $id_product = 0, $id_category = 0)
	{
		$params = array(
			'ajaxGetCarouselsInHook' => 1,
			'hook_name' => $hook_name,
			'id_product' => $id_product,
			'id_category' => $id_category,
		);
		$ajax_path = $this->context->link->getModuleLink($this->name, 'ajax', $params);
		$ajax_path = str_replace('&', '&amp;', $ajax_path);
		$ret = '<div class="easycarousels" data-ajaxpath="'.$ajax_path.'"></div>';
		return $ret;
	}

	public function hookDisplayHome()
	{
		return $this->displayNativeHook('displayHome');
	}
	public function hookDisplayHomeCustom()
	{
		return $this->displayNativeHook('displayHomeCustom');
	}
	public function hookDisplayLeftColumn()
	{
		return $this->displayNativeHook('displayLeftColumn');
	}

	public function hookDisplayRightColumn()
	{
		return $this->displayNativeHook('displayRightColumn');
	}

	public function hookDisplayEasyCarousel1()
	{
		return $this->displayNativeHook('displayEasyCarousel1');
	}

	public function hookDisplayEasyCarousel2()
	{
		return $this->displayNativeHook('displayEasyCarousel2');
	}

	public function hookDisplayEasyCarousel3()
	{
		return $this->displayNativeHook('displayEasyCarousel3');
	}

	public function hookDisplayFooterProduct($params)
	{
		return $this->displayNativeHook('displayFooterProduct', $params['product']->id, $params['category']->id);
	}

	public function getStructuredCarouselItems($carousel_type, $general_settings, $id_category, $id_product)
	{
		$items = array();
		$need_properties = false;
		$db = Db::getInstance();
		switch ($carousel_type)
		{
			case 'newproducts':
				$nb_days = Configuration::get('PS_NB_DAYS_NEW_PRODUCT') ? Configuration::get('PS_NB_DAYS_NEW_PRODUCT') : 20;
				$query = '
					SELECT p.id_product
					FROM '._DB_PREFIX_.'product p
					'.Shop::addSqlAssociation('product', 'p').'
					WHERE product_shop.active = 1
					AND product_shop.date_add > "'.pSQL(date('Y-m-d', strtotime('-'.(int)$nb_days.' DAY'))).'"
					AND product_shop.visibility IN ("both", "catalog")
					ORDER BY product_shop.date_add DESC
					LIMIT '.(int)$general_settings['items_in_carousel'].'
				';
				$items = $db->executeS($query);
				$ids = array();
				foreach ($items as $i)
					$ids[] = $i['id_product'];
				$items = $ids;
				$need_properties = true;
			break;
			case 'featuredproducts':
				$query = '
					SELECT p.id_product
					FROM '._DB_PREFIX_.'product p
					INNER JOIN '._DB_PREFIX_.'category_product cp ON cp.id_product = p.id_product AND cp.id_category = '.(int)$this->context->shop->getCategory().'
					'.Shop::addSqlAssociation('product', 'p').'
					WHERE product_shop.active = 1
					LIMIT '.(int)$general_settings['items_in_carousel'].'
				';
				$items = $db->executeS($query);
				$ids = array();
				foreach ($items as $i)
					$ids[] = $i['id_product'];
				$items = $ids;
				$need_properties = true;
			break;
			case 'pricesdrop':
				$query = '
					SELECT sp.id_product
					FROM '._DB_PREFIX_.'specific_price sp
					'.Shop::addSqlAssociation('product', 'sp').'
					WHERE product_shop.active = 1
					AND sp.id_shop IN (0, '.(int)$this->context->shop->id.')
					AND (sp.from = "0000-00-00 00:00:00" OR sp.from < "'.pSQL(date('Y-m-d G:i:s')).'")
					AND (sp.to = "0000-00-00 00:00:00" OR sp.to > "'.pSQL(date('Y-m-d G:i:s')).'")
					LIMIT '.(int)$general_settings['items_in_carousel'].'
				';
				$items = $db->executeS($query);
				$ids = array();
				foreach ($items as $i)
					$ids[] = $i['id_product'];
				$items = $ids;
				$need_properties = true;
			break;
			case 'bestsellers':
				$query = '
					SELECT ps.id_product
					FROM '._DB_PREFIX_.'product_sale ps
					'.Shop::addSqlAssociation('product', 'ps').'
					WHERE product_shop.active = 1
					ORDER BY quantity DESC
					LIMIT '.(int)$general_settings['items_in_carousel'].'
				';
				$items = $db->executeS($query);
				$ids = array();
				foreach ($items as $i)
					$ids[] = $i['id_product'];
				$items = $ids;
				$need_properties = true;
			break;
			case 'catproducts':
				$cat_ids = explode(',', $general_settings['cat_ids']);
				foreach ($cat_ids as &$id_cat)
					$id_cat = (int)$id_cat;
				if (!$cat_ids)
					$cat_ids = array(0);
				$query = '
					SELECT cp.id_product
					FROM '._DB_PREFIX_.'category_product cp
					'.Shop::addSqlAssociation('product', 'cp').'
					WHERE product_shop.active = 1
					AND cp.id_category IN ('.implode(', ', $cat_ids).')
					GROUP BY cp.id_product
					ORDER BY cp.position ASC
					LIMIT '.(int)$general_settings['items_in_carousel'].'
				';
				$items = $db->executeS($query);
				$ids = array();
				foreach ($items as $i)
					$ids[] = $i['id_product'];
				$items = $ids;
				$need_properties = true;
			break;
			case 'bymanufacturer':
				if (isset($general_settings['id_m']) && $general_settings['id_m'] != 0)
				{
					$query = '
						SELECT p.id_product
						FROM '._DB_PREFIX_.'product p
						'.Shop::addSqlAssociation('product', 'p').'
						WHERE product_shop.active = 1 AND p.id_manufacturer = '.(int)$general_settings['id_m'].'
						LIMIT '.(int)$general_settings['items_in_carousel'].'
					';
					$items = $db->executeS($query);
					$ids = array();
					foreach ($items as $i)
						$ids[] = $i['id_product'];
					$items = $ids;
					$need_properties = true;
				}
			break;
			case 'bysupplier':
				if (isset($general_settings['id_s']) && $general_settings['id_s'] != 0)
				{
					$query = '
						SELECT p.id_product
						FROM '._DB_PREFIX_.'product p
						'.Shop::addSqlAssociation('product', 'p').'
						WHERE product_shop.active = 1 AND p.id_supplier = '.(int)$general_settings['id_s'].'
						LIMIT '.(int)$general_settings['items_in_carousel'].'
					';
					$items = $db->executeS($query);
					$ids = array();
					foreach ($items as $i)
						$ids[] = $i['id_product'];
					$items = $ids;
					$need_properties = true;
				}
			break;
			case 'samecategory':
				$general_settings['items_in_carousel']++;
				$items = $db->ExecuteS('
					SELECT p.id_product
					FROM '._DB_PREFIX_.'product p
					INNER JOIN '._DB_PREFIX_.'category_product cp ON cp.id_product = p.id_product AND cp.id_category = '.(int)$id_category.'
					'.Shop::addSqlAssociation('product', 'p').'
					WHERE product_shop.active = 1
					LIMIT '.(int)$general_settings['items_in_carousel'].'
				');
				$ids = array();
				foreach ($items as $i)
					if ($i['id_product'] != $id_product)
						$ids[] = $i['id_product'];
				$items = $ids;
				$need_properties = true;
			break;
			case 'samefeature':
				if (isset($general_settings['id_feature']) && $general_settings['id_feature'] != 0)
				{
					// executeS for multifeature support
					$feat_vals_db = $db->executeS('
						SELECT id_feature_value
						FROM '._DB_PREFIX_.'feature_product
						WHERE id_feature = '.(int)$general_settings['id_feature'].'
						AND id_product='.(int)$id_product);
					$feat_val_ids = array();
					foreach ($feat_vals_db as $fv)
						$feat_val_ids[$fv['id_feature_value']] = (int)$fv['id_feature_value'];

					if ($feat_val_ids)
					{
						$general_settings['items_in_carousel']++;
						$items = $db->ExecuteS('
							SELECT fp.id_product
							FROM '._DB_PREFIX_.'feature_product fp
							'.Shop::addSqlAssociation('product', 'fp').'
							WHERE product_shop.active = 1
							AND id_feature_value IN ('.implode(', ', $feat_val_ids).')
							LIMIT '.(int)$general_settings['items_in_carousel'].'
						');
						$ids = array();
						foreach ($items as $i)
							if ($i['id_product'] != $id_product)
								$ids[] = $i['id_product'];
						$items = $ids;
						$need_properties = true;
					}
				}
			break;
			case 'manufacturers':
				$items = Manufacturer::getManufacturers();
				foreach ($items as &$i)
				{
					$i['image_url'] = _THEME_MANU_DIR_.$this->context->language->iso_code.'.jpg';
					if (file_exists(_PS_MANU_IMG_DIR_.$i['id_manufacturer'].'-'.$general_settings['image_type'].'.jpg'))
						$i['image_url'] = _THEME_MANU_DIR_.$i['id_manufacturer'].'-'.$general_settings['image_type'].'.jpg';
				}
			break;
			case 'suppliers':
				$items = Supplier::getSuppliers();
				foreach ($items as &$i)
				{
					$i['image_url'] = _THEME_SUP_DIR_.$this->context->language->iso_code.'.jpg';
					if (file_exists(_PS_SUPP_IMG_DIR_.$i['id_supplier'].'-'.$general_settings['image_type'].'.jpg'))
						$i['image_url'] = _THEME_SUP_DIR_.$i['id_supplier'].'-'.$general_settings['image_type'].'.jpg';
				}
			break;
		}

		$structured_items = array();
		$current_row = 1;
		$current_col = 0;
		foreach ($items as $item)
		{
			if ($current_col >= ceil(count($items) / $general_settings['rows']))
			{
				$current_row++;
				$current_col = 0;
			}
			$current_col++;

			if ($need_properties)
				$item = $this->getPropertiesById($item);
			$structured_items[$current_col][$current_row] = $item;
		}
		return $structured_items;
	}

	public function getPropertiesById($id)
	{
		$product = new Product($id, false, $this->context->language->id);
		$product_infos = array();
		$product_infos['id_product'] = $id;
		$product_infos['show_price'] = $product->show_price;
		$product_infos['on_sale'] = $product->on_sale;
		$product_infos['name'] = $product->name;
		$product_infos['description_short'] = $product->description_short;
		$product_infos['link_rewrite'] = $product->link_rewrite;
		$product_infos['reference'] = $product->reference;
		$product_infos['available_for_order'] = $product->available_for_order;
		$product_infos['id_category_default'] = $product->id_category_default;
		$product_infos['out_of_stock'] = $product->out_of_stock;
		$product_infos['minimal_quantity'] = $product->minimal_quantity;
		$product_infos['customizable'] = $product->customizable;
		$product_infos['ean13'] = $product->ean13;
		$image = $product->getCover($id);
		$product_infos['id_image'] = $image['id_image'];
		if ($this->productIsNew($product->date_add))
			$product_infos['new'] = 1;
		$product_infos = Product::getProductProperties($this->context->language->id, $product_infos);
		return $product_infos;
	}

	public function productIsNew($date_add)
	{
		if (!isset($this->nb_days_new))
		{
			$this->nb_days_new = Configuration::get('PS_NB_DAYS_NEW_PRODUCT');
			$this->now = time();
		}
		$diff = floor(strtotime($date_add) - $this->now) / 86400;
		return $diff <= $this->nb_days_new;
	}

	public function ajaxCallCarouselForm()
	{
		$id_carousel = (int)Tools::getValue('id_carousel');
		$hook_name = Tools::getValue('hook_name');
		$utf8_encoded_form = $this->renderCarouselForm($id_carousel, $hook_name);
		die(Tools::jsonEncode($utf8_encoded_form));
	}

	public function renderCarouselForm($id_carousel, $hook_name, $full = true)
	{
		$carousel_info = Db::getInstance()->getRow('
			SELECT * FROM '._DB_PREFIX_.'easycarousels
			WHERE id_carousel = '.(int)$id_carousel);
		$product_image_types = ImageType::getImagesTypes('products');
		$manufacturer_image_types = ImageType::getImagesTypes('manufacturers');
		$supplier_image_types = ImageType::getImagesTypes('suppliers');

		$sorted_image_types = array();
		foreach ($product_image_types as $t)
			$sorted_image_types['products'][$t['name']] = $t['name'];

		foreach ($manufacturer_image_types as $t)
			$sorted_image_types['manufacturers'][$t['name']] = $t['name'];

		foreach ($supplier_image_types as $t)
			$sorted_image_types['suppliers'][$t['name']] = $t['name'];

		if ($carousel_info)
		{
			$carousel_info['name_multilang'] = Tools::jsonDecode($carousel_info['name_multilang'], true);
			$carousel_info['name'] = $this->getLangName($carousel_info['name_multilang']);
			$carousel_info['general_settings'] = Tools::jsonDecode($carousel_info['general_settings'], true);
			$carousel_info['owl_settings'] = Tools::jsonDecode($carousel_info['owl_settings'], true);
		}
		else
		{
			// default carousel settings
			$carousel_info = array (
				'id_carousel' => (int)$id_carousel,
				'active' => 1,
				'carousel_type' => 'newproducts',
				'group_in_tabs' => $this->isColumnHook($hook_name) ? 0 : 1,
				'general_settings' => $this->getDefaultGeneralSettings($hook_name),
				'owl_settings' => $this->getDefaultOwlSettings($hook_name),
			);
			if (isset($sorted_image_types['products'][ImageType::getFormatedName('home')]))
				$carousel_info['general_settings']['image_type'] = ImageType::getFormatedName('home');
		}
		$languages = Language::getLanguages(false);
		$this->context->smarty->assign(array(
			'carousel' => $carousel_info,
			'type_names' => $this->getTypeNames(),
			'available_features' => Feature::getFeatures($this->context->language->id),
			'available_manufacturers' => Manufacturer::getManufacturers(),
			'available_suppliers' => Supplier::getSuppliers(),
			'sorted_image_types' => $sorted_image_types,
			'languages' => $languages,
			'id_lang_current' => $this->context->language->id,
			'full' => $full,
		));

		$form = $this->display(__FILE__, 'views/templates/admin/carousel-form.tpl');
		return utf8_encode($form);
	}

	public function ajaxSaveCarousel()
	{
		$result = array ('errors' => array());
		$id_carousel = Tools::getValue('id_carousel');
		if ($id_carousel == 0)
			$id_carousel = $this->getNewCarouselId();
		$hook_name = Tools::getValue('hook_name');
		$params_string = Tools::getValue('carousel_data');
		$params = array();
		parse_str($params_string, $params);

		if (trim($params['name_multilang'][Configuration::get('PS_LANG_DEFAULT')]) == '')
		{
			$lang_name = Db::getInstance()->getValue('
				SELECT name FROM '._DB_PREFIX_.'lang WHERE id_lang = '.(int)Configuration::get('PS_LANG_DEFAULT')
			);
			$this->errors[] = $this->l('Please fill carousel name at least for the following language: ').$lang_name;
		}
		if ($params['carousel_type'] == 'catproducts')
		{
			$ids_string = preg_replace('/[^0-9,]/', '', $params['general_settings']['cat_ids']);
			$ids_string = trim($ids_string, ',');
			$params['general_settings']['cat_ids'] = $ids_string;
			if ($ids_string == '')
				$this->errors[] = $this->l('Please add at least one category id');
		}
		if ($params['carousel_type'] == 'bymanufacturer' && $params['general_settings']['id_m'] == 0)
			$this->errors[] = $this->l('Please select a manufacturer');
		if ($params['carousel_type'] == 'bysupplier' && $params['general_settings']['id_s'] == 0)
			$this->errors[] = $this->l('Please select a supplier');
		if ($params['carousel_type'] == 'samefeature' && $params['general_settings']['id_feature'] == 0)
			$this->errors[] = $this->l('Please select a feature');

		if (!$this->errors && !$this->saveCarousel($id_carousel, $hook_name, $params))
			$this->errors[] = $this->l('Carousel not saved');

		if ($this->errors)
			$this->throwError($this->errors);

		$result['updated_form_header'] = $this->renderCarouselForm($id_carousel, false);
		$result['responseText'] = $this->l('Saved');
		die(Tools::jsonEncode($result));
	}

	/**
	* @return boolean saved
	**/
	public function saveCarousel($id_carousel, $hook_name, $params)
	{
		$db = Db::getInstance();

		foreach ($this->getDefaultGeneralSettings($hook_name) as $name => $value)
			if (!isset($params['general_settings'][$name]))
				$params['general_settings'][$name] = $value;

		foreach ($this->getDefaultOwlSettings($hook_name) as $name => $value)
			if (!isset($params['owl_settings'][$name]))
				$params['owl_settings'][$name] = $value;

		$name_multilang = Tools::jsonEncode($params['name_multilang']);
		$general_settings = Tools::jsonEncode($params['general_settings']);
		$owl_settings = Tools::jsonEncode($params['owl_settings']);

		$shop_ids = Shop::getContextListShopID();
		$insert_rows = array();
		foreach ($shop_ids as $id_shop)
		{
			$insert_rows[$id_shop] = '(';
			$insert_rows[$id_shop] .= (int)$id_carousel;
			$insert_rows[$id_shop] .= ', '.(int)$id_shop;
			$insert_rows[$id_shop] .= ', \''.pSQL($hook_name).'\'';
			$insert_rows[$id_shop] .= ', '.(int)$params['group_in_tabs'];
			$insert_rows[$id_shop] .= ', 1';
			$insert_rows[$id_shop] .= ', '.(int)$this->getNextPosition($hook_name);
			$insert_rows[$id_shop] .= ', \''.pSQL($params['carousel_type']).'\'';
			$insert_rows[$id_shop] .= ', \''.pSQL($name_multilang).'\'';
			$insert_rows[$id_shop] .= ', \''.pSQL($general_settings).'\'';
			$insert_rows[$id_shop] .= ', \''.pSQL($owl_settings).'\'';
			$insert_rows[$id_shop] .= ')';
		}

		$insert_query = '
			INSERT INTO '._DB_PREFIX_.'easycarousels
			VALUES '.implode(',', $insert_rows).'
			ON DUPLICATE KEY UPDATE
			group_in_tabs = VALUES(group_in_tabs),
			carousel_type = VALUES(carousel_type),
			name_multilang = VALUES(name_multilang),
			general_settings = VALUES(general_settings),
			owl_settings = VALUES(owl_settings)
		';
		$saved = $db->execute($insert_query);
		if ($saved && !$this->isRegisteredInHook($hook_name))
			$this->registerHook($hook_name);
		return $saved;
	}

	public function ajaxCallSettingsForm()
	{
		$hook_name = Tools::getValue('hook_name');
		$settings_type = Tools::getValue('settings_type');
		$settings = false;
		if ($settings_type == 'exceptions')
			$settings = $this->getHookExceptions($hook_name);

		if (!$settings)
			$this->throwError($this->l('This type of settings is not supported'));

		$this->context->smarty->assign(array(
			'settings' => $settings,
			'settings_type' => $settings_type,
			'hook_name' => $hook_name,
		));
		$form_html = $this->display($this->local_path, 'views/templates/admin/'.$settings_type.'-settings-form.tpl');
		$ret = array(
			'errors' => array(),
			'form_html' => utf8_encode($form_html),
		);
		die(Tools::jsonEncode($ret));
	}

	public function getHookExceptions($hook_name)
	{
		$current_exceptions = $this->getExceptions(Hook::getIdByName($hook_name));
		$sorted_exceptions = array(
			'core' => array(
				'group_name' => $this->l('Core pages'),
				'values' => array(),
			),
			'modules' => array(
				'group_name' => $this->l('Module pages'),
				'values' => array(),
			),
		);

		$front_controllers = array_keys(Dispatcher::getControllers(_PS_FRONT_CONTROLLER_DIR_));
		foreach ($front_controllers as $fc)
			$sorted_exceptions['core']['values'][$fc] = in_array($fc, $current_exceptions) ? 1 : 0;

		$module_front_controllers = Dispatcher::getModuleControllers('front');
		foreach ($module_front_controllers as $module_name => $controllers)
			foreach ($controllers as $controller_name)
			{
				$key = 'module-'.$module_name.'-'.$controller_name;
				$sorted_exceptions['modules']['values'][$key] = in_array($key, $current_exceptions) ? 1 : 0;
			}

		return $sorted_exceptions;
	}

	public function ajaxSaveHookSettings()
	{
		$hook_name = Tools::getValue('hook_name');
		$settings_type = Tools::getValue('settings_type');
		$saved = false;
		if ($settings_type == 'exceptions')
		{
			$exceptions = Tools::getValue('exceptions');
			$id_hook = Hook::getIdByName($hook_name);
			$saved = $this->unregisterExceptions($id_hook);
			$saved &= $this->registerExceptions($id_hook, $exceptions);
		}
		$ret = array(
			'saved' => $saved ? $this->l('Saved') : false,
		);
		die(Tools::jsonEncode($ret));
	}

	public function ajaxToggleActiveStatus()
	{
		$id_carousel = Tools::getValue('id_carousel');
		$active = Tools::getValue('active');
		$shop_ids = Shop::getContextListShopID();
		$update_query = '
			UPDATE '._DB_PREFIX_.'easycarousels
			SET active = '.(int)$active.'
			WHERE id_carousel = '.(int)$id_carousel.' AND id_shop IN ('.implode(', ', $shop_ids).')
		';
		$db = Db::getInstance();
		$ret = array('success' => $db->execute($update_query));
		die(Tools::jsonEncode($ret));
	}

	public function ajaxDeleteCarousel()
	{
		$id_carousel = Tools::getValue('id_carousel');
		$result = array(
			'deleted' => $this->deleteCarousel($id_carousel),
		);
		die(Tools::jsonEncode($result));
	}

	public function deleteCarousel($id_carousel)
	{
		$shop_ids = Shop::getContextListShopID();
		$delete_query = 'DELETE FROM '._DB_PREFIX_.'easycarousels WHERE id_carousel = '.(int)$id_carousel.' AND id_shop IN ('.implode(', ', $shop_ids).')';
		$deleted = Db::getInstance()->execute($delete_query);
		// TODO: unregister hook if it is not used, but need to find a way to keep hook positions
		return $deleted;
	}

	public function ajaxUpdatePositionsInHook()
	{
		$ordered_ids = Tools::getValue('ordered_ids');
		if (!$ordered_ids)
			$this->throwError($this->l('Ordering failed'));
		$update_rows = array();
		$shop_ids = Shop::getContextListShopID();
		foreach ($shop_ids as $id_shop)
		{
			foreach ($ordered_ids as $k => $id_carousel)
			{
				if ($id_carousel < 1)
					continue;
				$pos = $k + 1;
				$update_rows[] = '('.(int)$id_carousel.', '.(int)$id_shop.', '.(int)$pos.')';
			}
		}
		$update_query = '
			INSERT INTO '._DB_PREFIX_.'easycarousels (id_carousel, id_shop, position)
			VALUES '.implode(', ', $update_rows).'
			ON DUPLICATE KEY UPDATE
			position = VALUES(position)
		';
		if (!Db::getInstance()->execute($update_query))
			$this->throwError($this->l('Ordering failed'));
		$ret = array ('successText' => $this->l('Saved'));
		die(Tools::jsonEncode($ret));
	}

	public function getLangName($name_multilang)
	{
		if (!is_array($name_multilang))
			$name_multilang = Tools::jsonDecode($name_multilang, true);
		if (isset($name_multilang[$this->context->language->id]))
			$name = $name_multilang[$this->context->language->id];
		else if (isset($name_multilang[Configuration::get('PS_LANG_DEFAULT')]))
			$name = $name_multilang[Configuration::get('PS_LANG_DEFAULT')];
		else
			$name = '';
		return $name;
	}

	public function getAllCarousels($sort_by = 'hook_name', $hook_name = false, $active = false, $id_product = 0, $id_category = 0)
	{
		$where = '';
		if ($hook_name)
			$where .= 'AND hook_name = \''.pSQL($hook_name).'\'';
		if ($active)
			$where .= 'AND active = 1';
		$shop_ids = Shop::getContextListShopID();
		$carousels = Db::getInstance()->ExecuteS('
			SELECT * FROM '._DB_PREFIX_.'easycarousels
			WHERE id_shop IN ('.implode(', ', $shop_ids).') '.$where.'
			GROUP BY id_carousel
			ORDER BY position
		');

		if ($sort_by)
		{
			$sorted_carousels = array();
			foreach ($carousels as $k => $c)
			{
				// id_carousel, id_shop, group_in_tabs etc...
				foreach ($c as $name => $value)
					$sorted_carousels[$c[$sort_by]][$k][$name] = $value;
				$sorted_carousels[$c[$sort_by]][$k]['name'] = $this->getLangName($c['name_multilang']);
				// hook_name is called only in front-office
				if ($hook_name)
				{
					$general_settings = Tools::jsonDecode($c['general_settings'], true);
					$sorted_carousels[$c[$sort_by]][$k]['general_settings'] = $general_settings;
					$items = $this->getStructuredCarouselItems( $c['carousel_type'], $general_settings, $id_category, $id_product);
					if (!$items)
						unset($sorted_carousels[$c[$sort_by]][$k]);
					else
						$sorted_carousels[$c[$sort_by]][$k]['items'] = $items;
				}
			}
			$carousels = $sorted_carousels;
		}
		return $carousels;
	}

	public function throwError($errors)
	{
		if (!is_array($errors))
			$errors = array($errors);
		$ret = array(
			'errors' => $errors,
		);
		exit(Tools::jsonEncode($ret));
	}
}