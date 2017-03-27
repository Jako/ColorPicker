/**
 * Colorpicker Custom Manager Page Script
 *
 * @package colorpicker
 * @subpackage script
 */

var colorpicker = function (config) {
    config = config || {};
    colorpicker.superclass.constructor.call(this, config);
};

Ext.extend(colorpicker, Ext.Component, {
    page: {}, window: {}, grid: {}, tree: {}, panel: {}, combo: {}, config: {}, jquery: {}, form: {}
});
Ext.reg('colorpicker', colorpicker);

Colorpicker = new colorpicker();
