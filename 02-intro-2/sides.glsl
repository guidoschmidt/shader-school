void sideLengths(
  in highp float hypotenuse, 
  in highp float angleInDegrees, 
  out highp float opposite, 
  out highp float adjacent) {

  //TODO: Calculate side lengths here
  float pi = 3.141519;
  float angleInRadians = angleInDegrees * pi/180.0;
  adjacent = cos(angleInRadians) * hypotenuse;
  opposite = sin(angleInRadians) * hypotenuse;
}

//Do not change this line
#pragma glslify: export(sideLengths)
