precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

float state(vec2 coord) {
  return texture2D(prevState, fract(coord / stateSize)).r;
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  float cell_state = state(coord);

  vec2 neighbor_coords[8];
  // ┌ ─ ┐┌ ─ ┐┌ ─ ┐
  //   5    6    7 
  // └ ─ ┘└ ─ ┘└ ─ ┘
  // ┌ ─ ┐┌ ─ ┐┌ ─ ┐
  //   3    X    4 
  // └ ─ ┘└ ─ ┘└ ─ ┘
  // ┌ ─ ┐┌ ─ ┐┌ ─ ┐
  //   0    1    2 
  // └ ─ ┘└ ─ ┘└ ─ ┘
  // bottom row
  neighbor_coords[0] = vec2(-1.0, -1.0);
  neighbor_coords[1] = vec2( 0.0, -1.0);
  neighbor_coords[2] = vec2(+1.0, -1.0);
  // center row
  neighbor_coords[3] = vec2(-1.0,  0.0);
  neighbor_coords[4] = vec2(+1.0,  0.0);
  // top row
  neighbor_coords[5] = vec2(-1.0, +1.0);
  neighbor_coords[6] = vec2( 0.0, +1.0);
  neighbor_coords[7] = vec2(+1.0, +1.0);

  float living_neighbors = 0.0;
  for (int i = 0; i < 8; i++) {
    vec2 offset = neighbor_coords[i];
    float neighbor_lives = state(coord + offset);
    living_neighbors += neighbor_lives;
  }

  float s = state(coord);
  if ((s == 0.0 && living_neighbors == 3.0) ||
      (s == 1.0 && living_neighbors >= 2.0 && living_neighbors <= 3.0)) {
    s = 1.0;
  } else {
    s = 0.0;
  }

  gl_FragColor = vec4(s, s, s, 1.0);
}
