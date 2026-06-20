extends Area2D

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Mario"):
		get_parent().get_parent().jump_mario()
		get_parent().queue_free()
