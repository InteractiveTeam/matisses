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

require_once __DIR__ . '/dbregister.php';

class registerWithSap extends Module
{
	private $_html = '';
	private $_postErrors = array();
	public $context;

	function __construct($dontTranslate = false)
 	{
        $this->db = new DBRegister();
 	 	$this->name = 'registerwithsap';
		$this->version = '1.0.0';
		$this->author = 'Arkix';
 	 	$this->tab = 'front_office_features';
		$this->need_instance = 0;
		$this->secure_key = Tools::encrypt($this->name);

		parent::__construct();

        $this->displayName = $this->l('Registro con SAP');
        $this->description = $this->l('Permite el registro de usuario en el sitio si es cliente en la tienda fisica.');
		$this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
	}

	public function install()
	{
	 	return (parent::install() && $this->registerHook('header') && $this->db->CreateTokenTable());
	}

	public function uninstall()
	{
		return (parent::uninstall() && $this->unregisterHook('header') && $this->db->DeleteTokenTable());
	}

	public function hookHeader($params)
	{
		$this->page_name = Dispatcher::getInstance()->getController();
        $token = Tools::getValue('skey');
	}
    
    public function hookactionCustomerAccountAdd($params){
        
    }
    
    public function checkByEmail($email) {
        $result = Db::getInstance()->ExecuteS('SELECT * FROM '._DB_PREFIX_.'token_email WHERE email = "'.$email.'"');
        return $result;
    }
    
    public function createToken($email, $token) {
        $result = Db::getInstance()->insert('token_email',array(
                        'email' => $email,
                        'token' => $token,
                        'token_used' => 'false')
                    );
        return $result;
    }
    
    public function updateToken($email, $token, $tokenused) {
        $result = Db::getInstance()->update('token_email',array(
                    'token' => $token,
                    'token_used' => $tokenused
                ),"email = '".$email."'");
        return $result;
    }
}