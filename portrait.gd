extends Control

@export var default_offset = 0.2
@export var portrait_size = 0.8
signal has_portrait(has_portrait: bool)
var offset = default_offset

func _ready():
	scale *= portrait_size
	

func _process(_delta):
	pass


func update_position():
	var child_count = get_child_count()
	if child_count > 0:
		var child = get_child(0)
		
		# i don't remember exactly what this does but it stopped it from exploding
		child.expand_mode = TextureRect.EXPAND_KEEP_SIZE
		
		if child.texture != null:
			emit_signal("has_portrait", true)
			# clamp height at 500px
			if child.texture.get_height() > 500:
				size.x = 500 * (float(child.texture.get_width()) / float(child.texture.get_height()))
				size.y = 500
			else:
				size.x = child.texture.get_width()
				size.y = child.texture.get_height()
			
			# offset x position
			position.x = -(size.x * portrait_size) * offset
			
			# put it at the bottom of the viewport
			position.y = get_viewport().size.y - (size.y * portrait_size)
		else:
			emit_signal("has_portrait", false)
	else:
		emit_signal("has_portrait", false)


func _on_offset_slider_value_changed(value):
	offset = value
	update_position()


func _on_reset_offset_button_pressed():
	offset = default_offset
	update_position()
