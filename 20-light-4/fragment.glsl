precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 specular;

uniform vec3 lightPosition;

uniform float shininess;

varying vec3 vert_position;
varying vec3 vert_normal;
varying vec3 vert_lightDirection;

float phong(vec3 lightDirection,
            vec3 surfaceNormal,
            vec3 eyeDirection,
            float shininess) {
  vec3 lightReflection = reflect(lightDirection, surfaceNormal);
  float light = max(dot(lightReflection, eyeDirection), 0.0);
  return pow(light, shininess);
}

float lambert(in vec3 n, in vec3 d) {
  return max(dot(n, d), 0.0);
}

void main() {
  vec3 eyeDirection = normalize(vert_position);
  vec3 normal = normalize(vert_normal);
  vec3 lightDirection = normalize(vert_lightDirection);

  float lW = lambert(normal, lightDirection);
  float pW = phong(lightDirection, normal, eyeDirection, shininess);

  vec3 color = ambient
    + lW * diffuse
    + pW * specular;
  gl_FragColor = vec4(color, 1);
}
