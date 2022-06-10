<script type="text/javascript">
    // <![CDATA[{literal}
    var params = {
        {/literal}{foreach from=$params key=k item=v name='p'}
        '{$k}': '{$v|escape:"javascript"}'{if NOT $smarty.foreach.p.last}, {/if}
        {/foreach}{literal}
    };
    var oc = {
        change: {
            fn: function () {
                Ext.getCmp('modx-panel-tv').markDirty();
            }, scope: this
        }
    };
    var tvelements = Ext.getCmp('modx-tv-elements');
    if (tvelements) {
        tvelements.hide();
        if (MODx.expandHelp) {
            tvelements.nextSibling('.desc-under').hide();
        }
    }
    MODx.load({
        xtype: 'panel',
        layout: 'form',
        applyTo: 'modx-widget-props',
        cls: 'colorpicker-props',
        border: false,
        labelAlign: 'top',
        listeners: {
            afterrender: function (component) {
                var tvTabId = (ColorPicker.config.modxversion === '2') ? 'modx-tv-tabs' : 'modx-tv-editor-tabs';
                Ext.getCmp('modx-panel-tv-output-properties').addListener('resize', function () {
                    component.setWidth(Ext.getCmp('modx-widget-props').getWidth()).doLayout();
                });
                Ext.getCmp(tvTabId).addListener('tabchange', function () {
                    component.setWidth(Ext.getCmp('modx-widget-props').getWidth()).doLayout();
                });
            },
        },
        items: [{
            layout: 'column',
            items: [{
                columnWidth: .5,
                layout: 'form',
                labelAlign: 'top',
                items: [{
                    xtype: 'combo',
                    fieldLabel: _('colorpicker.output_format'),
                    description: MODx.expandHelp ? '' : _('colorpicker.output_format_desc'),
                    name: 'prop_color_format',
                    hiddenName: 'prop_color_format',
                    id: 'prop_color_format{/literal}{$tv}{literal}',
                    store: new Ext.data.SimpleStore({
                        fields: ['v', 'd'],
                        data: [
                            ['hex', _('colorpicker.format_hex')],
                            ['rgb', _('colorpicker.format_rgb')],
                            ['hsl', _('colorpicker.format_hsl')]
                        ]
                    }),
                    displayField: 'd',
                    valueField: 'v',
                    mode: 'local',
                    editable: false,
                    forceSelection: true,
                    typeAhead: false,
                    triggerAction: 'all',
                    value: params['color_format'] || 'hex',
                    anchor: '100%',
                    listeners: oc
                }, {
                    xtype: MODx.expandHelp ? 'label' : 'hidden',
                    forId: 'prop_color_format{/literal}{$tv}{literal}',
                    html: _('colorpicker.output_format_desc'),
                    cls: 'desc-under'
                }]
            }, {
                columnWidth: .5,
                layout: 'form',
                labelAlign: 'top',
                items: [{
                    xtype: 'combo-boolean',
                    fieldLabel: _('colorpicker.output_alpha'),
                    description: MODx.expandHelp ? '' : _('colorpicker.output_alpha_desc'),
                    name: 'prop_color_alpha',
                    hiddenName: 'prop_color_alpha',
                    id: 'prop_color_alpha{/literal}{$tv}{literal}',
                    value: (params['color_alpha'] === 1 || params['color_alpha'] === 'true'),
                    anchor: '100%',
                    listeners: oc
                }, {
                    xtype: MODx.expandHelp ? 'label' : 'hidden',
                    forId: 'prop_color_alpha{/literal}{$tv}{literal}',
                    html: _('colorpicker.output_alpha_desc'),
                    cls: 'desc-under'
                }]
            }]
        }, {
            layout: 'column',
            items: [{
                columnWidth: .5,
                layout: 'form',
                labelAlign: 'top',
                items: [{
                    xtype: 'combo',
                    fieldLabel: _('colorpicker.output_type'),
                    description: MODx.expandHelp ? '' : _('colorpicker.output_type_desc'),
                    name: 'prop_color_output',
                    hiddenName: 'prop_color_output',
                    id: 'prop_color_output{/literal}{$tv}{literal}',
                    store: new Ext.data.SimpleStore({
                        fields: ['v', 'd'],
                        data: [
                            ['css', _('colorpicker.output_type_css')],
                            ['json', _('colorpicker.output_type_json')]
                        ]
                    }),
                    displayField: 'd',
                    valueField: 'v',
                    mode: 'local',
                    editable: false,
                    forceSelection: true,
                    typeAhead: false,
                    triggerAction: 'all',
                    value: params['color_output'] || 'css',
                    anchor: '100%',
                    listeners: oc
                }, {
                    xtype: MODx.expandHelp ? 'label' : 'hidden',
                    forId: 'prop_color_output{/literal}{$tv}{literal}',
                    html: _('colorpicker.output_type_desc'),
                    cls: 'desc-under'
                }]
            },{
                columnWidth: .5,
                layout: 'form',
                labelAlign: 'top',
                items: [{
                    xtype: 'combo-boolean',
                    fieldLabel: _('colorpicker.output_strip'),
                    description: MODx.expandHelp ? '' : _('colorpicker.output_strip_desc'),
                    name: 'prop_color_strip',
                    hiddenName: 'prop_color_strip',
                    id: 'prop_color_strip{/literal}{$tv}{literal}',
                    value: (params['color_strip'] === 1 || params['color_strip'] === 'true'),
                    anchor: '100%',
                    listeners: oc
                }, {
                    xtype: MODx.expandHelp ? 'label' : 'hidden',
                    forId: 'prop_color_strip{/literal}{$tv}{literal}',
                    html: _('colorpicker.output_strip_desc'),
                    cls: 'desc-under'
                }]
            }]
        }, {
            cls: "treehillstudio_about",
            html: '<img width="146" height="40" src="' + ColorPicker.config.assetsUrl + 'img/treehill-studio-small.png"' + ' srcset="' + ColorPicker.config.assetsUrl + 'img/treehill-studio-small@2x.png 2x" alt="Treehill Studio">',
            listeners: {
                afterrender: function (component) {
                    component.getEl().select('img').on('click', function () {
                        var msg = '<span style="display: inline-block; text-align: center">&copy; 2011-2017 by Benjamin Vauchel <a href="https://github.com/benjamin-vauchel" target="_blank">github.com/benjamin-vauchel</a><br>' +
                                '<img src="' + ColorPicker.config.assetsUrl + 'img/treehill-studio.png" srcset="' + ColorPicker.config.assetsUrl + 'img/treehill-studio@2x.png 2x" alt="Treehill Studio" style="margin-top: 10px"><br>' +
                                '&copy; 2017-2022 by <a href="https://treehillstudio.com" target="_blank">treehillstudio.com</a></span>';
                        Ext.Msg.show({
                            title: _('colorpicker') + ' ' + ColorPicker.config.version,
                            msg: msg,
                            buttons: Ext.Msg.OK,
                            cls: 'treehillstudio_window',
                            width: 358
                        });
                    });
                }
            }
        }]
    });
    MODx.helpUrl = 'https://jako.github.io/ColorPicker/usage/';
    // ]]>
</script>
{/literal}
