extends CharacterBody2D

@export var speed: int = 80
var direction := Vector2.ZERO

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Gerakan player
	velocity = direction.normalized() * speed
	move_and_slide()

	# Atur animasi
	if direction != Vector2.ZERO:
		if direction.x > 0:
			anim_sprite.play("walk_right")
		elif direction.x < 0:
			anim_sprite.play("walk_left")
		elif direction.y > 0:
			anim_sprite.play("walk")
		elif direction.y < 0:
			anim_sprite.play("walk_back")
	else:
		anim_sprite.play("idle")
