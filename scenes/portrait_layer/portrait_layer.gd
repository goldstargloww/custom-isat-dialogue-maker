extends TextureRect

var default_max_height = 500
var max_height = default_max_height

var xoffset = 0.0 # set by x_offset_spin_box.gd
var xoffset_mode = "%"
var yoffset = 0.0 # set by y_offset_spin_box.gd
var yoffset_mode = "%"
var xscale = 100
var yscale = 100
var opacity = 100.0

func _ready():
	pass

func update():
	size.x = texture.get_width()
	size.y = texture.get_height()
	if size.y > max_height:
		size.x = max_height * (size.x / size.y) * (xscale / 100.0)
		size.y = max_height * (yscale / 100.0)
	else:
		size.x *= xscale / 100.0
		size.y *= yscale / 100.0
		
	if xoffset_mode == "%":
		position.x = ((xoffset / 100) * size.x)
	else:
		position.x = xoffset
		
	if yoffset_mode == "%":
		position.y = -size.y + ((yoffset / 100) * size.y)
	else:
		position.y = -size.y + yoffset
		
	modulate.a = opacity / 100
		
	
	var viewport = get_parent().get_parent()
	var self_rect = get_rect()
	var dialoguebox_rect = viewport.get_node("DialogueBox").get_rect()
	var _total_rect = self_rect.merge(dialoguebox_rect)
	#print("self: ", self_rect)
	#print("dbox: ", dialoguebox_rect)
	#print("totl: ", _total_rect)
	#viewport.size.y = self_rect.size.y
	get_parent().update()
