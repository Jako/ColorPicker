<?php
/**
 * @package colorpicker
 * @subpackage plugin
 */

namespace TreehillStudio\ColorPicker\Plugins\Events;

use TreehillStudio\ColorPicker\Plugins\Plugin;

class OnTVOutputRenderPropertiesList extends Plugin
{
    public function process()
    {
        $this->modx->event->output($this->colorpicker->getOption('corePath') . 'elements/tv/output/options/');
    }
}
