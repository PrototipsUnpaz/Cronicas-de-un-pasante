extends CanvasLayer

# Barra de Moral
var moral_minima = 0
var moral_maxima = 100
var moral = 50

# Edad y Dinero
var dinero = 0
var edad = 20

#Niveles
var nivel = 1

func _ready() -> void:
	dinero = 10
	edad = 20
	nivel = 1

func sumar_dinero():
	dinero += 10
	
