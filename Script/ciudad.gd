
extends Node2D   # o lo que uses

func _ready():
	if not Music.is_playing():
		Music.play()
