extends HSlider


func _on_height_spin_box_value_changed(new_value: float) -> void:
	value = new_value


func _on_height_reset_button_pressed() -> void:
	value = 500
