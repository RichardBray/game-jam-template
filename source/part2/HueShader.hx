package part2;

import flixel.system.FlxAssets.FlxShader;

class HueShader extends FlxShader {
	@:glFragmentSource('
    #pragma header

    uniform float uTime;

    vec3 hueShift(vec3 color, float hueAngle) {
      const mat3 rgb2yiq = mat3(
        0.299, 0.587, 0.114, 
        0.595716, -0.274453, -0.321263, 
        0.211456, -0.522591, 0.311135
      );

      const mat3 yiq2rgb = mat3(
        1.0, 0.9563, 0.6210, 
        1.0, -0.2721, -0.6474, 
        1.0, -1.1070, 1.7046
      );

      vec3 convertRGB = rgb2yiq * color;

      float hueInRads = atan(convertRGB.b / convertRGB.g); //*
      // rgb
      float updatedHue = hueInRads + hueAngle;
      // c2 = a2 + b2;
      // c = squareRoot(a2 + b2);
      float originalColor = sqrt(pow(convertRGB.b, 2.) + pow(convertRGB.g, 2.)); //*

      vec3 finalColor = vec3(convertRGB.r, originalColor * cos(updatedHue), originalColor * sin(updatedHue)); //*

      return finalColor * yiq2rgb;
    }

    void main() {
      vec4 color = texture2D(bitmap, openfl_TextureCoordv);
      vec3 newColor = hueShift(color.rgb, sin(uTime * 2.) + sin(uTime * 2.));
      gl_FragColor = vec4(newColor, color.a); 
    }
  ')
	public function new() {
		super();
		this.uTime.value = [0.0];
	}
}