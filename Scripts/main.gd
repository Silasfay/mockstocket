extends Node2D

var playerScene = load("res://scenes/player.tscn")
var StockHandler = load("res://Scripts/stock_handler.gd")
var stockScreenScene = load("res://scenes/stock_screen.tscn")

var stockHandler

const STOCK_COUNT = 4
var stockScreens = []

var StockScreenSize = Vector2(350,200)

var StockScreenCountX = 2
var StockScreenPadding = Vector2(5,5)

func _ready():
	var playerInstance = playerScene.instantiate()
	add_child(playerInstance)
	stockHandler = StockHandler.new(STOCK_COUNT)
	add_child(stockHandler)

	for n in STOCK_COUNT:
		var stockScreen : StockScreen = stockScreenScene.instantiate()
		stockScreens.append(stockScreen)
		
		var xCoord = n%StockScreenCountX
		var yCoord = n/StockScreenCountX
		print(str(xCoord," ",yCoord))
		
		stockScreen.position = Vector2((StockScreenSize+StockScreenPadding)*Vector2(xCoord,yCoord))
		print(stockScreen.position)
		
		add_child(stockScreens[n])

func _process(delta: float) -> void:
	var stocks = stockHandler.process(delta)
	for n in STOCK_COUNT:
		stockScreens[n].update(stocks[n])
		
