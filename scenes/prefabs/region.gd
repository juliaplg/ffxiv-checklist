@tool
extends VBoxContainer
class_name Region

var map_scene:PackedScene = preload("res://scenes/prefabs/map.tscn")
var map_nodes
var maps:Dictionary

func _process(_delta: float) -> void:
	$Label.text = name

func _on_close_button_pressed() -> void:
	queue_free()

func _on_add_button_pressed() -> void:
	$Maps.add_child(map_scene.instantiate())

func save_maps():
	for map in $Maps.get_children():
		if map is Map:
			map.get_items()
			maps.get_or_add(map.get_node("MapName").text,map.items)

func clear_maps():
	for i in $Maps.get_children():
		i.queue_free()

func load_maps():
	clear_maps()
	await get_tree().create_timer(0.1).timeout
	for k in maps:
		$Maps.add_child(map_scene.instantiate())
	for map in $Maps.get_children():
		if map is Map:
			map.get_node("MapName").text = maps.keys()[map.get_index()]
			for i in maps[map.get_node("MapName").text]:
				map.get_node("Items").add_child(map.item_scene.instantiate())
				for j in map.get_node("Items").get_children():
					if j is Item:
						j.get_node("ItemName").text = maps[map.get_node("MapName").text][j.get_index()]
				#for item in map.get_children():
					#if item is Item:
						#item.get_node("Name").text = maps[map.get_index()][item.get_index()]
	maps.clear()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_end"):
		save_maps()
	if event.is_action_pressed("ui_home"):
		load_maps()
		
