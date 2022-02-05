## Input Options

The following input options could be set in template variable settings if the
input type is set to `ColorPicker`.

Setting | Description | Default
------- | ----------- | -------
Format | Set the preferred color string format.[^1] | Hex
Show Alpha | Enable or disable alpha support. When disabled, the alpha value is removed from the existing color value in all formats. | No
Swatches Only | Set this value to true to hide all color selection widgets (spectrum, hue, …) except the color swatches. | No
Swatches | A JSON encoded array of the desired color swatches to be displayed. If the list is empty, the swatches are disabled.[^2] | -

[^1]: Hex: outputs #RRGGBB or #RRGGBBAA. RGB: outputs rgb(R,G,B) or rgba(R,G,B,A). HSL: outputs hsl(H,S,L) or hsla(H,S,L,A). Mixed: outputs #RRGGBB when alpha is 1; otherwise rgba(R,G,B,A).
[^2]: Example: `["#264653", "#2a9d8f", "#e9c46a", "rgb(244,162,97)", "#e76f51", "#d62828", "navy", "#07b", "#0096c7", "#00b4d880", "rgba(0,119,182,0.8)"]`.

## Output Options

The following output options could be set in template variable settings if the
output type is set to `ColorPicker`. Another possibility is to
assign the settings as properties to the MODX tag[^1].

Setting | Description | Default
------- | ----------- | -------
Format | Set the preferred color string format.[^3] | Hex
Alpha | Enable or disable alpha output support. | No
Output | The output type.[^4]. | CSS

[^3]: Hex: outputs #RRGGBB or #RRGGBBAA. RGB: outputs rgb(R,G,B) or rgba(R,G,B,A). HSL: outputs hsl(H,S,L) or hsla(H,S,L,A).
[^4]: Examples for CSS output are described under Format. Example for JSON output: Hex: ["80","ff","00"] or ["80","ff","00",0.5], RGB: [128,255,0] or [128,255,0,0.5], HSL: [90,"100%","50%"] or [90,"100%","50%",0.5]