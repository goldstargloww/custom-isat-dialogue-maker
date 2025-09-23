extends MarginContainer

var layer # set by add_layer_button.gd


func _on_image_button_pressed() -> void:
	$FileDialog.popup()


func _on_file_dialog_file_selected(path: String) -> void:
	var image = ImageTexture.create_from_image(Image.load_from_file(path))
	layer.texture = image
	%Thumbnail.texture = image
	layer.update()
	

func _on_visibility_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		layer.hide()
		%Thumbnail.modulate.a = 0.5
	else:
		layer.show()
		%Thumbnail.modulate.a = 1.0
