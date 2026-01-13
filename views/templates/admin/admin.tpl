{*
* @author Andrea Piani - www.andreapiani.com
* @copyright  Andrea Piani
* @license   https://opensource.org/licenses/AFL-3.0 Academic Free License version 3.0
*}
<ps-panel style="text-align:center">
    <div style="padding: 20px;">
        <img src="{$img_path}avocado-logo.svg" alt="Avo Adminer" style="width: 80px; height: 80px;">
        <h2 style="color: #568203; margin: 10px 0;">Avo Adminer</h2>
        <p>{l s='Developed by' mod='medadminer'} <strong>Andrea Piani</strong></p>
        <p><a href="https://www.andreapiani.com" target="_blank" class="btn btn-success">www.andreapiani.com</a></p>
    </div>
</ps-panel>

<ps-tabs position="left" id="medConfForm">

    <ps-tab label="Avo Adminer" active="true" id="tabadminer" icon="icon-database" panel=false>

        <ps-panel header="Avo Adminer" icon="icon-database">

        <form class="form-horizontal" method="post" action="{$medadminer_url|escape:'htmlall':'UTF-8'}" target="_blank">
            <input type="hidden" name="auth[driver]" value="server"/>
            <input type="hidden" name="auth[server]" value="{$db_server|escape:'htmlall':'UTF-8'}"/>
            <input type="hidden" name="auth[username]" value="{$db_user|escape:'htmlall':'UTF-8'}"/>
            <input type="hidden" name="auth[password]" value="{$db_passwd|escape:'htmlall':'UTF-8'}"/>
            <input type="hidden" name="auth[db]" value="{$db_name|escape:'htmlall':'UTF-8'}"/>

            <p>{l s='Easily manage and take action on your database with the most convenient and popular script, Adminer.' mod='medadminer'}</p>
            <p>{l s='Discover all the possibilities and interests that Adminer offers:' mod='medadminer'} <a href="https://www.adminer.org/" target="_blank" class="btn btn-default btn-xs">{l s='Discover Adminer' mod='medadminer'}</a></p>

            <ps-alert-error>

                {l s='The use of Adminer is under your responsibility, as this script can modify important elements in terms of data and rights, it is always preferable to make a backup of your database before any intervention on it.' mod='medadminer'}

            </ps-alert-error>

            <ps-alert-hint>

                {l s='To launch Adminer on your store\'s database, simply click on the button below.' mod='medadminer'}

            </ps-alert-hint>

            <ps-panel-footer>

                <ps-panel-footer-submit title="Start Avo Adminer" icon="process-icon-database" direction="left" name="saveconf"></ps-panel-footer-submit>

            </ps-panel-footer>

        </form>

        </ps-panel>

        <ps-panel header="{l s='About the Developer' mod='medadminer'}" icon="icon-user">

        <div style="text-align: center; padding: 20px;">
            <img src="{$img_path}avocado-logo.svg" alt="Avo Adminer" style="width: 60px; height: 60px; margin-bottom: 15px;">
            <h3>Andrea Piani</h3>
            <p>{l s='Web Developer & PrestaShop Specialist' mod='medadminer'}</p>
            <p><a href="https://www.andreapiani.com" target="_blank" class="btn btn-success btn-lg"><i class="icon-globe"></i> www.andreapiani.com</a></p>
        </div>

        </ps-panel>

    </ps-tab>

    <ps-tab label="{l s='Informations & support' mod='medadminer'}" id="tab20" icon="icon-info" gap="true" panel=false>

        {include file="$tpl_path/views/templates/admin/about.tpl"}

    </ps-tab>

    <ps-tab label="{l s='More Modules' mod='medadminer'}" id="tab25" icon="icon-cubes">

        {include file="$tpl_path/views/templates/admin/modules.tpl"}

    </ps-tab>

    <ps-tab label="{l s='License' mod='medadminer'}" id="tab30" icon="icon-legal" panel="false">

        {include file="$tpl_path/views/templates/admin/licence.tpl"}

    </ps-tab>

    <ps-tab label="Changelog" id="tab40" icon="icon-code">

        {include file="$tpl_path/views/templates/admin/changelog.tpl"}

    </ps-tab>

    <ps-tab label="V. {$version|escape:'htmlall':'UTF-8'}" icon="icon-info-sign" gap=true></ps-tab>

</ps-tabs>
