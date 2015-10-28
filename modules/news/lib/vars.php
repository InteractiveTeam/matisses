<?php
/*
 *  vars months 
 * 
 * 
 */
$_months = Array(
    1 => $this->l('January'),
    2 => $this->l('February'),
    3 => $this->l('March'),
    4 => $this->l('April'),
    5 => $this->l('May'),
    6 => $this->l('June'),
    7 => $this->l('July'),
    8 => $this->l('August'),
    9 => $this->l('September'),
    10 => $this->l('October'),
    11 => $this->l('November'),
    12 => $this->l('December')
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
        'sides' => Array(175, 85),
        'list' => Array(175, 85),
        'home' => Array(245, 150),
        'thumbnail' => Array(70, 30)
    );
?>
