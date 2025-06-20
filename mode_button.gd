extends Button

var mode = "portrait"


func _ready():
	pass


func _process(_delta):
	pass


func _on_pressed():
	if mode == "portrait":
		text = "editing: box"
		mode = "box"
	elif mode == "box":
		text = "editing: portrait"
		mode = "portrait"
