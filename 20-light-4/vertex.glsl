precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 lightPosition;

varying vec3 vert_position;
varying vec3 vert_normal;
varying vec3 vert_lightDirection;

void main() {
  vec4 viewPosition = view * model * vec4(position, 1.0);
  vec4 viewNormal = vec4(normal, 0.0) * inverseModel * inverseView;
  vec4 viewLight = view * vec4(lightPosition, 1.0);

  gl_Position = projection * viewPosition;

  vert_position = viewPosition.xyz;
  vert_normal = viewNormal.xyz;
  vert_lightDirection = viewLight.xyz - viewPosition.xyz;
}
