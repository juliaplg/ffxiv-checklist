extends Resource
class_name SaveGame

const SAVE_GAME_PATH:String = "user://save.tres"

@export var dict:Dictionary

func write_save():
	ResourceSaver.save(self, SAVE_GAME_PATH)
	
static func load_save():
	if ResourceLoader.exists(SAVE_GAME_PATH):
		return load(SAVE_GAME_PATH)
	return null
