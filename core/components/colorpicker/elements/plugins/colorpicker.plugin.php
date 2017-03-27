<?php
/**
 * Colorpicker runtime hooks
 * Registers custom TV input & output types and includes javascripts on document
 * edit pages so that the TV can be used from within other extras (i.e. MIGX,
 * Collections)
 *
 * @package colorpicker
 * @subpackage plugin
 *
 * @event OnManagerPageBeforeRender
 * @event OnTVInputRenderList
 * @event OnTVOutputRenderList
 * @event OnTVInputPropertiesList
 * @event OnTVOutputRenderPropertiesList
 * @event OnDocFormRender
 *
 * @var modX $modx
 */

$corePath = $modx->getOption('colorpicker.core_path', null, $modx->getOption('core_path') . 'components/colorpicker/');
$colorpicker = $modx->getService('colorpicker', 'Colorpicker', $corePath . 'model/colorpicker/', array(
    'core_path' => $corePath
));

switch ($modx->event->name) {
    case 'OnManagerPageBeforeRender':
        $modx->controller->addLexiconTopic('colorpicker:default');
        $colorpicker->includeScriptAssets();
        break;
    case 'OnTVInputRenderList':
        $modx->event->output($corePath . 'elements/tv/input/');
        break;
    case 'OnTVOutputRenderList':
        $modx->event->output($corePath . 'elements/tv/output/');
        break;
    case 'OnTVInputPropertiesList':
        $modx->event->output($corePath . 'elements/tv/input/options/');
        break;
    case 'OnTVOutputRenderPropertiesList':
        $modx->event->output($corePath . 'elements/tv/output/options/');
        break;
    case 'OnDocFormRender':
        $colorpicker->includeScriptAssets();
        break;
};
