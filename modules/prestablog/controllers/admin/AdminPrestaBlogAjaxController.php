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

class AdminPrestaBlogAjaxController extends ModuleAdminController
{
	public function ajaxProcessPrestaBlogRun()
	{
		$current_lang = (int)$this->context->language->id;

		switch (Tools::getValue('do'))
		{
			case 'sortSubBlocks' :
				if (Tools::getValue('items') && Tools::getValue('hook_name'))
					SubBlocksClass::updatePositions(Tools::getValue('items'), Tools::getValue('hook_name'));
				break;
			case 'sortBlocs' :
				if (Tools::getValue('sortblocLeft'))
					$sort_bloc_left = serialize(Tools::getValue('sortblocLeft'));
				else
					$sort_bloc_left = serialize(array(0 => ''));

				if (Tools::getValue('sortblocRight'))
					$sort_bloc_right = serialize(Tools::getValue('sortblocRight'));
				else
					$sort_bloc_right = serialize(array(0 => ''));

				Configuration::updateValue('prestablog_sbl', $sort_bloc_left, false, null, (int)Tools::getValue('id_shop'));
				Configuration::updateValue('prestablog_sbl', $sort_bloc_left);
				Configuration::updateValue('prestablog_sbr', $sort_bloc_right, false, null, (int)Tools::getValue('id_shop'));
				Configuration::updateValue('prestablog_sbr', $sort_bloc_right);
				break;

			case 'loadProductsLink' :
				$prestablog = new PrestaBlog();
				if (Tools::getValue('req'))
				{
						$list_product_linked = array();
						$list_product_linked = preg_split('/;/', rtrim(Tools::getValue('req'), ';'));

						if (count($list_product_linked) > 0)
						{
							foreach ($list_product_linked as $product_link)
							{
								$product_search = new Product((int)$product_link, false, $current_lang);
								$product_cover = Image::getCover($product_search->id);
								$image_product = new Image((int)$product_cover['id_image']);
								$image_thumb_path = ImageManager::thumbnail(_PS_IMG_DIR_.'p/'.$image_product->getExistingImgPath().'.jpg',
									'product_mini_'.$product_search->id.'.jpg', 45, 'jpg');

								echo '
										<tr class="'.($product_search->active ? '' : 'disabled_product ').'noInlisted_'.$product_search->id.'">
											<td class="center">'.$product_search->id.'</td>
											<td class="center">'.$image_thumb_path.'</td>
											<td>'.$product_search->name.'</td>
											<td class="center">
												<img src="../modules/prestablog/views/img/disabled.gif" rel="'.$product_search->id.'" class="delinked" />
											</td>
										</tr>'."\n";
							}
							echo '
								<script type="text/javascript">
									$("img.delinked").click(function() {
										var idP = $(this).attr("rel");
										$("#currentProductLink input.linked_"+idP).remove();
										$(".noInlisted_"+idP).remove();
										ReloadLinkedProducts();
										ReloadLinkedSearchProducts();
									});
								</script>'."\n";
						}
						else
							echo '<tr><td colspan="4" class="center">'.$prestablog->message_call_back['no_result_linked'].'</td></tr>'."\n";
				}
				else
					echo '<tr><td colspan="4" class="center">'.$prestablog->message_call_back['no_result_linked'].'</td></tr>'."\n";

				break;

			case 'searchProducts' :
				if (Tools::getValue('req') != '')
				{
					if (Tools::strlen(Tools::getValue('req')) >= (int)Configuration::get('prestablog_nb_car_min_linkprod'))
					{
						$start = 0;
						$pas = (int)Configuration::get('prestablog_nb_list_linkprod');
						if (!$pas || $pas == 0)
							$pas = 5;

						if (Tools::getValue('start'))
							$start = (int)Tools::getValue('start');

						$end = (int)$pas + (int)$start;

						$list_product_linked = array();

						if (Tools::getValue('listLinkedProducts') != '')
							$list_product_linked = preg_split('/;/', rtrim(Tools::getValue('listLinkedProducts'), ';'));

						$result_search = array();
						$prestablog = new PrestaBlog();
						$rsql_search = '';
						$rsql_lang = '';

						$query = Tools::strtoupper(pSQL(Trim(Tools::getValue('req'))));
						$querys = array_filter(explode(' ', $query));

						$list_champs_product_lang = array(
							'description',
							'description_short',
							'link_rewrite',
							'name',
							'meta_title',
							'meta_description',
							'meta_keywords'
						);

						foreach ($querys as $value)
						{
							foreach ($list_champs_product_lang as $value_c)
								$rsql_search .= ' UPPER(pl.`'.pSQL($value_c).'`) LIKE \'%'.pSQL($value).'%\' OR';
						}

						if (Tools::getValue('lang') != '')
							$current_lang = (int)Tools::getValue('lang');

						$rsql_lang = 'AND pl.`id_lang` = '.(int)$current_lang;
						$rsql_shop = 'AND ps.`id_shop` = '.(int)Tools::getValue('id_shop');

						$rsql_search = ' WHERE ('.rtrim($rsql_search, 'OR').') '.$rsql_lang.' '.$rsql_shop;

						$rsql_plink = '';

						foreach ($list_product_linked as $product_link)
							$rsql_plink .= ' AND pl.`id_product` <> '.(int)$product_link;

						$rsql_search .= $rsql_plink;

						$count_search = Db::getInstance(_PS_USE_SQL_SLAVE_)->GetRow('SELECT COUNT(DISTINCT pl.`id_product`) AS `value`
									FROM 	`'._DB_PREFIX_.'product_lang` AS pl
									LEFT JOIN `'._DB_PREFIX_.'product_shop` AS ps ON (ps.`id_product` = pl.`id_product`)
									'.$rsql_search.';');

						$rsql	=	'SELECT DISTINCT(pl.`id_product`)
									FROM 	`'._DB_PREFIX_.'product_lang` AS pl
									LEFT JOIN `'._DB_PREFIX_.'product_shop` AS ps ON (ps.`id_product` = pl.`id_product`)
									'.$rsql_search.'
									ORDER BY pl.`name`
									LIMIT '.(int)$start.', '.(int)$pas.' ;';

						$result_search = Db::getInstance(_PS_USE_SQL_SLAVE_)->ExecuteS($rsql);

						if (count($result_search) > 0)
						{
							foreach ($result_search as $value)
							{
								$product_search = new Product((int)$value['id_product'], false, $current_lang);
								$product_cover = Image::getCover($product_search->id);
								$image_product = new Image((int)$product_cover['id_image']);
								$image_thumb_path = ImageManager::thumbnail(_PS_IMG_DIR_.'p/'.$image_product->getExistingImgPath().'.jpg',
									'product_mini_'.$product_search->id.'.jpg', 45, 'jpg');

								echo '	<tr class="'.($product_search->active ? '' : 'disabled_product ').
											'Outlisted noOutlisted_'.$product_search->id.'">
											<td class="center">
												<img src="../modules/prestablog/views/img/linked.png" rel="'.$product_search->id.'" class="linked" />
											</td>
											<td class="center">'.$product_search->id.'</td>
											<td class="center" style="width:50px;">'.$image_thumb_path.'</td>
											<td>'.$product_search->name.'</td>
										</tr>'."\n";
							}
							echo '
								<tr class="prestablog-footer-search">
									<td colspan="4">
										'.$prestablog->message_call_back['total_results'].' : '.$count_search['value'].'
										'.($end < (int)$count_search['value'] ? '<span id="prestablog-next-search" class="prestablog-search">
										'.$prestablog->message_call_back['next_results'].
										'<img src="../modules/prestablog/views/img/list-next2.gif" /></span>' : '').'
										'.($start > 0?'<span id="prestablog-prev-search" class="prestablog-search">
										<img src="../modules/prestablog/views/img/list-prev2.gif" />
										'.$prestablog->message_call_back['prev_results'].'</span>':'').'
									</td>
								</tr>'."\n";
							echo '
								<script type="text/javascript">
									$("span#prestablog-prev-search").click(function() {
										ReloadLinkedSearchProducts('.($start - $pas).');
									});
									$("span#prestablog-next-search").click(function() {
										ReloadLinkedSearchProducts('.($start + $pas).');
									});
									$("img.linked").click(function() {
										var idP = $(this).attr("rel");
										$("#currentProductLink").append(\'<input type="text" name="productsLink[]" value="\'+idP+\'" class="linked_\'+idP+\'" />\');
										$(".noOutlisted_"+idP).remove();
										ReloadLinkedProducts();
										ReloadLinkedSearchProducts();
									});
								</script>'."\n";
						}
						else
							echo '
								<tr class="warning">
									<td colspan="4" class="center">'.$prestablog->message_call_back['no_result_search'].'</td>
								</tr>'."\n";

					}
					else
					{
						$prestablog = new PrestaBlog();
						echo '
							<tr class="warning">
								<td colspan="4" class="center">'.$prestablog->message_call_back['no_result_search'].'</td>
							</tr>'."\n";
					}
				}
				break;

			case 'search' :
				break;

			default :
				break;
		}
	}
}

?>
