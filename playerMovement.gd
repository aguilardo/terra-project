extends CharacterBody2D


@export var SPEED = 300.0

var velocity_custom : Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	
	velocity = velocity_custom
	move_and_slide()

func _process(delta: float) -> void:
	var direction_x := Input.get_axis("left", "right")
	if direction_x:
		velocity_custom.x = direction_x * SPEED
	else:
		velocity_custom.x = move_toward(velocity.x, 0, SPEED)
	
	var direction_y := Input.get_axis("down", "up")
	direction_y = -direction_y
	if direction_y:
		velocity_custom.y = direction_y * SPEED
	else:
		velocity_custom.y = move_toward(velocity.y, 0, SPEED)
