extends Area2D

signal coin_collected

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is RigidBody2D and body.name.begins_with("Player"):
		emit_signal("coin_collected", body)
		queue_free()
