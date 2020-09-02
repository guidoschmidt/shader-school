precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 vert_position;
varying vec3 vert_normal;

float phongWeight(vec3 lightDirection,
                  vec3 surfaceNormal,
                  vec3 eyeDirection,
                  float shininess) {
  vec3 rlight = reflect(lightDirection, surfaceNormal);
  float eyeLight = max(dot(rlight, eyeDirection), 0.0);
  return pow(eyeLight, shininess);
}

float lambertWeight(in vec3 n, in vec3 d) {
  return max(dot(n, d), 0.0);
}

void main() {
  vec3 color = vec3(0.0);
  vec3 view_dir = normalize(vert_position);
  float pW = phongWeight(normalize(lightDirection),
                         normalize(vert_normal),
                         view_dir,
                         shininess);
  float lW = lambertWeight(normalize(vert_normal),
                           lightDirection);
  color = ambient + diffuse * lW + specular * pW;
  gl_FragColor = vec4(color, 1);
}
