{if $MENU != ''}
	<!-- Menu -->
	<div id="block_top_menu" class="sf-contener clearfix col-sm-9">
		<div class="cat-title">{l s="Menu" mod="blocktopmenu"}</div>
		<ul class="sf-menu clearfix menu-content">



			<li class="">
				<a href="" title="Pompes" class="sf-with-ul">Brochures</a>
				<ul class="submenu-container clearfix first-in-line-xs" style="display: none;">
					<li class=""><a href="http://www.cpi-salina.fr/content/7-brochure-industrie" title="Brochure Industrie" class="sf-with-ul">Brochure industrie</a></li>
					<li class=""><a href="http://www.cpi-salina.fr/content/8-brochure-tp" title="Brochure TP" class="sf-with-ul">Brochure TP</a></li>
				</ul>
			</li>


			{$MENU}
			{if $MENU_SEARCH}
				<li class="sf-search noBack" style="float:right">
					<form id="searchbox" action="{$link->getPageLink('search')|escape:'html':'UTF-8'}" method="get">
						<p>
							<input type="hidden" name="controller" value="search" />
							<input type="hidden" value="position" name="orderby"/>
							<input type="hidden" value="desc" name="orderway"/>
							<input type="text" name="search_query" value="{if isset($smarty.get.search_query)}{$smarty.get.search_query|escape:'html':'UTF-8'}{/if}" />
						</p>
					</form>
				</li>
			{/if}


		</ul>
	</div>
	<!--/ Menu -->
{/if}