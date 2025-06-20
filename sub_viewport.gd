extends SubViewport

var trim_transparency = true


# https://github.com/jegor377/godot-gdgifexporter
const GIFExporter = preload("res://gdgifexporter/exporter.gd")
const MedianCutQuantization = preload("res://gdgifexporter/quantization/median_cut.gd")


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
	get_image().save_png(path)


func _on_export_gif_dialog_file_selected(path):
	var image = get_image()
	image.convert(Image.FORMAT_RGBA8)
	var exporter = GIFExporter.new(image.get_width(), image.get_height())
	
	var frames = []
	for i in range(30):
		image = get_image()
		image.convert(Image.FORMAT_RGBA8)
		frames.append(image)
		print("got frame ", i+1)
		await get_tree().create_timer(1/30).timeout
	for i in range(30):
		print("adding frame ", i+1)
		exporter.add_frame(frames[i], 1/30, MedianCutQuantization)
		
	var file: FileAccess = FileAccess.open(path, FileAccess.WRITE)
	file.store_buffer(exporter.export_file_data())
	file.close()
