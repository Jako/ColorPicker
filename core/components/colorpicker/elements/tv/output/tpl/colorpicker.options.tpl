<div id="tv-output-properties-form{$tv}"></div>
<script type="text/javascript">
    // <![CDATA[
    {literal}
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
            labelStyle: 'padding-top: 0',
            anchor: '100%',
            listeners: oc
        }, {
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
        }],
        renderTo: 'tv-output-properties-form{/literal}{$tv}{literal}'
    });
    // ]]>
</script>
{/literal}
