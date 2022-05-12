<?php

class CustomerThread extends CustomerThreadCore {

    public $firstname;
    public $lastname;
    public $fonction;
    public $phone;
    public $fax;
    public $department;
    public $city;

    public function __construct($id_product = null, $full = false, $id_lang = null, $id_shop = null, Context $context = null) {
        self::$definition['fields']['firstname'] = array('type' => self::TYPE_STRING);
        self::$definition['fields']['lastname'] = array('type' => self::TYPE_STRING);
        self::$definition['fields']['fonction'] = array('type' => self::TYPE_STRING);
        self::$definition['fields']['phone'] = array('type' => self::TYPE_STRING);
        self::$definition['fields']['fax'] = array('type' => self::TYPE_STRING);
        self::$definition['fields']['department'] = array('type' => self::TYPE_STRING);
        self::$definition['fields']['city'] = array('type' => self::TYPE_STRING);

        parent::__construct($id_product, $full, $id_lang, $id_shop,  $context);
    }

}