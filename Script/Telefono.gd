# Script/Telefono.gd
extends Area2D

@onready var popup_scene = preload("res://Scenes/Mensaje_Delivery.tscn")
@onready var evento_delivery_scene = preload("res://Scenes/evento_delivery.tscn")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		mostrar_popup()

func mostrar_popup():
	var popup = popup_scene.instantiate()
	get_tree().get_root().add_child(popup)
	
	# Conecta las señales SIN parámetros extras:
	popup.aceptado.connect(_on_popup_aceptado)
	popup.rechazado.connect(_on_popup_rechazado)

func _on_popup_aceptado():
	# Aquí instanciás lo que quieras al aceptar
	var evento = evento_delivery_scene.instantiate()
	get_tree().get_root().add_child(evento)
	# el popup ya se liberó solo con queue_free() del Mensaje_Delivery

func _on_popup_rechazado():
	# nada más que hacer, el popup se cerró solo
	pass
