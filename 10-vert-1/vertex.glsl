precision highp float;

uniform float theta;

attribute vec2 position;

void main() {

  //TODO: rotate position by theta radians about the origin
  float a = -theta;
  mat2 rotation = mat2(cos(a), -sin(a),
                       sin(a),  cos(a));
  vec2 rotated_position = rotation * position;
  gl_Position = vec4(rotated_position, 0, 1.0);
}
