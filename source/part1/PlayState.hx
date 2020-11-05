package part1;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState {
	override public function create() {
		super.create();

		FlxG.mouse.useSystemCursor = true;
		bgColor = 0xffcccccc; // GREY

		final box = new FlxSprite(50, 50);
		box.makeGraphic(100, 100, FlxColor.BLUE);
		add(box);

		box.shader = new TestShader();
	}
}