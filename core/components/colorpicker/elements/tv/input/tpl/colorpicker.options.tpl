<div id="tv-input-properties-form{$tv}"></div>
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
        autoHeight: true,
        cls: 'form-with-labels',
        border: false,
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
        }, {
            cls: "treehillstudio_about",
            html: '<img width="133" height="40" src="' + ColorPicker.config.assetsUrl + 'images/treehill-studio-small.png"' + ' srcset="' + ColorPicker.config.assetsUrl + 'images/treehill-studio-small@2x.png 2x" alt="Treehill Studio">',
            listeners: {
                afterrender: function (component) {
                    component.getEl().select('img').on('click', function () {
                        var msg = '<span style="display: inline-block; text-align: center;">&copy; 2011-2017 by Benjamin Vauchel <a href="https://github.com/benjamin-vauchel" target="_blank">github.com/benjamin-vauchel</a><br>' +
                                '<img src="' + ColorPicker.config.assetsUrl + 'images/treehill-studio.png" srcset="' + ColorPicker.config.assetsUrl + 'images/treehill-studio@2x.png 2x" alt="Treehill Studio" style="margin-top: 10px"><br>' +
                                '&copy; 2017-2020 by <a href="https://treehillstudio.com" target="_blank">treehillstudio.com</a></span>';
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
        renderTo: 'tv-input-properties-form{/literal}{$tv}{literal}'
    });
    // ]]>
</script>
{/literal}
