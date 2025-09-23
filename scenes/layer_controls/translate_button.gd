extends Button


func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%ScaleButton.button_pressed = false
		%HeightButton.button_pressed = false
		%OpacityButton.button_pressed = false
