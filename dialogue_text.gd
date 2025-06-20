extends RichTextLabel

@export var no_portrait_size = 785
@export var no_portrait_pos = 15
@export var portrait_pos_offset = 221


func _ready():
	pass


func _process(_delta):
	pass


func _on_text_edit_text_changed():
	var new_text = %TextEdit.text
	
	new_text = new_text.replace("[wish]", "[outline_size=5][outline_color=#555]")
	new_text = new_text.replace("[/wish]", "[/outline_color]")
	
	new_text = new_text.replace("[big]", "[font_size=36]")
	new_text = new_text.replace("[/big]", "[/font_size]")
	
	new_text = new_text.replace("[small]", "[font_size=16]")
	new_text = new_text.replace("[/small]", "[/font_size]")
	
	text = new_text


func position_for_no_dialogue():
	size.x = no_portrait_size
	position.x = no_portrait_pos
	

func position_for_dialogue():
	position.x = no_portrait_pos + portrait_pos_offset
	size.x = no_portrait_size - portrait_pos_offset


func _on_portrait_has_portrait(has_portrait):
	if has_portrait:
		position_for_dialogue()
	else:
		position_for_no_dialogue()


func _on_font_settings_option_item_selected(index):
	var vcr = load("res://assets/VCR_OSD_MONO.ttf")
	var crt = load("res://assets/BestTen-CRT.ttf")
	if index == 0:
		add_theme_font_override("normal_font", vcr)
		add_theme_font_override("mono_font", vcr)
		add_theme_font_override("italics_font", vcr)
		add_theme_font_override("bold_font", vcr)
		add_theme_font_override("bold_italics_font", vcr)
	elif index == 1:
		add_theme_font_override("normal_font", crt)
		add_theme_font_override("mono_font", crt)
		add_theme_font_override("italics_font", crt)
		add_theme_font_override("bold_font", crt)
		add_theme_font_override("bold_italics_font", crt)
		
