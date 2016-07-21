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
        $this->bootstrap = true;
 	 	$this->name = 'categorysap';
		$this->version = '1.0.0';
		$this->author = 'Arkix';
 	 	$this->tab = 'front_office_features';
		$this->need_instance = 0;
		$this->secure_key = Tools::encrypt($this->name);

		parent::__construct();

        $this->displayName = $this->l('Categorías SAP');
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
            $process = true;
            $codes = Tools::getValue('txtCtg');
            
            if (isset($codes)) {
                
                foreach ($codes as $key => $code) {                    
                    $update = Db::getInstance()->update('category', array('subgrupo' => $code), 'id_category = '.$key);

                    if (!$update) {
                        $process = false;
                    }    
                }
                
                if ($process) {
                    $this->context->smarty->assign('saveMsg', 'Guardado correctamente');
                } else {
                    $this->context->smarty->assign('errorMsg', 'Error al guardar');
                }
            }
		}	

		$categories	= Db::getInstance()->ExecuteS('SELECT c.id_category, cl.name AS "nameCat", c.subgrupo FROM '. _DB_PREFIX_ .'category c
                                                 JOIN '. _DB_PREFIX_ .'category_lang cl ON c.id_category = cl.id_category
                                                 WHERE c.level_depth >2');
        
        $this->context->smarty->assign('displayName',strtoupper($this->displayName));
        $this->context->smarty->assign('allCategories',$categories);
		
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