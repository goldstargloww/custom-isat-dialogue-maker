extends SubViewport

var trim_transparency = true

func _ready():
	pass


func _process(_delta):
	pass


func get_image():
	var image = get_texture().get_image()
	if trim_transparency:
		image = image.get_region(image.get_used_rect())
	return image


func _on_check_button_toggled(toggled_on):
	if toggled_on:
		trim_transparency = true
	else:
		trim_transparency = false


func _on_export_png_dialog_file_selected(path):
	path = path.get_basename() + ".png" # force it into a png extension
	get_image().save_png(path)


func _on_export_gif_dialog_file_selected(path: String):
	var image
	var frames = []
	
	var frame_count = 30 # number of frames to save
	var duration = 1 # duration over which to save frames, in seconds
	
	for i in range(frame_count):
		image = get_image()
		frames.append(image)
		print("got frame ", i+1)
		await get_tree().create_timer(duration/frame_count).timeout
	
	# THANK YOU GDSCRIPT FOR THIS WONDERFUL FUNCTION
	var filename = path.get_basename()
	
	for i in range(frame_count):
		frames[i].save_png(path + "_" + str(i+1) + ".png")
