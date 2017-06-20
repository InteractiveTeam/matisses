<?php
class ProductSale extends ProductSaleCore
{
    public static function getBestSalesLight($id_lang, $page_number = 0, $nb_products = 10, Context $context = null)
	{
		if (!$context)
			$context = Context::getContext();
		if ($page_number < 0) $page_number = 0;
		if ($nb_products < 1) $nb_products = 10;

		$sql = '
		SELECT
			p.id_product,  MAX(product_attribute_shop.id_product_attribute) id_product_attribute, pl.`link_rewrite`, pl.`name`, pl.`description_short`, product_shop.`id_category_default`,
			MAX(image_shop.`id_image`) id_image, il.`legend`,
			ps.`quantity` AS sales, p.`ean13`, p.`upc`, cl.`link_rewrite` AS category, p.show_price, p.available_for_order, IFNULL(stock.quantity, 0) as quantity, p.customizable,
			IFNULL(pa.minimal_quantity, p.minimal_quantity) as minimal_quantity, stock.out_of_stock,
			product_shop.`date_add` > "'.date('Y-m-d', strtotime('-'.(Configuration::get('PS_NB_DAYS_NEW_PRODUCT') ? (int)Configuration::get('PS_NB_DAYS_NEW_PRODUCT') : 20).' DAY')).'" as new,
			product_shop.`on_sale`, MAX(product_attribute_shop.minimal_quantity) AS product_attribute_minimal_quantity
		FROM `'._DB_PREFIX_.'product_sale` ps
		LEFT JOIN `'._DB_PREFIX_.'product` p ON ps.`id_product` = p.`id_product`
		'.Shop::addSqlAssociation('product', 'p').'
		LEFT JOIN `'._DB_PREFIX_.'product_attribute` pa
			ON (p.`id_product` = pa.`id_product`)
		'.Shop::addSqlAssociation('product_attribute', 'pa', false, 'product_attribute_shop.`default_on` = 1').'
		'.Product::sqlStock('p', 'product_attribute_shop', false, $context->shop).'
		LEFT JOIN `'._DB_PREFIX_.'product_lang` pl
			ON p.`id_product` = pl.`id_product`
			AND pl.`id_lang` = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('pl').'
		LEFT JOIN `'._DB_PREFIX_.'image` i ON (i.`id_product` = p.`id_product`)'.
		Shop::addSqlAssociation('image', 'i', false, 'image_shop.cover=1').'
		LEFT JOIN `'._DB_PREFIX_.'image_lang` il ON (i.`id_image` = il.`id_image` AND il.`id_lang` = '.(int)$id_lang.')
		LEFT JOIN `'._DB_PREFIX_.'category_lang` cl
			ON cl.`id_category` = product_shop.`id_category_default`
			AND cl.`id_lang` = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('cl');

		if (Group::isFeatureActive())
		{
			$groups = FrontController::getCurrentCustomerGroups();
			$sql .= '
				JOIN `'._DB_PREFIX_.'category_product` cp ON (cp.`id_product` = p.`id_product`)
				JOIN `'._DB_PREFIX_.'category_group` cg ON (cp.id_category = cg.id_category AND cg.`id_group` '.(count($groups) ? 'IN ('.implode(',', $groups).')' : '= 1').')';
		}

		$sql.= '
		WHERE product_shop.`active` = 1
		AND p.`visibility` != \'none\'
		GROUP BY product_shop.id_product
		ORDER BY sales DESC
		LIMIT '.(int)($page_number * $nb_products).', '.(int)$nb_products;

		if (!$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql))
			return false;

        $colors = Product::getAttributesColorList($result);
		foreach ($result as $key => $row){
            $tpl = $context->smarty->createTemplate(_PS_THEME_DIR_.'product-list-colors.tpl');
            if (isset($colors[$row['id_product']]))
                $tpl->assign(array(
                    'id_product' => $row['id_product'],
                    'colors_list' => $colors[$row['id_product']],
                    'link' => $context->link,
                    'img_col_dir' => _THEME_COL_DIR_,
                    'col_img_dir' => _PS_COL_IMG_DIR_
                ));
            if (isset($colors[$row['id_product']]))
				$result[$key]['color_list'] = $tpl->fetch(_PS_THEME_DIR_.'product-list-colors.tpl', Product::getColorsListCacheId($row['id_product']));
			else
				$result[$key]['color_list'] = '';
        }

		return Product::getProductsProperties($id_lang, $result);
	}
}