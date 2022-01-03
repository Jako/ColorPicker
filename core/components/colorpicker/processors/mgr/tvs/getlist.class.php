<?php
/**
 * Get list processor for ColorPicker
 *
 * @package colorpicker
 * @subpackage processors
 */

class ColorPickerTVsGetListProcessor extends modObjectGetListProcessor
{
    public $classKey = 'modTemplateVar';
    public $languageTopics = array('colorpicker:default');
    public $defaultSortField = 'name';
    public $defaultSortDirection = 'ASC';
    public $objectType = 'modTemplateVar';
}

return 'ColorPickerTVsGetListProcessor';
