<?php
/*
*
* 2012-2013 PrestaCS
*
* Module PrestaCenter XML Export Free – version for PrestaShop 1.5.x
* Modul PrestaCenter XML Export Free – verze pro PrestaShop 1.5.x
* 
* @author PrestaCS <info@prestacs.com>
* PrestaCenter XML Export Free (c) copyright 2012-2013 PrestaCS - Anatoret plus s.r.o.
* 
* PrestaCenter - modules and customization for PrestaShop
* PrestaCS - moduly, česká lokalizace a úpravy pro PrestaShop
*
* http://www.prestacs.cz
* 
*/

class PcXmlFreeTemplate
{
	protected $common = array();
	protected $feedVars = array();
	protected $helperData = array();
	public function __construct() { }
	public function setCommonData(array $common)
	{
		$this->common = $common;
		return $this;
	}
	public function set($name, $value)
	{
		$this->feedVars[$name] = $value;
		return $this;
	}
	public function reset()
	{
		$this->feedVars = array();
		return $this;
	}
	protected function parseCustomAvailability($custom)
	{
		$opts = array(0, '#', '#', '#', 'Y-m-d', '#skipProduct');
		$custom = array_map('trim', explode(',', $custom));
		if (isset($custom[0]) && $custom[0] !== '') {
			$tmp = array_map('trim', explode(':', $custom[0]));
			if (count($tmp) === 1) {  
				$opts[0] = 0;
				$opts[1] = $opts[2] = $tmp[0];
			} elseif (count($tmp) === 3 && ctype_digit($tmp[0])) { 
				$opts[0] = (int)$tmp[0];
				$opts[1] = $tmp[1];
				$opts[2] = $tmp[2];
			}
		}
		if (isset($custom[1]) && $custom[1] !== '') {
			$tmp = array_map('trim', explode(':', $custom[1]));
			if (count($tmp) === 1) {   
				$opts[3] = $tmp[0];
			} elseif ($tmp[0] === '#') {  
				$opts[3] = '#';
				$opts[4] = !empty($tmp[1]) ? $tmp[1] : $opts[4];
			}
		}
		if (isset($custom[2]) && $custom[2] !== '') {
			$opts[5] = $custom[2];
		}
		return $opts;
	}
	protected function generatorAvailability($uid, $value, $custom = '')
	{
		if (empty($this->helperData['order_default'])) {
			$this->helperData['order_default'] = (int)Configuration::get('PS_ORDER_OUT_OF_STOCK');
		}
		if (empty($this->helperData['availability'][$uid])) {
			$this->helperData['availability'][$uid] = $this->parseCustomAvailability($custom);
		}
		$opts = $this->helperData['availability'][$uid];
		$product = $this->feedVars['product'];
		if (!$this->id_combination && $product['quantity'] > 0 || $this->id_combination && $product['variant'][$this->id_combination]['quantity'] > 0) {
			$days = preg_match('~(\\d)~', $product['available_now'][$this->feedVars['id_lang']], $m) ? $m[1] : 0;
			if ($opts[0] === 0 || $days <= $opts[0]) {
				return $opts[1] === '#' ? $days : $opts[1];
			} else {
				return $opts[2] === '#' ? $days : $opts[2];
			}
		} elseif ($product['out_of_stock'] == 1 || $product['out_of_stock'] == 2 && $this->helperData['order_default']) {
			if ($opts[3] === '#skipProduct') {
				throw new PcXmlFreeAvailabilityException;
			} elseif ($opts[3] !== '#') {
				return $opts[3] === '#skipTag' ? '' : $opts[3];
			} else {
				if ($product['available_later'][$this->feedVars['id_lang']] === '')
					return '';
				if (preg_match('~(\d{4}-\d{1,2}-\d{1,2}|\d{1,2}\.\s*\d{1,2}\.\s*\d{4})~',
						$product['available_later'][$this->feedVars['id_lang']], $m)) {
					return date($opts[4], strtotime(str_replace(' ', '', $m[1])));
				} elseif (preg_match('~(\d+)~', $product['available_later'][$this->feedVars['id_lang']], $m)) {
					return (int)$m[1];
				} else {
					return '';
				}
			}
		} else {
			if ($opts[5] === '#skipProduct')
				throw new PcXmlFreeAvailabilityException;
			return $opts[5] === '#skipTag' ? '' : $opts[5];
		}
		return ''; 
	}
	protected function helperCondition($uid, $condition, $custom = '')
	{
		if (empty($this->helperData['condition'][$uid])) {
			$values = explode(',', trim($custom, '[]')); 
			$values = array_map('trim', $values);
			$fromDb = array('new', 'bazaar', 'refurbished');
			foreach($values as $key => $translation) {
				if (isset($fromDb[$key]))
					$this->helperData['condition'][$uid][$fromDb[$key]] = $translation;
			}
		}
		return isset($this->helperData['condition'][$uid][$condition]) ? $this->helperData['condition'][$uid][$condition] : $condition;
	}
	protected function helperFtime($uid, $time, $format = 'Y-m-d\TH:i:sP')
	{
		return gmdate(trim($format), $time);
	}
	protected function helperCategories($uid, $categories, $delim = '|')
	{
		return str_replace('|', htmlspecialchars($delim, null, null, false), $categories);
	}
	protected function helperEscape($uid, $input, $custom = '')
	{
		return htmlspecialchars($input, ENT_QUOTES, 'UTF-8', false);
	}
	protected function helperStrip($uid, $input, $custom = '')
	{
		return preg_replace('~\s+~u', ' ', $input);
	}
	public function helperClean($uid, $input, $custom = '')
	{
		$input = preg_replace("/(?:\s|&nbsp;|\<br\>|\<br \/\>|\<br\/\>)+/ui", " ", $input, -1);
		$input = trim(strip_tags($input));
		return $input;
	}
	
	public function feed1header(array $product = array()) 
	{ 
		$output = ''
		.'<?xml version="1.0" encoding="utf-8"?><SHOP>'."\n"; 
		return $output; 
	} 

	public function feed1product(array $product = array()) 
	{ 
		$product['availability'] = $this->generatorAvailability(14, $product['availability'], 'in stock, on order, sold out');
		$output = ''
		.'<SHOPITEM>'
		.($product['name'][$this->feedVars['id_lang']] !== '' ? '<PRODUCT>'.($product['name'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(1, $this->helperClean(1, $product['name'][$this->feedVars['id_lang']])) : '').'</PRODUCT>' : '')
		.($product['id'] !== '' ? '<PRODUCT_ID>'.($product['id'] !== '' ? $this->helperEscape(2, $product['id']) : '').'</PRODUCT_ID>' : '')
		.($product['description_short'][$this->feedVars['id_lang']] !== '' ? '<DESCRIPTION_SHORT>'.($product['description_short'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(3, $this->helperClean(3, $product['description_short'][$this->feedVars['id_lang']])) : '').'</DESCRIPTION_SHORT>' : '')
		.($product['description'][$this->feedVars['id_lang']] !== '' ? '<DESCRIPTION>'.($product['description'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(4, $this->helperClean(4, $product['description'][$this->feedVars['id_lang']])) : '').'</DESCRIPTION>' : '')
		.($product['reference'] !== '' ? '<REFERENCE>'.($product['reference'] !== '' ? $this->helperEscape(5, $this->helperClean(5, $product['reference'])) : '').'</REFERENCE>' : '')
		.($product['ean'] !== '' ? '<EAN>'.($product['ean'] !== '' ? $this->helperEscape(6, $product['ean']) : '').'</EAN>' : '')
		.($product['categories'][$this->feedVars['id_lang']] !== '' ? '<CATEGORYTEXT>'.($product['categories'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(7, $this->helperClean(7, $product['categories'][$this->feedVars['id_lang']])) : '').'</CATEGORYTEXT>' : '')
		.($product['url'][$this->feedVars['id_lang']] !== '' ? '<URL>'.($product['url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(8, $this->helperStrip(8, $product['url'][$this->feedVars['id_lang']])) : '').'</URL>' : '')
		.($product['img_url'][$this->feedVars['id_lang']] !== '' ? '<IMGURL>'.($product['img_url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(9, $this->helperStrip(9, $product['img_url'][$this->feedVars['id_lang']])) : '').'</IMGURL>' : '')
		.($product['manufacturer'] !== '' ? '<MANUFACTURER>'.($product['manufacturer'] !== '' ? $this->helperEscape(10, $this->helperStrip(10, $product['manufacturer'])) : '').'</MANUFACTURER>' : '')
		.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? '<PRICE_VAT>'.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? $this->helperEscape(11, $product['price_vat'][$this->feedVars['id_currency']]) : '').'</PRICE_VAT>' : '')
		.($product['condition'] !== '' ? '<ITEM_TYPE>'.($product['condition'] !== '' ? $this->helperEscape(12, $this->helperCondition(12, $this->helperClean(12, $product['condition'], 'new,bazaar,bazaar'), 'new,bazaar,bazaar')) : '').'</ITEM_TYPE>' : '')
		.($product['days'][$this->feedVars['id_lang']] !== '' ? '<DELIVERY>'.($product['days'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(13, $product['days'][$this->feedVars['id_lang']]) : '').'</DELIVERY>' : '')
		.($product['availability'] !== '' ? '<AVAILABILITY>'.($product['availability'] !== '' ? $this->helperEscape(14, $this->helperClean(14, $product['availability'], 'in stock, on order, sold out')) : '').'</AVAILABILITY>' : '')
		.'</SHOPITEM>'."\n"; 
		return $output; 
	} 

	public function feed1footer(array $product = array()) 
	{ 
		$output = ''
		.'</SHOP>
'."\n"; 
		return $output; 
	} 

	public function feed2header(array $product = array()) 
	{ 
		$output = ''
		.'<?xml version="1.0" encoding="utf-8"?><SHOP>'."\n"; 
		return $output; 
	} 

	public function feed2product(array $product = array()) 
	{ 
		$product['availability'] = $this->generatorAvailability(28, $product['availability'], 'in stock, on order, sold out');
		$output = ''
		.'<SHOPITEM>'
		.($product['name'][$this->feedVars['id_lang']] !== '' ? '<PRODUCT>'.($product['name'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(15, $this->helperClean(15, $product['name'][$this->feedVars['id_lang']])) : '').'</PRODUCT>' : '')
		.($product['id'] !== '' ? '<PRODUCT_ID>'.($product['id'] !== '' ? $this->helperEscape(16, $product['id']) : '').'</PRODUCT_ID>' : '')
		.($product['description_short'][$this->feedVars['id_lang']] !== '' ? '<DESCRIPTION_SHORT>'.($product['description_short'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(17, $this->helperClean(17, $product['description_short'][$this->feedVars['id_lang']])) : '').'</DESCRIPTION_SHORT>' : '')
		.($product['description'][$this->feedVars['id_lang']] !== '' ? '<DESCRIPTION>'.($product['description'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(18, $this->helperClean(18, $product['description'][$this->feedVars['id_lang']])) : '').'</DESCRIPTION>' : '')
		.($product['reference'] !== '' ? '<REFERENCE>'.($product['reference'] !== '' ? $this->helperEscape(19, $this->helperClean(19, $product['reference'])) : '').'</REFERENCE>' : '')
		.($product['ean'] !== '' ? '<EAN>'.($product['ean'] !== '' ? $this->helperEscape(20, $product['ean']) : '').'</EAN>' : '')
		.($product['categories'][$this->feedVars['id_lang']] !== '' ? '<CATEGORYTEXT>'.($product['categories'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(21, $this->helperClean(21, $product['categories'][$this->feedVars['id_lang']])) : '').'</CATEGORYTEXT>' : '')
		.($product['url'][$this->feedVars['id_lang']] !== '' ? '<URL>'.($product['url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(22, $this->helperStrip(22, $product['url'][$this->feedVars['id_lang']])) : '').'</URL>' : '')
		.($product['img_url'][$this->feedVars['id_lang']] !== '' ? '<IMGURL>'.($product['img_url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(23, $this->helperStrip(23, $product['img_url'][$this->feedVars['id_lang']])) : '').'</IMGURL>' : '')
		.($product['manufacturer'] !== '' ? '<MANUFACTURER>'.($product['manufacturer'] !== '' ? $this->helperEscape(24, $this->helperStrip(24, $product['manufacturer'])) : '').'</MANUFACTURER>' : '')
		.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? '<PRICE_VAT>'.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? $this->helperEscape(25, $product['price_vat'][$this->feedVars['id_currency']]) : '').'</PRICE_VAT>' : '')
		.($product['condition'] !== '' ? '<ITEM_TYPE>'.($product['condition'] !== '' ? $this->helperEscape(26, $this->helperCondition(26, $this->helperClean(26, $product['condition'], 'new,bazaar,bazaar'), 'new,bazaar,bazaar')) : '').'</ITEM_TYPE>' : '')
		.($product['days'][$this->feedVars['id_lang']] !== '' ? '<DELIVERY>'.($product['days'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(27, $product['days'][$this->feedVars['id_lang']]) : '').'</DELIVERY>' : '')
		.($product['availability'] !== '' ? '<AVAILABILITY>'.($product['availability'] !== '' ? $this->helperEscape(28, $this->helperClean(28, $product['availability'], 'in stock, on order, sold out')) : '').'</AVAILABILITY>' : '')
		.'</SHOPITEM>'."\n"; 
		return $output; 
	} 

	public function feed2footer(array $product = array()) 
	{ 
		$output = ''
		.'</SHOP>
'."\n"; 
		return $output; 
	} 

	public function feed4header(array $product = array()) 
	{ 
		$output = ''
		.'<?xml version="1.0" encoding="utf-8" standalone="yes"?><rss xmlns:date="http://exslt.org/dates-and-times" xmlns:g="http://base.google.com/ns/1.0" xmlns:c="http://www.chaordic.com.br/ns/catalog/1.0" version="2.0"><channel>'
		.'<title>'.$this->helperEscape(29, $this->helperStrip(29, $this->common['shop_name'])).'</title>'
		.'<link>'.$this->helperEscape(30, $this->helperStrip(30, $this->common['shop_url'])).'</link>'
		.'<last_build_date>'.$this->helperEscape(31, $this->helperFtime(31, $this->common['update_feed'])).'</last_build_date>'."\n"; 
		return $output; 
	} 

	public function feed4product(array $product = array()) 
	{ 
		$product['availability'] = $this->generatorAvailability(40, $product['availability'], 'in stock, on order, sold out');
		$output = ''
		.'<item>'
		.'<g:item_group_id>'.$this->helperEscape(32, $product['id']).'</g:item_group_id>'
		.'<g:id>'.$this->helperEscape(33, $this->helperClean(33, $product['reference_product'])).'</g:id>'
		.'<title>'.$this->helperEscape(34, $this->helperClean(34, $product['name'][$this->feedVars['id_lang']])).'</title>'
		.'<description>'.$this->helperEscape(35, $this->helperClean(35, $product['description'][$this->feedVars['id_lang']])).'</description>'
		.'<c:categories>'.$this->helperEscape(36, $this->helperStrip(36, $product['categoriesmeta'])).'</c:categories>'
		.'<link>'.$this->helperEscape(37, $this->helperStrip(37, $product['url'][$this->feedVars['id_lang']])).'</link>'
		.'<g:image_link>'.$this->helperEscape(38, $this->helperStrip(38, $product['img_url'][$this->feedVars['id_lang']])).'</g:image_link>'
		.'<g:condition>'.$this->helperEscape(39, $this->helperCondition(39, $this->helperClean(39, $product['condition'], 'new,used,refurbished'), 'new,used,refurbished')).'</g:condition>'
		.'<g:availability>'.$this->helperEscape(40, $this->helperClean(40, $product['availability'], 'in stock, on order, sold out')).'</g:availability>'
		.'<g:price>'.$this->helperEscape(41, $product['price_vat_iso'][$this->feedVars['id_currency']]).'</g:price>'
		.'<g:gtin>'.$this->helperEscape(42, $product['ean']).'</g:gtin>'
		.'<g:brand>'.$this->helperEscape(43, $this->helperStrip(43, $product['manufacturer'])).'</g:brand>'
		.'</item>'."\n"; 
		return $output; 
	} 

	public function feed4footer(array $product = array()) 
	{ 
		$output = ''
		.'</channel></rss>'."\n"; 
		return $output; 
	} 

}
