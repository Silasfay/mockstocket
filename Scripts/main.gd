extends Node2D

var playerScene = load("res://scenes/player.tscn")
var stockScreenScene = load("res://scenes/stock_screen.tscn")
var Stock = load("res://Scripts/stock.gd")
var Portf = load("res://scenes/portfolio.tscn")

var stockHandler : StockHandler


var stockScreens = []

var StockScreenSize = Vector2(350,200)

var StockScreenCountX = 2
var StockScreenPadding = Vector2(5,5)

var STOCK_DATA = [
	{
		name = "Stock1",
		initialPPS = 100,
	},
	{
		name = "Stock2",
		initialPPS = 100,
	},
	{
		name = "Stock3",
		initialPPS = 100,
	},
	{
		name = "Stock4",
		initialPPS = 100,
	},
]
var STOCK_COUNT = STOCK_DATA.size()

var stocks = []

func _ready():
	var playerInstance = playerScene.instantiate()
	add_child(playerInstance)

	#playerInstance.portfolio = [] #TODO set these to zero

	for stockId in STOCK_COUNT:
		var stockData = STOCK_DATA[stockId]
		stockData.stock_id = stockId
		var stock = Stock.new(stockData.name,stockId)
		stocks.append(stock)
		
		var stockScreen : StockScreen = stockScreenScene.instantiate()
		
		stockScreen.setStock(stock)
		stockScreens.append(stockScreen)
		
		var xCoord = stockId%StockScreenCountX + 3
		var yCoord = stockId/StockScreenCountX + 3
		stockScreen.position = Vector2((StockScreenSize+StockScreenPadding)*Vector2(xCoord,yCoord))
		add_child(stockScreen)
		

		
		
		
	
		

func _process(delta: float) -> void:
	for n in STOCK_COUNT:
		var value = stocks[n].process(delta)
		stockScreens[n].add_price_point(value)
		
		
