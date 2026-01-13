<?php
/**
 * @author    Andrea Piani - www.andreapiani.com
 * @copyright 2025-today Andrea Piani
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License version 3.0
 */
if (!defined('_PS_VERSION_')) {
    exit;
}
class MedAdminermedadminModuleFrontController extends ModuleFrontController
{
    public $ssl = true;

    public function init()
    {
        header('Access-Control-Allow-Origin: *');
        parent::init();
        $cookie = new Cookie('psAdmin');

        if ($cookie->profile != 1) {
            exit;
        }
        include $this->module->tpl_path . '/vendor/adminer/adminer.php';
        exit;
    }

    public function adminer_object()
    {
        // required to run any plugin
        include_once $this->module->tpl_path . '/vendor/adminer/plugins/plugin.php';

        // autoloader
        foreach (glob($this->module->tpl_path . '/vendor/adminer/plugins/*.php') as $filename) {
            include_once $filename;
        }

        $plugins = [
            new AdminerPrestashop(),
            new AdminerDumpZip(),
            new AdminerDumpXml(),
            new AdminerDumpDate(),
            new AdminerDumpJson(),
        ];

        return new AdminerPlugin($plugins);
    }
}
