package modular.mods;

import flixel.FlxSprite;

class Funkin extends ModBase
{
	override public function new()
	{
		super('funkin', '0.2.7.1');
	}

	override function makeStage(stage:String)
	{
		super.makeStage(stage);

		if (game == null)
			return;

		switch (stage)
		{
			case 'mainStage':
			    game.defaultCamZoom = 0.9;
				var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic('assets/images/stageback.png');
				bg.scrollFactor.set(0.9, 0.9);
				bg.active = false;
				game.backSprites.add(bg);

				var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic('assets/images/stagefront.png');
				stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
				stageFront.updateHitbox();
				stageFront.scrollFactor.set(0.9, 0.9);
				stageFront.active = false;
				game.backSprites.add(stageFront);

				var stageCurtains:FlxSprite = new FlxSprite(-500, -300).loadGraphic('assets/images/stagecurtains.png');
				stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
				stageCurtains.updateHitbox();
				stageCurtains.scrollFactor.set(1.3, 1.3);
				stageCurtains.active = false;

				game.backSprites.add(stageCurtains);
		}
	}
}
