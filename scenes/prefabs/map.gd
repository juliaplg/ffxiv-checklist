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

func clear_items():
	for i in $Items.get_children():
		i.queue_free()

func set_items():
	clear_items()
	await get_tree().create_timer(0.5).timeout
	for i in items:
		$Items.add_child(item_scene.instantiate())
	for i in $Items.get_children():
		if i is Item:
			i.get_node("Name").text = items[i.get_index()]
	items.clear()

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("ui_page_up"):
		#get_items()
	#if event.is_action_pressed("ui_cancel"):
		#clear_items()
	#if event.is_action_pressed("ui_page_down"):
		#set_items()
	#if event.is_action_pressed("ui_accept"):
		#print(items)
