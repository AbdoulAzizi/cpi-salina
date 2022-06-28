<?php

require_once(_PS_MODULE_DIR_.'/staticpagessearch/classes/StaticPage.php');
require_once(_PS_MODULE_DIR_.'/staticpagessearch/classes/StaticContent.php');

class Search extends SearchCore
{


    public static function SearchCategory($id_lang, $query, $page_number = 1, $page_size = 10, $active = true)

    {

        // var_dump($id_lang, $query, $page_number, $page_size);exit;
        //search categories by title and description

        // if query is a sentence, we want to search for each word in the query
        $words = explode(' ', $query);
        $words_count = count($words);
        $search_query = '';
        for ($i = 0; $i < $words_count; $i++) {
            $search_query .= '(';
            $search_query .= '`name` LIKE \'%' . pSQL($words[$i]) . '%\' OR ';
            $search_query .= '`description` LIKE \'%' . pSQL($words[$i]) . '%\' OR ';
            $search_query .= '`meta_title` LIKE \'%' . pSQL($words[$i]) . '%\' OR ';
            $search_query .= '`meta_description` LIKE \'%' . pSQL($words[$i]) . '%\' OR ';
            $search_query .= '`meta_keywords` LIKE \'%' . pSQL($words[$i]) . '%\' ';
            $search_query .= ')';
            if ($i < $words_count - 1) {
                $search_query .= ' OR ';
            }
        }
        // var_dump($search_query);exit;
        // select from category_lang table where search_query and left join category table for active categories if active is true
        $sql = 'SELECT * FROM `' . _DB_PREFIX_ . 'category_lang` cl ' .
            'LEFT JOIN `' . _DB_PREFIX_ . 'category` c ON (c.`id_category` = cl.`id_category`) ' .
            'WHERE ' . $search_query . ' AND `id_lang` = ' . (int)$id_lang . ' ' .
            'AND c.`active` = ' . (int)$active . ' ' .
            'ORDER BY `name` ASC';

        $result = Db::getInstance()->executeS($sql);


        // $sql = 'SELECT c.id_category, cl.name, cl.description, cl.link_rewrite
        //         FROM '._DB_PREFIX_.'category c
        //         LEFT JOIN '._DB_PREFIX_.'category_lang cl ON (c.id_category = cl.id_category AND cl.id_lang = '.(int)$id_lang.')
        //         WHERE (cl.name LIKE \'%'.pSQL($query).'%\' OR cl.description LIKE \'%'.pSQL($query).'%\')
        //         AND c.active = 1
        //         ORDER BY c.id_category ASC'
        //         .($page_size != 0 ? ' LIMIT '.(int)(($page_number - 1) * $page_size).', '.(int)$page_size : '');

        // $result = Db::getInstance()->executeS($sql);

        // create Categories object for each result
        $categories = array();
        foreach ($result as $row) {
            $categories[] = new Category($row['id_category'], $id_lang);
        }

        return $categories;
    }

    // get catalogues brochures when search query is catalogue or catalogues or brochure or brochures
    public static function SearchCatalogues($id_lang, $query, $page_number = 1, $page_size = 10, $active = true)
    {
        
        // verify if query is a catalogue or catalogues or brochure or brochures
        $catalogue_query = explode(' ', $query);
        $catalogue_query_count = count($catalogue_query);
        $base_url = _PS_BASE_URL_ . __PS_BASE_URI__;
        $base_uri = __PS_BASE_URI__;
        $theme_url = _PS_THEME_DIR_;
        $links = [
            'catalogue_1' =>  [
                'title' => 'BROCHURE INDUSTRIE',
                'link' => $base_uri. 'themes/default-bootstrap/brochures/Brochure_Industrie_CPI_SALINA_Industrie_2021.pdf',
            ],
            'catalogue_2' =>  [
                'title' => 'BROCHURE INSUSTRIE TP',
                'link' => $base_uri.'img/cms/Brochure%20TP%20CPI-SALINA%202021.pdf',
            ],
        ];
        $catalogues_links = array();
        // verify if query is equal to catalogue or catalogues or brochure or brochures
        if ($catalogue_query_count) {
            foreach ($catalogue_query as $key => $value) {
                if ($value == 'catalogue' || $value == 'catalogues' || $value == 'brochure' || $value == 'brochures') {
                    foreach ($links as $key => $value) {
                        $catalogues_links[] = $value;
                    }
                }
            }
        }
        

        // var_dump($catalogues_links);exit;
        return $catalogues_links;

    }

    // get static pages from static_pages and static_content table where match query
    public static function SearchStaticPages($id_lang, $query, $page_number = 1, $page_size = 10, $active = true)
    {
        // var_dump($id_lang, $query, $page_number, $page_size, $active);exit;
        // search static pages by title and description
        // if query is a sentence, we want to search for each word in the query
        $words = explode(' ', $query);
        $words_count = count($words);
        $search_query = '';
        for ($i = 0; $i < $words_count; $i++) {
            $search_query .= '(';
            $search_query .= 'sc.`title` LIKE \'%' . pSQL($words[$i]) . '%\' OR ';
            $search_query .= '`content` LIKE \'%' . pSQL($words[$i]) . '%\' OR ';
            $search_query .= '`meta_title` LIKE \'%' . pSQL($words[$i]) . '%\' OR ';
            $search_query .= '`meta_description` LIKE \'%' . pSQL($words[$i]) . '%\' OR ';
            $search_query .= '`meta_keywords` LIKE \'%' . pSQL($words[$i]) . '%\' ';
            $search_query .= ')';
            if ($i < $words_count - 1) {
                $search_query .= ' OR ';
            }
        }
        // var_dump($search_query);exit;
        // select from static_content table where search_query and left join static_pages table for active static_pages if active is true
        $sql = 'SELECT * FROM `' . _DB_PREFIX_ . 'static_contents` sc ' .
            'INNER JOIN `' . _DB_PREFIX_ . 'static_pages` sp ON (sp.`id_static_page` = sc.`id_static_page`) ' .
            'WHERE ' . $search_query . ' AND sp.`id_lang` = ' . (int)$id_lang . ' ' .
            // 'AND sp.`active` = ' . (int)$active . ' ' .
            'ORDER BY sp.`title` ASC';
        $result = Db::getInstance()->executeS($sql);
        // create StaticPages object for each result
       
        // array to return
        $static_contents = array();
        $static_contents_array = array();    
        foreach ($result as $row) {
            $static_contents[] = new StaticContent(StaticPage::getPageRessource($row['id_static_page']),$row['id_static_content']);
        }

        if ($static_contents) {
            foreach ($static_contents as $static_content) {
                $static_contents_array[] = array(
                    'id_static_content' => $static_content->id_static_content,
                    'meta_title' => $static_content->title,
                    'link_rewrite' => $static_content->page_url,
                    'content' => $static_content->content,
                );
            }
        }

        return $static_contents_array;
    }
                  

    // SearchCMSPage function
    // get CMS pages matching the query from database with pagination
    public static function SearchCMSPage($id_lang, $expr, $page_number = 1, $page_size = 10)
    {
        $link = new Link();

        // if query is a sentence, we want to search for each word in the query
        $words = explode(' ', $expr);

        // if words contains 'catalogue' or 'catalogues' or 'brochures', add 'brochure' to words array
        foreach ($words as $key => $value) {
            if ($value == 'catalogue' || $value == 'catalogues' || $value == 'brochure' || $value == 'brochures') {
                $words[] = 'brochure';
            }
        }
        $words_count = count($words);
        $search_query = '';
        for ($i = 0; $i < $words_count; $i++) {
            $search_query .= '(';
            $search_query .= '`meta_title` LIKE \'%' . pSQL($words[$i]) . '%\' OR ';
            $search_query .= '`meta_description` LIKE \'%' . pSQL($words[$i]) . '%\' OR ';
            $search_query .= '`meta_keywords` LIKE \'%' . pSQL($words[$i]) . '%\' ';
            $search_query .= ')';
            if ($i < $words_count - 1) {
                $search_query .= ' OR ';
            }
        }

        // select from CMS table where search_query and left join CMS_lang table for active CMS pages
        $sql = 'SELECT * FROM `' . _DB_PREFIX_ . 'cms` cms ' .
            'LEFT JOIN `' . _DB_PREFIX_ . 'cms_lang` cms_lang ON (cms_lang.`id_cms` = cms.`id_cms`) ' .
            'WHERE ' . $search_query . ' AND cms_lang.`id_lang` = ' . (int)$id_lang . ' ' .
            'ORDER BY cms_lang.`meta_title` ASC';

        // var_dump($sql);exit;
        $result = Db::getInstance()->executeS($sql);
        $cms_pages_matching_query = array();
        // $sql = 'SELECT p.id_cms, pl.meta_title, pl.link_rewrite
        //         FROM '._DB_PREFIX_.'cms p
        //         LEFT JOIN '._DB_PREFIX_.'cms_lang pl ON (p.id_cms = pl.id_cms AND pl.id_lang = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('pl').')
        //         WHERE pl.meta_title LIKE "%'.$expr.'%" OR pl.meta_description LIKE "%'.$expr.'%"
        //         ORDER BY pl.meta_title ASC'
        //         .' LIMIT '.(int)(($page_number - 1) * $page_size).', '.(int)$page_size;
        // $result = Db::getInstance()->executeS($sql);
        if ($result) {
            foreach ($result as $cms) {
                $cms_pages_matching_query[] = array(
                    'id_cms' => $cms['id_cms'],
                    'meta_title' => $cms['meta_title'],
                    'link_rewrite' => $link->getCMSLink($cms['id_cms'], $cms['link_rewrite'], null, null, $id_lang),
                    'type' => 'cms',
                );
            }
        }
        return $cms_pages_matching_query;
    }

    // SearchProducts function
    // get products matching the query from database with pagination
    public static function SearchProducts($id_lang, $expr, $page_number = 1, $page_size = 10, $order_by = 'position', $order_way = 'desc', $get_total = false, $active = true) {

        $link = new Link();
        $products_matching_query = array();

        // if the query is a sentence, we want to search for each word separated by a space
        $words = explode(' ', $expr);
        // if (count($words) > 1) {
        //     $products_matching_query = array();
        //     foreach ($words as $word) {
        //         $products_matching_query = array_merge($products_matching_query, self::SearchProducts($id_lang, $word, $page_number, $page_size, $order_by, $order_way, $get_total, $active));
        //     }
        //     return $products_matching_query;
        // }

        // if (count($words) > 1) {
            foreach ($words as $word) {
                $sql = 'SELECT p.id_product, pl.name, pl.link_rewrite, p.reference, p.active
                        FROM '._DB_PREFIX_.'product p
                        LEFT JOIN '._DB_PREFIX_.'product_lang pl ON (p.id_product = pl.id_product AND pl.id_lang = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('pl').')
                        LEFT JOIN '._DB_PREFIX_.'product_attribute pa ON (p.id_product = pa.id_product)
                        WHERE pl.name LIKE \'%'.pSQL($word).'%\' OR p.reference LIKE \'%'.pSQL($word).'%\' OR p.supplier_reference LIKE \'%'.pSQL($word).'%\' OR p.ean13 LIKE \'%'.pSQL($word).'%\' OR p.upc LIKE \'%'.pSQL($word).'%\' OR pa.reference LIKE \'%'.pSQL($word).'%\' OR pa.ean13 LIKE \'%'.pSQL($word).'%\' OR pa.upc LIKE \'%'.pSQL($word).'%\'
                        GROUP BY p.id_product
                        ORDER BY pl.name ASC';
                    
                $result = Db::getInstance()->executeS($sql);

                if ($result) {
                    foreach ($result as $row) {
                        if ($row['active'] == 1) {
                            $products_matching_query[] = array(
                                'id_product' => $row['id_product'],
                                'name' => $row['name'],
                                'link_rewrite' => $row['link_rewrite'],
                                'reference' => $row['reference'],
                                'link' => $link->getProductLink($row['id_product'], $row['link_rewrite']),
                                'id_image' => Product::getCover($row['id_product'])['id_image'],
                                'category' => Product::getProductCategories($row['id_product'])[0],

                            );
                        }
                    }
                }

            }
        // } else {

        //     $sql = 'SELECT p.id_product, pl.name, pl.link_rewrite
        //             FROM '._DB_PREFIX_.'product p
        //             LEFT JOIN '._DB_PREFIX_.'product_lang pl ON (p.id_product = pl.id_product AND pl.id_lang = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('pl').')
        //             WHERE pl.name LIKE "%'.$expr.'%"
        //             ORDER BY pl.name ASC'
        //             .' LIMIT '.(int)(($page_number - 1) * $page_size).', '.(int)$page_size;
        //     $result = Db::getInstance()->executeS($sql);
            
        //     if ($result) {
        //         foreach ($result as $product) {
        //             $products_matching_query[] = array(
        //                 'id_product' => $product['id_product'],
        //                 'name' => $product['name'],
        //                 'link_rewrite' => $product['link_rewrite'],
        //                 'type' => 'product',
        //                 'id_image' => Product::getCover($product['id_product'])['id_image'],
        //                 'link' => $link->getProductLink($product['id_product'], $product['link_rewrite']),
        //                 'category' => Product::getProductCategories($product['id_product'])[0],
        //             );
        //         }
        //     }
        // }
        
        // return total number of products matching the query
        if ($get_total) {
            $total_matching_query = count($products_matching_query);
            return $total_matching_query;
        }

        // return products matching the query with result parameter
        return array(
            'result' => $products_matching_query,
            'total' => count($products_matching_query),
        );

    }
       
        
    // display nav hook
    public function hookDisplayNav($params) {
        // $this->smarty->assign(array(
        //     'search_query' => (string)Tools::getValue('search_query'),
        //     'search_tag' => (string)Tools::getValue('search_tag'),
        //     'instant_search' => (bool)Configuration::get('PS_INSTANT_SEARCH'),
        // ));
        // return $this->display(__FILE__, 'views/templates/hook/nav.tpl');
    }

    // display home hook
    public function hookDisplayHome($params) {
        // $this->smarty->assign(array(
        //     'search_query' => (string)Tools::getValue('search_query'),
        //     'search_tag' => (string)Tools::getValue('search_tag'),
        //     'instant_search' => (bool)Configuration::get('PS_INSTANT_SEARCH'),
        // ));
        // return $this->display(__FILE__, 'views/templates/hook/home.tpl');
    }
    
 }
    