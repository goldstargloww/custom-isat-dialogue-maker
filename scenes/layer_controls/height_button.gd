extends Button


func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%TranslateButton.button_pressed = false
		%ScaleButton.button_pressed = false
		%OpacityButton.button_pressed = false
