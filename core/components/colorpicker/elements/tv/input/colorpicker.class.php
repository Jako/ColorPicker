<?php

/**
 * Colorpicker Input Render
 *
 * @package colorpicker
 * @subpackage input_render
 */
class ColorPickerInputRender extends modTemplateVarInputRender
{
    /**
     * Return the template path to load
     *
     * @return string
     */
    public function getTemplate()
    {
        $corePath = $this->modx->getOption('colorpicker.core_path', null, $this->modx->getOption('core_path') . 'components/colorpicker/');
        return $corePath . 'elements/tv/input/tpl/colorpicker.render.tpl';
    }
}

return 'ColorPickerInputRender';