extends Label

var dinero = Global.dinero

func _ready() -> void:
	text = str(dinero)

func actualizar_dinero():
	text = str(dinero)
