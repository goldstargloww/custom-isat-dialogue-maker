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
	if texture != null:
		if max_height:
			size.x = max_height * (float(texture.get_width()) / float(texture.get_height()))
			size.y = max_height
		else:
			size = texture.get_size()
			
		if xoffset_mode == "%":
			position.x = 0 + ((xoffset / 100) * size.x)
		else:
			position.x = 0 + xoffset
			
		if yoffset_mode == "%":
			position.y = -size.y + ((yoffset / 100) * size.y)
		else:
			position.y = -size.y + yoffset
			
		modulate.a = opacity / 100
			
		@warning_ignore("integer_division")
		size = Vector2(size.x * (xscale / 100), size.y * (yscale / 100))
		
		var viewport = get_parent().get_parent()
		var self_rect = get_rect()
		var dialoguebox_rect = viewport.get_node("DialogueBox").get_rect()
		var _total_rect = self_rect.merge(dialoguebox_rect)
		#print("self: ", self_rect)
		#print("dbox: ", dialoguebox_rect)
		#print("totl: ", total_rect)
		viewport.size.y = self_rect.size.y
