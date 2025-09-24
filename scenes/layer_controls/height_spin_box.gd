extends SpinBox

@onready var layer = $"../../../../.."

func _on_height_h_slider_value_changed(new_value: float) -> void:
	value = new_value
	layer.layer.max_height = value
	layer.layer.update()


func _on_height_reset_button_pressed() -> void:
	value = 500
