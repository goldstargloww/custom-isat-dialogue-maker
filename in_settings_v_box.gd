extends VBoxContainer


func _ready():
	pass


func _process(_delta):
	pass


func _on_settings_button_toggled(toggled_on):
	if toggled_on:
		show()
	else:
		hide()
