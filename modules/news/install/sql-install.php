<?php

	// Init
	$sql = array();

        // Create Category Table in Database
        // news
        $sql['news'] ="
                 CREATE TABLE `" . _DB_PREFIX_ . "news` (
                  `id_news` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                  `autor` VARCHAR(100) DEFAULT NULL,
                  `pos` INT(11) NOT NULL DEFAULT '1',
                  `active` INT(1) NOT NULL DEFAULT '0',
                  `date` INT(11) NOT NULL DEFAULT '0',
                  PRIMARY KEY (`id_news`),
                  KEY `Index1` (`id_news`),
                  KEY `Index2` (`id_news`,`pos`,`active`,`date`)
                ) ENGINE="._MYSQL_ENGINE_." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";

        // news_cats
        $sql['news_cats'] ="
                  CREATE TABLE `" . _DB_PREFIX_ . "news_cats` (
                  `id_cat` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                  `pos` INT(11) UNSIGNED NOT NULL DEFAULT '0',
                  PRIMARY KEY (`id_cat`),
                  KEY `Index1` (`id_cat`,`pos`)
                ) ENGINE="._MYSQL_ENGINE_." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";

        // news_cats_lang
        $sql['news_cats_lang'] ="
              CREATE TABLE `" . _DB_PREFIX_ . "news_cats_lang` (
              `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
              `id_cat` INT(11) UNSIGNED NOT NULL DEFAULT '0',
              `id_lang` INT(11) UNSIGNED NOT NULL DEFAULT '0',
              `title` VARCHAR(255) NOT NULL,
              PRIMARY KEY (`id`),
              KEY `Index1` (`id`,`id_cat`,`id_lang`)
            ) ENGINE="._MYSQL_ENGINE_." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";

        // news_cats_rel
       $sql['news_cats_rel'] ="
              CREATE TABLE `" . _DB_PREFIX_ . "news_cats_rel` (
              `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
              `id_cat` INT(11) UNSIGNED NOT NULL DEFAULT '0',
              `id_new` INT(11) UNSIGNED NOT NULL DEFAULT '0',
              PRIMARY KEY (`id`),
              KEY `Index1` (`id`,`id_cat`,`id_new`)
            ) ENGINE="._MYSQL_ENGINE_." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";

        // news_imgs
       $sql['news_imgs'] ="
             CREATE TABLE `" . _DB_PREFIX_ . "news_imgs` (
              `id_img` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
              PRIMARY KEY (`id_img`),
              KEY `Index1` (`id_img`)
            ) ENGINE="._MYSQL_ENGINE_." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";

        // news_imgs_rel
        $sql['news_imgs_rel'] ="
             CREATE TABLE `" . _DB_PREFIX_ . "news_imgs_rel` (
              `id_rel` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
              `id_news` INT(11) NOT NULL DEFAULT '0',
              `id_img` INT(11) NOT NULL DEFAULT '0',
              `pos` INT(11) NOT NULL DEFAULT '1',
              PRIMARY KEY (`id_rel`),
              KEY `Index1` (`id_rel`,`id_news`,`id_img`,`pos`)
            ) ENGINE="._MYSQL_ENGINE_." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";

        // news_langs
        $sql['news_langs'] ="
            CREATE TABLE `" . _DB_PREFIX_ . "news_langs` (
              `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
              `id_news` INT(11) UNSIGNED NOT NULL DEFAULT '0',
              `id_lang` INT(11) UNSIGNED NOT NULL DEFAULT '1',
              `title` VARCHAR(255) DEFAULT NULL,
              `new` TEXT,
              `description` VARCHAR(255) DEFAULT NULL,
              `keywords` VARCHAR(255) DEFAULT NULL,
              PRIMARY KEY (`id`),
              KEY `Index1` (`id`,`id_news`,`id_lang`)
            ) ENGINE="._MYSQL_ENGINE_." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";

        // news_products
        $sql['news_products'] ="
           CREATE TABLE `" . _DB_PREFIX_ . "news_products` (
          `id` INT(7) UNSIGNED NOT NULL AUTO_INCREMENT,
          `id_news` INT(7) UNSIGNED NOT NULL DEFAULT '0',
          `id_product` INT(7) UNSIGNED NOT NULL,
          `pos` INT(7) UNSIGNED NOT NULL DEFAULT '1',
          PRIMARY KEY (`id`),
          KEY `Index1` (`id`,`id_news`,`id_product`,`pos`)
        ) ENGINE="._MYSQL_ENGINE_." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";

        // news_rel
        $sql['news_rel'] ="
          CREATE TABLE `" . _DB_PREFIX_ . "news_rel` (
          `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
          `id_news` int(11) unsigned NOT NULL DEFAULT '0',
          `id_news_rel` int(11) unsigned NOT NULL DEFAULT '0',
          PRIMARY KEY (`id`),
          KEY `Index1` (`id`,`id_news`,`id_news_rel`)
        ) ENGINE="._MYSQL_ENGINE_." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";

        // news_tag_lang
        $sql['news_tag_lang'] ="
          CREATE TABLE `" . _DB_PREFIX_ . "news_tag_lang` (
          `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
          `id_tag` INT(11) UNSIGNED NOT NULL DEFAULT '0',
          `id_lang` INT(11) UNSIGNED NOT NULL DEFAULT '1',
          `tag` VARCHAR(255) DEFAULT NULL,
          PRIMARY KEY (`id`),
          KEY `Index1` (`id`,`id_tag`,`id_lang`)
        ) ENGINE="._MYSQL_ENGINE_." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";

        // news_tag_lang
        $sql['news_tag_rel'] ="
          CREATE TABLE `" . _DB_PREFIX_ . "news_tag_rel` (
          `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
          `id_new` INT(11) UNSIGNED NOT NULL DEFAULT '0',
          `id_tag` INT(11) UNSIGNED NOT NULL DEFAULT '0',
          PRIMARY KEY (`id`),
          KEY `Index1` (`id`,`id_tag`,`id_new`)
        ) ENGINE="._MYSQL_ENGINE_." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";

