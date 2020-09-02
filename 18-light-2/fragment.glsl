precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 lightDirection;

varying vec3 vert_normal;

float lambertWeight(in vec3 n, in vec3 d) {
  return max(dot(n, d), 0.0);
}

vec3 reflectLight(in vec3 normal, in vec3 lightDirection,
                  in vec3 ambient, in vec3 diffuse) {
  float lW = lambertWeight(normal, lightDirection);
  return ambient + diffuse * lW;
}

void main() {
  vec3 color;
  color = reflectLight(normalize(vert_normal), lightDirection, ambient, diffuse);
  gl_FragColor = vec4(color, 1);
}
