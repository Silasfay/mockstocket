extends Node2D

@export var newsBank : VBoxContainer
@export var stocks : Node2D

var newsNodes : Array = []
var stockNodes : Array = []

var stockChoices : Array = ["Aluminum", "Coal", "Copper", "Iron", "Jade", "Marble", "Niter", "Oil", "Stone", "Crabs", "Deer", "Fish", "Horses", "Sheep", "Coffee", "Rice", "Sugar", "Wheat"]

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
