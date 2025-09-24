extends SpinBox

@onready var layer = $"../../../../.."
@onready var mode_option = $"../YOffsetOptionButton"
@onready var mode = "%"

func _on_y_offset_h_slider_value_changed(new_value: float) -> void:
	value = new_value
	mode = mode_option.get_item_text(mode_option.get_item_index(mode_option.get_selected_id()))
	layer.layer.yoffset = -value
	layer.layer.yoffset_mode = mode
	layer.layer.update()


func _on_y_offset_option_button_item_selected(index: int) -> void:
	mode = mode_option.get_item_text(index)
	var height_px = layer.layer.size.y
	if mode == "%": # px -> %
		value = (value * 100) / height_px
	else: # % -> width
		value = (value / 100) * height_px
