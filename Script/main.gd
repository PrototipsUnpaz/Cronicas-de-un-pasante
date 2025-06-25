extends Node2D

@onready var moneda = $Monedas
@onready var hud_d = $Hud/VBoxContainer/HBoxContainer2/Label_dinero

func _ready():
	print("hud_d es: ", hud_d)
	for monedas in moneda.get_children():
		if monedas.has_signal("act_hud_dinero"):
			monedas.act_hud_dinero.connect(actualizar_hud_dinero)

func actualizar_hud_dinero():
	hud_d.text = str(Global.dinero)
