class_name Stock extends Node

# Stock properties
var price_per_share: float = 100.0
var stock_name: String

# Movement parameters
var volatility: float = 5.0  # Random price change per second
var trend: float = 0.0  # Directional price change as percentage

# Trend parameters
var trend_volatility: float = 10.0
var trend_mean_reversion: float = 0.15
var trend_max: float = 10.0
var trend_min: float = -10.0

func _init(name: String) -> void:
	stock_name = name
	price_per_share = 100.0

func process(delta: float) -> float:
	_update_trend(delta)
	_update_price(delta)
	return price_per_share

func _update_trend(delta: float) -> void:
	var mean_reversion_force = -trend * trend_mean_reversion * delta
	var random_force = randf_range(-1.0, 1.0) * trend_volatility * delta
	trend = clamp(
		trend + mean_reversion_force + random_force,
		trend_min,
		trend_max
	)

func _update_price(delta: float) -> void:
	var random_movement = randf_range(-0.97, 1.0) * volatility * delta
	var trend_movement = price_per_share * (trend/100.0) * delta
	price_per_share += random_movement + trend_movement
