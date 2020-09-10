precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 warm;
uniform vec3 cool;
uniform vec3 lightDirection;

varying vec3 vert_normal;

float goochWeight(vec3 normal, vec3 lightDirection) {
  return clamp(0.5 * (1.0 + dot(normal, lightDirection)), 0.0, 1.0);
}

void main() {
  vec3 color = vec3(0.0);

  float gW = goochWeight(vert_normal, lightDirection);
  // lerp between cool and warm color
  // (1.0 - gW) * cool + gW * warm
  //
  // with gW between [0, 1]
  color = mix(cool, warm, gW);

  gl_FragColor = vec4(color, 1);
}
