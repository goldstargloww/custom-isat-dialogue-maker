extends SpinBox


func _ready():
	value = %Portrait.default_offset


func _process(_delta):
	pass


func _on_reset_offset_button_pressed():
	value = %Portrait.default_offset


func _on_offset_slider_value_changed(new_value):
	value = new_value
