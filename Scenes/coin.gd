extends TextureButton


signal coin_colected

func _on_pressed() -> void:
	emit_signal("coin_collected")
	queue_free()
	
