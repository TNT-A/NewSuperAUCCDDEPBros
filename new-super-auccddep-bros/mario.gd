extends CharacterBody2D
class_name Platformer

@onready var base_mod = $Sprite2D.modulate

@export var host : CharacterBody2D
@export var speed : int = 300
@export var acceleration : float = 0.2

@export var GRAVITY : float = 2200
@export var FALL_GRAVITY : float = 2500
@export var JUMP_POWER : float = 800

var health : int = 1

func _physics_process(delta: float) -> void:
	fall(delta)
	move()
	host.move_and_slide()
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		jump()
	if health == 0:
		get_parent().reset_game()
	if health == 1:
		$Sprite2D.scale.y = .05
		$Sprite2D.modulate = base_mod
	if health == 2:
		$Sprite2D.scale.y = .09
		$Sprite2D.modulate = base_mod
	if health == 3:
		$Sprite2D.scale.y = .09
		$Sprite2D.modulate = Color.RED

func hurt():
	health -= 1
	$Hitbox/CollisionShape2D.disabled = true
	await get_tree().create_timer(1).timeout
	$Hitbox/CollisionShape2D.disabled = false

func jump():
	host.velocity.y = -JUMP_POWER

func fall(delta):
	host.velocity.y += use_gravity() * delta

func use_gravity():
	if host.velocity.y > 0:
		#print("gave heavy")
		return FALL_GRAVITY
	else:
		#print("gave light")
		return GRAVITY

func get_direction():
	var input : Vector2 = Vector2()
	if Input.is_action_pressed("Left"):
		input.x -=1
	if Input.is_action_pressed("Right"):
		input.x +=1
	return input

func move():
	var dir = get_direction()
	host.velocity.x = lerp(host.velocity.x, dir.x * speed, acceleration)
	if host.velocity.x > 0:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
