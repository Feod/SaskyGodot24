extends RigidBody2D

var force: Vector2 = Vector2(0, -1000)
var pulse_interval: float = 1.0
var timer: float = 0.0

func _ready() -> void:
    timer = pulse_interval

func _process(delta: float) -> void:
    timer -= delta
    if timer <= 0:
        apply_central_impulse(force)
        timer = pulse_interval
