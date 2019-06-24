<?php
/**
 * Colorpicker Output Render
 *
 * @package colorpicker
 * @subpackage output render
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
    public function process($value, array $params = array())
    {
        $output = '';
        $hex = $this->tv->parseInput($value);

        // We check the hexadecimal value
        if (strpos($hex, '#') === 0) {
            $hex = substr($hex, 1);
        }

        if (strlen($hex) == 3) {
            $hex = $hex[0] . $hex[0] . $hex[1] . $hex[1] . $hex[2] . $hex[2];
        }

        if (strlen($hex) == 6) {
            // Convert each tuple to decimal.
            $r = hexdec(substr($hex, 0, 2));
            $g = hexdec(substr($hex, 2, 2));
            $b = hexdec(substr($hex, 4, 2));

            switch ($params['color_format']) {
                case 'hex':
                    if ($params['color_output'] == 'json') {
                        $output = json_encode(array(substr($hex, 0, 2), substr($hex, 2, 2), substr($hex, 4, 2)));
                    } else {
                        $output = '#' . $hex;
                    }
                    break;
                case 'rgb':
                    if ($params['color_output'] == 'json') {
                        $output = json_encode(array($r, $g, $b));
                    } else {
                        $output = 'rgb(' . $r . ',' . $g . ',' . $b . ')';
                    }
                    break;
                case 'hsl':
                    // Where RGB values = 0 - 255.
                    $r = $r / 255;
                    $g = $g / 255;
                    $b = $b / 255;

                    // Min. value of RGB
                    $min = min($r, $g, $b);
                    // Max. value of RGB
                    $max = max($r, $g, $b);
                    // Delta RGB value
                    $delta = $max - $min;

                    $l = ($max + $min) / 2;

                    if ($delta == 0) {
                        // This is a gray, no chroma...
                        // HSL results = 0 - 1
                        $h = 0;
                        $s = 0;
                    } else {
                        // Chromatic data...
                        if ($l < 0.5) {
                            $s = $delta / ($max + $min);
                        } else {
                            $s = $delta / (2 - $max - $min);
                        }

                        $del_R = ((($max - $r) / 6) + ($delta / 2)) / $delta;
                        $del_G = ((($max - $g) / 6) + ($delta / 2)) / $delta;
                        $del_B = ((($max - $b) / 6) + ($delta / 2)) / $delta;

                        $h = 0;
                        if ($r == $max) {
                            $h = $del_B - $del_G;
                        } else {
                            if ($g == $max) {
                                $h = (1 / 3) + $del_R - $del_B;
                            } else {
                                if ($b == $max) {
                                    $h = (2 / 3) + $del_G - $del_R;
                                }
                            }
                        }

                        if ($h < 0) {
                            $h += 1;
                        }
                        if ($h > 1) {
                            $h -= 1;
                        }
                    }

                    if ($params['color_output'] == 'json') {
                        $output = json_encode(array($h, $s, $l));
                    } else {
                        $output = 'hsl(' . $h . ',' . $s . ',' . $l . ')';
                    }
                    break;

            }
        }


        if (empty($output) && $params['color_output'] == 'json') {
            $output = '{}';
        }

        return $output;
    }
}

return 'ColorPickerOutputRender';
