package modular.mods;

import flixel.util.FlxDestroyUtil.IFlxDestroyable;

class ModBase
{
	public static var modsList:Map<String, ModBase> = [];

	public static var mod:ModBase;

	public static function initModList()
	{
		for (modID => mod in modsList)
		{
			modsList.remove(modID);

			if (mod != null)
			{
				mod.destroy();
				mod = null;
			}
		}

		new Funkin();

        trace('Mod list: ${[for (id => mod in modsList) id]}');
	}

	public static function loadDefaultMod()
		loadMod('funkin');

	public static function loadMod(id:String)
	{
		initModList();

		mod = modsList.get(id);
		mod.loaded();
	}

	public var id(default, null):String;
	public var version(default, null):String;

	public var game(get, never):PlayState;

	function get_game():PlayState
	{
		return PlayState.instance;
	}

	public function new(id:String, version:String)
	{
		this.id = id;
		this.version = version;

		if (!modsList.exists(id))
			modsList.set(id, this);
	}

	public function makeStage(stage:String) {}

	public function destroy() {}

	public function loaded() {}
}
