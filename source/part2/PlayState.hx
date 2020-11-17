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
	var cameraTwo:FlxCamera;

	override public function create() {
		super.create();

		FlxG.mouse.useSystemCursor = true;
		bgColor = 0xffcccccc;

		player = new Player(500, 200);
		add(player);

		levelBounds = FlxCollision.createCameraWall(FlxG.camera, true, 1);

		shimmer = new ShimmerShader();
		shimmer.uTime.value = [0];

		cameraTwo = new FlxCamera(0, 0, 96, 192);
		cameraTwo.follow(player);
		cameraTwo.setFilters([new ShaderFilter(shimmer)]);
		cameraTwo.bgColor = FlxColor.TRANSPARENT;
		player.cameras = [cameraTwo];
		FlxG.cameras.add(cameraTwo);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
		shimmer.uTime.value[0] += elapsed;
		cameraTwo.setPosition(player.x, player.y);
		FlxG.collide(player, levelBounds);
	}
}