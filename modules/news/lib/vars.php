<?php
/*
 *  vars months 
 * 
 * 
 */
$_months = Array(
    1 => $this->l('Enero'),
    2 => $this->l('Febrero'),
    3 => $this->l('Marzo'),
    4 => $this->l('Abril'),
    5 => $this->l('Mayo'),
    6 => $this->l('Junio'),
    7 => $this->l('Julio'),
    8 => $this->l('Agosto'),
    9 => $this->l('Septiembre'),
    10 => $this->l('Octubre'),
    11 => $this->l('Noviembre'),
    12 => $this->l('Diciembre')
);


/*
 * 
 *  Module Routing 
 * 
 * 
 */

$_moduleRoutes = array(

                'module-news-list' => array(
                    'controller' => 'list',
                    'rule' =>  '{module}/{controller}/{cat_news}-{page_cat}/{rewrite}.html',
                  'keywords' => array(
                    /*    'page'   => array('regexp' => '[0-9]*',   'param' => 'page_cat'),
                        'rewrite'   => array('regexp' => '[_a-zA-Z0-9-\pL]*',   'param' => 'rewrite'),
                        'cat_news'  => array('regexp' => '[0-9]*', 'param' => 'cat_news')*/
                    ),
                    'params' => array(
                        'module' => 'news',
                        'controller' => 'list'
                    )
                ),
        
                'module-news-news' => array(
                    'controller' => 'news',
                    'rule' =>  '{module}/{controller}.html',
                      'keywords' => array(),
                    'params' => array(
                        'module' => 'news',
                        'controller' => 'news'
                    )
                ),
        
                'module-news-rss' => array(
                    'controller' => 'rss',
                    'rule' =>  '{module}/{rss_news}/{controller}.html',
                     'keywords' => array(),
                    'params' => array(
                        'module' => 'news',
                        'controller' => 'rss'
                    )
                ),

                'module-news-new' => array(
                    'controller' => 'new',
                    'rule' =>  '{module}/{controller}/{id_news}-{cat_news}-{page_cat}/{cat_rewrite}/{rewrite}.html',
                      'keywords' => array(/*
                       'id_news'   => array('regexp' => '[0-9]+',   'param' => 'id_news'),
                        'cat_news'  => array('regexp' => '[0-9]*',   'param' => 'cat_news'),
                        'cat_rewrite'  => array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'cat_rewrite'),
                        'page_cat'      => array('regexp' => '[0-9]*',   'param' => 'page_cat'),
                        'rewrite'   => array('regexp' => '[_a-zA-Z0-9-\pL]*',   'param' => 'rewrite'),*/
                    ),
                    'params' => array(
                        'module' => 'news',
                        'controller' => 'new'
                    )
                )

    );

/*
 * 
 * 
 * 
 * 
 */

$_imagesSizes= Array(
        'sides' => Array(1170, 346),
        'list' => Array(175, 85),
        'home' => Array(460, 136),
        'thumbnail' => Array(70, 30)
    );
?>
