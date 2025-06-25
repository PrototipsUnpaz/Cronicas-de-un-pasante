extends TextureButton


func _on_pressed() -> void:
	if Global.nivel == 2:
		get_tree().change_scene_to_file("res://Scenes/Eventos/game_over_moral.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/Ciudad2.tscn")
