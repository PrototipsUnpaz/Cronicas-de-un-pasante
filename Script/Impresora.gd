# impresora.gd
extends Area2D

@onready var popup_scene        = preload("res://Scenes/Mensaje/Mensaje_LlamarCura.tscn")
@onready var evento_cura_scene  = preload("res://Scenes/Eventos/evento_cura.tscn")
@onready var anim_posesion      = $AnimatedSprite2D    # <— aquí

var popup_instance: Node2D = null

func _ready():
	var t = Timer.new()
	t.wait_time = 3.0
	t.one_shot = false
	t.autostart = true
	add_child(t)
	t.timeout.connect(_on_timer_timeout)

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		mostrar_popup()

func mostrar_popup():
	if popup_instance: return
	popup_instance = popup_scene.instantiate()
	get_parent().add_child(popup_instance)
	popup_instance.global_position = global_position + Vector2(0, -100)
	popup_instance.aceptado.connect(_on_popup_aceptado)
	popup_instance.rechazado.connect(_on_popup_rechazar)

func _on_popup_aceptado():
	popup_instance.queue_free()
	popup_instance = null
	Global.moral += 10
	Global.dinero -= 20
	if Global.dinero >= (-1):
		Global.dinero = 0
	get_tree().change_scene_to_file("res://Scenes/Eventos/evento_cura.tscn")

func _on_popup_rechazar():
	popup_instance.queue_free()
	popup_instance = null

func _on_timer_timeout():
	if anim_posesion:
		# "ImpresoraPoseida" es el nombre de la animación dentro del AnimatedSprite2D
		anim_posesion.play("ImpresoraPoseida")
	else:
		push_warning("No se encontró $AnimatedSprite2D")
