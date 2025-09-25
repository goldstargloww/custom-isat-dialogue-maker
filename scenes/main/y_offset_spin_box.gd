extends SpinBox

var default_value = 0


func _ready():
	value = default_value
	

func _on_y_offset_h_slider_value_changed(new_value: float) -> void:
	value = new_value


func _on_y_offset_reset_button_pressed() -> void:
	value = default_value
