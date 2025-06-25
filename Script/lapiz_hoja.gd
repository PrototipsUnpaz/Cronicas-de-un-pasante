# lapizPapel.gd
extends Area2D

@onready var popup_scene           = preload("res://Scenes/Mensaje/mensaje_lapiz_papel.tscn")
@onready var evento_lapiz_scene    = preload("res://Scenes/Eventos/evento_lapiz_papel.tscn")
var popup_instance: Node2D         = null


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		mostrar_popup()

func mostrar_popup():
	if popup_instance:
		return
	# Instanciamos el mensaje
	popup_instance = popup_scene.instantiate()
	get_parent().add_child(popup_instance)
	# Ajusta el offset según tu sprite
	popup_instance.global_position = global_position + Vector2(0, -100)
	# Conectamos señales
	popup_instance.aceptado.connect(_on_popup_aceptar)
	popup_instance.rechazado.connect(_on_popup_rechazar)

func _on_popup_aceptar():
	popup_instance.queue_free()
	popup_instance = null
	Global.edad += 20
	Global.moral += 10
	get_tree().change_scene_to_file("res://Scenes/Eventos/evento_lapiz_papel.tscn")

func _on_popup_rechazar():
	popup_instance.queue_free()
	popup_instance = null
