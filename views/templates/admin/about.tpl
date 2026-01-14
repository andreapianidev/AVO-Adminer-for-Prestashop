{*
* Avo Adminer - About Template
* @author Andrea Piani - www.andreapiani.com
* @copyright 2025 Andrea Piani
* @license BSD-3-Clause
*}

{* Chi Sono *}
<ps-panel header="👨‍💻 {l s='Chi Sono' mod='medadminer'}" icon="icon-user">
    <div style="padding: 20px;">
        <div style="display: flex; align-items: center; flex-wrap: wrap; gap: 30px;">
            <div style="text-align: center;">
                <img src="{$img_path}avocado-logo.svg" alt="Andrea Piani" style="width: 120px; height: 120px;">
            </div>
            <div style="flex: 1; min-width: 300px;">
                <h3 style="margin-top: 0; color: #568203;">Andrea Piani</h3>
                <p style="font-size: 16px; color: #666; margin-bottom: 15px;">
                    <strong>{l s='Web Developer & Specialista PrestaShop' mod='medadminer'}</strong>
                </p>
                <p style="font-size: 14px; line-height: 1.7;">
                    {l s='Grazie per aver installato Avo Adminer! Sono un sviluppatore web italiano specializzato in PrestaShop. Aiuto i commercianti online a migliorare le performance del loro e-commerce e a sviluppare funzionalità personalizzate.' mod='medadminer'}
                </p>
                <p style="font-size: 14px; line-height: 1.7;">
                    {l s='Se hai bisogno di aiuto con il tuo negozio PrestaShop, non esitare a contattarmi!' mod='medadminer'}
                </p>
            </div>
        </div>
    </div>
</ps-panel>

{* Contatti *}
<ps-panel header="📞 {l s='Contatti' mod='medadminer'}" icon="icon-phone">
    <div style="padding: 20px;">
        <div style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center;">

            <div style="flex: 1; min-width: 200px; max-width: 280px; text-align: center; padding: 20px; background: #f8f9fa; border-radius: 8px;">
                <div style="font-size: 30px; margin-bottom: 10px;">🌐</div>
                <h5 style="margin: 0 0 10px 0;">{l s='Sito Web' mod='medadminer'}</h5>
                <a href="https://www.andreapiani.com" target="_blank" class="btn btn-success">
                    www.andreapiani.com
                </a>
            </div>

            <div style="flex: 1; min-width: 200px; max-width: 280px; text-align: center; padding: 20px; background: #f8f9fa; border-radius: 8px;">
                <div style="font-size: 30px; margin-bottom: 10px;">📧</div>
                <h5 style="margin: 0 0 10px 0;">Email</h5>
                <a href="mailto:andreapiani.dev@gmail.com" class="btn btn-primary">
                    andreapiani.dev@gmail.com
                </a>
            </div>

            <div style="flex: 1; min-width: 200px; max-width: 280px; text-align: center; padding: 20px; background: #f8f9fa; border-radius: 8px;">
                <div style="font-size: 30px; margin-bottom: 10px;">📱</div>
                <h5 style="margin: 0 0 10px 0;">{l s='Telefono / WhatsApp' mod='medadminer'}</h5>
                <a href="tel:+393516248936" class="btn btn-default">
                    +39 351 624 8936
                </a>
            </div>

        </div>
    </div>
</ps-panel>

{* Info Sistema per Supporto *}
<ps-panel header="🔧 {l s='Informazioni Sistema' mod='medadminer'}" icon="icon-cogs">
    <ps-alert-hint>
        <h5 style="margin-top: 0;">📋 {l s='Dati da fornire per richieste di supporto:' mod='medadminer'}</h5>
        <p>{l s='Se hai bisogno di supporto, includi queste informazioni nel tuo messaggio:' mod='medadminer'}</p>
    </ps-alert-hint>

    <table class="table" style="margin-top: 15px;">
        <tr>
            <td><strong>URL Sito:</strong></td>
            <td><code>{$url_site|escape:'html':'UTF-8'}</code></td>
        </tr>
        <tr>
            <td><strong>Modulo:</strong></td>
            <td><code>{$name|escape:'html':'UTF-8'} v{$version|escape:'html':'UTF-8'}</code></td>
        </tr>
        {if $tb_version}
        <tr>
            <td><strong>thirty bees:</strong></td>
            <td><code>{$tb_version|escape:'html':'UTF-8'}</code></td>
        </tr>
        {else}
        <tr>
            <td><strong>PrestaShop:</strong></td>
            <td><code>{$ps_version|escape:'html':'UTF-8'}</code></td>
        </tr>
        {/if}
        <tr>
            <td><strong>PHP:</strong></td>
            <td><code>{$php_version|escape:'html':'UTF-8'}</code></td>
        </tr>
    </table>
</ps-panel>

{* CTA Servizi *}
<ps-panel header="💼 {l s='Hai bisogno di aiuto professionale?' mod='medadminer'}" icon="icon-support" style="border-left: 4px solid #568203;">
    <div style="text-align: center; padding: 25px;">
        <p style="font-size: 15px; max-width: 500px; margin: 0 auto 20px auto;">
            {l s='Offro servizi di ottimizzazione database e sviluppo moduli personalizzati per PrestaShop. Richiedi un preventivo gratuito!' mod='medadminer'}
        </p>
        <a href="https://www.andreapiani.com" target="_blank" class="btn btn-success btn-lg">
            <i class="icon-envelope"></i> {l s='Richiedi Preventivo Gratuito' mod='medadminer'}
        </a>
    </div>
</ps-panel>
