extends CharacterBody2D

@export var speed: float = 300.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D  # Ajustá la ruta si tu nodo se llama distinto

func _ready():
	if anim and anim.sprite_frames:
		print("Animaciones disponibles: ", anim.sprite_frames.get_animation_names())
	else:
		push_error("sprite_frames nulo o nodo AnimatedSprite2D no encontrado")

func _physics_process(delta):
	var input_vec = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if input_vec.length() > 0:
		input_vec = input_vec.normalized()
		velocity = input_vec * speed
		
		anim.play("Run")
		anim.flip_h = input_vec.x < 0
	else:
		velocity = Vector2.ZERO
		anim.play("Idle")
	
	move_and_slide()
