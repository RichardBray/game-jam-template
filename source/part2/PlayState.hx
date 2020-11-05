package part2;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import openfl.filters.ShaderFilter;

class PlayState extends FlxState {
	var player:Player;

	var levelBounds:FlxGroup;
	var shimmer:ShimmerShader;
	var cameraTwo:FlxCamera = new FlxCamera(0, 0, 96, 128);

	override public function create() {
		super.create();

		FlxG.mouse.useSystemCursor = true;
		bgColor = 0xffcccccc;

		player = new Player(500, 200);
		add(player);

		levelBounds = FlxCollision.createCameraWall(FlxG.camera, true, 1);

		shimmer = new ShimmerShader();
		var shader = shimmer;
		shimmer.uTime.value = [0];

		cameraTwo.follow(player);
		cameraTwo.setFilters([new ShaderFilter(shader)]);
		cameraTwo.bgColor = FlxColor.TRANSPARENT;
		FlxG.cameras.add(cameraTwo);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
		cameraTwo.x = player.x;
		cameraTwo.y = player.y;
		shimmer.uTime.value[0] += elapsed;
		FlxG.collide(player, levelBounds);
	}
}