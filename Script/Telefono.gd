extends Area2D

@onready var popup_scene = preload("res://Scenes/Mensaje/Mensaje_Delivery.tscn")
@onready var evento_delivery_scene = preload("res://Scenes/Eventos/evento_delivery_final.tscn")

var popup_instance: Node2D = null  # guardamos la instancia para no duplicar

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		mostrar_popup()

func mostrar_popup():
	# Si ya está en pantalla, no hacemos nada
	if popup_instance:
		return

	# Instanciamos el popup y lo añadimos al mismo padre que este teléfono
	popup_instance = popup_scene.instantiate()
	get_parent().add_child(popup_instance)

	# Lo posicionamos justo encima del teléfono:
	# ajustá el -100 según el tamaño de tu sprite
	popup_instance.global_position = global_position + Vector2(0, -100)

	# Conectamos las señales y, al cerrarlo, limpiamos la instancia
	popup_instance.aceptado.connect(_on_popup_aceptado)
	popup_instance.rechazado.connect(_on_popup_rechazar)

func _on_popup_aceptado():
	# liberamos popup y reset
	popup_instance.queue_free()
	popup_instance = null


func _on_popup_rechazar():
	popup_instance.queue_free()
	popup_instance = null
