<input id="tv{$tv->id}" type="text" value="{$tv->value}" name="tv{$tv->id}" onblur="MODx.fireResourceFormChange();"/>
<script type="text/javascript">
    // <![CDATA[{literal}
    Ext.onReady(function () {
        MODx.load({{/literal}
            xtype: 'textfield',
            applyTo: 'tv{$tv->id}',
            name: 'tv{$tv->id}',
            value: '{$tv->value}',
            cls: 'coloris tv{$tv->id}',
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
                        formatToggle: false,
                        focusInput: true{literal}
                    });
                    document.getElementById('{/literal}tv{$tv->id}{literal}').addEventListener('click', e => {
                        Coloris({{/literal}
                            format: '{$params.format}',
                            alpha: {$params.alpha},
                            swatchesOnly: {$params.swatchesOnly},
                            swatches: {$params.swatches},{literal}
                            clearButton: {
                                show: {/literal}{$params.allowBlank}{literal},
                                label: _('delete')
                            },
                        });
                    });
                }
            }
        });
    });{/literal}
    // ]]>
</script>
