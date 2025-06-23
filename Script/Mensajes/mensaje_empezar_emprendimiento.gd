# mensaje_puerta.gd
extends Node2D

@onready var boton_aceptar  = $TextureRect/BotonAceptar
@onready var boton_rechazar = $TextureRect/BotonRechazar

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

func _on_rechazar():
	emit_signal("rechazado")
	queue_free()
