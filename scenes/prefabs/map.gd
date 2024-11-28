extends VBoxContainer
var item:PackedScene = preload("res://scenes/prefabs/item.tscn")

func _on_close_button_pressed() -> void:
	queue_free()

func _on_add_button_pressed() -> void:
	$Items.add_child(item.instantiate())
