extends Control

@export var StartingButton :Button
@export_file var MainScene 
@export var playerNode : PackedScene
var PlayerArray = [] 
@export var TutNode :PackedScene
@export_file var TutorialS 

# Called when the node enters the scene tree for the first time.
func _ready():
	checkControllers()
	StartingButton.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func checkControllers():
	var connectedControllers = Input.get_connected_joypads()
	if connectedControllers:
		for each in connectedControllers:
			var newPlayer : Player = playerNode.instantiate()
			var playerColor = Color(randf_range(0,1),randf_range(0,1),randf_range(0,1),1)
			newPlayer.device = each
			newPlayer.position = Vector2(randf_range(600,1700), randf_range(200,950))
			newPlayer.playerColor = playerColor
			newPlayer.playerNumber = each+1
			#portfolioManager.activePlayers.append(newPlayer)
			add_child(newPlayer)
			PlayerArray.append(newPlayer)
	if !connectedControllers:
		var newPlayer : Player = playerNode.instantiate()
		var playerColor = Color(randf_range(0,1),randf_range(0,1),randf_range(0,1),1)
		newPlayer.device = -1
		newPlayer.position = Vector2(randf_range(600,1700), randf_range(200,950))
		newPlayer.playerColor = playerColor
		newPlayer.playerNumber = 1
		#portfolioManager.activePlayers.append(newPlayer)
		add_child(newPlayer)
		PlayerArray.append(newPlayer)


func _on_start_button_pressed() -> void:
	var TutorialPass = TutNode.instantiate()
	TutorialPass.get_array(PlayerArray)
	get_tree().change_scene_to_file(TutorialS)
