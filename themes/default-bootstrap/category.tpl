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
{include file="$tpl_dir./errors.tpl"}
{if isset($category)}
	{if $category->id AND $category->active}
    	{if $scenes || $category->description || $category->id_image}
		
		{/if}
      <div class="container-fluid imgTop">
          <img src="{$img_dir}pages/top-presentation.jpg" alt="image page presentation">
      </div>
      <!-- Breadcrumbs -->
      {include file="$tpl_dir./breadcrumb.tpl"}

        {if $category->description}
                  <div class="cat_desc container">
                      <div class="row">
                          <div class="col-md-3">
                              <h1>
                                  {strip}
                                      {$category->name|escape:'html':'UTF-8'}
                                      {if isset($categoryNameComplement)}
                                          {$categoryNameComplement|escape:'html':'UTF-8'}
                                      {/if}
                                  {/strip}
                              </h1>
                          </div>
                          <div class="col-md-8 col-md-offset-1">
                              {if Tools::strlen($category->description) > 350}
                                  <div id="category_description_short" class="rte">{$description_short}</div>
                                  <div id="category_description_full" class="unvisible rte">{$category->description}</div>
                                  <a href="{$link->getCategoryLink($category->id_category, $category->link_rewrite)|escape:'html':'UTF-8'}" class="lnk_more">{l s='More'}</a>
                              {else}
                                  <div class="rte">{$category->description}</div>
                              {/if}
                          </div>
                      </div><!-- fin row -->
                  </div>
              {/if}
        {/if}
        <div class="verylightgrey item-list">
            <div class="container">
        		{if isset($subcategories)}
                {if (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories) }
        		<!-- Subcategories -->
        		<div id="subcategories">
        			<ul class="row">
        			{foreach from=$subcategories item=subcategory}
        				<li class="col-sm-3 col-xs-6 full-xs">
                        	<div class="subcategory-image">
        						<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
        						{if $subcategory.id_image}
        							<img class="replace-2x" src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'medium_default')|escape:'html':'UTF-8'}" alt="" width="{$mediumSize.width}" height="{$mediumSize.height}" />
        						{else}
        							<img class="replace-2x" src="{$img_cat_dir}{$lang_iso}-default-medium_default.jpg" alt="" width="{$mediumSize.width}" height="{$mediumSize.height}" />
        						{/if}
                                <div class="hover-subcat"></div>
        					    </a>
                           	</div>
        					<h5><a class="subcategory-name" href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}">{$subcategory.name|truncate:50:'...'|escape:'html':'UTF-8'}</a></h5>
        					{if $subcategory.description}
        						<div class="cat_desc">{Tools::truncateString($subcategory.description, 30)}</div>
        					{/if}
        				</li>
        			{/foreach}
        			</ul>
        		</div>
                {/if}
        		{/if}
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
        	{elseif $category->id}
        		<p class="alert alert-warning">{l s='This category is currently unavailable.'}</p>
        	{/if}
            </div><!-- End container -->
        </div>
