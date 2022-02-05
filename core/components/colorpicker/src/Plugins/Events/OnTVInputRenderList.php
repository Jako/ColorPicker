<?php
/**
 * @package colorpicker
 * @subpackage plugin
 */

namespace TreehillStudio\ColorPicker\Plugins\Events;

use TreehillStudio\ColorPicker\Plugins\Plugin;

class OnTVInputRenderList extends Plugin
{
    public function process()
    {
        $this->modx->event->output($this->colorpicker->getOption('corePath') . 'elements/tv/input/');
    }
}
