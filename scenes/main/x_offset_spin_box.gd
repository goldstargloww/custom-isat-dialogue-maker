extends SpinBox

var default_value = -20
@onready var mode_option = $"../XOffsetOptionButton"
@onready var mode = "%"
@onready var default_value_mode = mode


func _ready():
	value = default_value


func _on_x_offset_h_slider_value_changed(new_value: float) -> void:
	value = new_value


func _on_x_offset_reset_button_pressed() -> void:
	if mode == default_value_mode:
		value = default_value
	elif mode == "%":
		pass
	# TODO make this work for % -> px and px -> %
	else:
		value = default_value # TODO this is a temp fix


func _on_value_changed(_value: float) -> void:
	mode = mode_option.get_item_text(mode_option.get_item_index(mode_option.get_selected_id()))
	%Portrait.xoffset = value
	%Portrait.xoffset_mode = mode
	%Portrait.update()
