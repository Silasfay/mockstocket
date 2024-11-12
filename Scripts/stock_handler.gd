class_name StockHandler extends Node

var volatility = 1
var stocks = []

var Stock = load("res://Scripts/stock.gd")
var StockScreenScene = load("res://scenes/stock_screen.tscn")


func _init(count) -> void:
	for n in count:
		var stock = Stock.new(str(n))
		stocks.append(stock)

func getStocks() -> Array:
	return stocks


func process(detla: float):
	for index in stocks.size():
		var stock = stocks[index]
			
		stock.process(detla)
	return stocks
