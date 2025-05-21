extends CharacterBody2D

@export var speed: float = 300.0


func _physics_process(delta: float) -> void:
	var input_vector: Vector2 = Vector2.ZERO

	input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if input_vector.length() > 0:
		input_vector = input_vector.normalized()

	velocity = input_vector * speed
	move_and_slide()
	
