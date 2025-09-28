extends SpinBox

var default_value = 80


func _ready():
	value = default_value + 1 # to force it to update
	value = default_value


func _on_x_scale_h_slider_value_changed(new_value: float) -> void:
	value = new_value


func _on_value_changed(new_value: float) -> void:
	%Portrait.xscale = new_value
	%Portrait.update()


func _on_x_scale_reset_button_pressed() -> void:
	value = default_value + 1 # to force it to update
	value = default_value


func _on_y_scale_spin_box_value_changed(new_value: float) -> void:
	if $"../../ScaleLinkCheckButton".button_pressed:
		value = new_value
