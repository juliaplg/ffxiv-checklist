@tool
extends VBoxContainer
var map:PackedScene = preload("res://scenes/prefabs/map.tscn")

func _process(delta: float) -> void:
	$Label.text = name


func _on_close_button_pressed() -> void:
	queue_free()

func _on_add_button_pressed() -> void:
	$Maps.add_child(map.instantiate())
