extends Node

var dict:Dictionary

var map_nodes

func save_game():
	map_nodes = get_tree().get_nodes_in_group("map")
	for node in map_nodes:
		if node is Map:
			node.get_items()
			dict.get_or_add(node.get_node("MapName").text,node.items)

func load_game():
	map_nodes = get_tree().get_nodes_in_group("map")
	for node in map_nodes:
		if node is Map:
			node.clear_items()
			dict.get_or_add(node.get_node("MapName").text,node.items)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_end"):
		save_game()
	if event.is_action_pressed("ui_home"):
		
		
		print(dict)
