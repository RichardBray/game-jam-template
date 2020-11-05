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

    float drawRect(vec2 pixelCoords, vec2 borderWidth) {
      vec2 bottomLeft = step(vec2(borderWidth), pixelCoords);
      vec2 topRight = step(vec2(borderWidth), 1.0 - pixelCoords);
      float vecToFloat = (bottomLeft.x * bottomLeft.y) * (topRight.x * topRight.y);
      return vecToFloat;
    }


    void main() {
      vec4 color = texture2D(bitmap, openfl_TextureCoordv);
      vec2 pixelCoord2 = openfl_TextureCoordv;
      float PI = 3.14159265359;

      pixelCoord2 -= vec2(sin(uTime * 3.) / 2.) + .5;
      pixelCoord2 = rotate((PI / 4.0)) * pixelCoord2;
      pixelCoord2 += vec2(0.5);

      float box = drawRect(pixelCoord2, vec2(0.45, -0.45));

      if (color.a != 0.) {
        if (box == 0.) {
          gl_FragColor = color;
        } else {
          gl_FragColor = vec4(vec3(1.0), 1.0);
        }
      }

    }
  ')
	public function new() {
		super();
		this.uTime.value = [0.0];
	}
}