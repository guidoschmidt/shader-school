precision highp float;

uniform sampler2D texture;
uniform vec2 screenSize;

void main() {
  vec2 coord = gl_FragCoord.xy / screenSize;

  vec4 color = texture2D(texture, coord);
  float r = color.r;
  color.r = color.b;
  color.b = r;

  gl_FragColor = color;
}
