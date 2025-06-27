extends Button


func _ready():
	pass


func _process(_delta):
	pass


func _on_export_option_item_selected(index):
	if index == 0:
		show()
	else:
		hide()
