extends Area2D
class_name StockScreen

@export var value : float = 100.0
@export var volatility : float = 1.0
@export var updateTimer : float = 0.2

## News Impact Variables
var newsImpact : float = 0.0
var newsImpactTarget : float = 0.0
var newsImpactTimer : float = 0.0
var newsImpactEnable : bool = false

@export var graph : Line2D
@export var nameLabel : Label
@export var priceLabel : Label

var timer : float = 0.0

func _ready():
	set_modulate(Color(0.6,0.6,0.6,1))

func _process(delta):
	timer += delta
	if newsImpactEnable : newsHandler(delta)
	if timer > updateTimer:
		update_value(timer)
		timer = 0

func newsBreak(name : String, target : float):
	if name != nameLabel.text : return
	
	newsImpactTarget = target
	newsImpactEnable = true
	newsImpactTimer = 0.0

func newsHandler(delta : float):
	## Spikes to the target impact within 3 seconds, then gradually resets to 0 impact after 10 total seconds. This is using a cubic bezier method.
	var impact = Vector2(0,0)
	var impactLeftPull = Vector2(-5,newsImpactTarget*2)
	var impactTarget = Vector2(5,newsImpactTarget*0.5)
	var impactTargetEnd = Vector2(10,0)
	
	var leftMidpoint = impact.lerp(impactLeftPull, newsImpactTimer/10)
	var topMidpoint = impactLeftPull.lerp(impactTarget, newsImpactTimer/10)
	var rightMidpoint = impactTarget.lerp(impactTargetEnd, newsImpactTimer/10)
	
	var secondLeftMidpoint = leftMidpoint.lerp(topMidpoint, newsImpactTimer/10)
	var secondRightMidpoint = topMidpoint.lerp(rightMidpoint, newsImpactTimer/10)
	
	newsImpact = secondLeftMidpoint.lerp(secondRightMidpoint, newsImpactTimer/10).y
	newsImpactTimer += delta
	if newsImpactTimer > 10.0 : newsImpactEnable = false

func update_value(timeSinceUpdate):
	var valueChange = randf_range(-0.1,0.1) * volatility * timeSinceUpdate * value
	if abs(newsImpact) > 1 : valueChange += abs(valueChange) * newsImpact
	value += valueChange
	
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
