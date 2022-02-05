<?php
/**
 * ColorPicker Runtime Hooks
 *
 * @package colorpicker
 * @subpackage plugin
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$className = 'TreehillStudio\ColorPicker\Plugins\Events\\' . $modx->event->name;

$corePath = $modx->getOption('colorpicker.core_path', null, $modx->getOption('core_path') . 'components/colorpicker/');
/** @var ColorPicker $colorpicker */
$colorpicker = $modx->getService('colorpicker', 'ColorPicker', $corePath . 'model/colorpicker/', [
    'core_path' => $corePath
]);

if ($colorpicker) {
    if (class_exists($className)) {
        $handler = new $className($modx, $scriptProperties);
        if (get_class($handler) == $className) {
            $handler->run();
        } else {
            $modx->log(xPDO::LOG_LEVEL_ERROR, $className. ' could not be initialized!', '', 'ColorPicker Plugin');
        }
    } else {
        $modx->log(xPDO::LOG_LEVEL_ERROR, $className. ' was not found!', '', 'ColorPicker Plugin');
    }
}

return;
