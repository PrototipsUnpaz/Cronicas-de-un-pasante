extends CharacterBody2D

@export var speed: float = 300.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D  # Ajusta si tu ruta es distinta

# Flag que indica si estamos en Main
var en_main: bool = false

func _ready() -> void:
	if anim and anim.sprite_frames:
		print("Animaciones disponibles: ", anim.sprite_frames.get_animation_names())
	else:
		push_error("sprite_frames nulo o nodo AnimatedSprite2D no encontrado")

	get_tree().connect("scene_changed", Callable(self, "_on_scene_changed"))
	_on_scene_changed(get_tree().current_scene)

func _physics_process(delta: float) -> void:
	var input_vec = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if input_vec.length() > 0:
		input_vec = input_vec.normalized()
		velocity = input_vec * speed

		# Animación de correr según la escena
		if en_main:
			anim.play("CorrerDesesperado")
		else:
			anim.play("Run")
		anim.flip_h = input_vec.x < 0
	else:
		velocity = Vector2.ZERO
		# Animación de idle según la escena
		if en_main:
			anim.play("IdleDesesperado")
		else:
			anim.play("Idle")

	move_and_slide()

func _on_scene_changed(new_scene: Node) -> void:
	en_main = new_scene.name == "Main"
