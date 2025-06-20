extends Label


func _ready():
	pass


func _process(_delta):
	pass


func _on_mode_button_pressed():
	if visible:
		hide()
	else:
		show()
