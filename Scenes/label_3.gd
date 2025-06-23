extends Label

var edad = Global.edad

func _ready() -> void:
	text = str(edad)

func actualizar_edad():
	text = str(edad)
