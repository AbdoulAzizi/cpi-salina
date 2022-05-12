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
<div class="block">
	{*<h4 class="title_block">{l s='Last blog articles' mod='prestablog'}</h4>*}
	<ul id="blog_list" class="block_content" id="prestablog_lastliste">
		{if $ListeBlocLastNews}
			{foreach from=$ListeBlocLastNews item=Item name=myLoop}
			<li>
				<div class="row">
					<div class="block_gauche col-sm-5">
						{if isset($Item.link_for_unique)}<a href="{PrestaBlogUrl id=$Item.id_prestablog_news seo=$Item.link_rewrite titre=$Item.title}">{/if}
								{if isset($Item.image_presente) && $prestablog_config.prestablog_lastnews_showthumb}
									<img src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}thumb_{$Item.id_prestablog_news|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" alt="{$Item.title|escape:'htmlall':'UTF-8'}" class="lastlisteimg" />
								{/if}
						{if isset($Item.link_for_unique)}</a>{/if}
					</div>
					<div class="block_droite col-sm-7">
						<p class="date_blog-cat">{dateFormat date=$Item.date}</p>

						{if isset($Item.link_for_unique)}
							<h3><a href="{PrestaBlogUrl id=$Item.id_prestablog_news seo=$Item.link_rewrite titre=$Item.title}">{/if}
							{$Item.title|escape:'htmlall':'UTF-8'}
							{if isset($Item.link_for_unique)}</a></h3>
						{/if}

						<p>{$Item.paragraph}</p>

					</div>
				</div>
				{if !$smarty.foreach.myLoop.last}{/if}
			</li>
			{/foreach}
		{else}
			<p>{l s='No news' mod='prestablog'}</p>
		{/if}
	</ul>
	{if $prestablog_config.prestablog_lastnews_showall}<a href="{PrestaBlogUrl}" class="button-actu"><i class="icon icon-list-ul"></i> {l s='See all' mod='prestablog'}</a>{/if}
</div>
<!-- /Module Presta Blog -->
