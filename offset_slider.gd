extends HSlider


func _ready():
	value = %Portrait.default_offset


func _process(_delta):
	pass


func _on_reset_offset_button_pressed():
	value = %Portrait.default_offset


func _on_offset_direct_edit_value_changed(new_value):
	value = new_value


func _on_mode_button_mode_changed(mode_name):
	if mode_name == "portrait":
		show()
	else:
		hide()
