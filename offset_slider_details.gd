extends HBoxContainer


func _ready():
	pass


func _process(_delta):
	pass


func _on_mode_button_mode_changed(mode_name):
	if mode_name == "portrait":
		show()
	else:
		hide()
