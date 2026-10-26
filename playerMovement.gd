extends CharacterBody2D


@export var SPEED = 300.0
@export var ACCELERATION = 500.0
@export var FRICTION = 100.0
@export var ROTATION_SPEED = 2.0
@export var bullet_scene: PackedScene


func _physics_process(delta: float) -> void:
	
	var direction_x := Input.get_axis("left", "right")
	rotation += ROTATION_SPEED * delta * direction_x
	
	var move_dir = Vector2.UP.rotated(rotation) * SPEED * delta
	if Input.is_action_pressed("up"):
		
		velocity += move_dir
	#direction_y = -direction_y
	#if direction_y != 0.0:
		#velocity.y = move_toward(velocity.y, direction_y * SPEED, ACCELERATION * delta)
	#else:
		#velocity.y = move_toward(velocity.y, 0, FRICTION * delta)

	if Input.is_action_pressed("down"):
		var bullet = bullet_scene.instantiate()
		bullet.position = position
		bullet.DIRECTION = Vector2.UP.rotated(rotation)
		get_tree().current_scene.add_child(bullet)
		
	move_and_slide()
	queue_redraw()

func _draw():
	draw_line(Vector2(0, 0), Vector2.UP * 100, Color.GREEN, 1.0)
