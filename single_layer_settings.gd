extends HBoxContainer


var layer_rect

func _ready():
	pass


func _process(_delta):
	pass


func _on_layer_clear_button_pressed():
	layer_rect.texture = null
	%LayerPreview.texture = null
	layer_rect.get_parent().update_position()


func _on_layer_change_button_pressed():
	$FileDialog.popup()


func _on_file_dialog_file_selected(path):
	var image = ImageTexture.create_from_image(Image.load_from_file(path))
	layer_rect.texture = image
	%LayerPreview.texture = image
	layer_rect.get_parent().update_position()
