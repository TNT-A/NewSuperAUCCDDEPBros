extends CharacterBody2D

func _ready() -> void:
	velocity.x = 50

func _physics_process(delta: float) -> void:
	velocity.y = 200
	move_and_slide()

#func _on_ouchy_zone_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#get_parent().queue_free()
