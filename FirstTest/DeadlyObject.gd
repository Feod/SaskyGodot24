extends Area2D

signal player_killed

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is RigidBody2D and body.name.begins_with("Player"):
		emit_signal("player_killed", body)
		body.queue_free()
