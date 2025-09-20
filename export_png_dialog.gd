extends FileDialog

@onready var config_path = "user://settings.cfg"
@onready var config = ConfigFile.new()
@onready var err = config.load(config_path)

func _ready():
	pass


func _process(_delta):
	pass


func _on_export_png_button_pressed():
	if err == OK:
		var last_folder = config.get_value("last_opened_folders", "export", false)
		if last_folder:
			set_current_dir(last_folder)
	popup()
