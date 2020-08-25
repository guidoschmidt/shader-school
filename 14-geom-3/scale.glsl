highp mat4 scale(highp vec3 p) {
  // Return a matrix that scales
  // each axis about the origin by a factor of p.x/p.y/p.z
  vec3 s = p;
  return mat4(s.x, 0, 0, 0,
              0, s.y, 0, 0, 
              0, 0, s.z, 0,
              0, 0, 0, 1);
}

#pragma glslify: export(scale)
