{*
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
 *}

<!-- Module Presta Blog -->


<div class="container-fluid imgTop">
	<img src="{$img_dir}pages/top-presentation.jpg" alt="image page presentation">
</div>

{include file="$tpl_dir./breadcrumb.tpl"}

<div class="container">

<script type="text/javascript">
	( function($) {
		$(function() {
			$("div#menu-mobile, div#menu-mobile-close").click(function() {
			$("#prestablog_menu_cat nav").toggle();
			 });

		});
	} ) ( jQuery );
</script>
<div id="prestablog_menu_cat" class="hidden">
<div id="menu-mobile"></div>
	<nav>
		{PrestaBlogContent return=$MenuCatNews}
	</nav>
</div>
<!-- Module Presta Blog -->
