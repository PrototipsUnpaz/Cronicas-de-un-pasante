extends Area2D

@onready var popup_scene          = preload("res://Scenes/Mensaje/mensaje_darcafedelsuelo.tscn")
@onready var evento_darcafe_scene = preload("res://Scenes/Eventos/evento_darcafedelpiso.tscn")
var popup_instance: Node2D        = null

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		mostrar_popup()

func mostrar_popup():
	if popup_instance:
		return
	popup_instance = popup_scene.instantiate()
	get_parent().add_child(popup_instance)
	popup_instance.global_position = global_position + Vector2(0, -100)

	# ⁉️ Aquí usamos Callable para conectar la señal directamente
	popup_instance.aceptado.connect( Callable(self, "_on_popup_aceptado") )
	popup_instance.rechazado.connect( Callable(self, "_on_popup_rechazar") )

func _on_popup_aceptado():
	popup_instance.queue_free()
	popup_instance = null
	var evento = evento_darcafe_scene.instantiate()
	get_tree().get_root().add_child(evento)

func _on_popup_rechazar():
	popup_instance.queue_free()
	popup_instance = null
