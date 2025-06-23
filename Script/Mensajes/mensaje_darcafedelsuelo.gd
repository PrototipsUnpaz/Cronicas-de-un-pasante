# Mensaje_Darcafedelsuelo.gd
extends Node2D

# Referencias a los botones dentro de tu TextureRect
@onready var boton_aceptar  = $TextureRect/BotonAceptar
@onready var boton_rechazar = $TextureRect/BotonRechazar

# Señales que emitiremos al pulsar cada botón
signal aceptado
signal rechazado

func _ready():
	# Comprobaciones opcionales en consola
	print("Aceptar encontrado?: ", boton_aceptar != null)
	print("Rechazar encontrado?: ", boton_rechazar != null)

	# Conectamos las señales "pressed" de cada botón
	boton_aceptar.pressed.connect(_on_aceptar)
	boton_rechazar.pressed.connect(_on_rechazar)

func _on_aceptar():
	emit_signal("aceptado")
	Global.moral -= 30
	Global.edad += 1
	get_tree().change_scene_to_file("res://Scenes/Eventos/evento_cafe_del_piso_final.tscn")
	queue_free()

func _on_rechazar():
	emit_signal("rechazado")
	queue_free()
