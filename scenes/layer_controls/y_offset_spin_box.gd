extends SpinBox

@onready var layer = $"../../../../.."

func _on_y_offset_h_slider_value_changed(new_value: float) -> void:
	value = new_value
	layer.layer.yoffset = -value
	layer.layer.update()
