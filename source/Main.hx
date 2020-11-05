package;

import flixel.FlxGame;
import openfl.display.Sprite;
import part2.PlayState;

class Main extends Sprite {
	public function new() {
		super();
		addChild(new FlxGame(0, 0, PlayState));
	}
}