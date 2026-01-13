<?php
/**
 * Avo Adminer - Database Management for PrestaShop
 *
 * @author    Andrea Piani - www.andreapiani.com
 * @copyright 2025-today Andrea Piani
 * @license   BSD-3-Clause
 */
if (!defined('_PS_VERSION_')) {
    exit;
}

include_once dirname(__FILE__) . '/class/AvoAdminerHelper.php';

class MedAdminer extends Module
{
    public $smarty;
    public $context;
    public $controller;
    public $conf;
    public $helper;
    private $errors = [];
    protected $config_form = false;

    public function __construct()
    {
        $this->name = 'medadminer';
        $this->tab = 'administration';
        $this->version = '1.0.0';
        $this->author = 'Andrea Piani - www.andreapiani.com';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = ['min' => '1.6.0.0', 'max' => _PS_VERSION_];

        parent::__construct();

        $this->displayName = $this->l('Avo Adminer');
        $this->description = $this->l('Manage your database easily and quickly from the backoffice of your PrestaShop store with the Adminer script');

        $this->helper = new AvoAdminerHelper($this);

        $this->bootstrap = true;

        $this->tpl_path = _PS_ROOT_DIR_ . '/modules/' . $this->name;
    }

    public function install()
    {
        if (!parent::install()) {
            return false;
        }

        return true;
    }

    public function uninstall()
    {
        if (!parent::uninstall()) {
            return false;
        }

        $this->_clearCache('*');

        return true;
    }

    public function getContent($tab = 'AdminModules')
    {
        $output = '';

        $this->context->smarty->assign(
            [
                'tpl_path' => $this->tpl_path,
                'img_path' => $this->_path . 'views/img/',
                'base_link' => $this->context->shop->getBaseURI(),
                'languages' => Language::getLanguages(false),
                'description' => $this->description,
                'author' => $this->author,
                'name' => $this->name,
                'version' => $this->version,
                'ps_version' => defined('_PS_VERSION_') ? _PS_VERSION_ : null,
                'tb_version' => defined('_TB_VERSION_') ? _TB_VERSION_ : null,
                'php_version' => phpversion(),
                'helper' => $this->helper,
                'iso_code' => $this->helper->isoCode(),
                'id_active_lang' => $this->context->language->id,
                'db_server' => _DB_SERVER_,
                'db_name' => _DB_NAME_,
                'db_user' => _DB_USER_,
                'db_passwd' => _DB_PASSWD_,
                'url_site' => $this->context->link->getPageLink(
                    'index',
                    null,
                    (int) $this->context->language->id,
                    null,
                    false,
                    (int) $this->context->shop->id,
                    false
                ),
                'medadminer_url' => $this->context->link->getModuleLink(
                    $this->name,
                    'medadmin'
                ),
            ]
        );

        $this->context->controller->addJS($this->_path . 'vendor' . DIRECTORY_SEPARATOR . 'js' . DIRECTORY_SEPARATOR . 'riotcompiler.min.js');
        $this->context->controller->addCSS($this->_path . 'views' . DIRECTORY_SEPARATOR . 'css' . DIRECTORY_SEPARATOR . 'admin.css', 'all');
        if (version_compare(_PS_VERSION_, '9.0.0', '>=')) {
            $this->context->controller->addCSS($this->_path . 'vendor' . DIRECTORY_SEPARATOR . 'css' . DIRECTORY_SEPARATOR . 'ps9.css', 'all');
        }

        $output .= $this->display(__FILE__, 'views/templates/admin/admin.tpl');
        $output .= $this->display(__FILE__, 'vendor/prestui/ps-tags.tpl');

        return $output;
    }
}
