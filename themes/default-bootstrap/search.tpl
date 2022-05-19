{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}{l s='Search'}{/capture}
<div class="">
    <div class="container">
        <h1
            {if isset($instant_search) && $instant_search}id="instant_search_results"{/if}
                
                class="page-heading {if !isset($instant_search) || (isset($instant_search) && !$instant_search)} product-listing{/if}">
                {* {l s='Search'}&nbsp; *}
                {l s='Vos résultats concernant la recherche'}&nbsp;
            {if $nbProducts > 0 || isset($liste_news_matching_query) || isset($categories) || isset($liste_cms_matching_query)}
                <span class="lighter">
                    "{if isset($search_query) && $search_query}{$search_query|escape:'html':'UTF-8'}{elseif $search_tag}{$search_tag|escape:'html':'UTF-8'}{elseif $ref}{$ref|escape:'html':'UTF-8'}{/if}"
                </span>
            {/if}
            {if isset($instant_search) && $instant_search}
                <a href="#" class="close">
                    {l s='Return to the previous page'}
                </a>
            {* {else}
                <span class="heading-counter">
                    {if $nbProducts == 1}{l s='%d result has been found.' sprintf=$nbProducts|intval}{else}{l s='%d results have been found.' sprintf=$nbProducts|intval}{/if}
                </span> *}
            {/if}
        </h1>
    </div>
    <div class="container">
        {include file="$tpl_dir./errors.tpl"}
    </div>
    <div class="container">
        {if !$nbProducts && !isset($liste_news_matching_query) && !isset($categories) && !isset($liste_cms_matching_query)}
            <p class="alert alert-warning">
                {if isset($search_query) && $search_query}
                    {l s='No results were found for your search'}&nbsp;"{if isset($search_query)}{$search_query|escape:'html':'UTF-8'}{/if}"
                {elseif isset($search_tag) && $search_tag}
                    {l s='No results were found for your search'}&nbsp;"{$search_tag|escape:'html':'UTF-8'}"
                {else}
                    {l s='Please enter a search keyword'}
                {/if}
            </p>
            {else}
            {if isset($instant_search) && $instant_search}
                <p class="alert alert-info">
                    {if $nbProducts == 1}{l s='%d result has been found.' sprintf=$nbProducts|intval}{else}{l s='%d results have been found.' sprintf=$nbProducts|intval}{/if}
                </p>
            {/if}
            {* <div class="content_sortPagiBar">
                <div class="sortPagiBar clearfix {if isset($instant_search) && $instant_search} instant_search{/if}">
                    {include file="$tpl_dir./product-sort.tpl"}
                    {if !isset($instant_search) || (isset($instant_search) && !$instant_search)}
                        {include file="./nbr-product-page.tpl"}
                    {/if}
                </div>
                <div class="top-pagination-content clearfix">
                    {include file="./product-compare.tpl"}
                    {if !isset($instant_search) || (isset($instant_search) && !$instant_search)}
                        {include file="$tpl_dir./pagination.tpl" no_follow=1}
                    {/if}
                </div>
            </div> *}

            <!-- if category is not empty display category template -->
            {* {$categories|@var_dump} *}
            {if isset($categories) && $categories}
                <div class="products_results"><h3>{l s='Catégories'}</h3> </div>
                    <div class="item-list">
                        <div class="container">
                            {if isset($categories)}
                                <div id="subcategories">
                                    <ul class="row">
                                        {foreach from=$categories item=category}
                                            <li class="col-sm-3 col-xs-6 full-xs">
                                                <div class="subcategory-image">
                                                    <a href="{$link->getCategoryLink($category->id_category, $category->link_rewrite)|escape:'html':'UTF-8'}" title="{$category->name|escape:'html':'UTF-8'}" class="img">
                                                    {if $category->id_image}
                                                        <img class="replace-2x" src="{$link->getCatImageLink($category->link_rewrite, $category->id_image, 'medium_default')|escape:'html':'UTF-8'}" alt="" width="{$mediumSize.width}" height="{$mediumSize.height}" />
                                                    {else}
                                                        <img class="replace-2x" src="{$img_cat_dir}{$lang_iso}-default-medium_default.jpg" alt="" width="{$mediumSize.width}" height="{$mediumSize.height}" />
                                                    {/if}
                                                    <div class="hover-subcat"></div>
                                                    </a>
                                                </div>
                                                <h5><a class="subcategory-name" href="{$link->getCategoryLink($category->id_category, $category->link_rewrite)|escape:'html':'UTF-8'}">{$category->name|truncate:50:'...'|escape:'html':'UTF-8'}</a></h5>
                                                {if $category->description}
                                                    <div class="cat_desc">{Tools::truncateString($category->description, 30)}</div>
                                                {/if}
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                            {/if}
                            {* 
                            {if $products && (!isset($subcategories) || count($subcategories) == 0)}
                                {hook h='displayLeftColumn' mod='blocklayered'}
                                    
                                {include file="./product-list.tpl" products=$products}
                                <div class="content_sortPagiBar">
                                    <div class="bottom-pagination-content clearfix">
                                        {include file="./product-compare.tpl" paginationId='bottom'}
                                {include file="./pagination.tpl" paginationId='bottom'}
                                    </div>
                                </div>
                            {/if}
                            *}
                        </div><!-- End container -->
                    </div>
                </div>
            {/if}

            {if isset($search_products) && $search_products }
                <div class="container">
                    <div class="products_results"><h3>{l s='Produits'}</h3> </div>
                    {include file="$tpl_dir./product-list.tpl" products=$search_products}
                </div>
            {/if}
            
        
            {if isset($liste_news_matching_query) && $liste_news_matching_query}
                <div class="container">
                    <div class="products_results"><h3>{l s='Actualités'}</h3> </div>
                    {* {include file="/modules/prestablog/views/templates/front/default_page-all.tpl" news=$liste_news_matching_query} *}
                    {* {hook h='search_hook' mod='prestablog' news=$liste_news_matching_query} *}
                    {* {include hook h='displayLeftColumn' mod='prestablog' news=$liste_news_matching_query} *}
                    {assign var='news' value=$liste_news_matching_query}
                    {if sizeof($news)}
                        <div class="clearfix">
                            <div class="row">
                                <ul id="blog_list" class="col-md-10">
                                    {foreach from=$news item=news_item name=NewsName}
                                        <li class="row">
                                            {if isset($news_item.image_presente)}
                                                <div class="block_gauche col-sm-4">
                                                    {if isset($news_item.link_for_unique)}<a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" class="product_img_link" title="{$news_item.title|escape:'htmlall':'UTF-8'}">{/if}
                                                        <img src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}thumb_{$news_item.id_prestablog_news|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" alt="{$news_item.title|escape:'htmlall':'UTF-8'}" />
                                                    {if isset($news_item.link_for_unique)}</a>{/if}
                                                </div>
                                            {/if}
                                            <div class="block_droite col-sm-8">
                                                <span class="date_blog-cat">{l s='Published :' mod='prestablog'}
                                                        {dateFormat date=$news_item.date}
                                                        {if $news_item.count_comments>0}| {$news_item.count_comments|intval} {if $news_item.count_comments>1}{l s='comments' mod='prestablog'}{else}{l s='comment' mod='prestablog'}{/if} {/if}
                                                        {*{if sizeof($news_item.categories)} | {l s='Categories :' mod='prestablog'}
                                                            {foreach from=$news_item.categories item=categorie key=key name=current}
                                                                <a href="{PrestaBlogUrl c=$key titre=$categorie.link_rewrite}" class="categorie_blog">{$categorie.title|escape:'htmlall':'UTF-8'}</a>
                                                                {if !$smarty.foreach.current.last},{/if}
                                                            {/foreach}
                                                        {/if}*}
                                                </span>
                                                <h3>
                                                    {if isset($news_item.link_for_unique)}<a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" title="{$news_item.title|escape:'htmlall':'UTF-8'}">{/if}{$news_item.title|escape:'htmlall':'UTF-8'}{if isset($news_item.link_for_unique)}</a>{/if}
                                                </h3>
                                                <p class="blog_desc">
                                                    {if $news_item.paragraph_crop!=''}
                                                        {$news_item.paragraph_crop|escape:'htmlall':'UTF-8'}
                                                    {/if}
                                                </p>
                                                {if isset($news_item.link_for_unique)}
                                                    <p>
                                                        <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" class="link-right"><!-- {l s='Read more' mod='prestablog'} --></a>
                                                    </p>
                                                {/if}
                                            </div>
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                        </div>
                    {/if}
                    {* <div class="bottom-pagination-content">
                        {include file="$prestablog_pagination"}
                    </div> *}
            {* {else}
                <p class="warning">{l s='Empty' mod='prestablog'}</p>
            </div> *}
            {/if}


            {if isset($liste_cms_matching_query) && $liste_cms_matching_query}
                <div class="products_results container"><h3>{l s='Pages CMS'}</h3> </div>
                    <section class="services-actus">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6 services-home">
                                    {* <h2 class="border-dark">Nos <strong>services</strong></h2> *}
                                    <ul class="row">
                                    {foreach from=$liste_cms_matching_query item=cms_item name=CmsName}
                                    <a href="{$cms_item.link_rewrite|escape:'htmlall':'UTF-8'}" title="{$cms_item.meta_title|escape:'htmlall':'UTF-8'}">
                                        <li class="col-md-6 search">
                                            <div class="item">
                                            <span class="ico"></span>
                                                <span> {$cms_item.meta_title|escape:'htmlall':'UTF-8'}</span>
                                            </div>
                                        </li>
                                        </a>
                                    {/foreach}
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            {/if}

            {if (isset($search_products) && $search_products) || $liste_news_matching_query || $categories|| $liste_cms_matching_query}
                <div class="content_sortPagiBar container">
                    <div class="bottom-pagination-content clearfix">
                        {include file="./product-compare.tpl"}
                        {if !isset($instant_search) || (isset($instant_search) && !$instant_search)}
                            {include file="$tpl_dir./pagination.tpl" paginationId='bottom' no_follow=1}
                        {/if}
                    </div>
                </div>
            {/if}

            <!-- if no results -->
            {if !$liste_news_matching_query  && !$liste_cms_matching_query && !$search_products && !$categories}
                <div class="products_results container"><h3>{l s='Aucun résultat ne correspond à votre recherche'}</h3> </div>
            {/if}

        {/if}
     </div>


</div>
