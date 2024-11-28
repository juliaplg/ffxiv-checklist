extends Node

var save_path:String = "res://resources/save.tscn"

func save_game():
	var save = PackedScene.new()
	for c in self.get_children():
		c.set_owner(self)
		for a in c.get_children():
			a.set_owner(self)
	save.pack(self)

	ResourceSaver.save(save, save_path)
	
func load_game():
	var saved_scene = load(save_path).instantiate()
	add_child(saved_scene)

func _ready() -> void:
	save_game()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_page_up"):
		save_game()
	if event.is_action_pressed("ui_page_down"):
		load_game()
