precision mediump float;

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

float lambertWeight(vec3 normal, vec3 light_direction) {
  return max(dot(normal, light_direction), 0.0);
}

void main() {
  vec3 light_direction = normalize(lightDirection);
  vec3 normal = normalize(vert_normal);

  vec3 color = vec3(0.0);
  float lW = lambertWeight(normal, light_direction);
  float celIntensity = ceil(lW * numBands) / numBands;
  color = diffuse * celIntensity;
  
  gl_FragColor = vec4(color, 1);
}
