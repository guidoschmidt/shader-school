precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;

uniform PointLight lights[4];

varying vec3 vert_position;
varying vec3 vert_normal;
varying vec3 vert_lightPositions[4];

void main() {
  vec4 viewPosition = view * model * vec4(position, 1);
  vec4 viewNormal = vec4(normal, 0) * inverseModel * inverseView;

  gl_Position = projection * viewPosition;

  vert_position = viewPosition.xyz;
  vert_normal = viewNormal.xyz;

  for (int i = 0; i < 4; i++) {
    vec3 viewLight = vec3(view * vec4(lights[i].position, 1.0));
    vert_lightPositions[i] = viewLight - vert_position;
  }
}
