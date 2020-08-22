precision mediump float;

void main() {
  vec2 coord = gl_FragCoord.xy;
  float dx = 1.0 - step(0.5, fract((0.5 * coord.x) / 16.0));
  float dy = 1.0 - step(0.5, fract((0.5 * (coord.y + 16.0)) / 16.0));
  if (((dy - dx) * (dy - dx)) < 1.0) {
    discard;
  }
  gl_FragColor = vec4(1.0);
}
