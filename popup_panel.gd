extends PopupPanel


func _ready():
	size.y = 501


func _process(_delta):
	size.y = 501


func _on_info_button_pressed():
	popup()
	position.y = 61
