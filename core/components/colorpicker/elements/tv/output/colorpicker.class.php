<?php

use OzdemirBurak\Iris\Color\Factory;
use OzdemirBurak\Iris\Exceptions\AmbiguousColorString;

/**
 * ColorPicker Output Render
 *
 * @package colorpicker
 * @subpackage output_render
 */
class ColorPickerOutputRender extends modTemplateVarOutputRender
{
    /**
     * Process Output Render
     *
     * @param string $value
     * @param array $params
     * @return string
     */
    public function process($value, array $params = [])
    {
        $inputProperties = $this->tv->get('input_properties');

        $inputFormat = $inputProperties['format'] ?? 'hex';
        $inputAlpha = isset($inputProperties['alpha']) && $inputProperties['alpha'] == 'true';

        $outputFormat = $params['color_format'] ?? 'hex';
        $outputAlpha = isset($params['color_alpha']) && ($params['color_alpha'] == 'true' || $params['color_alpha'] == true);
        $outputType = isset($params['color_alpha']) && ($params['color_output'] == 'json') ? 'json' : 'css';

        $output = $value;
        if ($value) {
            if ($inputFormat === 'mixed') {
                try {
                    $color = Factory::init($value);
                } catch (AmbiguousColorString $e) {
                    $this->modx->log(xPDO::LOG_LEVEL_ERROR, 'Ambiguous Color Format: ' . $value, $e->getMessage());
                    $color = false;
                }
            } else {
                $inputClass = 'OzdemirBurak\Iris\Color\\' . ucfirst($inputFormat) . ($inputAlpha ? 'a' : '');
                try {
                    $color = new $inputClass($value);
                } catch (AmbiguousColorString $e) {
                    $this->modx->log(xPDO::LOG_LEVEL_ERROR, 'Ambiguous Color Format: ' . $value, $e->getMessage());
                    $color = false;
                }
            }

            if ($color) {
                $outputMethod = 'to' . ucfirst($outputFormat) . ($outputAlpha ? 'a' : '');
                if ($outputType !== 'json') {
                    $output = (string)$color->$outputMethod();
                } else {
                    $output = $color->$outputMethod();
                    $output = json_encode($output->values());
                }
            }
        }
        return $output;
    }
}

return 'ColorPickerOutputRender';
