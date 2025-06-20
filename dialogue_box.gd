extends NinePatchRect


func _ready():
	pass


func _process(_delta):
	pass


func _on_box_height_slider_value_changed(value):
	size.y = 180 - value
