extends HSlider

@onready var layer = $"../../../../.."

func _on_x_offset_spin_box_value_changed(new_value: float) -> void:
	value = new_value


func _on_x_offset_reset_button_pressed() -> void:
	value = 0
