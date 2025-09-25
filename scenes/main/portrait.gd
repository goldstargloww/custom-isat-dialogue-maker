extends Control

@onready var viewport = $".."
@onready var dialoguebox_rect = viewport.get_node("DialogueBox").get_rect()

var xoffset = 0.0
var xoffset_mode = "%"

func update():
	handle_viewport()
	handle_position()
	
func handle_position():
	var children_rect = get_children_rect()
	if xoffset_mode == "%":
		position.x = 0 + ((xoffset / 100) * children_rect.size.x)
	else:
		position.x = 0 + xoffset
	
func get_children_rect():
	var children = get_children()
	var children_rect = Rect2()
	for child in children:
		var child_rect = child.get_rect()
		child_rect.position.y += child.max_height
		children_rect = children_rect.merge(child_rect)
	return children_rect

func handle_viewport():
	var total_rect = dialoguebox_rect

	total_rect = get_children_rect().merge(dialoguebox_rect)
	#print("children ", children_rect, ", total ", total_rect)
	
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
