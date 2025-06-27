extends HSlider


func _ready():
	pass


func _process(_delta):
	pass


func _on_box_height_direct_edit_value_changed(new_value):
	value = new_value


func _on_reset_box_height_button_pressed():
	value = 0


func _on_mode_button_mode_changed(mode_name):
	if mode_name == "box":
		show()
	else:
		hide()
