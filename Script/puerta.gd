# Puerta.gd
extends Area2D

@onready var popup_scene = preload("res://Scenes/Mensaje/mensaje_empezar_emprendimiento.tscn")
@onready var evento_puerta_scene = preload("res://Scenes/Eventos/evento_empezar_emprendimiento.tscn")

var popup_instance: Node2D = null

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		mostrar_popup()

func mostrar_popup():
	if popup_instance:
		return

	popup_instance = popup_scene.instantiate()
	get_parent().add_child(popup_instance)
	popup_instance.global_position = global_position + Vector2(0, -100)

	# Conectar señales usando Callable en Godot 4
	popup_instance.aceptado.connect(self._on_popup_aceptado)
	popup_instance.rechazado.connect(self._on_popup_rechazado)

func _on_popup_aceptado():
	popup_instance.queue_free()
	print("hola")
	Global.edad += 20
	Global.moral += 5
	get_tree().change_scene_to_file("res://Scenes/Eventos/evento_empezar_emprendimiento.tscn")
	popup_instance = null


func _on_popup_rechazado():
	popup_instance.queue_free()
	popup_instance = null
