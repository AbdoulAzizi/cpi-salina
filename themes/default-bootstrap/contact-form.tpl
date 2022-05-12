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

<div class="container-fluid imgTop relative">
    <img src="{$img_dir}pages/top-contact.jpg" alt="image page presentation">
</div>

{include file="$tpl_dir./breadcrumb.tpl"}

{capture name=path}{l s='Contact'}{/capture}
<div class="container">
    <h1>{l s='Customer service'}</h1>

    {if isset($confirmation)}
    <p class="alert alert-success">{l s='Your message has been successfully sent to our team.'}</p>
    <ul class="footer_links clearfix">
        <li>
            <a class="btn btn-default button button-small" href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}">
				<span>
					<i class="icon-chevron-left"></i>{l s='Home'}
				</span>
            </a>
        </li>
    </ul>
    {elseif isset($alreadySent)}
    <p class="alert alert-warning">{l s='Your message has already been sent.'}</p>
    <ul class="footer_links clearfix">
        <li>
            <a class="btn btn-default button button-small" href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}">
				<span>
					<i class="icon-chevron-left"></i>{l s='Home'}
				</span>
            </a>
        </li>
    </ul>
    {else}
    {include file="$tpl_dir./errors.tpl"}
    <form action="{$request_uri}" method="post" class="contact-form-box" enctype="multipart/form-data">
        <fieldset>
            <div class="clearfix">
                <div class="col-xs-12 col-md-3 col-md-offset-2 col-sm-6">

                    {if !$PS_CATALOG_MODE}

                        {if isset($is_logged) && $is_logged}
                            <div class="form-group selector1">
                                {if !isset($customerThread.id_product)}
                                    {foreach from=$orderedProductList key=id_order item=products name=products}
                                        <select name="id_product" id="{$id_order}_order_products"
                                                class="unvisible product_select form-control"{if !$smarty.foreach.products.first} style="display:none;"{/if}{if !$smarty.foreach.products.first} disabled="disabled"{/if}>
                                            <option value="0">{l s='-- Choose --'}</option>
                                            {foreach from=$products item=product}
                                                <option value="{$product.value|intval}">{$product.label|escape:'html':'UTF-8'}</option>
                                            {/foreach}
                                        </select>
                                    {/foreach}
                                {elseif $customerThread.id_product > 0}
                                    <input type="hidden" name="id_product" id="id_product" value="{$customerThread.id_product|intval}" readonly="readonly"/>
                                {/if}
                            </div>
                        {/if}
                    {/if}

                    <p class="form-group">
                        {if isset($customerThread.lastname)}
                            <input class="form-control grey" type="text" id="lastname" name="lastname" placeholder="Nom*" value="{$customerThread.lastname}"/>
                        {else}
                            <input class="form-control grey" type="text" id="lastname" name="lastname" placeholder="Nom*"
                                   value="{if isset($smarty.post.lastname)}{$smarty.post.lastname}{/if}"/>
                        {/if}
                    </p>

                    <p class="form-group">
                        {if isset($customerThread.firstname)}
                            <input class="form-control grey" type="text" id="firstname" name="firstname" placeholder="Prénom*"
                                   value="{$customerThread.firstname}"/>
                        {else}
                            <input class="form-control grey" type="text" id="firstname" name="firstname" placeholder="Prénom*"
                                   value="{if isset($smarty.post.firstname)}{$smarty.post.firstname}{/if}"/>
                        {/if}
                    </p>

                    <p class="form-group">
                        {if isset($customerThread.company)}
                            <input class="form-control grey" type="text" id="company" placeholder="Société" name="company" value="{$customerThread.company}"/>
                        {else}
                            <input class="form-control grey" type="text" id="company" placeholder="Société" name="company"
                                   value="{if isset($smarty.post.company)}{$smarty.post.company}{/if}"/>
                        {/if}
                    </p>

                    <p class="form-group">
                        {if isset($customerThread.fonction)}
                            <input class="form-control grey" type="text" id="fonction" placeholder="Fonction" name="fonction"
                                   value="{$customerThread.fonction}"/>
                        {else}
                            <input class="form-control grey" type="text" id="fonction" placeholder="Fonction" name="fonction"
                                   value="{if isset($smarty.post.fonction)}{$smarty.post.fonction}{/if}"/>
                        {/if}
                    </p>

                    <p class="form-group">
                        {if isset($customerThread.email)}
                            <input class="form-control grey" type="text" id="email" name="from" placeholder="Email*"
                                   value="{$customerThread.email|escape:'html':'UTF-8'}" readonly="readonly"/>
                        {else}
                            <input class="form-control grey validate" type="text" id="email" name="from" data-validate="isEmail" placeholder="Email*"
                                   value="{$email|escape:'html':'UTF-8'}"/>
                        {/if}
                    </p>

                    <p class="form-group">
                        {if isset($customerThread.phone)}
                            <input class="form-control grey" type="text" id="phone" name="phone" placeholder="Téléphone" value="{$customerThread.phone}"/>
                        {else}
                            <input class="form-control grey" type="text" id="phone" name="phone" placeholder="Téléphone"
                                   value="{if isset($smarty.post.phone)}{$smarty.post.phone}{/if}"/>
                        {/if}
                    </p>

                    <p class="form-group">
                        {if isset($customerThread.fax)}
                            <input class="form-control grey" type="text" id="fax" placeholder="Fax" name="fax" value="{$customerThread.fax}"/>
                        {else}
                            <input class="form-control grey" type="text" id="fax" placeholder="Fax" name="fax"
                                   value="{if isset($smarty.post.fax)}{$smarty.post.fax}{/if}"/>
                        {/if}
                    </p>

                    <p class="form-group">
                        {if isset($customerThread.department)}
                            <input class="form-control grey" type="text" id="department" placeholder="Département" name="department"
                                   value="{$customerThread.department}"/>
                        {else}
                            <input class="form-control grey" type="text" id="department" placeholder="Département" name="department"
                                   value="{if isset($smarty.post.department)}{$smarty.post.department}{/if}"/>
                        {/if}
                    </p>

                    <p class="form-group">
                        {if isset($customerThread.city)}
                            <input class="form-control grey" type="text" id="city" name="city" placeholder="Ville" value="{$customerThread.city}"/>
                        {else}
                            <input class="form-control grey" type="text" id="city" name="city" placeholder="Ville"
                                   value="{if isset($smarty.post.city)}{$smarty.post.city}{/if}"/>
                        {/if}
                    </p>

                </div>
                <div class="col-xs-12 col-md-4 col-md-offset-1 col-sm-6">
                    <div class="form-group selector1 unvisible">
                        <label for="id_contact">{l s='Subject Heading'}</label>
                        {if isset($customerThread.id_contact) && $customerThread.id_contact && $contacts|count}
                        {assign var=flag value=true}
                        {foreach from=$contacts item=contact}
                            {if $contact.id_contact == $customerThread.id_contact}
                                <input type="text" class="form-control" id="contact_name" name="contact_name" value="{$contact.name|escape:'html':'UTF-8'}"
                                       readonly="readonly"/>
                                <input type="hidden" name="id_contact" value="{$contact.id_contact|intval}"/>
                                {$flag=false}
                            {/if}
                        {/foreach}
                        {if $flag && isset($contacts.0.id_contact)}
                            <input type="text" class="form-control" id="contact_name" name="contact_name" value="{$contacts.0.name|escape:'html':'UTF-8'}"
                                   readonly="readonly"/>
                            <input type="hidden" name="id_contact" value="{$contacts.0.id_contact|intval}"/>
                        {/if}
                    </div>
                    {else}
                    {*@todo dynamise selection id contact  *}
                    <select id="id_contact" class="form-control unvisible" name="id_contact">
                        <option value="5" selected></option>
                        {* Set the first contact
                        <option value="0">{l s='-- Choose --'}</option>
                        {foreach from=$contacts item=contact}
                            <option value="{$contact.id_contact|intval}"{if isset($smarty.request.id_contact) && $smarty.request.id_contact == $contact.id_contact} selected="selected"{/if}>{$contact.name|escape:'html':'UTF-8'}</option>
                        {/foreach*}
                    </select>
                </div>
                <p id="desc_contact0" class="desc_contact{if isset($smarty.request.id_contact)} unvisible{/if}">&nbsp;</p>

                {/if}

                <div class="form-group">
                    <textarea class="form-control" id="message" placeholder="Votre demande"
                              name="message">{if isset($message)}{$message|escape:'html':'UTF-8'|stripslashes}{/if}</textarea>
                </div>
                <div class="submit">
                    <button type="submit" name="submitMessage" id="submitMessage" class="button btn btn-default f-right"><span>{l s='Send'}</span></button>
                </div>
            </div>
</div>
    </fieldset>
    </form>
    </div><!-- fin container -->

    <section class="section-contact-map verylightgrey">
        <div class="container contact-infos">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                {*<li role="presentation" class="active"><a href="#map-paris" aria-controls="map-paris" role="tab" data-toggle="tab">Agence de Paris</a></li>*}
                {*<li role="presentation"><a href="#map-normandie" aria-controls="map-normandie" role="tab" data-toggle="tab">Agence Normandie</a></li>*}
                <li role="presentation"><a href="#map-cpi" aria-controls="map-cpi" role="tab" data-toggle="tab">CPI-SALINA</a></li>
            </ul>

            <!-- Tab panes -->
            {*<div class="tab-content">*}
                {*<div role="tabpanel" class="tab-pane fade in active" id="map-paris">*}
                    {*<div class="row">*}
                        {*<div class="col-md-4">*}
	    			{*<span class="contact-bloc contact-adress">*}
	    				{*<p>15 BD Richard Lenoir</p>*}
	    				{*<p>75011 Paris</p>*}
	    			{*</span>*}
                            {*<span class="contact-bloc contact-tel">*}
	    				{*<p>Tel : 01 43 57 65 29</p>*}
	    			{*</span>*}
                            {*<span class="contact-bloc contact-fax">*}
	    				{*<p>Fax : 01 43 57 31 93</p>*}
	    			{*</span>*}
                        {*</div>*}
                        {*<div class="col-md-8">*}
                            {*<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2625.099947075862!2d2.3677182158918177!3d48.85630447928728!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66dff782e5269%3A0xedbff00ebd092421!2s15+Boulevard+Richard+Lenoir%2C+75011+Paris!5e0!3m2!1sfr!2sfr!4v1446030282180"*}
                                    {*frameborder="0" style="border:0" allowfullscreen></iframe>*}
                        {*</div>*}
                    {*</div>*}
                {*</div>*}
                {*<div role="tabpanel" class="tab-pane fade" id="map-normandie">*}
                    {*<div class="row">*}
                        {*<div class="col-md-4">*}
	    			{*<span class="contact-bloc contact-adress">*}
	    				{*<p>Village d'Entreprises</p>*}
	    				{*<p>Boulevard Roger Fossé</p>*}
	    				{*<p>76570 Pavilly</p>*}
	    			{*</span>*}
                            {*<span class="contact-bloc contact-tel">*}
	    				{*<p>Tel : 02 35 72 87 81</p>*}
	    			{*</span>*}
                            {*<span class="contact-bloc contact-fax">*}
	    				{*<p>Fax : 02 35 72 96 05</p>*}
	    			{*</span>*}
                        {*</div>*}
                        {*<div class="col-md-8">*}
                            {*<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2587.578010218031!2d0.9275803159140174!3d49.56798497936336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e0eeff79f95541%3A0x2a861d985da695ec!2sBd+Roger+Fosse%2C+76570+Pavilly!5e0!3m2!1sfr!2sfr!4v1446032892335"*}
                                    {*frameborder="0" style="border:0" allowfullscreen></iframe>*}
                        {*</div>*}
                    {*</div>*}
                {*</div>*}
                <div role="tabpanel" class="tab-pane fade in active" id="map-cpi">
                    <div class="row">
                        <div class="col-md-4">
                            <span class="contact-bloc contact-adress">
                                <p>9 rue Panhard & Levassor</p>
                                <p>78570 Chanteloup-Les-Vignes</p>
                            </span>
                                    <span class="contact-bloc contact-tel">
                                <p><a href="tel:0139708450" style="color: #0b1983;">Tél. 01 39 70 84 50</a></p>
                            </span>
                            <span class="contact-bloc contact-email">
                                <p><a href="mailto:pompes@cpi-salina.fr" style="color: #0b1983;">pompes@cpi-salina.fr</a></p>
                            </span>
                            <span class="contact-link">

                                <p><a href="https://www.linkedin.com/company/cpi-salina" target="_blank" style="color: #0b1983;">
                                        <img src="/themes/default-bootstrap/img/icon/linkedin.png" alt=""> <br><br>Linkedin</a>
                                </p>
                            </span>
                        </div>
                        <div class="col-md-8">
                            <div id="map">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2619.1807716466387!2d2.0267115156782833!3d48.969083179298444!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e68b91eb07cc45%3A0x743c02d3436af18e!2s9%20Rue%20Panhard%20et%20Levassor%2C%2078570%20Chanteloup-les-Vignes!5e0!3m2!1sfr!2sfr!4v1594217628645!5m2!1sfr!2sfr"
                                        frameborder="0" style="border:0" allowfullscreen></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


{/if}
{addJsDefL name='contact_fileDefaultHtml'}{l s='No file selected' js=1}{/addJsDefL}
{addJsDefL name='contact_fileButtonHtml'}{l s='Choose File' js=1}{/addJsDefL}
