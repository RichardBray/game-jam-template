package part1;

import flixel.system.FlxAssets.FlxShader;

class TestShader extends FlxShader {
	@:glFragmentSource('
    #pragma header
    
    void main() {
      gl_FragColor = vec4(0.2, 0.3, 0.1, 1.0); //rbga
    }
  ')
	public function new() {
		super();
	}
}