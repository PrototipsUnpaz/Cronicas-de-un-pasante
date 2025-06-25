extends TextureButton

func _on_pressed() -> void:
	Global.nivel = 2
	get_tree().change_scene_to_file("res://Scenes/main2.tscn")
