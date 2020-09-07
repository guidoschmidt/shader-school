precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

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

float phong(vec3 lightDirection,
            vec3 surfaceNormal,
            vec3 eyeDirection,
            float shininess) {
  vec3 lightReflection = reflect(lightDirection, surfaceNormal);
  float light = max(dot(lightReflection, eyeDirection), 0.0);
  return pow(light, shininess);
}

float lambert(in vec3 normal, in vec3 lightDirection) {
  return max(dot(normal, lightDirection), 0.0);
}

void main() {
  vec3 color = vec3(0.0);

  vec3 eyeDirection = normalize(vert_position);
  vec3 normal = normalize(vert_normal);

  color = ambient;

  for (int i = 0; i < 4; i++) {
    float lW = lambert(normal, normalize(vert_lightPositions[i]));
    float pW = phong(normalize(vert_lightPositions[i]),
                     normal,
                     eyeDirection,
                     lights[i].shininess);
    color += lW * lights[i].diffuse + pW * lights[i].specular;
  }

  gl_FragColor = vec4(color, 1);
}
