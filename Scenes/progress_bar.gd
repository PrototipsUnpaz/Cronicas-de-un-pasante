extends ProgressBar

func _ready() -> void:
	set_value_no_signal(Global.moral)
