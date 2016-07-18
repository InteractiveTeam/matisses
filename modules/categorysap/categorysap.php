<?php
/*
* 2007-2014 PrestaShop
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_'))
	exit;

require_once __DIR__ . '/dbregistercs.php';

class categorysap extends Module
{
	private $_html = '';
	private $_postErrors = array();
	public $context;

	function __construct($dontTranslate = false)
 	{
        $this->db = new DBRegisterCS();
 	 	$this->name = 'categorysap';
		$this->version = '1.0.0';
		$this->author = 'Arkix';
 	 	$this->tab = 'front_office_features';
		$this->need_instance = 0;
		$this->secure_key = Tools::encrypt($this->name);

		parent::__construct();

        $this->displayName = $this->l('Categorías con SAP');
        $this->description = $this->l('Permite asociar las categorías de Prestashop con los identificadores de SAP.');
		$this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
	}
    
    /***********************************************
	* BACKEND
	***********************************************/
	public function getContent()
	{	
		if (Tools::isSubmit('updateCodes'))
		{
			$NewApyKey = pSQL(Tools::getValue('ApyKey'));
			if(0==Db::getInstance()->getValue('SELECT count(*) as disp FROM `' . _DB_PREFIX_ . 'wsmatisses_configuration`'))
			{
				Db::getInstance()->insert('wsmatisses_configuration', array('apykey' =>	$NewApyKey));
			}else{
					Db::getInstance()->update('wsmatisses_configuration', array('apykey' =>	$NewApyKey));
				 }
			Configuration::updateValue($this->name.'_UrlWs', pSQL(Tools::getValue('url')));	
			Configuration::updateValue($this->name.'_LocationWs', pSQL(Tools::getValue('locationurl')));
			Configuration::updateValue($this->name.'_RowNumber', pSQL(Tools::getValue('RowNumber')));
			Configuration::updateValue($this->name.'_TimeRecord', abs(pSQL(Tools::getValue('TimeRecord'))));	 
		}	
		$limit = Configuration::get($this->name.'_RowNumber') ? Configuration::get($this->name.'_RowNumber') : 20;
		$ApyKey	= Db::getInstance()->ExecuteS('SELECT * FROM `' . _DB_PREFIX_ . 'webservice_account` WHERE active =1');
		$Log	= Db::getInstance()->ExecuteS('SELECT * FROM `' . _DB_PREFIX_ . 'wsmatisses_log` order by register_date desc limit '.$limit);
		foreach($Log as $d => $v)
		{
			$Log[$d]['register_date'] = date('Y-m-d H:i:s', $Log[$d]['register_date']);
		}
		foreach($ApyKey as $d => $v)
		{
			$ApyKey[$d]['selected'] = ($ApyKey[$d]['key'] == Db::getInstance()->getValue('SELECT apykey as disp FROM `' . _DB_PREFIX_ . 'wsmatisses_configuration`') 
										? 'selected' : NULL);
		}	
		$this->context->smarty->assign('path',$this->name);
		$this->context->smarty->assign('displayName',$this->displayName);
		$this->context->smarty->assign('ApyKey',$ApyKey);
		$this->context->smarty->assign('UrlWs',Configuration::get($this->name.'_UrlWs'));
		$this->context->smarty->assign('locationurl',Configuration::get($this->name.'_LocationWs'));
		$this->context->smarty->assign('RowNumber',Configuration::get($this->name.'_RowNumber'));
		$this->context->smarty->assign('TimeRecord',Configuration::get($this->name.'_TimeRecord'));
		$this->context->smarty->assign('Log',$Log);
		
		return $this->display(__FILE__, '/views/backend.tpl');
	}	

	public function install()
	{
	 	return (parent::install() && $this->db->CreateTable());
	}

	public function uninstall()
	{
		return (parent::uninstall() && $this->db->DeleteTable());
	}
}