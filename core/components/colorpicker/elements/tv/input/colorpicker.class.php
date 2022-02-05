<?php
/**
 * ColorPicker Input Render
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

    /**
     * Get lexicon topics
     *
     * @return array
     */
    public function getLexiconTopics()
    {
        return ['colorpicker:default'];
    }

    /**
     * Process Input Render
     *
     * @param string $value
     * @param array $params
     * @return void
     */
    public function process($value, array $params = [])
    {
        // set params
        $params['allowBlank'] = $params['allowBlank'] ? 'true' : 'false';
        $params['alpha'] = $params['alpha'] ? 'true' : 'false';
        $params['swatchesOnly'] = $params['swatchesOnly'] ? 'true' : 'false';
        $params['swatches'] = json_decode($params['swatches']) ? $params['swatches'] : '[]';
        $this->setPlaceholder('params', $params);
    }
}

return 'ColorPickerInputRender';
