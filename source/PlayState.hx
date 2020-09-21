package;

import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState {
	override public function create() {
		super.create();
		add(new FlxText("Hello World", 32).screenCenter());
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}