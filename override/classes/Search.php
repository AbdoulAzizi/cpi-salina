<?php

class Search extends SearchCore
{


    public static function SearchCategory($id_lang, $query, $page_number = 1, $page_size = 10)

    {
        //search categories by title and description
        $sql = 'SELECT c.id_category, cl.name, cl.description, cl.link_rewrite
                FROM '._DB_PREFIX_.'category c
                LEFT JOIN '._DB_PREFIX_.'category_lang cl ON (c.id_category = cl.id_category AND cl.id_lang = '.(int)$id_lang.')
                WHERE (cl.name LIKE \'%'.pSQL($query).'%\' OR cl.description LIKE \'%'.pSQL($query).'%\')
                AND c.active = 1
                ORDER BY c.id_category ASC'
                .($page_size != 0 ? ' LIMIT '.(int)(($page_number - 1) * $page_size).', '.(int)$page_size : '');

        $result = Db::getInstance()->executeS($sql);

        // create Categories object for each result
        $categories = array();
        foreach ($result as $row) {
            $categories[] = new Category($row['id_category'], $id_lang);
        }

        return $categories;
    }

    // SearchCMSPage function
    // get CMS pages matching the query from database with pagination
    public static function SearchCMSPage($id_lang, $expr, $page_number = 1, $page_size = 10) {
        $cms_pages_matching_query = array();
        $sql = 'SELECT p.id_cms, pl.meta_title, pl.link_rewrite
                FROM '._DB_PREFIX_.'cms p
                LEFT JOIN '._DB_PREFIX_.'cms_lang pl ON (p.id_cms = pl.id_cms AND pl.id_lang = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('pl').')
                WHERE pl.meta_title LIKE "%'.$expr.'%" OR pl.meta_description LIKE "%'.$expr.'%"
                ORDER BY pl.meta_title ASC'
                .' LIMIT '.(int)(($page_number - 1) * $page_size).', '.(int)$page_size;
        $result = Db::getInstance()->executeS($sql);
        if ($result) {
            foreach ($result as $cms) {
                $cms_pages_matching_query[] = array(
                    'id_cms' => $cms['id_cms'],
                    'meta_title' => $cms['meta_title'],
                    'link_rewrite' => $cms['link_rewrite'],
                    'type' => 'cms',
                );
            }
        }
        return $cms_pages_matching_query;
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
    