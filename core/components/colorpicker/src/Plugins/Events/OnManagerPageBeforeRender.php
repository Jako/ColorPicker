<?php
/**
 * @package colorpicker
 * @subpackage plugin
 */

namespace TreehillStudio\ColorPicker\Plugins\Events;

use TreehillStudio\ColorPicker\Plugins\Plugin;

class OnManagerPageBeforeRender extends Plugin
{
    public function process()
    {
        $this->modx->controller->addLexiconTopic('colorpicker:default');
        $this->colorpicker->includeScriptAssets();
    }
}
