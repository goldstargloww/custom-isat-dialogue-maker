extends SpinBox

@onready var layer = $"../../../../.."

func _on_opacity_h_slider_value_changed(new_value: float) -> void:
	value = new_value
	layer.layer.opacity = value
	layer.layer.update()
