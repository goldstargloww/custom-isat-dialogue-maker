extends SpinBox


func _ready():
	pass


func _process(_delta):
	pass


func _on_box_height_slider_value_changed(new_value):
	value = new_value


func _on_reset_box_height_button_pressed():
	value = 0
