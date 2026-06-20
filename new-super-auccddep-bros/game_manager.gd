extends Node2D

var shroom : PackedScene = preload("res://mushroom.tscn")

func reset_game():
	get_tree().reload_current_scene()

func hurt_mario():
	$Mario.hurt()
	
func heal_mario():
	$Mario.health = 2

func jump_mario():
	$Mario.jump()

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Mario"):
		$CanvasLayer.visible = true

func spawn_mush():
	var new_shroom = shroom.instantiate()
	new_shroom.global_position = $Mario.global_position
	new_shroom.global_position.y -= 50
	add_child(new_shroom)
