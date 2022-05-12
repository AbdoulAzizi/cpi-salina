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

<!-- Content Home -->
<h1 class="center mt-md">
    <span class="light">CPI-SALINA, le spécialiste de</span>
    <span class="bold">vos solutions de pompage</span>
</h1>

<section class="product-home">
    <div class="container">
        <h2 class="center">Nos <strong>Produits</strong></h2>
        <ul class="row">
            <li class="col-md-3 col-xs-6">
                <div class="item">
                    <a href="{$link->getCategoryLink(15)|escape:'html':'UTF-8'}">
                        <img src="{$img_dir}products/cat-centrifuge.jpg" alt="image catégorie">
                        <span class="item-title">Pompes centrifuges</span>
                    </a>
                </div>
            </li>
            <li class="col-md-3 col-xs-6">
                <div class="item">
                    <a href="{$link->getCategoryLink(16)|escape:'html':'UTF-8'}">
                        <img src="{$img_dir}products/cat-pneumatique.jpg" alt="image catégorie">
                        <span class="item-title">Pompes pneumatiques</span>
                    </a>
                </div>
            </li>
            <li class="col-md-3 col-xs-6">
                <div class="item">
                    <a href="{$link->getCategoryLink(17)|escape:'html':'UTF-8'}">
                        <img src="{$img_dir}products/cat-volumetrique.jpg" alt="image catégorie">
                        <span class="item-title">Pompes volumétriques</span>
                    </a>
                </div>
            </li>
            <li class="col-md-3 col-xs-6">
                <div class="item">
                    <a href="{$link->getCategoryLink(13)|escape:'html':'UTF-8'}">
                        <img src="{$img_dir}products/cat-accessoires.jpg" alt="image catégorie">
                        <span class="item-title">Accessoires</span>
                    </a>
                </div>
            </li>
        </ul>
    </div>
</section>

<section class="services-actus">
    <div class="container">
        <div class="row">
            <div class="col-md-6 services-home">
                <h2 class="border-dark">Nos <strong>services</strong></h2>
                <ul class="row">
                    <li class="col-xs-6 full-xs">
                        <div class="item">
                            <span class="ico"><img src="{$img_dir}icon/ico-rep.png" alt="icone réparation"></span>
                            <span>Réparation</span>
                        </div>
                    </li>
                    <li class="col-xs-6 full-xs">
                        <div class="item">
                            <span class="ico"><img src="{$img_dir}icon/ico-maintenance.png" alt="icone maintenance"></span>
                            <span>Maintenance</span>
                        </div>
                    </li>
                    {*<li class="col-xs-6 full-xs">*}
                    {*<div class="item">*}
                    {*<span class="ico"><img src="{$img_dir}icon/ico-disco.png" alt="icone disconnecteurs"></span>*}
                    {*<span>Disconnecteurs</span>*}
                    {*</div>*}
                    {*</li>*}
                    <li class="col-xs-6 full-xs">
                        <div class="item">
                            <span class="ico"><img src="{$img_dir}icon/ico-garn.png" alt="icone garniture"></span>
                            <span>Garnitures Chesterton</span>
                        </div>
                    </li>
                    <li class="col-xs-6 full-xs">
                        <div class="item">
                            <span class="ico"><img src="{$img_dir}icon/ico-location.png" alt="icone location"></span>
                            <span>Location pompes</span>
                        </div>
                    </li>
                    <li class="col-xs-6 full-xs">
                        <div class="item">
                            <span class="ico"><img src="{$img_dir}icon/ico-solution.png" alt="icone solution"></span>
                            <span>Solution sur mesure</span>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-md-6 actus-home">
                <h2 class="border-light">Nos <strong>Actualités</strong></h2>

                {$HOOK_BLOG_LASTNEWS}
            </div>
        </div>
    </div>
</section>

<section class="carousel-marques">
    <div class="container">
        <h2 class="center">Marques <strong>distribuées</strong></h2>
        <div class="responsive">
            <div><img src="{$img_dir}marques/logocpi.jpg" alt="marque"></div>
            <div><img src="{$img_dir}marques/alpha-pompe.png" alt="marque"></div>
            <div><img src="{$img_dir}marques/abaque.jpg" alt="marque"></div>

            <div><img src="{$img_dir}marques/aro.jpg" alt="marque"></div>
            <div><img src="{$img_dir}marques/chesterton.jpg" alt="marque"></div>
            <div><img src="{$img_dir}marques/grundfos.jpg" alt="marque"></div>
            <div><img src="{$img_dir}marques/milton.jpg" alt="marque"></div>
            <div><img src="{$img_dir}marques/mouvex.jpg" alt="marque"></div>
        </div>
    </div>
</section>

<section class="bottom-home">
    <div class="container">
        <p><strong>Depuis 1968 et en partenariat avec les plus grands constructeurs mondiaux</strong> (ARO, GRUNDFOS, PRORIL, MOUVEX, ABAQUE, ALFA POMPE, HILGE), CPI-SALINA avec ses équipes techniques et commerciales vous proposent le matériel de pompage le plus performant pour transférer vos liquides, quelle que soit leur nature (viscosité, densité, température).</p>

        <h2 class="border-light">Recherches <strong>fréquentes</strong></h2>
        <div class="row">
            <ul class="col-sm-3 col-xs-6 full-xs">
                <li><a href="{$link->getCategoryLink(15)|escape:'html':'UTF-8'}">Pompes centrifuges</a></li>
                <li><a href="{$link->getCategoryLink(41)|escape:'html':'UTF-8'}">Pompes immergées</a></li>
                <li><a href="{$link->getCategoryLink(15)|escape:'html':'UTF-8'}">Surpresseurs</a></li>
                <li><a href="{$link->getCategoryLink(49)|escape:'html':'UTF-8'}">Pompes doseuses</a></li>
                <li><a href="{$link->getCategoryLink(43)|escape:'html':'UTF-8'}">Pompes de relevage</a></li>
            </ul>
            <ul class="col-sm-3 col-xs-6 full-xs">
                <li><a href="{$link->getCategoryLink(18)|escape:'html':'UTF-8'}">Pompes pour process sanitaire</a></li>
                <li><a href="{$link->getCategoryLink(37)|escape:'html':'UTF-8'}">Solutions sur-mesure</a></li>
                <li><a href="{$link->getCategoryLink(50)|escape:'html':'UTF-8'}">Pompes auto-amorçantes RICHIER UP</a></li>
                <li><a href="{$link->getCategoryLink(52)|escape:'html':'UTF-8'}">Pompes submersibles</a></li>
                <li><a href="{$link->getCategoryLink(16)|escape:'html':'UTF-8'}">Pompes pneumatiques à membranes</a></li>
            </ul>
            <ul class="col-sm-3 col-xs-6 full-xs">
                <li><a href="{$link->getCategoryLink(16)|escape:'html':'UTF-8'}">Pompes pneumatiques à piston</a></li>
                <li><a href="{$link->getCategoryLink(16)|escape:'html':'UTF-8'}">Pompes vide-fût</a></li>
                <li><a href="{$link->getCategoryLink(16)|escape:'html':'UTF-8'}">Pompes à poudre</a></li>
                <li><a href="{$link->getCategoryLink(16)|escape:'html':'UTF-8'}">Groupes d'extrusion</a></li>
                <li><a href="{$link->getCategoryLink(17)|escape:'html':'UTF-8'}">Pompes volumétriques</a></li>
            </ul>
            <ul class="col-sm-3 col-xs-6 full-xs">
                <li><a href="{$link->getProductLink(207)|escape:'html':'UTF-8'}">Pompes péristaltiques</a></li>
                <li><a href="{$link->getProductLink(245)|escape:'html':'UTF-8'}">Agitateurs</a></li>
                <li><a href="{$link->getCategoryLink(52)|escape:'html':'UTF-8'}">Pompes CPI-2</a></li>
                <li><a href="{$link->getCategoryLink(27)|escape:'html':'UTF-8'}">Chesterton</a></li>
                <li><a href="http://www.cpi-salina.fr/167-pompes-mouvex-serie-g-flo-et-h-flo">Nouvelles pompes MOUVEX<br/>série G-FLO et H-FLO</a></li>
                {*<li><a href="/services">Disconnecteurs</a></li>*}
            </ul>
        </div>

    </div>
</section>


<section style="background: #efefef;margin:0;">
    <div class="container">

        <h2 class="border-light">Contactez-nous <strong>pour obtenir un devis</strong></h2>
        <div style="text-align: center;">
            <a href="mailto:pompes@cpi-salina.fr"
               style="display: inline-block; font-weight: bold; border: 2px solid #0154a0; color: #0154a0; padding: 13px 45px; font-size: 14px; border-radius: 35px; margin: 20px 0 50px 0; position: relative;">Contactez-nous</a>
        </div>
    </div>
</section>


{if isset($HOOK_HOME_TAB_CONTENT) && $HOOK_HOME_TAB_CONTENT|trim}
    {if isset($HOOK_HOME_TAB) && $HOOK_HOME_TAB|trim}
        <ul id="home-page-tabs" class="nav nav-tabs clearfix">
            {$HOOK_HOME_TAB}
        </ul>
    {/if}
    <div class="tab-content">{$HOOK_HOME_TAB_CONTENT}</div>
{/if}
{if isset($HOOK_HOME) && $HOOK_HOME|trim}
    <div class="clearfix">{$HOOK_HOME}</div>
{/if}
<script>
    $(document).ready(function () {
        $('.responsive').slick({
            infinite: false,
            speed: 300,
            slidesToShow: 4,
            slidesToScroll: 4,
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                        infinite: true,
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                    }
                }
                // You can unslick at a given breakpoint now by adding:
                // settings: "unslick"
                // instead of a settings object
            ]
        });
    });
</script>