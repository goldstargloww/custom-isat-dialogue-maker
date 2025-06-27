extends Button

var mode = "portrait"
signal mode_changed(mode_name: String)


func _ready():
	pass


func _process(_delta):
	pass


func _on_pressed():
	if mode == "portrait":
		text = "editing: box"
		mode = "box"
	elif mode == "box":
		text = "editing: export"
		mode = "export"
	elif mode == "export":
		text = "editing: portrait"
		mode = "portrait"
	emit_signal("mode_changed", mode)
