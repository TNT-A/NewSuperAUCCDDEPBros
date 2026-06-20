extends Camera2D

func _process(delta: float) -> void:
	global_position.x = $"../Mario".global_position.x
	if $"../Mario".global_position.x < 320:
		global_position.x = 320
