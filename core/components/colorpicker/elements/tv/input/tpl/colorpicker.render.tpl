<input id="tv{$tv->id}" type="text"
       value="{$tv->value}" name="tv{$tv->id}"
       onblur="MODx.fireResourceFormChange();"/>
<script type="text/javascript">
    // <![CDATA[{literal}
    Ext.onReady(function () {
        new Ext.ux.form.ColorPickerField({{/literal}
            applyTo: 'tv{$tv->id}',
            name: 'tv{$tv->id}',
            value: '{$tv->value}',
            width: '100',
            allowBlank: {if $params.allowBlank == 1 || $params.allowBlank == 'true'}true{else}false{/if},
            listeners: {
                change: {
                    fn: MODx.fireResourceFormChange,
                    scope: this
                }
            }
        });
    });{/literal}
    // ]]>
</script>
