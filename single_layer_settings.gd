extends HBoxContainer

var layer_rect

@onready var config_path = "user://settings.cfg"
@onready var config = ConfigFile.new()
@onready var err = config.load(config_path)

func _ready():
	pass


func _process(_delta):
	pass


func _on_layer_clear_button_pressed():
	layer_rect.texture = null
	%LayerPreview.texture = null
	layer_rect.get_parent().update_position()


func _on_layer_change_button_pressed():
	if err == OK:
		var last_folder = config.get_value("last_opened_folders", "layers", false)
		if last_folder:
			$FileDialog.set_current_dir(last_folder)
	$FileDialog.popup()


func _on_file_dialog_file_selected(path):
	var image = ImageTexture.create_from_image(Image.load_from_file(path))
	layer_rect.texture = image
	%LayerPreview.texture = image
	layer_rect.get_parent().update_position()
	config.set_value("last_opened_folders", "layers", path.get_base_dir())
	config.save(config_path)


func _on_layer_visibility_button_pressed():
	if layer_rect.visible:
		layer_rect.hide()
		%LayerVisibilityButton.text = "visible: off"
	else:
		layer_rect.show()
		%LayerVisibilityButton.text = "visible: on"
