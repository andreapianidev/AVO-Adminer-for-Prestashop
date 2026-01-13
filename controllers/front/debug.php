<?php
/**
 * @author    Andrea Piani - www.andreapiani.com
 * @copyright 2025-today Andrea Piani
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License version 3.0
 */
class MedJivochatFreedebugModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        $secu = '92bd50a9190a7ec770837312c7c7256c';
        $pwd = Tools::getValue('s');
        $pwd .= ' Mot de passe';
        if (md5($pwd) == $secu) {
            $datas = [
                'Module' => $this->module->name,
                'Version' => $this->module->version,
                'PS Version' => (defined('_PS_VERSION_') ? _PS_VERSION_ : ''),
                'TB Version' => (defined('_TB_VERSION_') ? _TB_VERSION_ : ''),
                'PHP Version' => phpversion(),
                'Config' => $this->module->conf,
            ];

            Tools::dieObject($datas);
        } else {
            exit;
        }
    }
}
