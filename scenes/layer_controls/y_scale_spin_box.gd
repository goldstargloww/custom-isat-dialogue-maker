extends SpinBox

@onready var layer = $"../../../../../.."

func _on_y_scale_reset_button_pressed() -> void:
	value = 0


func _on_y_scale_h_slider_value_changed(new_value: float) -> void:
	value = new_value
	layer.layer.yscale = value
	layer.layer.update()
