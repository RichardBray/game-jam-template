package part2;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

enum States {
	Grounded;
	Jumping;
}

class Player extends FlxSprite {
	static inline final SPEED = 250;
	static inline final WALKING_SPEED = 100;
	static inline final GRAVITY = 600;

	var left = false;
	var right = false;

	var playerState:States = Grounded;
	var hueShader:HueShader;

	public function new(xPos:Int = 0, yPos:Int = 0) {
		super(xPos, yPos);
		loadGraphic("assets/images/kenny_male.png", true, 96, 128);

		drag.x = SPEED * 4;

		animation.add("run", [for (i in 25...28) i], 12);
		animation.add("walk", [for (i in 36...44) i], 12);
		animation.add("jump", [2], 12, false);
		animation.add("idle", [0], 12, false);

		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);

		acceleration.y = GRAVITY;

		hueShader = new HueShader();
		hueShader.uTime.value = [0];

		shader = hueShader;
	}

	function movementStates() {
		final jump = FlxG.keys.anyJustPressed([UP, SPACE, W]);
		final touchingFloor = isTouching(FlxObject.FLOOR);

		switch (playerState) {
			case Grounded:
				groundedAnims();
				if (jump && touchingFloor) {
					velocity.y = -GRAVITY / 1.5;
					playerState = Jumping;
				}
			case Jumping:
				animation.play("jump");
				movement(SPEED);
				if (touchingFloor) playerState = Grounded;
		}
	}

	function groundedAnims() {
		final walk = FlxG.keys.pressed.SHIFT;

		if (left || right) {
			animation.play(walk ? "walk" : "run");
			movement(walk ? WALKING_SPEED : SPEED);
		} else {
			animation.play("idle");
		}
	}

	function movement(speed:Int) {
		if (left && right) {
			velocity.x = 0;
		} else if (right) {
			velocity.x = speed;
			facing = FlxObject.RIGHT;
		} else if (left) {
			velocity.x = -speed;
			facing = FlxObject.LEFT;
		}
	}

	override function update(elapsed:Float) {
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);
		hueShader.uTime.value[0] += elapsed;
		movementStates();
		super.update(elapsed);
	}
}