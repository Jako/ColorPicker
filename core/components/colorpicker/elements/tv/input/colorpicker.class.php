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
        return array('daterangetv:default');
    }

    /**
     * Process Input Render
     *
     * @param string $value
     * @param array $params
     * @return void
     */
    public function process($value, array $params = array())
    {
        $this->modx->controller->addLexiconTopic('colorpicker:tvrenders');

        // Set params
        $params['allowBlank'] = ($params['allowBlank'] === 'false' || $params['allowBlank'] === 0 || $params['allowBlank'] === false) ? false : true;
        $this->setPlaceholder('params', $params);
    }
}

return 'ColorPickerInputRender';
