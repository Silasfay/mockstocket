class_name StockHandler extends Node

var volatility = 1
var stocks = []

var Stock = load("res://Scripts/stock.gd")



func _init(count) -> void:
	for n in count:
		var stock = Stock.new(str(n))
		stocks.append(stock)


func process(detla: float):
	for index in stocks.size():
		var stock = stocks[index]
			
		stock.process(detla)
