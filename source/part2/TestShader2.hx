package part2;

import flixel.system.FlxAssets.FlxShader;

class TestShader2 extends FlxShader {
	@:glFragmentSource('
    #pragma header
    
    void main() {
      vec4 color = texture2D(bitmap, openfl_TextureCoordv);

      if (color.a == 0.) {
        gl_FragColor = color;
      } else {
        gl_FragColor = vec4(0.2, 0.3, 0.1, color.a); //rbga
      }
    }
  ')
	public function new() {
		super();
	}
}