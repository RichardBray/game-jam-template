package part2;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class PlayState extends FlxState {
	var player:Player;

	var levelBounds:FlxGroup;

	override public function create() {
		super.create();

		FlxG.mouse.useSystemCursor = true;
		bgColor = 0xffcccccc;

		player = new Player(500, 200);
		add(player);

		levelBounds = FlxCollision.createCameraWall(FlxG.camera, true, 1);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
		FlxG.collide(player, levelBounds);
	}
}