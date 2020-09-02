precision mediump float;

attribute vec3 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 vert_normal;
varying vec3 vert_position;

void main() {
  vert_normal = vec3(view * inverseModel * vec4(normal, 0.0));
  vert_position = vec3(view * model * vec4(position, 1.0));
  gl_Position = projection * view * model * vec4(position, 1.0);
}
