extends Area2D

@export var SPEED = 100.0
var DIRECTION = Vector2.UP

func _ready() -> void:
	get_tree().create_timer(5.0).timeout.connect(func(): queue_free())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += SPEED * DIRECTION * delta
