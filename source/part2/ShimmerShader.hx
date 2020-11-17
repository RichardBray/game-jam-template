package part2;

import flixel.system.FlxAssets.FlxShader;

class ShimmerShader extends FlxShader {
	@:glFragmentSource('
    #pragma header

    uniform float uTime;

    mat2 rotate(float angle) {
      return mat2(
        cos(angle), -sin(angle),
        sin(angle), cos(angle)
      );
    }

    float drawRect(vec2 pixelCoord, vec2 borderWidth) {
      vec2 bottomLeft = step(borderWidth, pixelCoord);
      vec2 topRight = step(borderWidth, 1.0 - pixelCoord);

      float vec2ToFloat = (bottomLeft.x * bottomLeft.y) * (topRight.x * topRight.y); 
      return vec2ToFloat;
    }

    void main() {
      vec4 color = texture2D(bitmap, openfl_TextureCoordv);
      vec2 pixelCoord = openfl_TextureCoordv;
      const float PI = 3.141592;

      pixelCoord -= vec2(sin(uTime * 3.) /2.) + .5;
      pixelCoord = rotate(PI / 4.0) * pixelCoord;
      pixelCoord += vec2(0.5);

      vec2 borderWidth = vec2(0.45, -0.45);
      float box = drawRect(pixelCoord, borderWidth);

      if (color.a != 0.) {
        if (box == 0.) {
          gl_FragColor = color;
        } else {
          gl_FragColor = vec4(vec3(1.), color.a);
        }
      }
    }
  ')
	public function new() {
		super();
		this.uTime.value = [0.0];
	}
}