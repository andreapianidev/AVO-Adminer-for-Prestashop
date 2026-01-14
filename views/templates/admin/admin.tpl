{*
* Avo Adminer - Database Management for PrestaShop
* @author Andrea Piani - www.andreapiani.com
* @copyright 2025 Andrea Piani
* @license BSD-3-Clause
*}

{* Header con branding *}
<ps-panel style="text-align:center; background: linear-gradient(135deg, #568203 0%, #7cb342 100%); color: white; border-radius: 8px;">
    <div style="padding: 25px;">
        <img src="{$img_path}avocado-logo.svg" alt="Avo Adminer" style="width: 90px; height: 90px; filter: drop-shadow(2px 2px 4px rgba(0,0,0,0.3));">
        <h1 style="color: white; margin: 15px 0 5px 0; font-size: 28px;">🥑 Avo Adminer</h1>
        <p style="font-size: 16px; margin: 0; opacity: 0.9;">{l s='Gestione Database per PrestaShop' mod='medadminer'}</p>
        <p style="margin-top: 10px;">
            {l s='Sviluppato da' mod='medadminer'} <strong>Andrea Piani</strong> |
            <a href="https://www.andreapiani.com" target="_blank" style="color: white; text-decoration: underline;">www.andreapiani.com</a>
        </p>
    </div>
</ps-panel>

<ps-tabs position="left" id="medConfForm">

    {* TAB 1: Avo Adminer - Principale *}
    <ps-tab label="🥑 Avo Adminer" active="true" id="tabadminer" icon="icon-database" panel=false>

        <ps-panel header="{l s='Gestione Database' mod='medadminer'}" icon="icon-database">

        <form class="form-horizontal" method="post" action="{$medadminer_url|escape:'htmlall':'UTF-8'}" target="_blank">
            <input type="hidden" name="auth[driver]" value="server"/>
            <input type="hidden" name="auth[server]" value="{$db_server|escape:'htmlall':'UTF-8'}"/>
            <input type="hidden" name="auth[username]" value="{$db_user|escape:'htmlall':'UTF-8'}"/>
            <input type="hidden" name="auth[password]" value="{$db_passwd|escape:'htmlall':'UTF-8'}"/>
            <input type="hidden" name="auth[db]" value="{$db_name|escape:'htmlall':'UTF-8'}"/>

            <p style="font-size: 15px;">{l s='Gestisci e intervieni facilmente sul tuo database con lo script più comodo e popolare: Adminer.' mod='medadminer'}</p>

            <p>{l s='Scopri tutte le possibilità che Adminer offre:' mod='medadminer'}
                <a href="https://www.adminer.org/" target="_blank" class="btn btn-default btn-xs">
                    <i class="icon-external-link"></i> {l s='Scopri Adminer' mod='medadminer'}
                </a>
            </p>

            <ps-alert-error>
                <strong>⚠️ {l s='Attenzione' mod='medadminer'}:</strong> {l s='L\'uso di Adminer è sotto la tua responsabilità. Questo script può modificare elementi importanti del database. È sempre preferibile fare un backup prima di qualsiasi intervento.' mod='medadminer'}
            </ps-alert-error>

            <ps-alert-hint>
                <i class="icon-hand-right"></i> {l s='Per avviare Adminer sul database del tuo negozio, clicca semplicemente sul pulsante qui sotto.' mod='medadminer'}
            </ps-alert-hint>

            <ps-panel-footer>
                <ps-panel-footer-submit title="🚀 {l s='Avvia Avo Adminer' mod='medadminer'}" icon="process-icon-database" direction="left" name="saveconf"></ps-panel-footer-submit>
            </ps-panel-footer>

        </form>

        </ps-panel>

        {* Box CTA Servizi *}
        <ps-panel header="💼 {l s='Hai bisogno di aiuto con il database?' mod='medadminer'}" icon="icon-support" style="border-left: 4px solid #568203;">
            <div style="padding: 15px;">
                <p style="font-size: 15px;"><strong>{l s='Offro servizi professionali di ottimizzazione database PrestaShop:' mod='medadminer'}</strong></p>
                <ul style="font-size: 14px; line-height: 1.8;">
                    <li>🔍 {l s='Analisi e pulizia tabelle inutilizzate' mod='medadminer'}</li>
                    <li>⚡ {l s='Ottimizzazione query e indici per velocizzare il sito' mod='medadminer'}</li>
                    <li>📉 {l s='Riduzione dimensioni database' mod='medadminer'}</li>
                    <li>🚀 {l s='Miglioramento tempi di caricamento' mod='medadminer'}</li>
                </ul>
                <div style="text-align: center; margin-top: 20px;">
                    <a href="https://www.andreapiani.com" target="_blank" class="btn btn-success btn-lg">
                        <i class="icon-envelope"></i> {l s='Richiedi Preventivo Gratuito' mod='medadminer'}
                    </a>
                    <p style="margin-top: 10px; font-size: 13px;">
                        📧 andreapiani.dev@gmail.com | 📱 +39 351 624 8936
                    </p>
                </div>
            </div>
        </ps-panel>

    </ps-tab>

    {* TAB 2: Servizi *}
    <ps-tab label="💼 {l s='Servizi' mod='medadminer'}" id="tabservices" icon="icon-briefcase" panel=false>

        {include file="$tpl_path/views/templates/admin/services.tpl"}

    </ps-tab>

    {* TAB 3: Informazioni & Supporto *}
    <ps-tab label="ℹ️ {l s='Info & Supporto' mod='medadminer'}" id="tab20" icon="icon-info" panel=false>

        {include file="$tpl_path/views/templates/admin/about.tpl"}

    </ps-tab>

    {* TAB 4: Licenza *}
    <ps-tab label="📜 {l s='Licenza' mod='medadminer'}" id="tab30" icon="icon-legal" panel="false">

        {include file="$tpl_path/views/templates/admin/licence.tpl"}

    </ps-tab>

    {* TAB 5: Changelog *}
    <ps-tab label="📋 Changelog" id="tab40" icon="icon-code">

        {include file="$tpl_path/views/templates/admin/changelog.tpl"}

    </ps-tab>

    {* TAB Versione *}
    <ps-tab label="v{$version|escape:'htmlall':'UTF-8'}" icon="icon-tag" gap=true></ps-tab>

</ps-tabs>
