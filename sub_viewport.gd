extends SubViewport

var trim_transparency = true


func _ready():
	pass


func _process(_delta):
	pass


func _on_export_png_dialog_file_selected(path):
	var image = get_texture().get_image()
	if trim_transparency:
		image = image.get_region(image.get_used_rect())
	image.save_png(path)


func _on_check_button_toggled(toggled_on):
	if toggled_on:
		trim_transparency = true
	else:
		trim_transparency = false
