extends SubViewport

var trim_transparency = true

# for frame export
var frame_count: float = 30.0 # number of frames to save
var duration: float = 1.0 # duration over which to save frames, in seconds

@onready var config_path = "user://settings.cfg"
@onready var config = ConfigFile.new()
@onready var err = config.load(config_path)

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
	config.set_value("last_opened_folders", "export", path.get_base_dir())
	config.save(config_path)
	get_image().save_png(path)


func _on_export_gif_dialog_file_selected(path: String):
	config.set_value("last_opened_folders", "export", path.get_base_dir())
	config.save(config_path)
	var image
	var frames = []
	
	for i in range(frame_count):
		image = get_image()
		frames.append(image)
		await get_tree().create_timer(duration/frame_count).timeout
	
	# THANK YOU GDSCRIPT FOR THIS WONDERFUL FUNCTION
	var filename = path.get_basename()
	
	for i in range(frame_count):
		frames[i].save_png(filename + "_" + str(i+1) + ".png")


func _on_duration_spin_box_value_changed(value):
	duration = value


func _on_frame_count_spin_box_value_changed(value):
	frame_count = value
