precision highp float;

#define CIRCLE_COLOR    vec4(1.0, 0.4313, 0.3411, 1.0)
#define OUTSIDE_COLOR   vec4(0.3804, 0.7647, 1.0, 1.0)

void main() {
  vec2 coord = gl_FragCoord.xy;
  vec2 center = vec2(256.0);
  vec2 radius = vec2(128.0);

  float d = step((distance(coord - radius, radius) * 1.0 / radius.x), 1.0);

  if (d > 0.0) {
    gl_FragColor = CIRCLE_COLOR;
  } else {
    gl_FragColor = OUTSIDE_COLOR;
  }
}
