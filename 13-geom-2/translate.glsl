highp mat4 translate(highp vec3 p) {
  // Construct a matrix, m, which translates
  // all points so that p is at the origin.
  vec3 t = vec3(0, 0, 0) - p;
  return mat4(1,   0,   0,   0,
              0,   1,   0,   0, 
              0,   0,   1,   0,
              t.x, t.y, t.z, 1);
}

//Do not remove this line
#pragma glslify: export(translate)
