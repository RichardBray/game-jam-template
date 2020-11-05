package part2;

import flixel.system.FlxAssets.FlxShader;

class OutlineShader extends FlxShader {
	@:glFragmentSource('
    #pragma header
    
    void main() {
      vec4 color = texture2D(bitmap, openfl_TextureCoordv);
      float borderWidth = 0.002;

      if (color.a == 0.) {
        if (texture2D(bitmap, vec2(openfl_TextureCoordv.x + borderWidth, openfl_TextureCoordv.y)).a != 0.
        || texture2D(bitmap, vec2(openfl_TextureCoordv.x - borderWidth, openfl_TextureCoordv.y)).a != 0.
        || texture2D(bitmap, vec2(openfl_TextureCoordv.x, openfl_TextureCoordv.y + borderWidth)).a != 0.
        || texture2D(bitmap, vec2(openfl_TextureCoordv.x, openfl_TextureCoordv.y - borderWidth)).a != 0.) {
          gl_FragColor = vec4(0.7, 0.1, 0.5, color.a);
        } else {    
          gl_FragColor = color;
        }
      } else {
        gl_FragColor = color;
      }
    }
  ')
	public function new() {
		super();
	}
}