extends Control

@onready var viewport = $".."
@onready var dialoguebox_rect = viewport.get_node("DialogueBox").get_rect()

var default_max_height = 500
var max_height = default_max_height

var xoffset = 0.0
var xoffset_mode = "%"
var yoffset = 0.0
var yoffset_mode = "%"
var xscale = 100.0
var yscale = 100.0

func update():
	handle_viewport()
	handle_size()
	handle_position()


func get_children_rect():
	var children = get_children()
	if children:
		var children_rect = false
		for child in children:
			var child_rect = child.get_rect()
			child_rect.position.y += child.max_height
			if children_rect:
				children_rect = children_rect.merge(child_rect)
			else: children_rect = child_rect
		return children_rect
	else:
		return Rect2()


func handle_size():
	var children_rect = get_children_rect()
	print("children rect: ", children_rect)
	size.x = children_rect.size.x
	size.y = children_rect.size.y
	print(size)
	if size.y > max_height:
		size.x = max_height * (size.x / size.y) * (xscale / 100.0)
		size.y = max_height * (yscale / 100.0)
	else:
		size.x *= xscale / 100.0
		size.y *= yscale / 100.0


func handle_position():
	var children_rect = get_rect()
	if xoffset_mode == "%":
		position.x = ((xoffset / 100) * children_rect.size.x)
	else:
		position.x = xoffset
		
	if yoffset_mode == "%":
		position.y = children_rect.size.y + ((yoffset / 100) * -children_rect.size.y)
	else:
		position.y = -yoffset + children_rect.size.y


func handle_viewport():
	var total_rect = dialoguebox_rect

	total_rect = get_rect().merge(dialoguebox_rect)
	#print("children ", get_children_rect(), ", total ", total_rect)
	
	viewport.size.y = total_rect.size.y
	
	
	#print("\n\n\n\n")
	#print("none")
	#print(position)
	#print(size)
	#print("self")
	#print(self_rect)
	#print(self_rect.position)
	#print(self_rect.size)
	#print("dialoguebox")
	#print(dialoguebox_rect)
	#print(dialoguebox_rect.position)
	#print(dialoguebox_rect.size)
	#print("total_rect")
	#print(total_rect)
	#print(total_rect.position)
	#print(total_rect.size)
	
	#print("self:  ", self_rect, ", size ", self_rect.size)
	#print("dbox:  ", dialoguebox_rect, ", size ", dialoguebox_rect.size)
	#print("total: ", total_rect, ", size ", total_rect.size)
	#print("vport: ", viewport.get_visible_rect(), ", size ", viewport.get_visible_rect().size)
