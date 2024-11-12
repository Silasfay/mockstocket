extends Node2D

var playerScene = load("res://scenes/player.tscn")
var StockHandler = load("res://Scripts/stock_handler.gd")

var stockHandler


func _ready():
	var playerInstance = playerScene.instantiate()
	add_child(playerInstance)
	stockHandler = StockHandler.new(5)

	add_child(stockHandler)

func _process(delta: float) -> void:
	#update stocks
	#update visuals
	#recalculate players earnings
	#tick time down
	
	
	
	var stockInfo = stockHandler.process(delta)
	$StockScreen.update("update!")
