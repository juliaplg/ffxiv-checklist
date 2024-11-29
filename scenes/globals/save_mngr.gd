extends Node

var main:Main

func _ready() -> void:
	main = get_tree().get_first_node_in_group("main")

func save():
	if is_instance_valid(main):
		main.save_game()

func load_game():
	if is_instance_valid(main):
		main.load_game()
