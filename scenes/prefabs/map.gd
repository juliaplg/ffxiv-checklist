extends VBoxContainer
class_name Map

var item_scene:PackedScene = preload("res://scenes/prefabs/item.tscn")

var items:Array = []

func _on_close_button_pressed() -> void:
	queue_free()

func _on_add_button_pressed() -> void:
	$Items.add_child(item_scene.instantiate())

func get_items():
	for i in $Items.get_children():
		if i is Item:
			if not items.has(i.get_node("ItemName").text):
				items.append(i.get_node("ItemName").text)
