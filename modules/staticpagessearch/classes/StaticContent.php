<?php

class StaticContent {
    public $id_static_content;
    public $id_static_page;
    public $id_shop;
    public $id_lang;
    public $title;
    public $content;
    public $page_url;

    public function __construct($page_ressource = '', $id_static_content= 0) {
        $this->id_static_content = $id_static_content;
        $this->id_static_page = $this->getPageId($page_ressource);
        $this->page_url =  _PS_BASE_URL_.__PS_BASE_URI__.$page_ressource;
        $this->load();
    }

    public function load() {
        if ($this->id_static_content > 0) {
            $sql = 'SELECT `id_static_content`, `id_static_page`, `id_shop`, `id_lang`, `title`, `content` FROM `'._DB_PREFIX_.'static_contents` WHERE `id_static_content` = '.$this->id_static_content;
            $result = Db::getInstance()->executeS($sql);
            if (count($result) > 0) {
                // $this->id_static_content = $result[0]['id_static_content'];
                // $this->id_static_page = $result[0]['id_static_page'];
                $this->id_shop = $result[0]['id_shop'];
                $this->id_lang = $result[0]['id_lang'];
                $this->title = $result[0]['title'];
                $this->content = $result[0]['content'];
            }
        }
    }

    public function save() {
        if ($this->id_static_content == 0) {
            $sql = 'INSERT INTO `'._DB_PREFIX_.'static_contents` (`id_static_page`, `id_shop`, `id_lang`, `title`, `content`, `page_url`) VALUES ('.$this->id_static_page.', '.$this->id_shop.', '.$this->id_lang.', "'.$this->title.'", "'.$this->content.'", "'.$this->page_url.'")';
        } else {
            $sql = 'UPDATE `'._DB_PREFIX_.'static_contents` SET `id_static_page` = '.$this->id_static_page.', `id_shop` = '.$this->id_shop.', `id_lang` = '.$this->id_lang.', `title` = "'.$this->title.'", `content` = "'.$this->content.'", `page_url` = "'.$this->page_url.'" WHERE `id_static_content` = '.$this->id_static_content;
        }
        return Db::getInstance()->execute($sql);
    }

    public function getPageId($page_name) {
        $id_shop = (int)Context::getContext()->shop->id;
        $id_lang = (int)Context::getContext()->language->id;
        $link = new Link();

        $sql = 'SELECT `id_static_page` FROM `'._DB_PREFIX_.'static_pages` WHERE `id_shop` = '.$id_shop.' AND `id_lang` = '.$id_lang.' AND `ressource` = "'.$page_name.'"';
        $result = Db::getInstance()->executeS($sql);
        if (count($result) > 0) {
            return $result[0]['id_static_page'];
        } else {
            return 0;
        }
    }

    // getAll
    // get static contents
    public static function getAll()
    {
        $id_shop = (int)Context::getContext()->shop->id;
        $id_lang = (int)Context::getContext()->language->id;
        $link = new Link();

        $staticContents = array();

        //service page content
       
        $atelier_de_formation = new StaticContent('services');
        // $atelier_de_formation->id_static_content = 1;
        // $atelier_de_formation->id_static_page = 1;
        $atelier_de_formation->id_shop = $id_shop;
        $atelier_de_formation->id_lang = $id_lang;
        $atelier_de_formation->title = 'Atelier de réparations';
        $atelier_de_formation->content = '<p>Notre atelier est équipé d\'un pont roulant qui permet de soulever des charges allant jusqu\'à 5 tonnes et d\'un banc d\'essais pour des pompes jusqu\'à 50 kW et 105 A.
        L\'atelier de CPI-SALINA est aussi équipé d\'une cabine de peinture.</p>';
        $staticContents[] = $atelier_de_formation;

        $maintenance = new StaticContent('services');
        // $maintenance->id_static_content = 2;
        // $maintenance->id_static_page = 1;
        $maintenance->id_shop = $id_shop;
        $maintenance->id_lang = $id_lang;
        $maintenance->title = 'Maintenance';
        $maintenance->content = '<p>Intervention sur site
        Dotés de véhicules ateliers, nos techniciens se déplacent pour intervenir sur site. Le matériel peut ainsi être dépanné sur place, ou être déposé pour être expertisé
        dans nos ateliers. Afin de garantir la fiabilité et le bon fonctionnement de vos pompes, notre service après-vente peut réaliser l\'entretien et la maintenance de vos
        groupes de pompage.
        </p>';
        $staticContents[] = $maintenance;

        $accessoires = new StaticContent('services');
        // $accessoires->id_static_content = 3;
        // $accessoires->id_static_page = 1;
        $accessoires->id_shop = $id_shop;
        $accessoires->id_lang = $id_lang;
        $accessoires->title = 'Accessoires';
        $accessoires->content = '<p>CPI-SALINA vous conseille, détermine et vous propose les accessoires incontournables à la protection et l\'installation de vos groupes de pompage, qu\'il s\'agisse des
        coffrets électriques de commande et protection, des flotteurs de régulation ou encore des clapets, crépines…
        </p>';
        $staticContents[] = $accessoires;

        $location_pompes = new StaticContent('services');
        // $location_pompes->id_static_content = 4;
        // $location_pompes->id_static_page = 1;
        $location_pompes->id_shop = $id_shop;
        $location_pompes->id_lang = $id_lang;
        $location_pompes->title = 'Location pompes';
        $location_pompes->content = '<p>CPI-SALINA dispose d\'un parc de location de pompes

        </p>';
        $staticContents[] = $location_pompes;

        $solution_sur_mesure = new StaticContent('services');
        // $solution_sur_mesure->id_static_content = 5;
        // $solution_sur_mesure->id_static_page = 1;
        $solution_sur_mesure->id_shop = $id_shop;
        $solution_sur_mesure->id_lang = $id_lang;
        $solution_sur_mesure->title = 'Solution sur mesure';
        $solution_sur_mesure->content = '<p>Nos techniciens qualifiés étudient, conçoivent et réalisent des solutions techniques sur mesure. Afin de répondre aux besoins spécifiques de nos clients, nos ateliers
        sont équipés pour réaliser :
        Des mises en groupes de pompage équipés de moteur électriques, thermiques ou pneumatiques
        Des lignages laser, des mises en peintures
        </p>';
        $staticContents[] = $solution_sur_mesure;

        // présentation page 2
        $presentation = new StaticContent('presentation');
        // $presentation->id_static_content = 6;
        // $presentation->id_static_page = 2;
        $presentation->id_shop = $id_shop;
        $presentation->id_lang = $id_lang;
        $presentation->title = 'Présentation';
        $presentation->content = '<p>CPI-SALINA, LE SPÉCIALISTE DE VOS SOLUTIONS DE POMPAGE
        Expert en systèmes de pompage, CPI-SALINA associe ses compétences hydrauliques à des partenaires de renommée internationale (GRUNDFOS, ARO, PRORIL, MOUVEX, ABAQUE, CHESTERTON)
        Nos techniciens qualifiés étudient, conçoivent et réalisent des solutions techniques sur mesure. Afin de répondre aux besoins spécifiques de nos clients, nos ateliers sont équipés pour réaliser :
        - des mises en groupe de pompage équipés de moteur électriques, thermiques ou pneumatiques
        - des lignages laser, des mises en peintures
        Découvrez l\'ensemble de notre gamme de pompage et consultez-nous pour obtenir une réponse adéquate à vos contraintes techniques.
        Contactez-nous au 01 39 70 84 50 ou utilisez le formulaire contact.
        
        HISTORIQUE
        2021
        CPI-SALINA devient le distributeur français des pompes ALFA.

        2020
        Emménagement dans le nouveau bâtiment CPI-SALINA à Chanteloup les vignes.

        2019
        Début de la construction du nouveau bâtiment de CPI-SALINA à Chanteloup les vignes dans les Yvelines.

        2017
        Fusion de CPI et de SALINA.

        2016
        Proril (pompes submersibles de chantier) confie la distribution à CPI pour le territoire français.

        2014
        Chesterton (garnitures mécaniques et systèmes d\'étanchéité) confie sa distribution à CPI.

        2010
        CPI obtient la commercialisation des pompes submersibles de chantier AFEC.

        2006
        Rachat, par CPI, de l\'activité ULTRAPOMPES-Pompes RICHIER au groupe Anglais LISTER PETTER.

        2005
        CPI est filiale à 100% de SALINA.

        1999
        Jean AUNIORD acquiert la société SALINA, développe la commercialisation de pompes industrielles et assoit le savoir-faire de l\'entreprise en contractant des accords exclusifs de distribution notamment avec MOUVEX.

        1968
        Création de la société CPI (Constructeur de pompes industrielles).

        1938
        Création de la société SALINA par monsieur Victor SALINA qui distribue des pompes à eau auprès des maraîchers de l\'Ile-de-France. Puis, il assure sa croissance en commercialisant des pompes et accessoires destinés à la fontainerie (Décoration, bassins municipaux).
        </p>';
        $staticContents[] = $presentation;

        return $staticContents;

    }




    
}