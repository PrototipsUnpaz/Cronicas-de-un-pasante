extends CanvasLayer

@export var tiempo_inicial: float = 30.0

var tiempo_actual: float = 0.0

# Referencia al ProgressBar
@onready var barra = $TextureProgressBar

func _ready():
	tiempo_actual = tiempo_inicial
	barra.value = tiempo_actual

func _process(delta):
	if tiempo_actual > 0:
		tiempo_actual -= delta
		tiempo_actual = max(tiempo_actual, 0)  # Evita que sea negativo
		barra.value = tiempo_actual

		if tiempo_actual == 0:
			print("¡Tiempo agotado!")
			get_tree().change_scene_to_file("res://Scenes/sin_tiempo.tscn")
