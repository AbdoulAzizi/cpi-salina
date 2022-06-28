<?php

class StaticPage {
    public $id_static_page;
    public $id_shop;
    public $id_lang;
    public $title;
    public $url_rewrite;
    public $content;
    public $date_add;
    public $date_upd;
    public $ressource;
    
    public function __construct($id_static_page = 0) {
        $this->id_static_page = $id_static_page;
        $this->load();

    }

    public function load() {
        if ($this->id_static_page > 0) {
            $sql = 'SELECT `id_static_page`, `id_shop`, `id_lang`, `title`, `url_rewrite` FROM `'._DB_PREFIX_.'static_pages` WHERE `id_static_page` = '.$this->id_static_page;
            $result = Db::getInstance()->executeS($sql);
            if (count($result) > 0) {
                $this->id_static_page = $result[0]['id_static_page'];
                $this->id_shop = $result[0]['id_shop'];
                $this->id_lang = $result[0]['id_lang'];
                $this->title = $result[0]['title'];
                $this->url_rewrite = $result[0]['url_rewrite'];
            }
        }
    }
    
    public function save() {
        if ($this->id_static_page == 0) {
            $sql = 'INSERT INTO `'._DB_PREFIX_.'static_pages` (`id_shop`, `id_lang`, `title`, `url_rewrite`, `meta_title`, `meta_description`, `meta_keywords`, `active`, `ressource`) VALUES ('.$this->id_shop.', '.$this->id_lang.', "'.$this->title.'", "'.$this->url_rewrite.'", "'.$this->meta_title.'", "'.$this->meta_description.'", "'.$this->meta_keywords.'", '.$this->active.', "'.$this->ressource.'")';
        } else {
            $sql = 'UPDATE `'._DB_PREFIX_.'static_pages` SET `id_shop` = '.$this->id_shop.', `id_lang` = '.$this->id_lang.', `title` = "'.$this->title.'", `url_rewrite` = "'.$this->url_rewrite.'" , `meta_title` = "'.$this->meta_title.'", `meta_description` = "'.$this->meta_description.'", `meta_keywords` = "'.$this->meta_keywords.'", `active` = '.$this->active.', `ressource` = "'.$this->ressource.'" WHERE `id_static_page` = '.$this->id_static_page;
        }
        return Db::getInstance()->execute($sql);

    }

     // get page ressource by page id
    public static function getPageRessource($page_id) {
        $sql = 'SELECT `ressource` FROM `'._DB_PREFIX_.'static_pages` WHERE `id_static_page` = '.$page_id;
        $result = Db::getInstance()->executeS($sql);
        if (count($result) > 0) {
            return $result[0]['ressource'];
        } else {
            return 0;
        }
    }
    


     // getPages
    // get static pages
    public static function getAll()
    {
        $id_shop = (int)Context::getContext()->shop->id;
        $id_lang = (int)Context::getContext()->language->id;
        $link = new Link();

        $staticPages = array();
       
        $service = new StaticPage();
        // $ervice->id_static_page = 1;
        $service->id_shop = $id_shop;
        $service->id_lang = $id_lang;
        $service->title = 'Services';
        $service->ressource = 'services';
        // get service cms page rewrite_url
        $service->url_rewrite = $link->getPageLink($service->ressource, true);
        $service->meta_title = 'Services';
        $service->meta_description = 'Services';
        $service->meta_keywords = 'Services';
        $service->active = 1;
        $staticPages[] = $service;


        $presentation = new StaticPage();
        // $presentation->id_static_page = 2;
        $presentation->id_shop = $id_shop;
        $presentation->id_lang = $id_lang;
        $presentation->title = 'Présentation';
        $presentation->ressource = 'presentation';
        // get presentation cms page rewrite_url
        $presentation->url_rewrite = $link->getPageLink($presentation->ressource, true);
        $presentation->meta_title = 'Presentation';
        $presentation->meta_description = 'Presentation';
        $presentation->meta_keywords = 'Presentation';
        $presentation->active = 1;
        $staticPages[] = $presentation;

        return $staticPages;

    }


}