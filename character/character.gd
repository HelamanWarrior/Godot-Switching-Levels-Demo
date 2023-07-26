extends CharacterBody2D

var speed = 120
var jump_speed = 175
const GRAVITY = 700
const MAX_FALL_SPEED = 300

@onready var sprite = $Sprite2D
@onready var sprite_animation_player = $Sprite2D/AnimationPlayer

func _process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed
		
		if is_on_floor():
			sprite_animation_player.play("run")
		
		sprite.rotation_degrees = lerp(sprite.rotation_degrees, 15.0, 0.2)
		sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		
		if is_on_floor():
			sprite_animation_player.play("run")
		
		sprite.rotation_degrees = lerp(sprite.rotation_degrees, -15.0, 0.2)
		sprite.flip_h = true
	else:
		if is_on_floor():
			sprite_animation_player.play("idle")
		
		sprite.rotation_degrees = lerp(sprite.rotation_degrees, 0.0, 0.2)
		
		velocity.x = 0
	
	if !is_on_floor():
		velocity.y = move_toward(velocity.y, MAX_FALL_SPEED, GRAVITY * delta)
		
		if velocity.y > 0:
			sprite_animation_player.play("fall")
		else:
			sprite_animation_player.play("jump")
	elif Input.is_action_just_pressed("jump"):
		velocity.y = -jump_speed
	else:
		velocity.y = 1
	
	if global_position.y > 200:
		global_position.y = -50

func _physics_process(delta):
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
