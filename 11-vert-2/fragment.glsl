precision highp float;

varying vec3 vs_color;

void main() {
  gl_FragColor = vec4(vs_color, 1);
}
