{*
* @author Andrea Piani - www.andreapiani.com
* @copyright  Andrea Piani
* @license   https://opensource.org/licenses/AFL-3.0 Academic Free License version 3.0
*}

<ps-panel header="{l s='Informations & support' mod='medadminer'}" icon="icon-info">

	<div style="text-align: center; margin-bottom: 20px;">
		<img src="{$img_path}avocado-logo.svg" alt="Avo Adminer" style="width: 100px; height: 100px;">
		<h2 style="color: #568203;">Avo Adminer</h2>
	</div>

	<p>{l s='Thanks for installing this module on your website.' mod='medadminer'}</p>

	<p>{l s='Developed by' mod='medadminer'} <a href="https://www.andreapiani.com" target="_blank"><strong>Andrea Piani</strong></a>, {l s='Web Developer and PrestaShop specialist.' mod='medadminer'}</p>

	<p>{l s='For support or to suggest new features, please visit:' mod='medadminer'} <a href="https://www.andreapiani.com" class="btn btn-success" target="_blank"><i class="icon-globe"></i> www.andreapiani.com</a></p>

	<ps-alert-hint>

		<h4>{l s='Data to be provided for any support request' mod='medadminer'}</h4>

		<p>URL: <b>{$url_site|escape:'html':'UTF-8'}</b></p>
		<p>Module: <b>{$name|escape:'html':'UTF-8'} {$version|escape:'html':'UTF-8'}</b></p>
		{if $tb_version}
		<p>thirty bees: <b>{$tb_version|escape:'html':'UTF-8'}</b></p>
		{else}
		<p>PrestaShop: <b>{$ps_version|escape:'html':'UTF-8'}</b></p>
		{/if}
		<p>PHP : <b>{$php_version|escape:'html':'UTF-8'}</b></p>

	</ps-alert-hint>

</ps-panel>

<ps-panel header="{l s='About the Developer' mod='medadminer'}" icon="icon-user">

	<div style="text-align: center; padding: 20px;">
		<h3>Andrea Piani</h3>
		<p>{l s='Web Developer & PrestaShop Specialist' mod='medadminer'}</p>
		<p><a href="https://www.andreapiani.com" target="_blank" class="btn btn-success btn-lg"><i class="icon-globe"></i> www.andreapiani.com</a></p>
	</div>

</ps-panel>
