precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 diffuse;
uniform vec3 lightDirection;
uniform float numBands;

varying vec3 vert_normal;

void main() {
  vec4 world_position = model * vec4(position, 1.0);
  vec4 world_normal = vec4(normal, 0.0) * inverseModel;

  gl_Position = projection * view * world_position;

  vert_normal = world_normal.xyz;
}
