
extends Node2D   # o lo que uses

func _ready():
	Global.edad += 1
	if not Music.is_playing():
		Music.play()
