class_name Stock extends Node

var pricePerShare = 100
var volatility = 5 #change in price per second in random directions
var trend = 0 #change in price per second by % of the stock, 1 = 1% 100 =100%

var trend_volatility = 10.0
var trend_mean_reversion = 0.15
var trend_max = 10.0
var trend_min = -10.0

var stockName:String

var history = []


func _init(name:String) -> void:
	stockName = name
	print(str("stock named:",name," has been initialized"))

func process(delta: float) -> Array:
	update_trend(delta)
	var random_movement = randf_range(-0.97,1) * volatility * delta
	var trend_movement = pricePerShare * (trend/100.0) * delta
	
	pricePerShare = pricePerShare+random_movement+trend_movement
	if history.size() >= 100:
		history.pop_front()
	history.append(pricePerShare)
	
	return history


func update_trend(delta: float) -> void:
	var mean_reversion_force = -trend * trend_mean_reversion * delta
	
	var random_force = randf_range(-1, 1) * trend_volatility * delta
	
	trend += (mean_reversion_force + random_force)
	
	trend = clamp(trend, trend_min, trend_max)
