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

	public function feed3header(array $product = array()) 
	{ 
		$output = ''
		.'<?xml version="1.0" encoding="utf-8"?><feed xmlns="http://www.w3.org/2005/Atom" xmlns:g="http://base.google.com/ns/1.0">'
		.($this->common['shop_name'] !== '' ? '<title>'.($this->common['shop_name'] !== '' ? $this->helperEscape(29, $this->helperStrip(29, $this->common['shop_name'])) : '').'</title>' : '')
		.($this->common['shop_url'] !== '' ? '<link rel="self" '.'href="'.($this->common['shop_url'] !== '' ? $this->helperEscape(30, $this->helperStrip(30, $this->common['shop_url'])) : '').'"'.' />' : '')
		.($this->common['update_feed'] !== '' ? '<updated>'.($this->common['update_feed'] !== '' ? $this->helperEscape(31, $this->helperFtime(31, $this->common['update_feed'])) : '').'</updated>' : '')."\n"; 
		return $output; 
	} 

	public function feed3product(array $product = array()) 
	{ 
		$product['availability'] = $this->generatorAvailability(43, $product['availability'], 'in stock, on order, sold out');
		$output = ''
		.'<entry>'
		.($product['name'][$this->feedVars['id_lang']] !== '' ? '<title>'.($product['name'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(32, $this->helperClean(32, $product['name'][$this->feedVars['id_lang']])) : '').'</title>' : '')
		.($product['id'] !== '' ? '<g:id>'.($product['id'] !== '' ? $this->helperEscape(33, $product['id']) : '').'</g:id>' : '')
		.($product['url'][$this->feedVars['id_lang']] !== '' ? '<link '.'href="'.($product['url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(34, $this->helperStrip(34, $product['url'][$this->feedVars['id_lang']])) : '').'"'.' />' : '')
		.($product['description_short'][$this->feedVars['id_lang']] !== '' ? '<summary>'.($product['description_short'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(35, $this->helperClean(35, $product['description_short'][$this->feedVars['id_lang']])) : '').'</summary>' : '')
		.($product['update_item'] !== '' ? '<updated>'.($product['update_item'] !== '' ? $this->helperEscape(36, $this->helperFtime(36, $product['update_item'])) : '').'</updated>' : '')
		.'<g:google_product_category></g:google_product_category>'
		.($product['categories'][$this->feedVars['id_lang']] !== '' ? '<g:product_type>'.($product['categories'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(37, $this->helperClean(37, $product['categories'][$this->feedVars['id_lang']])) : '').'</g:product_type>' : '')
		.($product['img_url'][$this->feedVars['id_lang']] !== '' ? '<g:image_link>'.($product['img_url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(38, $this->helperStrip(38, $product['img_url'][$this->feedVars['id_lang']])) : '').'</g:image_link>' : '')
		.($product['price_vat_iso'][$this->feedVars['id_currency']] !== '' ? '<g:price>'.($product['price_vat_iso'][$this->feedVars['id_currency']] !== '' ? $this->helperEscape(39, $product['price_vat_iso'][$this->feedVars['id_currency']]) : '').'</g:price>' : '')
		.($product['condition'] !== '' ? '<g:condition>'.($product['condition'] !== '' ? $this->helperEscape(40, $this->helperCondition(40, $this->helperClean(40, $product['condition'], 'new,used,refurbished'), 'new,used,refurbished')) : '').'</g:condition>' : '')
		.($product['ean'] !== '' ? '<g:gtin>'.($product['ean'] !== '' ? $this->helperEscape(41, $product['ean']) : '').'</g:gtin>' : '')
		.($product['manufacturer'] !== '' ? '<g:brand>'.($product['manufacturer'] !== '' ? $this->helperEscape(42, $this->helperStrip(42, $product['manufacturer'])) : '').'</g:brand>' : '')
		.($product['availability'] !== '' ? '<g:availability>'.($product['availability'] !== '' ? $this->helperEscape(43, $this->helperClean(43, $product['availability'], 'in stock, on order, sold out')) : '').'</g:availability>' : '')
		.'</entry>'."\n"; 
		return $output; 
	} 

	public function feed3footer(array $product = array()) 
	{ 
		$output = ''
		.'</feed>'."\n"; 
		return $output; 
	} 

	public function feed4header(array $product = array()) 
	{ 
		$output = ''
		.'<?xml version="1.0" encoding="utf-8" standalone="yes"?><rss xmlns:date="http://exslt.org/dates-and-times" xmlns:g="http://base.google.com/ns/1.0" version="2.0"><channel>'
		.($this->common['shop_name'] !== '' ? '<title>'.($this->common['shop_name'] !== '' ? $this->helperEscape(44, $this->helperStrip(44, $this->common['shop_name'])) : '').'</title>' : '')
		.($this->common['shop_url'] !== '' ? '<link>'.($this->common['shop_url'] !== '' ? $this->helperEscape(45, $this->helperStrip(45, $this->common['shop_url'])) : '').'</link>' : '')
		.($this->common['update_feed'] !== '' ? '<last_build_date>'.($this->common['update_feed'] !== '' ? $this->helperEscape(46, $this->helperFtime(46, $this->common['update_feed'])) : '').'</last_build_date>' : '')."\n"; 
		return $output; 
	} 

	public function feed4product(array $product = array()) 
	{ 
		$product['availability'] = $this->generatorAvailability(54, $product['availability'], 'in stock, on order, sold out');
		$output = ''
		.'<item>'
		.($product['reference'] !== '' ? '<g:id>'.($product['reference'] !== '' ? $this->helperEscape(47, $this->helperClean(47, $product['reference'])) : '').'</g:id>' : '')
		.($product['name'][$this->feedVars['id_lang']] !== '' ? '<title>'.($product['name'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(48, $this->helperClean(48, $product['name'][$this->feedVars['id_lang']])) : '').'</title>' : '')
		.($product['description_short'][$this->feedVars['id_lang']] !== '' ? '<description>'.($product['description_short'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(49, $this->helperClean(49, $product['description_short'][$this->feedVars['id_lang']])) : '').'</description>' : '')
		.'<g:google_product_category></g:google_product_category>'
		.($product['categories'][$this->feedVars['id_lang']] !== '' ? '<g:product_type>'.($product['categories'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(50, $this->helperClean(50, $product['categories'][$this->feedVars['id_lang']])) : '').'</g:product_type>' : '')
		.($product['url'][$this->feedVars['id_lang']] !== '' ? '<link>'.($product['url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(51, $this->helperStrip(51, $product['url'][$this->feedVars['id_lang']])) : '').'</link>' : '')
		.($product['img_url'][$this->feedVars['id_lang']] !== '' ? '<g:image_link>'.($product['img_url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(52, $this->helperStrip(52, $product['img_url'][$this->feedVars['id_lang']])) : '').'</g:image_link>' : '')
		.($product['condition'] !== '' ? '<g:condition>'.($product['condition'] !== '' ? $this->helperEscape(53, $this->helperCondition(53, $this->helperClean(53, $product['condition'], 'new,used,refurbished'), 'new,used,refurbished')) : '').'</g:condition>' : '')
		.($product['availability'] !== '' ? '<g:availability>'.($product['availability'] !== '' ? $this->helperEscape(54, $this->helperClean(54, $product['availability'], 'in stock, on order, sold out')) : '').'</g:availability>' : '')
		.($product['price_vat_iso'][$this->feedVars['id_currency']] !== '' ? '<g:price>'.($product['price_vat_iso'][$this->feedVars['id_currency']] !== '' ? $this->helperEscape(55, $product['price_vat_iso'][$this->feedVars['id_currency']]) : '').'</g:price>' : '')
		.($product['ean'] !== '' ? '<g:gtin>'.($product['ean'] !== '' ? $this->helperEscape(56, $product['ean']) : '').'</g:gtin>' : '')
		.($product['manufacturer'] !== '' ? '<g:brand>'.($product['manufacturer'] !== '' ? $this->helperEscape(57, $this->helperStrip(57, $product['manufacturer'])) : '').'</g:brand>' : '')
		.($product['id'] !== '' ? '<g:item_group_id>'.($product['id'] !== '' ? $this->helperEscape(58, $product['id']) : '').'</g:item_group_id>' : '')
		.'</item>'."\n"; 
		return $output; 
	} 

	public function feed4footer(array $product = array()) 
	{ 
		$output = ''
		.'</channel></rss>'."\n"; 
		return $output; 
	} 

	public function feed5header(array $product = array()) 
	{ 
		$output = ''
		.'<?xml version="1.0" encoding="utf-8"?><feed xmlns="http://www.w3.org/2005/Atom" xmlns:g="http://base.google.com/ns/1.0">'
		.($this->common['shop_name'] !== '' ? '<title>'.($this->common['shop_name'] !== '' ? $this->helperEscape(59, $this->helperStrip(59, $this->common['shop_name'])) : '').'</title>' : '')
		.($this->common['shop_url'] !== '' ? '<link rel="self" '.'href="'.($this->common['shop_url'] !== '' ? $this->helperEscape(60, $this->helperStrip(60, $this->common['shop_url'])) : '').'"'.' />' : '')
		.($this->common['update_feed'] !== '' ? '<updated>'.($this->common['update_feed'] !== '' ? $this->helperEscape(61, $this->helperFtime(61, $this->common['update_feed'])) : '').'</updated>' : '')."\n"; 
		return $output; 
	} 

	public function feed5product(array $product = array()) 
	{ 
		$product['availability'] = $this->generatorAvailability(73, $product['availability'], 'in stock, on order, sold out');
		$output = ''
		.'<entry>'
		.($product['name'][$this->feedVars['id_lang']] !== '' ? '<title>'.($product['name'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(62, $this->helperClean(62, $product['name'][$this->feedVars['id_lang']])) : '').'</title>' : '')
		.($product['id'] !== '' ? '<g:id>'.($product['id'] !== '' ? $this->helperEscape(63, $product['id']) : '').'</g:id>' : '')
		.($product['url'][$this->feedVars['id_lang']] !== '' ? '<link '.'href="'.($product['url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(64, $this->helperStrip(64, $product['url'][$this->feedVars['id_lang']])) : '').'"'.' />' : '')
		.($product['description_short'][$this->feedVars['id_lang']] !== '' ? '<summary>'.($product['description_short'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(65, $this->helperClean(65, $product['description_short'][$this->feedVars['id_lang']])) : '').'</summary>' : '')
		.($product['update_item'] !== '' ? '<updated>'.($product['update_item'] !== '' ? $this->helperEscape(66, $this->helperFtime(66, $product['update_item'])) : '').'</updated>' : '')
		.'<g:google_product_category></g:google_product_category>'
		.($product['categories'][$this->feedVars['id_lang']] !== '' ? '<g:product_type>'.($product['categories'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(67, $this->helperClean(67, $product['categories'][$this->feedVars['id_lang']])) : '').'</g:product_type>' : '')
		.($product['img_url'][$this->feedVars['id_lang']] !== '' ? '<g:image_link>'.($product['img_url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(68, $this->helperStrip(68, $product['img_url'][$this->feedVars['id_lang']])) : '').'</g:image_link>' : '')
		.($product['price_vat_iso'][$this->feedVars['id_currency']] !== '' ? '<g:price>'.($product['price_vat_iso'][$this->feedVars['id_currency']] !== '' ? $this->helperEscape(69, $product['price_vat_iso'][$this->feedVars['id_currency']]) : '').'</g:price>' : '')
		.($product['condition'] !== '' ? '<g:condition>'.($product['condition'] !== '' ? $this->helperEscape(70, $this->helperCondition(70, $this->helperClean(70, $product['condition'], 'new,used,refurbished'), 'new,used,refurbished')) : '').'</g:condition>' : '')
		.($product['ean'] !== '' ? '<g:gtin>'.($product['ean'] !== '' ? $this->helperEscape(71, $product['ean']) : '').'</g:gtin>' : '')
		.($product['manufacturer'] !== '' ? '<g:brand>'.($product['manufacturer'] !== '' ? $this->helperEscape(72, $this->helperStrip(72, $product['manufacturer'])) : '').'</g:brand>' : '')
		.($product['availability'] !== '' ? '<g:availability>'.($product['availability'] !== '' ? $this->helperEscape(73, $this->helperClean(73, $product['availability'], 'in stock, on order, sold out')) : '').'</g:availability>' : '')
		.'</entry>'."\n"; 
		return $output; 
	} 

	public function feed5footer(array $product = array()) 
	{ 
		$output = ''
		.'</feed>'."\n"; 
		return $output; 
	} 

	public function feed6header(array $product = array()) 
	{ 
		$output = ''
		.'<?xml version="1.0" encoding="utf-8"?><SHOP>'."\n"; 
		return $output; 
	} 

	public function feed6product(array $product = array()) 
	{ 
		$product['availability'] = $this->generatorAvailability(83, $product['availability'], '0, 7, 14');
		$output = ''
		.'<SHOPITEM>'
		.($product['name'][$this->feedVars['id_lang']] !== '' ? '<PRODUCTNAME>'.($product['name'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(74, $this->helperClean(74, $product['name'][$this->feedVars['id_lang']])) : '').'</PRODUCTNAME>' : '')
		.($product['name'][$this->feedVars['id_lang']] !== '' ? '<PRODUCT>'.($product['name'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(75, $this->helperClean(75, $product['name'][$this->feedVars['id_lang']])) : '').'</PRODUCT>' : '')
		.($product['description_short'][$this->feedVars['id_lang']] !== '' ? '<DESCRIPTION>'.($product['description_short'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(76, $this->helperClean(76, $product['description_short'][$this->feedVars['id_lang']])) : '').'</DESCRIPTION>' : '')
		.($product['url'][$this->feedVars['id_lang']] !== '' ? '<URL>'.($product['url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(77, $this->helperStrip(77, $product['url'][$this->feedVars['id_lang']])) : '').'</URL>' : '')
		.($product['img_url'][$this->feedVars['id_lang']] !== '' ? '<IMGURL>'.($product['img_url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(78, $this->helperStrip(78, $product['img_url'][$this->feedVars['id_lang']])) : '').'</IMGURL>' : '')
		.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? '<PRICE_VAT>'.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? $this->helperEscape(79, $product['price_vat'][$this->feedVars['id_currency']]) : '').'</PRICE_VAT>' : '')
		.($product['manufacturer'] !== '' ? '<MANUFACTURER>'.($product['manufacturer'] !== '' ? $this->helperEscape(80, $this->helperStrip(80, $product['manufacturer'])) : '').'</MANUFACTURER>' : '')
		.($product['categories'][$this->feedVars['id_lang']] !== '' ? '<CATEGORYTEXT>'.($product['categories'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(81, $this->helperClean(81, $product['categories'][$this->feedVars['id_lang']])) : '').'</CATEGORYTEXT>' : '')
		.($product['ean'] !== '' ? '<EAN>'.($product['ean'] !== '' ? $this->helperEscape(82, $product['ean']) : '').'</EAN>' : '')
		.($product['availability'] !== '' ? '<DELIVERY_DATE>'.($product['availability'] !== '' ? $this->helperEscape(83, $this->helperClean(83, $product['availability'], '0, 7, 14')) : '').'</DELIVERY_DATE>' : '')
		.'</SHOPITEM>'."\n"; 
		return $output; 
	} 

	public function feed6footer(array $product = array()) 
	{ 
		$output = ''
		.'</SHOP>'."\n"; 
		return $output; 
	} 

	public function feed7header(array $product = array()) 
	{ 
		$output = ''
		.'<?xml version="1.0" encoding="utf-8"?><SHOP>'."\n"; 
		return $output; 
	} 

	public function feed7product(array $product = array()) 
	{ 
		$product['availability'] = $this->generatorAvailability(93, $product['availability'], '0, 7, 14');
		$output = ''
		.'<SHOPITEM>'
		.($product['name'][$this->feedVars['id_lang']] !== '' ? '<PRODUCTNAME>'.($product['name'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(84, $this->helperClean(84, $product['name'][$this->feedVars['id_lang']])) : '').'</PRODUCTNAME>' : '')
		.($product['name'][$this->feedVars['id_lang']] !== '' ? '<PRODUCT>'.($product['name'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(85, $this->helperClean(85, $product['name'][$this->feedVars['id_lang']])) : '').'</PRODUCT>' : '')
		.($product['description_short'][$this->feedVars['id_lang']] !== '' ? '<DESCRIPTION>'.($product['description_short'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(86, $this->helperClean(86, $product['description_short'][$this->feedVars['id_lang']])) : '').'</DESCRIPTION>' : '')
		.($product['url'][$this->feedVars['id_lang']] !== '' ? '<URL>'.($product['url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(87, $this->helperStrip(87, $product['url'][$this->feedVars['id_lang']])) : '').'</URL>' : '')
		.($product['img_url'][$this->feedVars['id_lang']] !== '' ? '<IMGURL>'.($product['img_url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(88, $this->helperStrip(88, $product['img_url'][$this->feedVars['id_lang']])) : '').'</IMGURL>' : '')
		.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? '<PRICE_VAT>'.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? $this->helperEscape(89, $product['price_vat'][$this->feedVars['id_currency']]) : '').'</PRICE_VAT>' : '')
		.($product['manufacturer'] !== '' ? '<MANUFACTURER>'.($product['manufacturer'] !== '' ? $this->helperEscape(90, $this->helperStrip(90, $product['manufacturer'])) : '').'</MANUFACTURER>' : '')
		.($product['categories'][$this->feedVars['id_lang']] !== '' ? '<CATEGORYTEXT>'.($product['categories'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(91, $this->helperClean(91, $product['categories'][$this->feedVars['id_lang']])) : '').'</CATEGORYTEXT>' : '')
		.($product['ean'] !== '' ? '<EAN>'.($product['ean'] !== '' ? $this->helperEscape(92, $product['ean']) : '').'</EAN>' : '')
		.($product['availability'] !== '' ? '<DELIVERY_DATE>'.($product['availability'] !== '' ? $this->helperEscape(93, $this->helperClean(93, $product['availability'], '0, 7, 14')) : '').'</DELIVERY_DATE>' : '')
		.'</SHOPITEM>'."\n"; 
		return $output; 
	} 

	public function feed7footer(array $product = array()) 
	{ 
		$output = ''
		.'</SHOP>'."\n"; 
		return $output; 
	} 

	public function feed8header(array $product = array()) 
	{ 
		$output = ''
		.'<?xml version="1.0" encoding="utf-8"?><SHOP>'."\n"; 
		return $output; 
	} 

	public function feed8product(array $product = array()) 
	{ 
		$product['availability'] = $this->generatorAvailability(102, $product['availability'], '0, 7, 14');
		$output = ''
		.'<SHOPITEM>'
		.($product['name'][$this->feedVars['id_lang']] !== '' ? '<PRODUCT>'.($product['name'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(94, $this->helperClean(94, $product['name'][$this->feedVars['id_lang']])) : '').'</PRODUCT>' : '')
		.($product['ean'] !== '' ? '<EAN>'.($product['ean'] !== '' ? $this->helperEscape(95, $product['ean']) : '').'</EAN>' : '')
		.($product['reference'] !== '' ? '<PRODUCTNO>'.($product['reference'] !== '' ? $this->helperEscape(96, $this->helperClean(96, $product['reference'])) : '').'</PRODUCTNO>' : '')
		.($product['description_short'][$this->feedVars['id_lang']] !== '' ? '<DESCRIPTION>'.($product['description_short'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(97, $this->helperClean(97, $product['description_short'][$this->feedVars['id_lang']])) : '').'</DESCRIPTION>' : '')
		.($product['categories'][$this->feedVars['id_lang']] !== '' ? '<CATEGORYTEXT>'.($product['categories'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(98, $this->helperClean(98, $product['categories'][$this->feedVars['id_lang']])) : '').'</CATEGORYTEXT>' : '')
		.($product['url'][$this->feedVars['id_lang']] !== '' ? '<URL>'.($product['url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(99, $this->helperStrip(99, $product['url'][$this->feedVars['id_lang']])) : '').'</URL>' : '')
		.($product['manufacturer'] !== '' ? '<MANUFACTURER>'.($product['manufacturer'] !== '' ? $this->helperEscape(100, $this->helperStrip(100, $product['manufacturer'])) : '').'</MANUFACTURER>' : '')
		.($product['condition'] !== '' ? '<ITEM_TYPE>'.($product['condition'] !== '' ? $this->helperEscape(101, $this->helperCondition(101, $this->helperClean(101, $product['condition'], 'new, bazaar, bazaar'), 'new, bazaar, bazaar')) : '').'</ITEM_TYPE>' : '')
		.($product['availability'] !== '' ? '<DELIVERY_DATE>'.($product['availability'] !== '' ? $this->helperEscape(102, $this->helperClean(102, $product['availability'], '0, 7, 14')) : '').'</DELIVERY_DATE>' : '')
		.($product['img_url'][$this->feedVars['id_lang']] !== '' ? '<IMGURL>'.($product['img_url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(103, $this->helperStrip(103, $product['img_url'][$this->feedVars['id_lang']])) : '').'</IMGURL>' : '')
		.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? '<PRICE_VAT>'.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? $this->helperEscape(104, $product['price_vat'][$this->feedVars['id_currency']]) : '').'</PRICE_VAT>' : '')
		.'</SHOPITEM>'."\n"; 
		return $output; 
	} 

	public function feed8footer(array $product = array()) 
	{ 
		$output = ''
		.'</SHOP>'."\n"; 
		return $output; 
	} 

	public function feed9header(array $product = array()) 
	{ 
		$output = ''
		.'<?xml version="1.0" encoding="utf-8"?><products>'."\n"; 
		return $output; 
	} 

	public function feed9product(array $product = array()) 
	{ 
		$product['availability'] = $this->generatorAvailability(113, $product['availability'], '0, 7, 14');
		$output = ''
		.'<product>'
		.($product['id'] !== '' ? '<id>'.($product['id'] !== '' ? $this->helperEscape(105, $product['id']) : '').'</id>' : '')
		.($product['name'][$this->feedVars['id_lang']] !== '' ? '<name>'.($product['name'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(106, $this->helperClean(106, $product['name'][$this->feedVars['id_lang']])) : '').'</name>' : '')
		.($product['description_short'][$this->feedVars['id_lang']] !== '' ? '<description>'.($product['description_short'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(107, $this->helperClean(107, $product['description_short'][$this->feedVars['id_lang']])) : '').'</description>' : '')
		.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? '<price>'.($product['price_vat'][$this->feedVars['id_currency']] !== '' ? $this->helperEscape(108, $product['price_vat'][$this->feedVars['id_currency']]) : '').'</price>' : '')
		.($product['categories'][$this->feedVars['id_lang']] !== '' ? '<category>'.($product['categories'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(109, $this->helperClean(109, $product['categories'][$this->feedVars['id_lang']])) : '').'</category>' : '')
		.($product['manufacturer'] !== '' ? '<manufacturer>'.($product['manufacturer'] !== '' ? $this->helperEscape(110, $this->helperStrip(110, $product['manufacturer'])) : '').'</manufacturer>' : '')
		.($product['url'][$this->feedVars['id_lang']] !== '' ? '<url>'.($product['url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(111, $this->helperStrip(111, $product['url'][$this->feedVars['id_lang']])) : '').'</url>' : '')
		.($product['img_url'][$this->feedVars['id_lang']] !== '' ? '<picture>'.($product['img_url'][$this->feedVars['id_lang']] !== '' ? $this->helperEscape(112, $this->helperStrip(112, $product['img_url'][$this->feedVars['id_lang']])) : '').'</picture>' : '')
		.($product['availability'] !== '' ? '<availability>'.($product['availability'] !== '' ? $this->helperEscape(113, $this->helperClean(113, $product['availability'], '0, 7, 14')) : '').'</availability>' : '')
		.($product['ean'] !== '' ? '<ean>'.($product['ean'] !== '' ? $this->helperEscape(114, $product['ean']) : '').'</ean>' : '')
		.'</product>'."\n"; 
		return $output; 
	} 

	public function feed9footer(array $product = array()) 
	{ 
		$output = ''
		.'</products>'."\n"; 
		return $output; 
	} 

}
