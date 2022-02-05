<input id="tv{$tv->id}" type="text"
       value="{$tv->value}" name="tv{$tv->id}"
       onblur="MODx.fireResourceFormChange();"/>
<script type="text/javascript">
    // <![CDATA[{literal}
    Ext.onReady(function () {
        MODx.load({{/literal}
            xtype: 'textfield',
            applyTo: 'tv{$tv->id}',
            name: 'tv{$tv->id}',
            value: '{$tv->value}',
            cls: 'coloris',
            width: '150',
            allowBlank: {$params.allowBlank},{literal}
            listeners: {
                change: {
                    fn: MODx.fireResourceFormChange,
                    scope: this
                },
                afterrender: function () {
                    Coloris({{/literal}
                        el: '.coloris',
                        wrap: true,
                        theme: 'modx' + ColorPicker.config.modxversion,
                        themeMode: 'light',
                        margin: 5,
                        format: '{$params.format}',
                        formatToggle: false,
                        alpha: {$params.alpha},
                        swatchesOnly: {$params.swatchesOnly}{literal},
                        focusInput: true,
                        clearButton: {
                            show: {/literal}{$params.allowBlank}{literal},
                            label: _('delete')
                        },
                        swatches: {/literal}{$params.swatches}{literal}
                    });
                }
            }
        });
    });{/literal}
    // ]]>
</script>
