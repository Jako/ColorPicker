<script type="text/javascript">
    // <![CDATA[{literal}
    var params = {
        {/literal}{foreach from=$params key=k item=v name='p'}
        '{$k}': '{$v|escape:"javascript"}'{if NOT $smarty.foreach.p.last}, {/if}
        {/foreach}{literal}
    };
    var oc = {
        'change': {
            fn: function () {
                Ext.getCmp('modx-panel-tv').markDirty();
            }, scope: this
        }
    };
    MODx.load({
        xtype: 'panel',
        layout: 'form',
        applyTo: 'modx-widget-props',
        border: false,
        labelAlign: 'top',
        listeners: {
            afterrender: function (component) {
                Ext.getCmp('modx-panel-tv-input-properties').addListener('resize', function () {
                    component.setWidth(Ext.getCmp('modx-widget-props').getWidth()).doLayout();
                });
            }
        },
        items: [{
            layout: 'column',
            items: [{
                columnWidth: .5,
                layout: 'form',
                labelAlign: 'top',
                items: [{
                    xtype: 'combo',
                    fieldLabel: _('colorpicker.format'),
                    description: MODx.expandHelp ? '' : _('colorpicker.format_desc'),
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
                    html: _('colorpicker.format_desc'),
                    cls: 'desc-under'
                }]
            }, {
                columnWidth: .5,
                layout: 'form',
                labelAlign: 'top',
                items: [{
                    xtype: 'combo',
                    fieldLabel: _('colorpicker.output'),
                    description: MODx.expandHelp ? '' : _('colorpicker.output_desc'),
                    name: 'prop_color_output',
                    hiddenName: 'prop_color_output',
                    id: 'prop_color_output{/literal}{$tv}{literal}',
                    store: new Ext.data.SimpleStore({
                        fields: ['v', 'd'],
                        data: [
                            ['css', _('colorpicker.output_css')],
                            ['json', _('colorpicker.output_json')]
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
                    html: _('colorpicker.output_desc'),
                    cls: 'desc-under'
                }]
            }]
        }, {
            cls: "treehillstudio_about",
            html: '<img width="133" height="40" src="' + ColorPicker.config.assetsUrl + 'images/treehill-studio-small.png"' + ' srcset="' + ColorPicker.config.assetsUrl + 'images/treehill-studio-small@2x.png 2x" alt="Treehill Studio">',
            listeners: {
                afterrender: function (component) {
                    component.getEl().select('img').on('click', function () {
                        var msg = '<span style="display: inline-block; text-align: center">&copy; 2011-2017 by Benjamin Vauchel <a href="https://github.com/benjamin-vauchel" target="_blank">github.com/benjamin-vauchel</a><br>' +
                                '<img src="' + ColorPicker.config.assetsUrl + 'images/treehill-studio.png" srcset="' + ColorPicker.config.assetsUrl + 'images/treehill-studio@2x.png 2x" alt="Treehill Studio" style="margin-top: 10px"><br>' +
                                '&copy; 2017-2021 by <a href="https://treehillstudio.com" target="_blank">treehillstudio.com</a></span>';
                        Ext.Msg.show({
                            title: _('colorpicker') + ' ' + ColorPicker.config.version,
                            msg: msg,
                            buttons: Ext.Msg.OK,
                            cls: 'treehillstudio_window',
                            width: 330
                        });
                    });
                }
            }
        }],
        renderTo: 'tv-output-properties-form{/literal}{$tv}{literal}'
    });
    // ]]>
</script>
{/literal}
