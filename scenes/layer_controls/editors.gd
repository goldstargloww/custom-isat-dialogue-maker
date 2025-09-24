extends PanelContainer

func update_editors_visibility():
	if %TranslateButton.button_pressed:
		$TranslateEditor.show()
	else:
		$TranslateEditor.hide()
		
	if %ScaleButton.button_pressed:
		$ScaleEditor.show()
	else:
		$ScaleEditor.hide()
		
	if %HeightButton.button_pressed:
		$HeightEditor.show()
	else:
		$HeightEditor.hide()
		
	if %OpacityButton.button_pressed:
		$OpacityEditor.show()
	else:
		$OpacityEditor.hide()

func _ready():
	update_editors_visibility()


func _on_translate_button_toggled(_toggled_on: bool) -> void:
	update_editors_visibility()


func _on_scale_button_toggled(_toggled_on: bool) -> void:
	update_editors_visibility()


func _on_height_button_toggled(_toggled_on: bool) -> void:
	update_editors_visibility()


func _on_opacity_button_toggled(_toggled_on: bool) -> void:
	update_editors_visibility()
