extends Node

# Lista de pistas
const TRACKS = [
	preload("res://Musica/Cancion menu.mp3"),
	preload("res://Musica/Cancion Menu 2.mp3"),
]

# 2) Índice de la pista actual
var current: int = 0

# 3) Referencia al AudioStreamPlayer (usando la anotación @onready)
@onready var player: AudioStreamPlayer = $Player

func _ready() -> void:
	# Conecta la señal "finished" al callback
	player.finished.connect(_on_track_finished)
	_play_current()

func _play_current() -> void:
	player.stream = TRACKS[current]
	player.play()

func _on_track_finished() -> void:
	current = (current + 1) % TRACKS.size()
	_play_current()
