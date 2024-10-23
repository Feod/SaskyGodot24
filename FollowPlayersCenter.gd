extends Node

# Import PlayerManager from PlayerManager.gd
import "res://PlayerManager.gd"

# Variable to control the speed of the lerp
@export var lerp_speed: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the initial position to the players' center
	position = PlayerManager.instance.playersCenter

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Use lerp to move towards the players' center position
	position = position.lerp(PlayerManager.instance.playersCenter, lerp_speed)
