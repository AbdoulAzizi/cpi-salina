<?php
/**
 * 2008 - 2015 HDClic
 *
 * MODULE PrestaBlog
 *
 * @version   3.6.2
 * @author    HDClic <prestashop@hdclic.com>
 * @link      http://www.hdclic.com
 * @copyright Copyright (c) permanent, HDClic
 * @license   Addons PrestaShop license limitation
 *
 * NOTICE OF LICENSE
 *
 * Don't use this module on several shops. The license provided by PrestaShop Addons
 * for all its modules is valid only once for a single shop.
 */

if (!defined('_PS_VERSION_'))
	exit;

function upgrade_module_3_6_1($module)
{
	if (!Configuration::get('prestablog_nb_list_linkprod'))
		Configuration::updateValue('prestablog_nb_list_linkprod', 5);

	$id_tab = Tab::getIdFromClassName('AdminPrestaBlogAjax');
	if (empty ($id_tab))
		$module->registerAdminTab();

	Tools::clearCache();

	return true;
}
