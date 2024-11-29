extends Node

var save_path:String = "res://resources/save.tscn"
@onready var canvas_layer: CanvasLayer = $CanvasLayer

func save_game():
	var save = PackedScene.new()
	var items = get_tree().get_nodes_in_group("item")
	var saved_map = PackedScene.new()
	var map = get_tree().get_nodes_in_group("map")
	for c in map.get_children():
		c.set_owner(self)

	save.pack(self)

	ResourceSaver.save(save, save_path)
	
func load_game():
	var saved_scene = load(save_path).instantiate()
	add_child(saved_scene)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_page_up"):
		save_game()
	if event.is_action_pressed("ui_page_down"):
		load_game()
