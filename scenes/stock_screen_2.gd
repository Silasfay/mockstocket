extends Area2D
class_name StockScreen

@export var value : float = 100.0
@export var volatility : float = 1.0
@export var updateTimer : float = 0.2

var newsImpact : float = 0.0

@export var graph : Line2D
@export var nameLabel : Label
@export var priceLabel : Label

var timer : float = 0.0

func _ready():
	set_modulate(Color(0.6,0.6,0.6,1))


func _process(delta):
	timer += delta
	if timer > updateTimer:
		update_value(timer)
		timer = 0

func update_value(timeSinceUpdate):
	value = value + (randf_range(-0.1,0.1) * volatility * timeSinceUpdate * value)
	if value < 0.01 : value = 0.01
	if priceLabel : priceLabel.text = "$" + str(value).pad_decimals(2)

func _on_body_entered(body):
	if body is Player:
		print(body)
		set_modulate(Color(1,1,1,1))


func _on_body_exited(body):
	if body is Player:
		print(body)
		set_modulate(Color(0.6,0.6,0.6,1))
