<?php


if(!defined('_PS_VERSION_')) {
    exit;
}

require_once(_PS_MODULE_DIR_.'/staticpagessearch/classes/StaticPage.php');
require_once(_PS_MODULE_DIR_.'/staticpagessearch/classes/StaticContent.php');

// var_dump(StaticPage::getAll());exit;

class StaticPagesSearch extends Module
{
    public function __construct()
    {
        $this->name = 'staticpagessearch';
        $this->tab = 'search_filter';
        $this->version = '1.0.0';
        $this->author = 'WOBY WEB';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
        $this->bootstrap = true;
        parent::__construct();
        $this->displayName = $this->l('Static Pages Search');
        $this->description = $this->l('installs Static Pages Search');
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
    }

    public function install()
    {

        // add static_pages and static_content tables if they don't exist
        if (!parent::install() || !$this->installDB() || !$this->registerHook('displayLeftColumn') || !$this->registerHook('displayRightColumn')) {
            return false;
        }

        // create static_pages and static_content 
       
        // get all static pages
        $staticPages = StaticPage::getAll();
        if (!empty($staticPages)) {
            foreach ($staticPages as $staticPage) {
                $staticPage->save();
            }
        }

        // get all static content
        $staticContents = StaticContent::getAll();
        if (!empty($staticContents)) {
            foreach ($staticContents as $staticContent) {
                $staticContent->save();
            }
        }

        return true;
    }

    public function uninstall()
    {
        if (parent::uninstall() == false || !$this->uninstallDB()) {
            return false;
        }
        return true;
    }

    public function installDB()
    {
        $return = true;
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'static_pages` (
                `id_static_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
                `id_shop` int(10) unsigned  NULL,
                `id_lang` int(10) unsigned  NULL,
                `title` varchar(255)  NULL,
                `url_rewrite` varchar(255) NULL,
                `meta_title` varchar(255) NULL,
                `meta_description` varchar(255) NULL,
                `meta_keywords` varchar(255) NULL,
                `active` tinyint(1) unsigned NULL,
                `ressource` varchar(255) NULL,
                PRIMARY KEY (`id_static_page`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;
        ');
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'static_contents` (
                `id_static_content` int(10) unsigned NOT NULL AUTO_INCREMENT,
                `id_static_page` int(10) unsigned NOT NULL,
                `id_shop` int(10) unsigned  NULL,
                `id_lang` int(10) unsigned NULL,
                `title` varchar(255) NULL,
                `content` text  NULL,
                `page_url` varchar(255) NULL,
                PRIMARY KEY (`id_static_content`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;
        ');

        return $return;
    }

    public function uninstallDB()
    {
        $return = true;
        $return &= Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'static_pages`');
        $return &= Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'static_contents`');
        return $return;
    }

    public function hookLeftColumn($params)
    {
        $this->context->smarty->assign(array(
            'staticpagessearch_url' => $this->context->link->getModuleLink('staticpagessearch', 'search'),
            'staticpagessearch_title' => $this->l('Search'),
        ));
        return $this->display(__FILE__, 'staticpagessearch.tpl');
    }

    public function hookHeader($params)
    {
        $this->context->controller->addCSS($this->_path.'css/staticpagessearch.css', 'all');
    }
    




   


}