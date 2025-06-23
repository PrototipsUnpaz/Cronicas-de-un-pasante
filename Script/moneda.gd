extends TextureButton


signal act_hud_dinero

func _ready() -> void:
	pass # Replace with function body.


func _on_pressed() -> void:
	Global.sumar_dinero()
	emit_signal("act_hud_dinero")
	queue_free()
