package modular;

import modular.Section;
import haxe.Json;
import haxe.format.JsonParser;
import lime.utils.Assets;

using StringTools;

typedef SongNotes = Array<SwagSection>;

typedef SongChart =
{
	var song:SwagSong;
	var notes:Map<String, SongNotes>;
}

typedef SwagSong =
{
	var song:String;
	var bpm:Int;
	var needsVoices:Bool;
	var speed:Float;

	var player1:String;
	var player2:String;
	var stage:String;
}

class Song
{
	public static function loadFromJson(jsonInput:String):SongChart
	{
		var rawJson = Assets.getText('assets/songs/${jsonInput.toLowerCase()}/${jsonInput.toLowerCase()}.json').trim();

		return parseJSONshit(rawJson);
	}

	public static function parseJSONshit(rawJson:String):SongChart
	{
		var swagShit:SongChart = cast Json.parse(rawJson);

		return swagShit;
	}

	public static function getDifficulty(songData:Dynamic, difficulty:String):SongNotes
	{
		difficulty = difficulty.toLowerCase();

		return Reflect.field(songData.notes, difficulty);
	}
}
