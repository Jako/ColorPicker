<?php
/**
 * ColorPicker Output Options Render
 *
 * @package colorpicker
 * @subpackage outputoptions_render
 */

/** @var modX $modx */
$corePath = $modx->getOption('colorpicker.core_path', null, $modx->getOption('core_path') . 'components/colorpicker/');

return $modx->smarty->fetch($corePath . 'elements/tv/output/tpl/colorpicker.options.tpl');
