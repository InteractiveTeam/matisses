<?php

class giftlistempezarModuleFrontController extends ModuleFrontController {

    public function initContent(){
        if(!$this->context->customer->isLogged()){
            Tools::redirect("index");
        }
        $this->setTemplate ('empezar.tpl');
    }
}