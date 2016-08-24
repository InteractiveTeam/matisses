<?php

class giftlistempezarModuleFrontController extends ModuleFrontController {

    public function initContent(){
        parent::initContent ();
        $this->display_column_left = false;
        $this->display_column_right = false;
        if($this->context->customer->isLogged()){
            $create = $this->context->link->getModuleLink('giftlist', 'administrar');
            $lists = $this->context->link->getModuleLink('giftlist', 'listas');
        }else{
            $create = $this->context->link->getPageLink('authentication', true)."?back=".$this->context->link->getModuleLink('giftlist', 'administrar');
            $lists = $this->context->link->getPageLink('authentication', true)."?back=".$this->context->link->getModuleLink('giftlist', 'listas');
        }
        
        $this->context->smarty->assign(
	  		array(
                'gift_link' =>  $lists,
  				'search_link' => $this->context->link->getModuleLink('giftlist', 'buscar'),
  				'create_link' => $create,
        ));
        
        $this->setTemplate ('empezar.tpl');
    }
    
    public function setMedia() {
		parent::setMedia ();
		$this->addJS ( array (
            _MODULE_DIR_ . '/giftlist/views/js/vendor/validation/jquery.validate.min.js',
            _MODULE_DIR_ . '/giftlist/views/js/vendor/validation/messages_es.js',
            _MODULE_DIR_ . '/giftlist/views/js/ax-empezar.js'
        ) );
		$this->addCSS ( array (
			_MODULE_DIR_ . '/giftlist/views/css/ax-lista-de-regalos.css'
		) );
	}
}