precision mediump float;

uniform mat4 model, view, projection;
uniform vec3 ambient;

void main() {
  vec3 color = ambient;

  gl_FragColor = vec4(ambient,1);
}
