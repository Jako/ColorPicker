## Output Options

The following output options could be set in template variable settings if the
output type is set to `ColorPicker`. Another possibility is to
assign the settings as properties to the MODX tag[^1].

Setting | Description | Default
------- | ----------- | -------
Format | CSS color format | Hexadecimal
Output | Output type[^2]. | CSS

[^1]: The colorpicker template tariable could be formatted in template or template chunks with the following tag syntax: ```[[*tvname? &color_format=`hex` &color_output=`css`]]```
[^2]: Examples of CSS output: `#FFFFFF` or `rgb(255,255,255)` or `hsl(1,1,1)`. Examples of JSON output: `{"FF","FF","FF"}` or `{255,255,255}` or `{1,1,1}`.
