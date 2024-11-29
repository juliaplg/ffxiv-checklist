extends LineEdit
class_name MyLineEdit

func _ready() -> void:
	connect("text_submitted", request_save)

func request_save(new_text):
	SaveMngr.save()
