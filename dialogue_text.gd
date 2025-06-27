extends RichTextLabel

@export var no_portrait_size = 771
@export var no_portrait_pos = 18
@export var portrait_pos_offset = 219


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
	
	var slant = 0.2
	var italic_transform = Transform2D(Vector2(1.0, slant), Vector2.DOWN, Vector2.ZERO)
	var emboldening_factor = 0.5
	
	var vcr_italic = FontVariation.new()
	var vcr_bold = FontVariation.new()
	var vcr_bold_italic = FontVariation.new()
	vcr_italic.base_font = vcr
	vcr_bold.base_font = vcr
	vcr_bold_italic.base_font = vcr
	
	vcr_italic.variation_transform = italic_transform
	vcr_bold_italic.variation_transform = italic_transform
	vcr_bold.variation_embolden = emboldening_factor
	vcr_bold_italic.variation_embolden = emboldening_factor
		
	var crt_italic = FontVariation.new()
	var crt_bold = FontVariation.new()
	var crt_bold_italic = FontVariation.new()
	crt_italic.base_font = crt
	crt_bold.base_font = crt
	crt_bold_italic.base_font = crt
	
	crt_italic.variation_transform = italic_transform
	crt_bold_italic.variation_transform = italic_transform
	crt_bold.variation_embolden = emboldening_factor
	crt_bold_italic.variation_embolden = emboldening_factor

	
	
	if index == 0:
		add_theme_font_override("normal_font", vcr)
		#add_theme_font_override("mono_font", vcr)
		add_theme_font_override("italics_font", vcr_italic)
		add_theme_font_override("bold_font", vcr_bold)
		add_theme_font_override("bold_italics_font", vcr_bold_italic)
	elif index == 1:
		add_theme_font_override("normal_font", crt)
		#add_theme_font_override("mono_font", crt)
		add_theme_font_override("italics_font", crt_italic)
		add_theme_font_override("bold_font", crt_bold)
		add_theme_font_override("bold_italics_font", crt_bold_italic)
		


func _on_box_height_slider_value_changed(value):
	size.y = 142 - value
