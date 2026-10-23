uniform float opacity;

void windowShader(inout vec4 color) {
	color *= opacity;
}
