<?php
/**
 * ColorPicker
 *
 * Copyright 2011-2017 by Benjamin Vauchel <benjamin.vauchel@gmail.com>
 * Copyright 2017-2022 by Thomas Jakobi <thomas.jakobipartout.info>
 *
 * @package colorpicker
 * @subpackage classfile
 */

namespace TreehillStudio\ColorPicker;

use modX;
use xPDO;

/**
 * Class ColorPicker
 */
class ColorPicker
{
    /**
     * A reference to the modX instance
     * @var modX $modx
     */
    public $modx;

    /**
     * The namespace
     * @var string $namespace
     */
    public $namespace = 'colorpicker';

    /**
     * The package name
     * @var string $packageName
     */
    public $packageName = 'ColorPicker';

    /**
     * The version
     * @var string $version
     */
    public $version = '2.0.2';

    /**
     * The class options
     * @var array $options
     */
    public $options = [];

    /**
     * ColorPicker constructor
     *
     * @param modX $modx A reference to the modX instance.
     * @param array $options An array of options. Optional.
     */
    public function __construct(modX &$modx, $options = [])
    {
        $this->modx =& $modx;
        $this->namespace = $this->getOption('namespace', $options, $this->namespace);

        $corePath = $this->getOption('core_path', $options, $this->modx->getOption('core_path', null, MODX_CORE_PATH) . 'components/' . $this->namespace . '/');
        $assetsPath = $this->getOption('assets_path', $options, $this->modx->getOption('assets_path', null, MODX_ASSETS_PATH) . 'components/' . $this->namespace . '/');
        $assetsUrl = $this->getOption('assets_url', $options, $this->modx->getOption('assets_url', null, MODX_ASSETS_URL) . 'components/' . $this->namespace . '/');
        $modxversion = $this->modx->getVersionData();

        // Load some default paths for easier management
        $this->options = array_merge([
            'namespace' => $this->namespace,
            'version' => $this->version,
            'corePath' => $corePath,
            'modelPath' => $corePath . 'model/',
            'vendorPath' => $corePath . 'vendor/',
            'chunksPath' => $corePath . 'elements/chunks/',
            'pagesPath' => $corePath . 'elements/pages/',
            'snippetsPath' => $corePath . 'elements/snippets/',
            'pluginsPath' => $corePath . 'elements/plugins/',
            'controllersPath' => $corePath . 'controllers/',
            'processorsPath' => $corePath . 'processors/',
            'templatesPath' => $corePath . 'templates/',
            'assetsPath' => $assetsPath,
            'assetsUrl' => $assetsUrl,
            'jsUrl' => $assetsUrl . 'js/',
            'cssUrl' => $assetsUrl . 'css/',
            'imagesUrl' => $assetsUrl . 'images/',
            'connectorUrl' => $assetsUrl . 'connector.php'
        ], $options);

        // Add default options
        $this->options = array_merge($this->options, [
            'debug' => (bool)$this->modx->getOption($this->namespace . '.debug', null, '0') == 1,
            'modxversion' => $modxversion['version']
        ]);

        $lexicon = $this->modx->getService('lexicon', 'modLexicon');
        $lexicon->load($this->namespace . ':default');
    }

    /**
     * Get a local configuration option or a namespaced system setting by key.
     *
     * @param string $key The option key to search for.
     * @param array $options An array of options that override local options.
     * @param mixed $default The default value returned if the option is not found locally or as a
     * namespaced system setting; by default this value is null.
     * @return mixed The option value or the default value specified.
     */
    public function getOption($key, $options = [], $default = null)
    {
        $option = $default;
        if (!empty($key) && is_string($key)) {
            if ($options != null && array_key_exists($key, $options)) {
                $option = $options[$key];
            } elseif (array_key_exists($key, $this->options)) {
                $option = $this->options[$key];
            } elseif (array_key_exists("$this->namespace.$key", $this->modx->config)) {
                $option = $this->modx->getOption("$this->namespace.$key");
            }
        }
        return $option;
    }

    /**
     * Register javascripts in the controller
     */
    public function includeScriptAssets()
    {
        $assetsUrl = $this->getOption('assetsUrl');
        $jsUrl = $this->getOption('jsUrl') . 'mgr/';
        $jsSourceUrl = $assetsUrl . '../../../source/js/mgr/';
        $cssUrl = $this->getOption('cssUrl') . 'mgr/';
        $cssSourceUrl = $assetsUrl . '../../../source/css/mgr/';
        $nodeUrl = $assetsUrl . '../../../node_modules/';

        if ($this->getOption('debug') && $assetsUrl != MODX_ASSETS_URL . 'components/colorpicker/') {
            $this->modx->controller->addJavascript($jsSourceUrl . 'colorpicker.js?v=v' . $this->version);
            $this->modx->controller->addJavascript($jsSourceUrl . 'colorpickerfield.js?v=v' . $this->version);
            $this->modx->controller->addJavascript($jsSourceUrl . 'Ext.ux.ColorPicker.js?v=v' . $this->version);
            $this->modx->controller->addJavascript($nodeUrl . '@melloware/coloris/dist/coloris.js?v=v' . $this->version);
            $this->modx->controller->addCss($cssSourceUrl . 'colorpicker.css?v=v' . $this->version);
        } else {
            $this->modx->controller->addJavascript($jsUrl . 'colorpicker.min.js?v=v' . $this->version);
            $this->modx->controller->addCss($cssUrl . 'colorpicker.min.css?v=v' . $this->version);
        }
        $this->modx->controller->addHtml('<script type="text/javascript">ColorPicker.config = ' . json_encode($this->options, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES) . ';</script>');
    }
}
