uniform vec2 offset;
uniform float opacity;

void windowShader(inout vec4 color) { 
	color.a += texture(x_Tex, x_TexCoord - offset).a * opacity;
}
