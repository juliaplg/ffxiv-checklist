extends Node
class_name MySaveManager

var save_path:String = "res://resources/save.tscn"
@onready var canvas_layer: CanvasLayer = $CanvasLayer

func save_game():
	var save = PackedScene.new()
	for c in canvas_layer.get_children():
		c.set_owner(canvas_layer)
		for a in c.get_children():
			a.set_owner(canvas_layer)
	save.pack(canvas_layer)

	ResourceSaver.save(save, save_path)
	
func load_game():
	var saved_scene = load(save_path).instantiate()
	get_tree().add_child(saved_scene)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_page_up"):
		save_game()
	if event.is_action_pressed("ui_page_down"):
		load_game()
