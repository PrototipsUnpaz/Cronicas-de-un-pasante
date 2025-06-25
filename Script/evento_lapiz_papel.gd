extends TextureButton

func _on_pressed() -> void:
	if Global.edad >= 60:
		get_tree().change_scene_to_file("res://Scenes/Eventos/game_over_edad.tscn")
	elif Global.moral == 0:
		get_tree().change_scene_to_file("res://Scenes/Eventos/game_over_moral.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/Eventos/good_ending.tscn")
