extends CanvasLayer

var moneda : int = 50

func _on_coin_button_pressed() -> void:
	print("HolaManola")
	moneda += 1
	print(moneda)
	$contador_money.text = str(moneda)
