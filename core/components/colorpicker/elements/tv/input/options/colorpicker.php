<?php
/**
 * ColorPicker Input Options Render
 *
 * @package colorpicker
 * @subpackage inputoptions_render
 */

/** @var modX $modx */
$corePath = $modx->getOption('colorpicker.core_path', null, $modx->getOption('core_path') . 'components/colorpicker/');

return $modx->smarty->fetch($corePath . 'elements/tv/input/tpl/colorpicker.options.tpl');
