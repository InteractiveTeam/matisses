<?php
/**
* 2012-2014 PrestaCS, PrestaCenter - Anatoret plus s.r.o.
*
* PrestaCenter XML Export Free
*
* Module PrestaCenter XML Export Free – version for PrestaShop 1.5 and 1.6
* Modul PrestaCenter XML Export Free – verze pro PrestaShop 1.5 a 1.6
*
* FREE FOR PRIVATE USE
*
* PrestaCenter - modules and customization for PrestaShop
* PrestaCS - moduly, česká lokalizace a úpravy pro PrestaShop
* http://www.prestacs.cz
*
* @author    PrestaCenter <info@prestacenter.com>
* @category  others
* @package   prestacenterxmlexportfree
* @copyright 2012-2014 PrestaCenter - Anatoret plus s.r.o.
* @license   see "licence-prestacenter.html"
*/

/**
 * @since 1.5.0
 * @version 1.2.4.1 (2014-07-07)
*/


class PcXmlFreeTplGenerator
{
	const VARIABLE = 1;
	const BLOCK = 2;
	const VAR_OPEN = "\xc2\x86";
	const VAR_CLOSE = "\xc2\x87";
	protected $phpTemplate;
	protected $replace = '/* @methods@ */';
	protected $stack = array();
	protected $uid = 0;
	protected $currentId = '';
	protected $namePrefix = '';
	protected $tplInfo = array();
	protected $allowEmptyTags = false;
	protected $allowedHelpers = array();
	protected $allowedGenerators = array();
	protected $allowedProperties = array();
	protected $supportedBlocks = array(
		'product' => true,
	);
	public function __construct(array $allowedProperties)
	{
		$this->allowedProperties = $allowedProperties;
	}
	public function setSource($phpTemplate)
	{
		$this->parsePhpTemplate($this->phpTemplate = $phpTemplate);
		return $this;
	}
	public function setNamePrefix($prefix)
	{
		if (!is_scalar($prefix))
			throw new InvalidArgumentException($this->l('Internal error: block name prefix is not a string.'));
		$this->namePrefix = (string)$prefix;
		return $this;
	}
	public function allowEmptyTags($isAllowed = true)
	{
		$this->allowEmptyTags = (bool)$isAllowed;
		return $this;
	}
	protected function parsePhpTemplate($source)
	{
		$watch = false;
		foreach (token_get_all($source) as $token)
		{
			if (!is_array($token))
				$token = array(0, $token);
			if ($token[0] === T_FUNCTION)
			{
				$watch = true;
			}
			elseif ($watch && $token[0] === T_STRING)
			{
				if (Tools::substr($token[1], 0, 6) === 'helper')
				{
					$this->allowedHelpers[Tools::strtolower(Tools::substr($token[1], 6))] = $token[1];
				}
				if (Tools::substr($token[1], 0, 9) === 'generator')
				{
					$this->allowedGenerators[Tools::strtolower(Tools::substr($token[1], 9))] = $token[1];
				}
				$watch = false;
			}
		}
	}
	public function getTemplate()
	{
		$tmp = explode($this->replace, $this->phpTemplate);
		return $tmp[0].implode('', $this->stack).$tmp[1];
	}
	public function reset()
	{
		$this->stack = array();
		$this->uid = 0;
		return $this;
	}
	public function addBlock($id, $template)
	{
		$this->currentId = $id;
		$name = $this->namePrefix.$this->currentId;
		if (isset($this->stack[$name.'header']) || isset($this->stack[$name.'product']) || isset($this->stack[$name.'footer']))
			throw new LogicException(sprintf($this->l('Error creating the XML template. Block with the name "%s" already exists.'), $name));
		$buffer = array(
		'header' => array(
			'prelim' => "\n\tpublic function {$name}header(array \$product = array()) \n\t{ \n\t\t\$output = '';",
			'code' => "\n\t\t\$output .= ''",
		),
		'product' => array(
			'prelim' => "\n\tpublic function {$name}product(array \$product = array()) \n\t{ \n\t\t\$output = '';",
			'code' => "\n\t\t\$output .= ''",
		),
		'footer' => array(
			'prelim' => "\n\tpublic function {$name}footer(array \$product = array()) \n\t{ \n\t\t\$output = '';",
			'code' => "\n\t\t\$output .= ''",
		));
		$buffer['header']['code'] .= '.'.var_export('<?xml version="1.0" encoding="utf-8" ?>', true);
		$key = 'header';
		$xml = new XmlReader;
		$xml->xml(trim($template));
		while ($xml->read())
		{
			if ($xml->nodeType === XMLReader::COMMENT ||
				$xml->nodeType === XMLReader::WHITESPACE ||
				$xml->nodeType === XMLReader::SIGNIFICANT_WHITESPACE)
			{
				continue;
			}
			elseif ($xml->nodeType === XMLReader::ELEMENT)
			{
				if (($attrValue = $xml->getAttribute(PrestaCenterXmlExportFree::XMLTPL_BLOCK)))
				{
					$blocks = array_flip(explode(' ', $attrValue));
					$isSupportedBlock = false;
					foreach ($blocks as $blockName => $foo)
					{
						$isSupportedBlock |= isset($this->supportedBlocks[$blockName]);
					}
					if (!$isSupportedBlock)
					{
						$tmp = $this->parseTag($xml);
						if (!empty($tmp['prelim']))
							$buffer[$key]['prelim'] .= $tmp['prelim'];
						$buffer[$key]['code'] .= $tmp['code'];
						continue;
					}
					if (isset($blocks['product']))
						$key = 'product';
					$xml->moveToElement();
					$tmp = $this->parseCycle($xml, $blocks);
					if (!empty($tmp['prelim']))
						$buffer[$key]['prelim'] .= $tmp['prelim'];
					$buffer[$key]['code'] .= $tmp['code'];
					if (isset($blocks['product']))
						$key = 'footer';
				}
				else
				{
					$tmp = $this->parseTag($xml);
					if (!empty($tmp['prelim']))
						$buffer[$key]['prelim'] .= $tmp['prelim'];
					$buffer[$key]['code'] .= $tmp['code'];
				}
			}
			elseif ($xml->nodeType === XMLReader::END_ELEMENT && $xml->depth === 0)
			{
				$buffer[$key]['code'] .= '.'.var_export('</'.$xml->name.'>', true);
			}
		}
		foreach ($buffer as $part => &$data)
		{
			$data['prelim'] = preg_replace('~(?<!\\\\)\'\.\'~Us', '', $data['prelim']);
			$data['code'] = preg_replace('~(?<!\\\\)\'\.\'~Us', '', $data['code']);
			$this->stack[$name.$part] = implode($data).'."\\n"'."; \n\t\treturn \$output; \n\t} \n";
		}
		unset($data);
		return $this;
	}
	protected function parseCycle(XMLReader $xml, $blocks)
	{
		$output = array('prelim' => '', 'code' => '');
		$currentBlock = '';
		if (isset($blocks['product']))
		{
			$this->tplInfo[$this->currentId][self::BLOCK]['product'] = true;
		}
		$tmp = $this->parseTag($xml);
		$output['prelim'] .= $tmp['prelim'];
		$output['code'] .= $tmp['code'];
		return $output;
	}
	protected function parseTag(XMLReader $xml)
	{
		$output = array('prelim' => '', 'code' => '');
		$varNames = array();
		$isSimple = true; 
			$output['code'] = '.'.var_export('<'.$xml->name, true);
			if ($xml->hasAttributes)
		{
				for ($i = 0, $cnt = $xml->attributeCount; $i < $cnt; $i++)
			{
					$xml->moveToAttributeNo($i);
					if ($xml->name === PrestaCenterXmlExportFree::XMLTPL_BLOCK)
				{
						continue;
					}
					$attr = $this->parseAttribute($xml);
					if ($attr['varNames'])
				{
						$varNames = array_merge($varNames, $attr['varNames']);
					}
					$output['prelim'] .= $attr['prelim'];
					$output['code'] .= $attr['code'];
				}
				$xml->moveToElement();
			}
			if ($xml->isEmptyElement)
		{
				$output['code'] .= '.\' />\'';
				if ($varNames && !$this->allowEmptyTags)
			{
					$output['code'] = "\n\t\t"
						.(!empty($varNames) ? '. ('.implode(' !== \'\' || ', array_unique($varNames)).' !== \'\' ? ' : '')
						.ltrim($output['code'], '.')
						.(!empty($varNames) ?  ' : \'\') ' : '');
				}
				return $output;
			}
			$output['code'] .= '.\'>\'';
		if ($xml->depth === 0)
		{
			return $output;
		}
		$name = $xml->name;
		$depth = $xml->depth;
		while ($xml->read()
			&& $xml->nodeType !== XMLReader::END_ELEMENT && $xml->name !== $name && $xml->depth !== $depth)
		{
			if ($xml->nodeType === XMLReader::WHITESPACE ||
				$xml->nodeType === XMLReader::SIGNIFICANT_WHITESPACE ||
				$xml->nodeType === XMLReader::COMMENT)
			{
				continue;
			}
			if (($val = $xml->getAttribute(PrestaCenterXmlExportFree::XMLTPL_BLOCK)))
			{
				$blocks = array_flip(explode(' ', $val));
				$child = $this->parseCycle($xml, $blocks);
				$isSimple = false;
				$output['code'] .= $child['prelim'];
				$output['code'] .= $child['code'];
			}
			elseif ($xml->nodeType === XMLReader::ELEMENT)
			{
				$child = $this->parseTag($xml);
				$isSimple = false; 
				$output['prelim'] .= $child['prelim'];
				$output['code'] .= $child['code'];
			}
			elseif ($xml->nodeType === XMLReader::TEXT || $xml->nodeType === XMLReader::CDATA)
			{
				$child = $this->parseText($xml);
				if ($child['varNames'] && !$this->allowEmptyTags)
				{
					$varNames = array_merge($varNames, $child['varNames']);
					$child['code'] = (!empty($child['varNames']) ? '. ('.implode(' !== \'\' || ', array_unique($child['varNames'])) : '')
						.' !== \'\' ? '.ltrim($child['code'], '.')
						.(!empty($child['varNames']) ? ' : \'\') ' : '');
				}
				$output['prelim'] .= $child['prelim'];
				$output['code'] .= $child['code'];
			}
		}
			$output['code'] .= '.'.var_export("</$name>", true);
		if ($isSimple && $varNames && !$this->allowEmptyTags)
		{
			$output['code'] = "\n\t\t"
				.(!empty($varNames) ? '. ('.implode(' !== \'\' || ', array_unique($varNames)).' !== \'\' ? ' : '')
				.ltrim($output['code'], '.')
				.(!empty($varNames) ? ' : \'\') ' : '');
		}
		return $output;
	}
	protected function parseAttribute(XMLReader $xml)
	{
		$output = array(
			'prelim' => '',
			'code' => '',
			'varNames' => array(),
		);
		$value = $this->parseText($xml);
		if ($value['varNames'] && !$this->allowEmptyTags)
		{
			$output['varNames'] = $value['varNames'];
			$output['prelim'] = $value['prelim'];
			$output['code'] = (!empty($value['varNames']) ? '. ('.implode(' !== \'\' || ', array_unique($value['varNames'])).' !== \'\' ? ' : '')
				.var_export(' '.$xml->name.'="', true).$value['code'].'.'.var_export('"', true)
				.(!empty($value['varNames']) ? ' : \'\') ' : '');
		}
		else
		{
			$output['code'] = '.'.var_export(' '.$xml->name.'="', true).$value['code'].'.'.var_export('"', true);
		}
		return $output;
	}
	protected function parseText(XMLReader $xml)
	{
		$output = array(
			'prelim' => '',
			'code' => '',
			'varNames' => array(),
		);
		$text = preg_replace('~\{.+(?<!\\\\)\}~Us', self::VAR_OPEN.'$0'.self::VAR_CLOSE, $xml->value, -1, $cnt);
		if (!$cnt)
		{
			if ($xml->nodeType === XMLReader::CDATA)
			{
				$output['code'] = '.\'<![CDATA[\'.'.var_export($text, true).'.\']]>\'';
			}
			else
			{
				$output['code'] = '. $this->helperEscape(0, '.var_export($text, true).')';
			}
			return $output;
		}
		$isVar = false;
		$splitChars = self::VAR_OPEN.'|'.self::VAR_CLOSE;
		foreach (preg_split('~(?='.$splitChars.')|(?<='.$splitChars.')~', $text) as $token)
		{
			if (Tools::strlen($token) < 1)
				continue;
			if ($token === self::VAR_OPEN)
			{
				$isVar = true;
				continue;
			}
			elseif ($token === self::VAR_CLOSE)
			{
				$isVar = false;
				continue;
			}
			if ($isVar)
			{
				$var = $this->parseVariable($token);
				if (!empty($var->generator))
				{
					$output['prelim'] .= $var->generator;
				}
				if ($var->isDebug)
				{
					$output['code'] .= '.'.$var->replace;
				}
				else
				{
					$output['varNames'][] = $var->fullName;
					$output['code'] .= '.'
						.(!$this->allowEmptyTags ? '('.$var->fullName.' !== \'\' ? ' : '')
						.$var->replace
						.(!$this->allowEmptyTags  ? ' : \'\')' : '');
				}
			}
			else
			{
				$output['code'] .= '.'.var_export($token, true);
			}
		}
		if ($xml->nodeType === XMLReader::CDATA )
		{
			$output['code'] = '.\'<![CDATA[\''.$output['code'].'.\']]>\'';
		}
		else
		{
			$output['code'] = '. $this->helperEscape(0, '.ltrim($output['code'], '.').')';
		}
		return $output;
	}
	protected function parseVariable($input)
	{
		if (!preg_match('~\{([a-z_]+)(?:\s*\:\s*(["\'])(.+)(?<!\\\\)\\2)?(?:\s*\:\s*([A-Z_, ]+)\s*)?\}~Uis', $input, $matches))
			throw new InvalidArgumentException(sprintf($this->l('Variable %s has wrong format or contains illegal characters. Are permitted only original letters (without diacritical marks) and underscores.'), $input));
		$var = new stdClass;
		$var->name = Tools::strtolower($matches[1]);
		$var->isDebug = (Tools::substr($var->name, 0, 6) === 'debug_');
		if (!$var->isDebug && !isset($this->allowedProperties[$var->name]))
			throw new InvalidArgumentException(sprintf($this->l('XML template uses the undefined property {%s}.'), $var->name));
		if ($var->isDebug)
		{
			$this->allowedProperties[$var->name] = array(
				'context' => PrestaCenterXmlExportFree::CONTEXT_SELF,
				'key' => '',
				'modifier' => '',
				'helper' => $var->name,
			);
		}
		$this->uid++;
		$this->tplInfo[$this->currentId][self::VARIABLE][$var->name] = true;
		if ($var->isDebug)
		{
			$var->fullName = 'null';
		}
		else
		{
			$context = '';
			if (isset($this->allowedProperties[$var->name]['context']))
			{
				if ($this->allowedProperties[$var->name]['context'] === PrestaCenterXmlExportFree::CONTEXT_ALL)
					$context = '$this->common';
				elseif ($this->allowedProperties[$var->name]['context'] === PrestaCenterXmlExportFree::CONTEXT_FILE)
					$context = '$this->feedVars';
				else
					$context = '$product';
			}
			else
			{
				$context = '$product';
			}
			$var->fullName = $context ? $context.'[\''.$var->name.'\']' : '$'.$var->name;
			if (!empty($this->allowedProperties[$var->name]['key']))
			{
				foreach (explode('|', $this->allowedProperties[$var->name]['key']) as $key)
				{
					$var->fullName .= ($key
					{0} === '^' ? '[\''.Tools::substr($key, 1).'\']' : '[$this->feedVars[\''.$key.'\']]');
				}
			}
		}
		$var->param = '';
		if (isset($matches[3]) && $matches[3] !== '')
		{
			$tmp = strpos($matches[3], $matches[2]) === false
				? $matches[3]
				: preg_split('~'.$matches[2].'\s*,\s*'.$matches[2].'~', $matches[3]);
			$var->param = is_array($tmp) ? preg_replace('~[\n\r\t]+~', '', var_export($tmp, true)) : var_export($tmp, true);
		}
		$var->helpers = $tmp = array();
		$var->generator = '';
		if (!empty($this->allowedProperties[$var->name]['helper']))
			$tmp = array_map('strtolower', explode('|', $this->allowedProperties[$var->name]['helper']));
		foreach ($tmp as $name)
		{
			if (isset($this->allowedGenerators[$name]))
			{
				if ($name === 'notempty')
				{
					$var->generator = "\n\t\tif (!isset(".$var->fullName.') || '.$var->fullName." === ''".') { throw new PcXmlFreeExportException; }';
				}
				else
				{
					$var->generator .= "\n\t\t".$var->fullName.' = $this->'.$this->allowedGenerators[$name].'('
						.$this->uid
						.', '.$var->fullName
						.', null'
						.($var->param ? ', '.$var->param : '')
					.');';
				}
			}
			elseif (isset($this->allowedHelpers[$name]))
			{
				$var->helpers[$this->allowedHelpers[$name]] = true;
			}
			elseif ($name
			{0} === '?' && isset($this->allowedHelpers[Tools::substr($name, 1)]))
			{
				if ($var->param === '')
				{
					continue;
				}
				$var->helpers[$this->allowedHelpers[Tools::substr($name, 1)]] = true;
			}
			elseif (function_exists($name))
			{
				$var->helpers[$name] = false;
			}
			else
			{
				throw new InvalidArgumentException(sprintf($this->l('For properties {%1$s} is set the undefined helper "%2$s".'), $var->name, $name));
			}
		}
		$var->replace = $var->fullName;
		foreach ($var->helpers as $name => $isInternal)
		{
			if ($name === $this->allowedHelpers['escape'])
			{ continue; }
			if ($isInternal)
			{
				$var->replace = '$this->'.$name.'('
					.$this->uid
					.', '.$var->replace
					.', null'
					.($var->param ? ', '.$var->param : '')
				.')';
			}
			else
			{
				$var->replace = $name.'('.$var->replace.')';
			}
		}
		$var->replaceWithEscape = '$this->helperEscape('.$this->uid.', '.$var->replace.')';
		return $var;
	}
	public function isUsed($id, $type, $name)
	{
		return isset($this->tplInfo[$id][$type][$name]);
	}
	public function l($string)
	{
		return Context::getContext()->controller->module->l($string);
	}
}