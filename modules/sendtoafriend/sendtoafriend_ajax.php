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

require_once(dirname(__FILE__).'/../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../init.php');
include_once(dirname(__FILE__).'/sendtoafriend.php');

$module = new SendToAFriend();

if (Tools::getValue('action') == 'sendToMyFriend' && Tools::getValue('secure_key') == $module->secure_key)
{
		$response=file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=6LdfuxYUAAAAAKuZuJNp0DBgB19hK9eX8hizG6F3&response=".Tools::getValue('g_recaptcha_response')."&remoteip=".$_SERVER['REMOTE_ADDR']);
		$obj = json_decode($response);
		if($obj->success == false)
		{
			die('0');
		}
		// Retrocompatibilty with old theme
		if($friend = Tools::getValue('friend'))
		{
			$friend = Tools::jsonDecode($friend, true);

			foreach ($friend as $key => $value)
			{
				if ($value['key'] == 'friend_name')
					$friendName = $value['value'];
				elseif ($value['key'] == 'friend_email')
					$friendMail = $value['value'];
				elseif ($value['key'] == 'id_product')
					$id_product = $value['value'];
			}
		}
		else
		{
			$friendName = Tools::getValue('name');
			$friendMail = Tools::getValue('email');
			$id_product = Tools::getValue('id_product');
		}
    
        $mailFrom = 'productosweb@matisses.co';

		if (!$friendName || !$friendMail || !$id_product)
			die('0');

		/* Email generation */
		$product = new Product((int)$id_product, false, $module->context->language->id);
		$productLink = $module->context->link->getProductLink($product);
            
        $id_image = Product::getCover((int)$id_product);
        if (sizeof($id_image) > 0) {
            $image = new Image($id_image['id_image']);
            $image_url = _PS_BASE_URL_._THEME_PROD_DIR_.$image->getExistingImgPath().".jpg";
        }
        
		$customer = $module->context->cookie->customer_firstname ? $module->context->cookie->customer_firstname.' '.$module->context->cookie->customer_lastname : $module->l('A friend', 'sendtoafriend_ajax');

		$templateVars = array(
			'{product}' => $product->name,
			'{product_link}' => $productLink,
            '{image_url}' => $image_url,
			'{customer}' => $customer,
			'{name}' => Tools::safeOutput($friendName)
		);

		/* Email sending */
		if (!Mail::Send((int)$module->context->cookie->id_lang,
				'send_to_a_friend',
				sprintf(Mail::l('%1$s sent you a link to %2$s', (int)$module->context->cookie->id_lang), $customer, $product->name),
				$templateVars, $friendMail,
				null,
				$mailFrom,
				($module->context->cookie->customer_firstname ? $module->context->cookie->customer_firstname.' '.$module->context->cookie->customer_lastname : null),
				null,
				null,
				dirname(__FILE__).'/mails/'))
			die('0');
		die('1');
}
die('0');
