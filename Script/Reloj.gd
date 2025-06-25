extends CanvasLayer

@export var tiempo_inicial: float = 30.0
var tiempo_actual: float = 0.0

@onready var barra: TextureProgressBar = $TextureProgressBar

func _ready() -> void:
	# Conecta la señal scene_changed con un Callable
	get_tree().connect("scene_changed", Callable(self, "_on_scene_changed"))
	# Llamada inicial para ajustar el estado según la escena actual
	_on_scene_changed(get_tree().current_scene)

func _process(delta: float) -> void:
	if tiempo_actual > 0:
		tiempo_actual -= delta
		tiempo_actual = max(tiempo_actual, 0)
		barra.value = tiempo_actual

		if tiempo_actual == 0:
			print("¡Tiempo agotado!")
			Global.moral -= 25
			get_tree().change_scene_to_file("res://Scenes/Eventos/sin_tiempo_1.tscn")

func _on_scene_changed(new_scene: Node) -> void:
	# Cambia "Main" por el nombre exacto de tu escena principal sin extensión
	if new_scene.name == "Main":
		# Entramos a Main: resetea y activa el contador
		tiempo_actual = tiempo_inicial
		barra.value = tiempo_actual
		set_process(true)
	else:
		# Salimos de Main: detén el contador y resetea la barra
		set_process(false)
		tiempo_actual = tiempo_inicial
		barra.value = tiempo_actual
