extends AnimatedSprite2D


func _ready():
	pass


func _process(_delta):
	pass


func _on_ctc_visible_button_toggled(toggled_on):
	if toggled_on:
		show()
	else:
		hide()


func _on_box_height_slider_value_changed(value):
	position.y = 153 - value
