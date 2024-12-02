extends Node2D

@export var newsBank : VBoxContainer
@export var playerNode : PackedScene
@export var stocks : Node2D
@export var time : Label
@export var mainMenu : PackedScene
@export var portfolioManager : PortfolioManager

var newsNodes : Array = []
var stockNodes : Array = []
var players : Array = []

var stockChoices : Array = ["Aluminum", "Coal", "Copper", "Iron", "Jade", "Marble", "Niter", "Oil", "Stone", "Crabs", "Deer", "Fish", "Horses", "Sheep", "Coffee", "Rice", "Sugar", "Wheat"]

var timeElaped : float = 0.0

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
			portfolioManager.activePlayers.append(newPlayer)
			add_child(newPlayer)
	if !connectedControllers:
		var newPlayer : Player = playerNode.instantiate()
		var playerColor = Color(randf_range(0,1),randf_range(0,1),randf_range(0,1),1)
		newPlayer.device = -1
		newPlayer.position = Vector2(randf_range(600,1700), randf_range(200,950))
		newPlayer.playerColor = playerColor
		newPlayer.playerNumber = 1
		portfolioManager.activePlayers.append(newPlayer)
		add_child(newPlayer)

func _ready():
	## Check if controllers are set. If there are controllers, spawn a player for each connected controller. If not, spawn only one for keyboard input. Sends player data to portfolio manager to hook each portfolio to a spawned player.
	checkControllers()
	portfolioManager.start()
	
	## Initializes each stock to random unique stock, random volitility and a value between $100 and $500
	stockNodes = stocks.get_children()
	for eachStock in stockNodes:
		var playerName = stockChoices.pop_at(randi() % stockChoices.size())
		eachStock.volatility = randf_range(0.05, 0.25)
		eachStock.nameLabel.text = playerName
		eachStock.value = randf_range(100.0,500.0)
		eachStock.start()

func impactStocks(stock : String, impact : int):
	for eachStock in stockNodes:
			eachStock.newsBreak(stock, impact)

func _process(delta):
	## Resets to title screen
	if Input.is_action_just_pressed("Reset") : get_tree().change_scene_to_packed(mainMenu)
	
	## Handles clock. Initializes at 9:30AM. Time moves at x130 speed, to ensure game ends in 3 minutes, displaying 4:00PM. (Total 6Hours 30Minutes ingame)
	timeElaped += delta
	var convertedTime = 34200 + (timeElaped * 130)
	
	@warning_ignore("narrowing_conversion")
	var hour = fmod(floor(convertedTime/3600),12)
	if hour == 0 : hour = 12
	time.get_node("Hours").text = "%02d" % hour
	
	@warning_ignore("narrowing_conversion")
	var minutes = fmod(convertedTime, 3600) / 60
	time.get_node("Minutes").text = "%02d" % minutes
	
	if convertedTime > 43200 : time.get_node("AMPM").text = "PM"
	
	if convertedTime > 57600 : gameEnds()

func gameEnds():
	get_tree().paused = true
	#do stuff
