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

class AvoAdminerHelper
{
    /**
     * @var Module
     */
    public $module;

    /**
     * @param Module $module
     */
    public function __construct($module)
    {
        $this->module = $module;
    }

    /**
     * Retrieves the ISO code for the current language
     *
     * @param bool $domain If true, returns the domain extension
     *
     * @return string ISO code (fr/en) or domain extension (fr/com)
     */
    public function isoCode($domain = false)
    {
        $iso = $this->module->context->language->iso_code;

        if ($iso === 'fr') {
            return 'fr';
        }

        return $domain ? 'com' : 'en';
    }

    /**
     * Retrieves the language code in ISO format (e.g., fr-FR, en-GB)
     * Compatible with PrestaShop 1.6+ (language_code) and 1.7+ (locale)
     *
     * @return string ISO language code
     */
    public function getLanguageCode()
    {
        $locale = isset($this->module->context->language->locale)
            ? $this->module->context->language->locale
            : $this->module->context->language->language_code;

        $codes = explode('-', $locale);

        if (is_array($codes) && count($codes) === 2) {
            return $codes[0] . '-' . strtoupper($codes[1]);
        }

        return 'en-GB';
    }

    /**
     * Formats a date according to the language format of the context
     * Compatible with all versions of PrestaShop
     *
     * @param string $date Date to format (MySQL or timestamp format)
     * @param bool $full If true, uses the full format, otherwise uses the short format
     *
     * @return string Formatted date or empty string if date is invalid
     *
     * @throws PrestaShopException If the date or the full parameter is invalid
     */
    public static function displayDate($date, $full = false)
    {
        if (empty($date)) {
            return '';
        }

        $time = strtotime($date);
        if ($time === false) {
            return $date;
        }

        $date = date('Y-m-d H:i:s', $time);

        if ($date === '0000-00-00 00:00:00' || $date === '0000-00-00') {
            return '';
        }

        if (!Validate::isDate($date) || !Validate::isBool($full)) {
            throw new PrestaShopException('Invalid date');
        }

        $context = Context::getContext();
        $dateFormat = $full ? $context->language->date_format_full : $context->language->date_format_lite;

        return date($dateFormat, $time);
    }

    /**
     * Recursive copy of a directory
     *
     * @param string $src Source path
     * @param string $dst Destination path
     *
     * @return bool True if successful, false otherwise
     */
    public function recurseCopy($src, $dst)
    {
        $dir = opendir($src);
        if (!$dir) {
            return false;
        }

        if (!is_dir($dst)) {
            mkdir($dst, 0755, true);
        }

        while (false !== ($file = readdir($dir))) {
            if ($file === '.' || $file === '..') {
                continue;
            }

            $srcPath = $src . '/' . $file;
            $dstPath = $dst . '/' . $file;

            if (is_dir($srcPath)) {
                if (!$this->recurseCopy($srcPath, $dstPath)) {
                    closedir($dir);
                    return false;
                }
            } else {
                if (!$this->copyFile($srcPath, $dstPath)) {
                    closedir($dir);
                    return false;
                }
            }
        }

        closedir($dir);
        return true;
    }

    /**
     * Deletes a file
     *
     * @param string $file File path
     *
     * @return bool True if successful, false otherwise
     */
    public function deleteFile($file)
    {
        if (!is_file($file)) {
            return true;
        }

        if (!unlink($file)) {
            $this->module->errors[] = $this->module->l('Deleting the old file is not possible') . ' - ' . $file;
            return false;
        }

        return true;
    }

    /**
     * Simplifies the name of a language by removing annotations in parentheses
     * Ex: "French (France)" becomes "French"
     *
     * @param string $name Full name of the language
     *
     * @return string Simplified name
     */
    public function getNameSimple($name)
    {
        return preg_replace('/\s\(.*\)$/', '', $name);
    }

    /**
     * Copies a file using the appropriate method depending on the PrestaShop version
     *
     * @param string $src Source path
     * @param string $dst Destination path
     *
     * @return bool True if successful, false otherwise
     */
    private function copyFile($src, $dst)
    {
        if (version_compare(_PS_VERSION_, '1.5.5.0', '>=')) {
            return Tools::copy($src, $dst);
        }

        return copy($src, $dst);
    }
}
