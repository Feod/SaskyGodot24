extends Node

class_name PlayerManager
static var instance: PlayerManager

var playersCenter : Vector2
var players : Array


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
		playersCenter += player.global_position
		# print(player)
		
	playersCenter = playersCenter / players.size()
	

func AddPNewPlayer(newplayer):
	players.push_back(newplayer)
