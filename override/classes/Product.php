<?php

class Product extends ProductCore {

    /* Test commit */

    /** @var string Date de début de la vente privée */
    public $adv_avantages;

    /** @var string Date de fin de la vente privée */
    public $adv_applications;

    /** @var integer Id du domaine lieé */
    public $adv_accessoires;

    /** @var integer Code dossier */
    public $adv_references;

    /** @var string Lien de la video (youtube de pref) */
    public $adv_video_link;

    public function __construct($id_product = null, $full = false, $id_lang = null, $id_shop = null, Context $context = null) {
        self::$definition['fields']['adv_avantages']    = array('type' => self::TYPE_HTML);
        self::$definition['fields']['adv_applications'] = array('type' => self::TYPE_HTML);
        self::$definition['fields']['adv_accessoires']  = array('type' => self::TYPE_HTML);
        self::$definition['fields']['adv_references']   = array('type' => self::TYPE_HTML);
        self::$definition['fields']['adv_video_link']   = array('type' => self::TYPE_HTML);

        parent::__construct($id_product, $full, $id_lang, $id_shop,  $context);
    }

    public function getVideoCode()
    {
        if ($this->adv_video_link && strlen($this->adv_video_link) > 0) {
            $url = $this->adv_video_link;
            parse_str(parse_url($url, PHP_URL_QUERY), $linkVars);
            if (isset($linkVars['v']))
                return $linkVars['v'];
        }

        return false;
    }

}