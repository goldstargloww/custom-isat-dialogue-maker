extends Node

@onready var config_path = "user://settings.cfg"
@onready var config = ConfigFile.new()
@onready var err = config.load(config_path)
@onready var version = "1.2.2" # version of the tool itself

func _ready():
	var current_config_version = config.get_value("meta", "version", false)
	if err == OK and current_config_version != version:
		print(
			"[WARN] config version is outdated! config is %s, version being used is %s. 
			updating config, but this might cause breaking changes!" % [current_config_version, version]
		)
	config.set_value("meta", "version", version)
	config.save(config_path)
