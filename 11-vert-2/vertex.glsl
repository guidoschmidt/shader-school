precision highp float;

attribute vec4 position;
attribute vec3 color;

varying vec3 vs_color;

void main() {
  vs_color = color;
  gl_Position = position;
}
