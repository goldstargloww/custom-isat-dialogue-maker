extends HSlider


func _on_x_scale_reset_button_pressed() -> void:
	value = 0


func _on_x_scale_spin_box_value_changed(new_value: float) -> void:
	value = new_value
