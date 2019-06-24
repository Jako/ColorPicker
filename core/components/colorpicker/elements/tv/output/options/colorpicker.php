<?php
/**
 * Colorpicker Input Options Render
 *
 * @package colorpicker
 * @subpackage output properties
 *
 * @var modX $modx
 */

$corePath = $modx->getOption('colorpicker.core_path', null, $modx->getOption('core_path') . 'components/colorpicker/');

return $modx->smarty->fetch($corePath . 'elements/tv/output/tpl/colorpicker.options.tpl');
