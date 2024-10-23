extends Node

@export var PlayerRigidBody : RigidBody2D
@export var move_speed: float = 500.0  # Control the force applied for movement

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Add player to the player manager
	# PlayerManager.instance.AddPNewPlayer(self)
	PlayerManager.instance.AddPNewPlayer(PlayerRigidBody)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_select"):
		PlayerRigidBody.apply_central_impulse(Vector2(0,-1000))
	
	# Get the input directions (arrow keys)
	var direction := Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	# Normalize the direction to prevent faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()
	# Apply force to the RigidBody2D
	PlayerRigidBody.apply_central_force(direction * move_speed)

func destroy_player(player: RigidBody2D) -> void:
	player.queue_free()
