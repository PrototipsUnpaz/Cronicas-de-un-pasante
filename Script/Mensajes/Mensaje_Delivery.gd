extends CanvasLayer

@onready var boton_aceptar  = $"Imagen del cartel"/BotonAceptar
@onready var boton_rechazar = $"Imagen del cartel"/BotonRechazar

signal aceptado
signal rechazado

func _ready():
	print("Aceptar encontrado?: ", boton_aceptar != null)
	print("Rechazar encontrado?: ", boton_rechazar != null)

	boton_aceptar.pressed.connect(_on_aceptar)
	boton_rechazar.pressed.connect(_on_rechazar)

func _on_aceptar():
	emit_signal("aceptado")
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/evento_delivery.tscn")

func _on_rechazar():
	emit_signal("rechazado")
	queue_free()
