extends Node

class_name PlayerManager
static var instance: PlayerManager

var playersCenter : Vector2
var players : Array
@export var player_scene: PackedScene


func _init():
	instance = self

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if players.size() == 0:
		return
	
	playersCenter = Vector2.ZERO;
	
	for player in players:
		if(player != null):
			playersCenter += player.global_position
		# print(player)
		
	playersCenter = playersCenter / players.size()
	
	if Input.is_action_just_pressed("ui_select"):
		spawn_player()

func AddPNewPlayer(newplayer):
	players.push_back(newplayer)

func RemovePlayer(player):
	players.erase(player)
	player.queue_free()

func spawn_player():
	var new_player = player_scene.instantiate()
	add_child(new_player)
	players.push_back(new_player)
