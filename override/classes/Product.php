<?php
class Product extends ProductCore
{
    public function getImages($id_lang, Context $context = null)
	{
        $att = Product::getProductAttributesIds($this->id);
        $sql = '
                SELECT image_shop.`cover`, i.`id_image`, il.`legend`, i.`position`,id_product_attribute
                FROM `'._DB_PREFIX_.'image` i
                '.Shop::addSqlAssociation('image', 'i').'
                LEFT JOIN `'._DB_PREFIX_.'image_lang` il ON (i.`id_image` = il.`id_image` AND il.`id_lang` = '.(int)$id_lang.')
                INNER JOIN ps_product_attribute_image ai ON ai.id_image = i.id_image
                WHERE i.`id_product` = '.(int)$this->id .' AND';
        $last_key = end(array_keys($att));
        foreach($att as $key => $c){
            $sql .= ' id_product_attribute = '.$c['id_product_attribute'] .($key != $last_key ? ' OR':"");      
        }
        $sql .= ' ORDER BY `position`';
        
		return Db::getInstance()->executeS($sql);
	}
}