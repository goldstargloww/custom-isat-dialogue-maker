extends Button

func _on_pressed() -> void:
	var layer = preload("res://scenes/portrait_layer/portrait_layer.tscn").instantiate()
	%Portrait.add_child(layer)
	var layer_controls = preload("res://scenes/layer_controls/layer_controls.tscn").instantiate()
	%LayerList.add_child(layer_controls)
	layer_controls.layer = layer
