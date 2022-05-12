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
<!-- Pagination -->
{if isset($Pagination.NombreTotalPages) && $Pagination.NombreTotalPages > 1}
	<ul class="pagination">
		{if $Pagination.PageCourante > 1}
		<li class="pagination_previous">
			<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartPrecedent p=$Pagination.PagePrecedente c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'url':'UTF-8'}"></a>
		</li>
		{else}
		<li class="disabled pagination_previous">
			<span></span>
		</li>
		{/if}
		{foreach from=$Pagination.PremieresPages key=key_page item=value_page}
			{if ($Pagination.PageCourante == $key_page) || (!$Pagination.PageCourante && $key_page == 1)}
			<li class="active">
				<span><span>{$key_page|intval}</span></span>
			</li>
			{else}
				{if $key_page == 1}
				<li>
					<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'url':'UTF-8'}">
						<span>{$key_page|intval}</span>
					</a>
				</li>
				{else}
				<li>
					<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'url':'UTF-8'}"
					>
					<span>{$key_page|intval}</span></a>
				</li>
				{/if}
			{/if}
		{/foreach}
		{if isset($Pagination.Pages) && $Pagination.Pages}
		<li>
			<span class="more"><span>...<span></span>
		</li>
			{foreach from=$Pagination.Pages key=key_page item=value_page}
				{if !in_array($value_page, $Pagination.PremieresPages)}
					{if ($Pagination.PageCourante == $key_page) || (!$Pagination.PageCourante && $key_page == 1)}
					<li class="current active">
						<span><span>{$key_page|intval}<span></span>
					</li>
					{else}
					<li>
						<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'url':'UTF-8'}"
						><span>{$key_page|intval}</span></a>
					</li>
					{/if}
				{/if}
			{/foreach}
		{/if}
		{if $Pagination.PageCourante < $Pagination.NombreTotalPages}
		<li class="pagination_next">
			<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartSuivant p=$Pagination.PageSuivante c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'url':'UTF-8'}"><span></span></a>
		</li>
		{else}
		<li class="pagination_next disabled">
			<span><span></span></span>
		</li>
		{/if}
	</ul>
{/if}
<!-- /Pagination -->
<!-- /Module Presta Blog -->
