extends Node
class_name Main

var dict:Dictionary

const SAVE_GAME_PATH:String = "user://save.tres"

@onready var regions: VBoxContainer = %Regions


func save_game():
	for i in regions.get_children():
		if i is Region:
			i.save_maps()
			dict.get_or_add(i.name, i.maps)
			dict[i.name] = i.maps
			var save = SaveGame.new()
			save.dict = dict
			ResourceSaver.save(save,SAVE_GAME_PATH)


func load_game():
	if ResourceLoader.exists(SAVE_GAME_PATH):
		dict = ResourceLoader.load(SAVE_GAME_PATH).dict
	for i in regions.get_children():
		if i is Region:
			i.load_maps()
			if dict.has(i.name):
				i.maps = dict[i.name]
				

func clear():
	dict.clear()
	if ResourceLoader.exists(SAVE_GAME_PATH):
		ResourceLoader.load(SAVE_GAME_PATH).dict.clear()
	var save = SaveGame.new()
	ResourceSaver.save(save,SAVE_GAME_PATH)


func _ready() -> void:
	load_game()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("save"):
		save_game()
	if event.is_action_pressed("load"):
		load_game()
	if event.is_action_pressed("clear"):
		clear()
		load_game()
