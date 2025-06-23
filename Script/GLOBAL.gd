extends CanvasLayer

# Barra de Moral
var moral_minima = 0
var moral_maxima = 100
var moral: int = 50:
	set(value):
		moral = value
		if moral <= 0:
			game_over_moral()


# Edad y Dinero
var dinero = 0
var edad: int = 20:
	set(value):
		edad = value
		if edad >= 60:
			game_over_edad()


func _ready() -> void:
	dinero = 10
	edad = 20

func sumar_dinero():
	dinero += 10
	
func game_over_moral():
	get_tree().change_scene_to_file("res://Scenes/Eventos/game_over_moral.tscn")

func game_over_edad():
	get_tree().change_scene_to_file("res://Scenes/Eventos/game_over_edad.tscn")
