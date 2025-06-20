extends Button


func _ready():
	pass


func _process(_delta):
	pass


func _on_pressed():
	var layer = preload("res://portrait_layer.tscn").instantiate()
	%Portrait.add_child(layer)
	var layer_settings = preload("res://single_layer_settings.tscn").instantiate()
	%LayersVBox.add_child(layer_settings)
	layer_settings.layer_rect = layer
