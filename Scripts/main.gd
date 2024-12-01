extends Node2D

@export var newsBank : VBoxContainer
@export var stocks : Node2D

var newsNodes : Array = []
var stockNodes : Array = []
var activeNews : Array = []

var stockChoices : Array = ["Aluminum", "Coal", "Copper", "Iron", "Jade", "Marble", "Niter", "Oil", "Stone", "Crabs", "Deer", "Fish", "Horses", "Sheep", "Coffee", "Rice", "Sugar", "Wheat"]

func _ready():
	stockNodes = stocks.get_children()
	newsNodes = newsBank.get_children()
	
	## TODO Prevent double stock impact on initialization
	
	for eachStock in stockNodes:
		var name = stockChoices.pop_at(randi() % stockChoices.size())
		eachStock.nameLabel.text = name
		
	for eachNews in newsNodes:
		var news = randi_range(1,54)
		while news in activeNews : news = randi_range(1,54)
		eachNews.newsFlash(news)
		var newsData = eachNews.newsFlash(news)
		
		for eachStock in stockNodes:
			eachStock.newsBreak(newsData.Stock, newsData.Impact)
		
		activeNews.append(news)
		
