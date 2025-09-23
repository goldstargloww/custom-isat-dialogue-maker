extends TextureRect

var default_max_height = 500
var max_height = default_max_height
var xoffset = 0.0 # set by x_offset_spin_box.gd
var yoffset = 0.0 # set by y_offset_spin_box.gd

func _ready():
	pass

func update():
	if texture != null:
		if max_height:
			size.x = max_height * (float(texture.get_width()) / float(texture.get_height()))
			size.y = max_height
		else:
			size = texture.get_size()
		position = Vector2(0 + xoffset, -size.y + yoffset)
		
		var viewport = get_parent().get_parent()
		var self_rect = get_rect()
		var dialoguebox_rect = viewport.get_node("DialogueBox").get_rect()
		var _total_rect = self_rect.merge(dialoguebox_rect)
		#print("self: ", self_rect)
		#print("dbox: ", dialoguebox_rect)
		#print("totl: ", total_rect)
		viewport.size.y = self_rect.size.y
