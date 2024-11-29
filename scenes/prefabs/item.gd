extends HBoxContainer
class_name Item

func _on_close_button_pressed() -> void:
	queue_free()
