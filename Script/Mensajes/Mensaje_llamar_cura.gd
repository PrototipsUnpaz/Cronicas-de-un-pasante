extends Node2D

@onready var boton_aceptar  = $"Imagen del cartel/BotonAceptar"
@onready var boton_rechazar = $"Imagen del cartel/BotonRechazar"

signal aceptado
signal rechazado

func _ready():
	# Conexiones de botones
	boton_aceptar.pressed.connect(_on_aceptar)
	boton_rechazar.pressed.connect(_on_rechazar)

func _on_aceptar():
	emit_signal("aceptado")
	queue_free()

func _on_rechazar():
	emit_signal("rechazado")
	queue_free()
