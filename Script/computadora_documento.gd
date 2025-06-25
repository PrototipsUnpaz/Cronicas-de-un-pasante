# Computadora.gd
extends Area2D

@onready var popup_scene             = preload("res://Scenes/Mensaje/mensaje_documento_computadora.tscn")
@onready var evento_computadora_scene = preload("res://Scenes/Eventos/Evento_DocumentoComputadora.tscn")
var popup_instance: Node2D           = null

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		mostrar_popup()

func mostrar_popup():
	if popup_instance:
		return
	popup_instance = popup_scene.instantiate()
	get_parent().add_child(popup_instance)
	# Ajusta este offset para que el mensaje quede sobre la computadora
	popup_instance.global_position = global_position + Vector2(0, -100)
	popup_instance.aceptado.connect(_on_popup_aceptar)
	popup_instance.rechazado.connect(_on_popup_rechazar)

func _on_popup_aceptar():
	popup_instance.queue_free()
	Global.dinero += 20
	Global.moral -= 20
	get_tree().change_scene_to_file("res://Scenes/Eventos/Evento_DocumentoComputadora.tscn")
	popup_instance = null
	

func _on_popup_rechazar():
	popup_instance.queue_free()
	popup_instance = null
