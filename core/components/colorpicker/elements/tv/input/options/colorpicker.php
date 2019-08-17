<?php
/**
 * ColorPicker Input Properties
 *
 * @package colorpicker
 * @subpackage input properties
 *
 * @var modX $modx
 */

$corePath = $modx->getOption('colorpicker.core_path', null, $modx->getOption('core_path') . 'components/colorpicker/');
/** @var ColorPicker $colorpicker */
$colorpicker = $modx->getService('colorpicker', 'ColorPicker', $corePath . 'model/colorpicker/', array(
    'core_path' => $corePath
));

$selectConfig = json_decode($colorpicker->getOption('select_config'), true);
$forceConfig = $colorpicker->getOption('force_config', false);

if ($selectConfig) {
    $modx->smarty->assign('selectconfig', json_encode($selectConfig));
    $modx->smarty->assign('forceconfig', intval($forceConfig));
    $modx->smarty->assign('hide', 0);
} else {
    $modx->smarty->assign('selectconfig', '[]');
    $modx->smarty->assign('forceconfig', 0);
    $modx->smarty->assign('hide', 1);
}
return $modx->smarty->fetch($corePath . 'elements/tv/input/tpl/colorpicker.options.tpl');
