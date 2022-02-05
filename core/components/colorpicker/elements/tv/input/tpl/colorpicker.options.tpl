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
    MODx.load({
        xtype: 'panel',
        layout: 'form',
        applyTo: 'modx-input-props',
        cls: 'colorpicker-props',
        border: false,
        labelAlign: 'top',
        listeners: {
            afterrender: function (component) {
                Ext.getCmp('modx-panel-tv-input-properties').addListener('resize', function () {
                    component.setWidth(Ext.getCmp('modx-input-props').getWidth()).doLayout();
                });
                Ext.getCmp('modx-tv-tabs').addListener('tabchange', function () {
                    component.setWidth(Ext.getCmp('modx-input-props').getWidth()).doLayout();
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
                    xtype: 'combo-boolean',
                    fieldLabel: _('required'),
                    description: MODx.expandHelp ? '' : _('required_desc'),
                    name: 'inopt_allowBlank',
                    hiddenName: 'inopt_allowBlank',
                    id: 'inopt_allowBlank{/literal}{$tv}{literal}',
                    value: !(params['allowBlank'] === 0 || params['allowBlank'] === 'false'),
                    anchor: '100%',
                    listeners: oc
                }, {
                    xtype: MODx.expandHelp ? 'label' : 'hidden',
                    forId: 'inopt_allowBlank{/literal}{$tv}{literal}',
                    html: _('required_desc'),
                    cls: 'desc-under'
                }]
            }, {
                columnWidth: .5,
                layout: 'form',
                labelAlign: 'top',
                items: [{
                    xtype: 'combo',
                    fieldLabel: _('colorpicker.format'),
                    description: MODx.expandHelp ? '' : _('colorpicker.format_desc'),
                    name: 'inopt_format',
                    hiddenName: 'inopt_format',
                    id: 'inopt_format{/literal}{$tv}{literal}',
                    store: new Ext.data.SimpleStore({
                        fields: ['v', 'd'],
                        data: [
                            ['hex', _('colorpicker.format_hex')],
                            ['rgb', _('colorpicker.format_rgb')],
                            ['hsl', _('colorpicker.format_hsl')],
                            ['mixed', _('colorpicker.format_mixed')]
                        ]
                    }),
                    displayField: 'd',
                    valueField: 'v',
                    mode: 'local',
                    editable: false,
                    forceSelection: true,
                    typeAhead: false,
                    triggerAction: 'all',
                    value: params['format'] || 'hex',
                    anchor: '100%',
                    listeners: oc
                }, {
                    xtype: MODx.expandHelp ? 'label' : 'hidden',
                    forId: 'inopt_format{/literal}{$tv}{literal}',
                    html: _('colorpicker.format_desc'),
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
                    xtype: 'combo-boolean',
                    fieldLabel: _('colorpicker.alpha'),
                    description: MODx.expandHelp ? '' : _('colorpicker.alpha_desc'),
                    name: 'inopt_alpha',
                    hiddenName: 'inopt_alpha',
                    id: 'inopt_alpha{/literal}{$tv}{literal}',
                    value: (params['alpha'] === 1 || params['alpha'] === 'true'),
                    anchor: '100%',
                    listeners: oc
                }, {
                    xtype: MODx.expandHelp ? 'label' : 'hidden',
                    forId: 'inopt_alpha{/literal}{$tv}{literal}',
                    html: _('colorpicker.alpha_desc'),
                    cls: 'desc-under'
                }]
            }, {
                columnWidth: .5,
                layout: 'form',
                labelAlign: 'top',
                items: [{
                    xtype: 'combo-boolean',
                    fieldLabel: _('colorpicker.swatchesOnly'),
                    description: MODx.expandHelp ? '' : _('colorpicker.swatchesOnly_desc'),
                    name: 'inopt_swatchesOnly',
                    hiddenName: 'inopt_swatchesOnly',
                    id: 'inopt_swatchesOnly{/literal}{$tv}{literal}',
                    value: (params['swatchesOnly'] === 1 || params['swatchesOnly'] === 'true'),
                    anchor: '100%',
                    listeners: oc
                }, {
                    xtype: MODx.expandHelp ? 'label' : 'hidden',
                    forId: 'inopt_swatchesOnly{/literal}{$tv}{literal}',
                    html: _('colorpicker.swatchesOnly_desc'),
                    cls: 'desc-under'
                }]
            }]
        }, {
            xtype: 'textfield',
            fieldLabel: _('colorpicker.swatches'),
            description: MODx.expandHelp ? '' : _('colorpicker.swatches_desc'),
            name: 'inopt_swatches',
            id: 'inopt_swatches{/literal}{$tv}{literal}',
            value: params['swatches'],
            anchor: '100%',
            listeners: oc
        }, {
            xtype: MODx.expandHelp ? 'label' : 'hidden',
            forId: 'inopt_swatches{/literal}{$tv}{literal}',
            html: _('colorpicker.swatches_desc'),
            cls: 'desc-under'
        },{
            cls: "treehillstudio_about",
            html: '<img width="146" height="40" src="' + ColorPicker.config.assetsUrl + 'img/treehill-studio-small.png"' + ' srcset="' + ColorPicker.config.assetsUrl + 'img/treehill-studio-small@2x.png 2x" alt="Treehill Studio">',
            listeners: {
                afterrender: function (component) {
                    component.getEl().select('img').on('click', function () {
                        var msg = '<span style="display: inline-block; text-align: center;">&copy; 2011-2017 by Benjamin Vauchel <a href="https://github.com/benjamin-vauchel" target="_blank">github.com/benjamin-vauchel</a><br>' +
                            '<img src="' + ColorPicker.config.assetsUrl + 'images/treehill-studio.png" srcset="' + ColorPicker.config.assetsUrl + 'images/treehill-studio@2x.png 2x" alt="Treehill Studio" style="margin-top: 10px"><br>' +
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
