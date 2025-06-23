# puerta_oficina.gd
extends Area2D

# Ruta a la escena de la oficina
@export_file("*.tscn") var escena_oficina := "res://Scenes/main.tscn"

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.pressed \
	and event.button_index == MOUSE_BUTTON_LEFT:
		entrar_oficina()


func entrar_oficina():
	get_tree().change_scene_to_file("res://Scenes/Eventos/nivel_1_intro.tscn")
