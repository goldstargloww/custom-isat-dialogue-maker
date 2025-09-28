extends SpinBox

var default_value = 100
@onready var layer = $"../../../../../.."
@onready var scale_link = $"../../ScaleLinkCheckButton"


func _on_y_scale_h_slider_value_changed(new_value: float) -> void:
	value = new_value
	layer.layer.yscale = value
	layer.layer.update()


func _on_y_scale_reset_button_pressed() -> void:
	value = default_value


func _on_x_scale_spin_box_value_changed(new_value: float) -> void:
	if scale_link.button_pressed:
		value = new_value
		layer.layer.yscale = value
