<?php

/**
 * Get list of Template Variables
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