<?php

class giftlistempezarModuleFrontController extends ModuleFrontController {

    public function initContent(){
        parent::initContent ();
        $this->display_column_left = false;
        $this->display_column_right = false;
        
        $this->context->smarty->assign(
	  		array(
                'gift_link' =>  $this->context->link->getModuleLink('giftlist', 'listas'),
  				'search_link' => $this->context->link->getModuleLink('giftlist', 'buscar'),
  				'create_link' => $this->context->link->getModuleLink('giftlist', 'administrar',array('url'=>"nuevo")),
        ));
        
        $this->setTemplate ('empezar.tpl');
    }
    
    public function setMedia() {
		parent::setMedia ();
		/*$this->addJS ( array () );*/
		$this->addCSS ( array (
			_MODULE_DIR_ . '/giftlist/views/css/ax-lista-de-regalos.css'
		) );
	}
}