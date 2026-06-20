extends CharacterBody2D

var can_turn : bool = true

func _ready() -> void:
	velocity.x = -40

func _physics_process(delta: float) -> void:
	velocity.y = 250
	move_and_slide()
	if is_on_wall() and can_turn:
		velocity.x *= -1
		can_turn = false
		$Timer.start()
		print("ok")

func _on_timer_timeout() -> void:
	can_turn = true
