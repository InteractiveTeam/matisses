<?php

class matissesexperiencesModuleFrontController extends ModuleFrontController
{
	//public $php_self = "experiences";  
	protected $experience;
	public $id_experience;
	
	public function init()
	{
		parent::init();
		include_once(dirname(__FILE__).'/../../classes/Experiences.php');
		
		if (!$context)
			$context = Context::getContext();
		
		$Experiences = new Experiences();
		$id_experiencia = Tools::getValue('id_experiencia') ? (int)Tools::getValue('id_experiencia') : Configuration::get('PS_EXPERIENCIA_PRINCIPAL');
		$this->id_experience = $id_experiencia;
		$this->experience = new Experiences($id_experiencia, $this->context->language->id, $this->context->shop->id);

		if($this->experience->products)
		{
			$this->experience->products = json_decode($this->experience->products, true);
			foreach($this->experience->products as $k => $pointer)
			{
				
				if($this->experience->products[$k]['status']==1)
				{
					$Product = new Product($this->experience->products[$k]['id_product'],false,$this->context->language->id,$this->context->shop->id);
					$this->experience->products[$k]['price'] 		= Product::getPriceStatic($this->experience->products[$k]['id_product'],true,$this->experience->products[$k]['id_product_attribute']);
					$this->experience->products[$k]['link_rewrite']	= $Product->link_rewrite;
					$this->experience->products[$k]['name']			= $Product->name;
					if($this->experience->products[$k]['id_product_attribute']==1)
					{
						$this->experience->products[$k]['id_image'] 	= current(Product::getCover($this->experience->products[$k]['id_product'])); 
						
					}else{
							$id_image = Db::getInstance()->getValue('SELECT id_image FROM '._DB_PREFIX_.'product_attribute_image WHERE id_product_attribute = '.$this->experience->products[$k]['id_product_attribute']);
							$this->experience->products[$k]['id_image'] = $id_image ? $id_image : current(Product::getCover($this->experience->products[$k]['id_product'])); 
						 }
				}else{
						unset($this->experience->products[$k]);
					 }
			}
		}
	}
	
	public function setMedia()
	{
		parent::setMedia();	
		$this->addJqueryPlugin('bxslider');
		
		
		$this->addJS(array(
			_MODULE_DIR_.'matisses/js/experiences/front-experiences.js',
			
		));
		
		$this->addCSS(array(
						dirname(__FILE__).'/../../css/experiences/front-experiences.css',
						dirname(__FILE__).'/../../../../themes/matisses/css/modules/socialsharing/css/socialsharing.css',
					));

		
	}
	
	public function initContent()
	{
		parent::initContent();
		$this->setTemplate('experiences.tpl');
		
		
		$path[] = '<span class="navigation"><a href="/experiencias">Experiencias</a></span>';
		$path[] = '<span class="navigation-pipe"> > </span>';
		$path[] = '<span class="navigation">'.$this->experience->name.'</span>';
		
		$experiences =  $this->experience->getExperiences();

		
		
		$this->context->smarty->assign(array(
			'experience' => $this->experience,
			'current' => $this->id_experience,
			'experiences' => $experiences,
			'path' => implode('',$path),
			'meta_title' => $this->experience->meta_title,
			'meta_description' => $this->experience->meta_description,
		));
		
		
	}
}

?>
