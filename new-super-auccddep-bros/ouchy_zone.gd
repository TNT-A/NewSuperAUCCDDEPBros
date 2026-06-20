extends Area2D

@export var kills_you : bool = true
@export var hurts_you : bool = true
@export var helps_you : bool = false





func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Mario"):
		if hurts_you:
			get_parent().get_parent().hurt_mario()
		if kills_you:
			get_parent().get_parent().reset_game()
		if helps_you:
			get_parent().get_parent().heal_mario()
