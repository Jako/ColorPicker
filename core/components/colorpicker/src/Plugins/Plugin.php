<?php
/**
 * Abstract plugin
 *
 * @package colorpicker
 * @subpackage plugin
 */

namespace TreehillStudio\ColorPicker\Plugins;

use modX;
use TreehillStudio\ColorPicker\ColorPicker;

/**
 * Class Plugin
 */
abstract class Plugin
{
    /** @var modX $modx */
    protected $modx;
    /** @var ColorPicker $colorpicker */
    protected $colorpicker;
    /** @var array $scriptProperties */
    protected $scriptProperties;

    /**
     * Plugin constructor.
     *
     * @param $modx
     * @param $scriptProperties
     */
    public function __construct($modx, &$scriptProperties)
    {
        $this->scriptProperties = &$scriptProperties;
        $this->modx =& $modx;
        $corePath = $this->modx->getOption('colorpicker.core_path', null, $this->modx->getOption('core_path') . 'components/colorpicker/');
        $this->colorpicker = $this->modx->getService('colorpicker', 'ColorPicker', $corePath . 'model/colorpicker/', [
            'core_path' => $corePath
        ]);
    }

    /**
     * Run the plugin event.
     */
    public function run()
    {
        $init = $this->init();
        if ($init !== true) {
            return;
        }

        $this->process();
    }

    /**
     * Initialize the plugin event.
     *
     * @return bool
     */
    public function init()
    {
        return true;
    }

    /**
     * Process the plugin event code.
     *
     * @return mixed
     */
    abstract public function process();
}