<?php
/**
 * Get list processor for Colorpicker
 *
 * @package colorpicker
 * @subpackage processor
 */

class ColorpickerTVsGetListProcessor extends modObjectGetListProcessor
{
    public $classKey = 'modTemplateVar';
    public $languageTopics = array('colorpicker:default');
    public $defaultSortField = 'name';
    public $defaultSortDirection = 'ASC';
    public $objectType = 'modTemplateVar';
}

return 'ColorpickerTVsGetListProcessor';
