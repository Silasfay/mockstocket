extends Node2D

@export var newsBank : VBoxContainer
@export var stocks : Node2D
@export var time : Label
@export var mainMenu : PackedScene

var newsNodes : Array = []
var stockNodes : Array = []

var stockChoices : Array = ["Aluminum", "Coal", "Copper", "Iron", "Jade", "Marble", "Niter", "Oil", "Stone", "Crabs", "Deer", "Fish", "Horses", "Sheep", "Coffee", "Rice", "Sugar", "Wheat"]

var timeElaped : float = 0.0

func _ready():
	stockNodes = stocks.get_children()
	
	## Initializes each stock to random unique stock, random volitility and a value between $100 and $500
	for eachStock in stockNodes:
		var name = stockChoices.pop_at(randi() % stockChoices.size())
		eachStock.volatility = randf_range(0.05, 0.25)
		eachStock.nameLabel.text = name
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
	var convertedTime = 34200 + (timeElaped * 1130)
	
	@warning_ignore("narrowing_conversion")
	var hour = fmod(floor(convertedTime/3600),12)
	if hour == 0 : hour = 12
	time.get_node("Hours").text = "%02d" % hour
	
	@warning_ignore("narrowing_conversion")
	var minutes = fmod(convertedTime, 3600) / 60
	time.get_node("Minutes").text = "%02d" % minutes
	
	if convertedTime > 43200 : time.get_node("AMPM").text = "PM"
	print(convertedTime)
	
	if convertedTime > 57600 : gameEnds()

func gameEnds():
	get_tree().paused = true
	#do stuff
